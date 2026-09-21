# Laya and Jev play 2048

Two *decision models* as players. Neither searches the game tree: the
position is put to them as a typed question — the legal moves as
anonymous candidates A–D, each with the board it produces and, at the
richer evidence levels, what a 2048 player looks at — and they answer
with a probability per candidate in one forward pass, without
generating text.

| | what | where it runs | needs |
|---|---|---|---|
| **Laya** | Convai Innovations' open-weights model (Apache 2.0), [`convaiinnovations/laya`](https://huggingface.co/convaiinnovations/laya), ModernBERT-large, 421M parameters | on your machine, in `ai/bridge.py` (`pip install laya`) | the weights, fetched from Hugging Face on first use (~1.7 GB); a GPU for ~35 ms decisions, a CPU for ~200–500 ms |
| **Jev** | TypeSafe's hosted model, pinned to `jev-1.13.0` like the reference projects | at api.typesafe.ai, relayed by the bridge with the official SDK (`pip install typesafe-sdk`) | `TYPESAFE_API_KEY` in the bridge's environment ($0.042 per million input tokens; a decision is ~350 tokens) |
| **mock** | a fixed weighting of the same evidence, answering in the same shape | in the bridge, or in-process (`jsmock`) | nothing — the test path and the baseline the models must beat |

## Run

```sh
pip install -r ai/requirements.txt
python3 ai/bridge.py                      # http://127.0.0.1:2048; Laya loads on the first move
TYPESAFE_API_KEY=... python3 ai/bridge.py # and Jev
python3 ai/bridge.py --mock               # everything answered by the mock: no weights, no key
```

Then either play in the browser — pick **REGULAR** (or EVIL) tiles,
**LAYA** or **JEV** in the AI rows, an **evidence** level, check the
**bridge** row says ● and hit RUN AI (the page at
domthedeveloper.github.io can talk to a bridge on your own machine:
browsers treat `http://127.0.0.1` as a secure origin) — or headless
from Node:

```sh
node test/decision.js laya 5             # five games, feature evidence
VARIANT=board node test/decision.js jev 3
node test/decision.js mock 3             # through the bridge's mock
node test/decision.js jsmock 3           # no bridge at all
node test/decision.js --selftest         # question building, validation, the mock
node test/decision.js --check 60         # bridge mock == js mock on 60 random positions
```

Options through the environment: `BRIDGE`, `VARIANT=board|feature|assist`,
`TILES=regular|evil`, `UNDO=disabled|regular`, `GOAL=tile|score`,
`CORNER`, `MAXMOVES`, `SEED`, `TIMEOUT`.

Bridge options: `--laya ID_OR_DIR` (a Hugging Face id or a local
checkpoint, e.g. a fine-tuned one), `--laya-subfolder
multilingual|typed-decisions`, `--device cpu|cuda|mps`, `--preload`,
`--jev-model`, `--port`, `--mock`. `GET /health` reports what is
available; every decision prints one line with the latency, the choice,
its confidence and the input tokens (and `TRUNCATED` if Laya's window
was exceeded).

## Evidence levels

- **board** — each candidate's board and the points the move scores.
- **feature** — plus `empty`, `merges` (pairs mergeable next move),
  `order` (a disorder penalty), `corner` (largest tile in a corner)
  and `moves` (legal moves next): the vocabulary of Amansoory's
  [JEV2048](https://github.com/amansoory/JEV2048), whose saved runs
  put raw Jev near 800 points and Jev with such features near 11,000.
- **assist** — plus GENIUS's expectimax value per candidate, scaled
  0–1: the model arbitrates over search evidence.

The boards are written as four rows separated by `/` and the candidates
come before the current board in the state, so Laya's 512-token window
(the English checkpoint) holds a full four-candidate request and cuts,
if anything, the part it can best spare.

## Expect

Laya's own README reports its base checkpoints near random on typed
decisions they were not trained for (0.36 zero-shot on the
typed-decisions benchmark, 0.766 after fine-tuning). A Laya that plays
2048 well is a fine-tuned Laya:

```sh
node test/decision.js --dataset ai/data/2048-feature.jsonl 20000   # GENIUS-labelled decisions
python3 ai/finetune_laya_2048.py --data ai/data/2048-feature.jsonl --out ai/laya-2048
python3 ai/bridge.py --laya ai/laya-2048
```

`ai/finetune_laya_2048.py` is Convai Innovations' own recipe (RLCD:
policy gradient against a strictly proper scoring rule plus soft
cross-entropy toward the teacher, then temperature calibration) from
the laya repository's Kaggle notebook, reduced to one process and
pointed at that JSONL; it also widens the model's window to 1,024
tokens. It wants a GPU; the notebook's figure is 4–5 hours for 30k
questions on two T4s. The dataset generator writes one line per
decision — the state, the question, the teacher's probability over the
shuffled labels — in the same shape as the `LocalLLaMA/typed-decisions`
rows the notebook trains on.

Neither model ran in the environment this was written in (it cannot
reach Hugging Face or api.typesafe.ai); the whole path is exercised
with the mock, and `node test/decision.js --check` proves the bridge's
mock and the in-process mock agree.
