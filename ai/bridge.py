#!/usr/bin/env python3
"""The decision bridge: Laya and Jev as 2048 players, over HTTP.

    python3 ai/bridge.py                 # Laya (loads on first move) + Jev (needs TYPESAFE_API_KEY)
    python3 ai/bridge.py --preload       # load Laya at start
    python3 ai/bridge.py --mock          # answer everything with the mock: no weights, no key, no cost

The game (index.html, or test/decision.js) posts the position as a typed
question to POST /systemone, exactly the System One request both models
take — {"model", "state", "questions"} — and gets back the answer the
model gives: {"answers": {"move": {"type": "choice", "choice": "B",
"probabilities": {...}, "confidence": ...}}, "usage": {...}}. The bridge
only routes: "laya*" runs Convai Innovations' open-weights model in this
process (pip install laya; the weights come from Hugging Face on first
use), "jev*" is relayed to TypeSafe's API with your key by the official
SDK (pip install typesafe-sdk), "mock" is a fixed weighting of the
evidence that answers in the same shape.

GET /health says what is available. Responses carry CORS headers so the
page at domthedeveloper.github.io can talk to a bridge on your own
machine (browsers treat http://127.0.0.1 as a secure origin).

Options: --host 127.0.0.1 --port 2048 (2049, the obvious choice, is on the
browsers' and Node's "bad ports" list) --laya convaiinnovations/laya
(a Hugging Face id or a local directory, e.g. a fine-tuned checkpoint)
--laya-subfolder multilingual|typed-decisions --device cpu|cuda|mps
--jev-model jev-1.13.0 --mock --preload --quiet
"""
import argparse
import json
import math
import os
import sys
import threading
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

CORNERS = (0, 3, 12, 15)
N = 4


# ----------------------------------------------------------------- rules
def slide(board, d):
    """2048's slide on a flat 16-list; d: 0 up, 1 right, 2 down, 3 left.
    Returns (board, moved, merges)."""
    new = [0] * 16
    moved = False
    merges = []
    for i in range(N):
        cells = [(r, i) for r in range(N)] if d in (0, 2) else [(i, c) for c in range(N)]
        if d in (1, 2):
            cells.reverse()
        vals = [board[r * N + c] for r, c in cells if board[r * N + c]]
        out = []
        k = 0
        while k < len(vals):
            if k + 1 < len(vals) and vals[k] == vals[k + 1]:
                out.append(2 * vals[k])
                merges.append(2 * vals[k])
                k += 2
            else:
                out.append(vals[k])
                k += 1
        for idx, (r, c) in enumerate(cells):
            v = out[idx] if idx < len(out) else 0
            new[r * N + c] = v
            if v != board[r * N + c]:
                moved = True
    return new, moved, merges


def rank(v):
    return v.bit_length() - 1 if v else 0


def features(board):
    """The same evidence js/decision_ai.js computes (boardFeatures)."""
    ranks = [rank(v) for v in board]
    mx = max(board)
    empty = board.count(0)
    order = 0
    for axis in range(2):
        for l in range(4):
            inc = dec = 0
            for n in range(1, 4):
                a = (n - 1) * 4 + l if axis else l * 4 + n - 1
                c = n * 4 + l if axis else l * 4 + n
                d = ranks[c] - ranks[a]
                if d > 0:
                    inc += d
                else:
                    dec -= d
            order += min(inc, dec)
    moves = merges = 0
    for d in range(4):
        _, moved, m = slide(board, d)
        if moved:
            moves += 1
            merges = max(merges, len(m))
    corner = 1 if mx and any(board[i] == mx for i in CORNERS) else 0
    return {"empty": empty, "merges": merges, "order": order, "corner": corner,
            "moves": moves, "max": mx}


def flat(g):
    """A board as the page sends it: "2 4 8 16 / 0 0 2 4 / ..." (or a nested list)."""
    if isinstance(g, str):
        out = [int(v) for v in g.replace("/", " ").split()]
        if len(out) != 16:
            raise ValueError("bad board string: %r" % g)
        return out
    if g and isinstance(g[0], list):
        return [v for row in g for v in row]
    return list(g)


def estimate_tokens(obj):
    import re
    s = obj if isinstance(obj, str) else json.dumps(obj, ensure_ascii=False)
    return len(re.findall(r"[A-Za-z]+|\d{1,3}|[^\sA-Za-z\d]", s))


# ------------------------------------------------------------------ mock
def mock_score(c):
    f = c if isinstance(c.get("merges"), (int, float)) and isinstance(c.get("order"), (int, float)) \
        else features(flat(c["after"]))
    s = (2.5 * f["empty"] + 1.5 * f["merges"] - 0.35 * f["order"] + 3 * f["corner"]
         + 0.5 * f["moves"] + 0.3 * math.log((c.get("gain") or 0) + 1) / math.log(2))
    if isinstance(c.get("value"), (int, float)):
        s += 6 * c["value"]
    return s


def mock_answer(request):
    cands = request["state"]["candidates"]
    labels = list(cands.keys())
    scores = [mock_score(cands[L]) for L in labels]
    mx = max(scores)
    ex = [math.exp((s - mx) / 2) for s in scores]
    z = sum(ex)
    probs, best, best_p = {}, labels[0], -1.0
    for L, e in zip(labels, ex):
        p = round(e / z, 4)
        probs[L] = p
        if p > best_p:
            best_p, best = p, L
    return {
        "model": "mock-2048",
        "answers": {"move": {"type": "choice", "choice": best, "probabilities": probs,
                             "confidence": best_p}},
        "usage": {"input_tokens": estimate_tokens(request["state"]) + estimate_tokens(request["questions"]),
                  "output_tokens": 0},
    }


# -------------------------------------------------------------- backends
class MockBackend:
    name = "mock"

    def status(self):
        return {"mode": "mock", "ready": True}

    def answer(self, request):
        return mock_answer(request)


class LayaBackend:
    name = "laya"

    def __init__(self, model, subfolder, device):
        self.model_id = model
        self.subfolder = subfolder
        self.device = device
        self.agent = None
        self.error = None
        self.lock = threading.Lock()
        self.load_s = None

    def ensure(self):
        with self.lock:
            if self.agent is not None:
                return self.agent
            try:
                import laya
            except ImportError as e:
                self.error = "pip install laya  (%s)" % e
                raise RuntimeError(self.error)
            t0 = time.time()
            try:
                self.agent = laya.load(self.model_id, device=self.device, subfolder=self.subfolder)
            except Exception as e:  # HF unreachable, bad path, no memory ...
                self.error = "%s: %s" % (type(e).__name__, str(e).strip().splitlines()[0][:200])
                raise RuntimeError("Laya could not load %r: %s" % (self.model_id, self.error))
            self.load_s = round(time.time() - t0, 1)
            self.error = None
            return self.agent

    def status(self):
        d = {"mode": "laya", "model": self.model_id + ("/" + self.subfolder if self.subfolder else ""),
             "loaded": self.agent is not None, "ready": self.agent is not None}
        if self.agent is not None:
            d["device"] = str(self.agent.device)
            d["max_len"] = self.agent.cfg.get("max_len", 512)
            d["load_s"] = self.load_s
        if self.error:
            d["error"] = self.error
        try:
            import laya
            d["version"] = laya.__version__
        except Exception:
            d["installed"] = False
        return d

    def answer(self, request):
        agent = self.ensure()
        with self.lock:
            res = agent.system_one(request["state"], request["questions"])
        max_len = agent.cfg.get("max_len", 512)
        used = res.get("usage", {}).get("input_tokens", 0)
        res["bridge_meta"] = {"device": str(agent.device), "max_len": max_len,
                              "truncated": used >= max_len}
        return res


class JevBackend:
    name = "jev"

    def __init__(self, model):
        self.model = model
        self.client = None
        self.key = os.environ.get("TYPESAFE_API_KEY", "").strip()
        self.lock = threading.Lock()

    def ensure(self):
        with self.lock:
            if self.client is None:
                if not self.key:
                    raise RuntimeError("Jev needs TYPESAFE_API_KEY in the bridge's environment")
                try:
                    from typesafe_sdk import TypeSafeClient
                except ImportError as e:
                    raise RuntimeError("pip install typesafe-sdk  (%s)" % e)
                self.client = TypeSafeClient(api_key=self.key, model=self.model)
            return self.client

    def status(self):
        d = {"mode": "jev", "model": self.model, "key": bool(self.key), "ready": bool(self.key)}
        try:
            import typesafe_sdk
            d["sdk"] = typesafe_sdk.__version__
        except Exception:
            d["installed"] = False
        return d

    def answer(self, request):
        client = self.ensure()
        model = request.get("model") or self.model
        if not str(model).startswith("jev"):
            model = self.model
        r = client.system_one(request["state"], request["questions"], model=model)
        return to_plain(r)


def to_plain(r):
    """A SystemOneResponse (pydantic) as the plain dict the page expects."""
    if hasattr(r, "model_dump"):
        try:
            d = r.model_dump(mode="json")
            if isinstance(d, dict) and "answers" in d:
                return d
        except Exception:
            pass
    answers = {}
    for name, a in dict(getattr(r, "answers", {}) or {}).items():
        entry = {"type": getattr(a, "type", None)}
        for k in ("choice", "probabilities", "confidence", "score", "noul", "legend"):
            if hasattr(a, k):
                entry[k] = getattr(a, k)
        if entry["type"] is None:
            entry["type"] = "choice" if "choice" in entry else "score" if "score" in entry else "noul"
        answers[name] = entry
    usage = getattr(r, "usage", None)
    return {"model": getattr(r, "model", None), "answers": answers,
            "usage": {"input_tokens": getattr(usage, "input_tokens", 0) or 0,
                      "output_tokens": getattr(usage, "output_tokens", 0) or 0}}


# ------------------------------------------------------------------ http
class Bridge:
    def __init__(self, args):
        self.args = args
        self.mock = MockBackend()
        self.laya = LayaBackend(args.laya, args.laya_subfolder, args.device)
        self.jev = JevBackend(args.jev_model)
        self.decisions = 0

    def pick(self, model):
        m = str(model or "laya").lower()
        if self.args.mock or m.startswith("mock") or m == "jsmock":
            return self.mock
        if m.startswith("jev"):
            return self.jev
        if m.startswith("laya"):
            return self.laya
        raise KeyError("unknown model %r (laya, jev or mock)" % model)

    def health(self):
        return {"ok": True, "bridge": "2048-superintelligence", "mock": bool(self.args.mock),
                "decisions": self.decisions,
                "backends": {"laya": self.laya.status(), "jev": self.jev.status(),
                             "mock": self.mock.status()}}


def make_handler(bridge):
    class Handler(BaseHTTPRequestHandler):
        server_version = "2048-bridge/1"
        protocol_version = "HTTP/1.1"  # keep-alive; every reply sets Content-Length

        def cors(self):
            self.send_header("Access-Control-Allow-Origin", "*")
            self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")
            self.send_header("Access-Control-Max-Age", "600")

        def reply(self, code, obj):
            body = json.dumps(obj).encode()
            self.send_response(code)
            self.cors()
            self.send_header("Content-Type", "application/json")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

        def do_OPTIONS(self):
            self.send_response(204)
            self.cors()
            self.end_headers()

        def do_GET(self):
            if self.path.startswith("/health"):
                return self.reply(200, bridge.health())
            text = (__doc__ + "\nPOST /systemone with {model, state, questions}.\n").encode()
            self.send_response(200)
            self.cors()
            self.send_header("Content-Type", "text/plain; charset=utf-8")
            self.send_header("Content-Length", str(len(text)))
            self.end_headers()
            self.wfile.write(text)

        def do_POST(self):
            if not self.path.startswith("/systemone"):
                return self.reply(404, {"error": "POST /systemone"})
            try:
                n = int(self.headers.get("Content-Length") or 0)
                request = json.loads(self.rfile.read(n) or b"{}")
                if not isinstance(request, dict) or "state" not in request or "questions" not in request:
                    return self.reply(400, {"error": "a System One request has state and questions"})
                backend = bridge.pick(request.get("model"))
            except KeyError as e:
                return self.reply(400, {"error": str(e)})
            except Exception as e:
                return self.reply(400, {"error": "bad request: %s" % e})
            t0 = time.time()
            try:
                res = backend.answer(request)
            except Exception as e:
                msg = str(e).strip().splitlines()[0][:300] if str(e).strip() else type(e).__name__
                if not bridge.args.quiet:
                    print("[%s] error: %s" % (backend.name, msg), flush=True)
                return self.reply(503, {"error": msg, "backend": backend.name})
            ms = round((time.time() - t0) * 1000, 1)
            meta = res.pop("bridge_meta", {}) if isinstance(res, dict) else {}
            res["bridge"] = dict(meta, backend=backend.name, ms=ms)
            bridge.decisions += 1
            if not bridge.args.quiet:
                a = res.get("answers", {}).get("move", {})
                print("[%s] %6.0f ms  %s (%.2f)  tokens %s%s" % (
                    backend.name, ms, a.get("choice"), a.get("confidence") or 0,
                    res.get("usage", {}).get("input_tokens", "?"),
                    "  TRUNCATED" if meta.get("truncated") else ""), flush=True)
            return self.reply(200, res)

        def log_message(self, fmt, *args):
            pass  # one line per decision above is enough

    return Handler


def main():
    ap = argparse.ArgumentParser(description="Laya and Jev as 2048 players, over HTTP.")
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=2048)
    ap.add_argument("--laya", default=os.environ.get("LAYA_MODEL", "convaiinnovations/laya"),
                    help="Hugging Face id or local checkpoint directory")
    ap.add_argument("--laya-subfolder", default=os.environ.get("LAYA_SUBFOLDER") or None,
                    help="multilingual | typed-decisions (checkpoints bundled in the hub repo)")
    ap.add_argument("--device", default=os.environ.get("LAYA_DEVICE") or None, help="cpu, cuda, mps")
    ap.add_argument("--jev-model", default=os.environ.get("TYPESAFE_DEFAULT_MODEL", "jev-1.13.0"))
    ap.add_argument("--mock", action="store_true", help="answer every model with the mock")
    ap.add_argument("--preload", action="store_true", help="load Laya before serving")
    ap.add_argument("--quiet", action="store_true")
    args = ap.parse_args()

    bridge = Bridge(args)
    if args.preload and not args.mock:
        print("loading %s ..." % args.laya, flush=True)
        try:
            bridge.laya.ensure()
            print("Laya ready on %s in %ss" % (bridge.laya.agent.device, bridge.laya.load_s), flush=True)
        except Exception as e:
            print("Laya not loaded: %s" % e, flush=True)
    server = ThreadingHTTPServer((args.host, args.port), make_handler(bridge))
    st = bridge.health()["backends"]
    print("2048 decision bridge on http://%s:%d  (laya: %s; jev: %s; mock: yes)" % (
        args.host, server.server_address[1],
        "mock" if args.mock else ("ready" if st["laya"]["loaded"] else "loads on first move"),
        "mock" if args.mock else ("key set" if st["jev"]["key"] else "no TYPESAFE_API_KEY")), flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
