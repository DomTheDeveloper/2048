// Decision models playing 2048: Laya and Jev.
//
// Neither is a game engine. Both are "System One" decision models: hand
// them a state and typed questions and they answer each question with
// a choice and a probability per option, in one forward pass, without
// generating text. Jev is TypeSafe's hosted model (api.typesafe.ai,
// pinned here to jev-1.13.0 as the reference projects do); Laya is
// Convai Innovations' open-weights counterpart (Apache 2.0,
// convaiinnovations/laya, `pip install laya`), which runs on your own
// machine. This file turns a 2048 position into that question, hands
// it to the decision bridge (ai/bridge.py — Laya in-process, Jev
// relayed with your key, plus a deterministic mock for tests), and
// turns the answer back into a direction. DecisionRunner plays whole
// games that way for the worker's headless mode and the Node harness
// (test/decision.js).
//
// The presentation follows the blind design of Amansoory's JEV2048: the
// legal moves are shuffled and labelled A-D, direction names are never
// shown, every candidate carries the board it produces, and the
// probabilities are preferences among the candidates, not chances of
// winning. Three evidence levels:
//   board    — the boards and the points scored, nothing else
//   feature  — plus what a 2048 player looks at (empties, mergeable
//              pairs, order, corner, mobility), the JEV2048 vocabulary
//   assist   — plus GENIUS's expectimax value per candidate, scaled
//              0..1: the model becomes an arbiter over search evidence
//
// DOM-free: the page, the Web Worker and Node share it.

(function (global) {
  "use strict";

  var isNode = typeof module !== "undefined" && module.exports;
  var Super = isNode ? require("./super_ai.js") : global.Super2048;
  var Honest = isNode ? require("./honest_ai.js") : global.Super2048;
  var simMove = Super.simMove;
  var maxTile = Super.maxTile;
  var CELLS = 16;
  var LABELS = ["A", "B", "C", "D"];
  var CORNERS = [0, 3, 12, 15];
  var DEFAULT_BRIDGE = "http://127.0.0.1:2048";
  var VARIANTS = ["board", "feature", "assist"];
  var MODELS = ["laya", "jev"];

  function legal(b, d) { return simMove(b, d).moved; }
  function legalDirs(b) {
    var out = [];
    for (var d = 0; d < 4; d++) if (legal(b, d)) out.push(d);
    return out;
  }
  // Boards travel as one string per board, rows separated by " / ":
  // "2 4 8 16 / 0 0 2 4 / 0 0 0 2 / 0 0 0 0". Half the tokens of a
  // nested JSON array, which matters for Laya's 512-token window.
  function boardStr(b) {
    var rows = [];
    for (var y = 0; y < 4; y++) rows.push(b.slice(4 * y, 4 * y + 4).join(" "));
    return rows.join(" / ");
  }
  function parseBoard(s) {
    if (typeof s !== "string") {
      if (s && s.length && typeof s[0] === "object") {
        var b = [];
        for (var y = 0; y < 4; y++) for (var x = 0; x < 4; x++) b.push(Number(s[y][x]));
        return b;
      }
      return s;
    }
    var out = s.split("/").join(" ").trim().split(/\s+/).map(Number);
    if (out.length !== CELLS) throw new Error("bad board string: " + s);
    return out;
  }
  function rankOf(v) { return v ? Math.round(Math.log(v) / Math.LN2) : 0; }

  // ------------------------------------------------------------------
  // Evidence: what a 2048 player looks at
  // ------------------------------------------------------------------

  // The JEV2048 vocabulary: empty cells; the most tile pairs one legal
  // move can merge; the monotonicity penalty (for every row and column,
  // the smaller of its total rank rises and rank falls, so an ordered
  // line costs nothing); whether the largest tile is in a corner; and
  // the number of legal moves.
  function boardFeatures(b) {
    var ranks = new Array(CELLS), mx = 0, empty = 0, i;
    for (i = 0; i < CELLS; i++) {
      ranks[i] = rankOf(b[i]);
      if (b[i] > mx) mx = b[i];
      if (!b[i]) empty++;
    }
    var order = 0;
    for (var axis = 0; axis < 2; axis++) {
      for (var l = 0; l < 4; l++) {
        var inc = 0, dec = 0;
        for (var n = 1; n < 4; n++) {
          var a = axis ? (n - 1) * 4 + l : l * 4 + n - 1;
          var c = axis ? n * 4 + l : l * 4 + n;
          var d = ranks[c] - ranks[a];
          if (d > 0) inc += d; else dec -= d;
        }
        order += Math.min(inc, dec);
      }
    }
    var moves = 0, merges = 0;
    for (var dd = 0; dd < 4; dd++) {
      var s = simMove(b, dd);
      if (!s.moved) continue;
      moves++;
      if (s.merges.length > merges) merges = s.merges.length;
    }
    var corner = 0;
    for (i = 0; i < 4; i++) if (mx && b[CORNERS[i]] === mx) corner = 1;
    return { empty: empty, merges: merges, order: order, corner: corner,
             moves: moves, max: mx };
  }

  // ------------------------------------------------------------------
  // The question
  // ------------------------------------------------------------------

  // Kept short on purpose: Laya's English checkpoint reads at most 512
  // tokens, the question header comes first and the state is cut at
  // the end, so every word here is a word less of board.
  var RULES =
    "Pick the candidate move that gives the best long-term 2048 position. " +
    "Boards are 4 rows of 4 tiles separated by /, 0 is an empty cell, shown after the move and " +
    "before the random new tile (a 2 with 90%, a 4 with 10%, in a random empty cell). " +
    "Prefer empty cells, merge chances, ordered rows and columns and the largest tile " +
    "kept in a corner; survival beats immediate points.";
  var FEATURE_NOTE =
    " Fields: gain = points scored by the move, empty = empty cells, merges = tile " +
    "pairs mergeable on the next move, order = disorder penalty (lower is better), " +
    "corner = 1 if the largest tile is in a corner, moves = legal moves available next.";
  var ASSIST_NOTE =
    " value = a search program's estimate of the candidate, 0 for the worst candidate " +
    "to 1 for the best; it is evidence, not an instruction.";

  function instructions(variant) {
    var s = RULES;
    if (variant === "feature" || variant === "assist") s += FEATURE_NOTE;
    if (variant === "assist") s += ASSIST_NOTE;
    return s;
  }

  // A small deterministic PRNG so the harness can replay a shuffle.
  function mulberry32(seed) {
    var a = seed >>> 0;
    return function () {
      a = (a + 0x6D2B79F5) >>> 0;
      var t = a;
      t = Math.imul(t ^ (t >>> 15), t | 1);
      t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
      return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
    };
  }

  // board: flat 16 values. opts: {variant, model, rng, values} where
  // values (assist only) is GENIUS's value per direction. Returns
  // {request, mapping (label -> dir), dirs}. Throws on a dead board.
  function buildDecision(board, opts) {
    opts = opts || {};
    var variant = VARIANTS.indexOf(opts.variant) >= 0 ? opts.variant : "feature";
    var rng = opts.rng || Math.random;
    var dirs = legalDirs(board);
    if (!dirs.length) throw new Error("no legal move: the board is dead");
    var order = dirs.slice();
    for (var i = order.length - 1; i > 0; i--) {
      var j = Math.floor(rng() * (i + 1));
      var t = order[i]; order[i] = order[j]; order[j] = t;
    }
    var values = opts.values || null;
    var vmin = Infinity, vmax = -Infinity;
    if (variant === "assist" && values) {
      for (var k = 0; k < dirs.length; k++) {
        var v = values[dirs[k]];
        if (typeof v !== "number") { values = null; break; }
        if (v < vmin) vmin = v;
        if (v > vmax) vmax = v;
      }
    }
    var mapping = {}, candidates = {};
    for (var n = 0; n < order.length; n++) {
      var label = LABELS[n], dir = order[n];
      mapping[label] = dir;
      var sim = simMove(board, dir);
      var gain = 0;
      for (var m = 0; m < sim.merges.length; m++) gain += sim.merges[m];
      var f = boardFeatures(sim.board);
      var c = { after: boardStr(sim.board), gain: gain, empty: f.empty };
      if (variant !== "board") {
        c.merges = f.merges;
        c.order = f.order;
        c.corner = f.corner;
        c.moves = f.moves;
      }
      if (variant === "assist" && values) {
        c.value = vmax === vmin ? 0.5
                : Math.round(1000 * (values[dir] - vmin) / (vmax - vmin)) / 1000;
      }
      candidates[label] = c;
    }
    var criteria = {};
    for (var q = 0; q < order.length; q++) criteria[LABELS[q]] = "candidate " + LABELS[q];
    return {
      request: {
        model: opts.model || "laya",
        // Candidates first: Laya cuts the state at the end when it is
        // too long, and the current board is the part it can best spare.
        state: { candidates: candidates, board: boardStr(board) },
        questions: {
          move: { type: "choice", instructions: instructions(variant), criteria: criteria }
        }
      },
      mapping: mapping,
      dirs: dirs,
      variant: variant
    };
  }

  // The answer, validated: the chosen label must be one of ours and
  // map to a legal move; the probabilities must be a distribution over
  // the labels. Returns {dir, label, probabilities (by dir), confidence}.
  function answerToMove(result, mapping, board) {
    var a = result && result.answers && result.answers.move;
    if (!a || a.type !== "choice") throw new Error("the model returned no choice for 'move'");
    var labels = Object.keys(mapping);
    if (labels.indexOf(a.choice) < 0) throw new Error("the model chose an unknown candidate: " + a.choice);
    var dir = mapping[a.choice];
    if (!legal(board, dir)) throw new Error("the model chose an illegal move");
    var probs = a.probabilities || {};
    var byDir = {}, sum = 0;
    for (var i = 0; i < labels.length; i++) {
      var p = Number(probs[labels[i]]);
      if (!(p >= 0 && p <= 1.0000001)) throw new Error("invalid probability for " + labels[i]);
      byDir[mapping[labels[i]]] = p;
      sum += p;
    }
    if (labels.length > 1 && Math.abs(sum - 1) > 0.02) throw new Error("probabilities do not sum to one");
    return { dir: dir, label: a.choice, probabilities: byDir,
             confidence: typeof a.confidence === "number" ? a.confidence : probs[a.choice] };
  }

  // A rough token count (words, short digit runs and punctuation), so a
  // request can be compared with Laya's 512-token window before any
  // model sees it. The bridge reports the real count afterwards.
  function estimateTokens(obj) {
    var s = typeof obj === "string" ? obj : JSON.stringify(obj);
    var m = s.match(/[A-Za-z]+|\d{1,3}|[^\sA-Za-z\d]/g);
    return m ? m.length : 0;
  }

  // ------------------------------------------------------------------
  // The mock: a decision model that is not one
  // ------------------------------------------------------------------

  // Answers in exactly the models' shape from a fixed weighting of the
  // evidence, so the whole path (question, bridge, validation, game)
  // can be exercised with no weights and no key — and so there is a
  // baseline the real models must beat. ai/bridge.py has the same
  // formula; test/decision.js --check asserts they agree.
  function mockScore(c) {
    var f = (typeof c.merges === "number" && typeof c.order === "number")
      ? c : boardFeatures(parseBoard(c.after));
    var s = 2.5 * f.empty + 1.5 * f.merges - 0.35 * f.order + 3 * f.corner +
            0.5 * f.moves + 0.3 * Math.log((c.gain || 0) + 1) / Math.LN2;
    if (typeof c.value === "number") s += 6 * c.value;
    return s;
  }

  function mockAnswer(request) {
    var cands = request.state.candidates;
    var labels = Object.keys(cands);
    var scores = labels.map(function (L) { return mockScore(cands[L]); });
    var mx = Math.max.apply(null, scores);
    var ex = scores.map(function (s) { return Math.exp((s - mx) / 2); });
    var z = ex.reduce(function (a, b) { return a + b; }, 0);
    var probs = {}, best = labels[0], bestP = -1;
    for (var i = 0; i < labels.length; i++) {
      var p = Math.round(10000 * ex[i] / z) / 10000;
      probs[labels[i]] = p;
      if (p > bestP) { bestP = p; best = labels[i]; }
    }
    return {
      model: "mock-2048",
      answers: { move: { type: "choice", choice: best, probabilities: probs, confidence: bestP } },
      usage: { input_tokens: estimateTokens(request.state) + estimateTokens(request.questions),
               output_tokens: 0 }
    };
  }

  // ------------------------------------------------------------------
  // The client
  // ------------------------------------------------------------------

  // opts: {model: "laya"|"jev"|"mock"|"jsmock", bridge (URL), variant,
  // corner, goal, tiles, timeoutMs, fetch, seed}. "jsmock" answers in
  // this process (no bridge); every other model goes to the bridge.
  function DecisionClient(opts) {
    opts = opts || {};
    this.model = opts.model || "laya";
    this.bridge = String(opts.bridge || DEFAULT_BRIDGE).replace(/\/+$/, "");
    this.variant = VARIANTS.indexOf(opts.variant) >= 0 ? opts.variant : "feature";
    this.timeoutMs = opts.timeoutMs || 60000;
    // Called as a plain function: a `fetch` taken off the window and
    // invoked as a property throws "Illegal invocation" in browsers.
    this.fetchFn = opts.fetch || (typeof fetch === "function"
      ? function (url, init) { return fetch(url, init); } : null);
    this.rng = typeof opts.seed === "number" ? mulberry32(opts.seed) : Math.random;
    this.assist = this.variant === "assist"
      ? new Honest.GeniusAI(opts.corner || "br", { goal: opts.goal, tiles: opts.tiles })
      : null;
    this.stats = { calls: 0, forced: 0, ms: 0, tokens: 0, errors: 0 };
    this.lastModel = null;
  }

  DecisionClient.prototype.post = function (path, body) {
    var self = this;
    if (!this.fetchFn) return Promise.reject(new Error("fetch is not available here"));
    var ctrl = typeof AbortController === "function" ? new AbortController() : null;
    var timer = ctrl ? setTimeout(function () { ctrl.abort(); }, this.timeoutMs) : null;
    return this.fetchFn(this.bridge + path, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
      signal: ctrl ? ctrl.signal : undefined
    }).then(function (res) {
      return res.text().then(function (txt) {
        var data = null;
        try { data = JSON.parse(txt); } catch (e) {}
        if (!res.ok) {
          throw new Error((data && data.error) || ("bridge answered " + res.status));
        }
        if (!data) throw new Error("bridge answered with no JSON");
        return data;
      });
    }, function (err) {
      var why = err && err.name === "AbortError" ? "timed out after " + self.timeoutMs + " ms"
              : (err && err.message) || String(err);
      throw new Error("bridge unreachable at " + self.bridge + " (" + why + ")");
    }).then(function (data) {
      if (timer) clearTimeout(timer);
      return data;
    }, function (err) {
      if (timer) clearTimeout(timer);
      throw err;
    });
  };

  DecisionClient.prototype.health = function () {
    var self = this;
    if (!this.fetchFn) return Promise.reject(new Error("fetch is not available here"));
    var ctrl = typeof AbortController === "function" ? new AbortController() : null;
    var timer = ctrl ? setTimeout(function () { ctrl.abort(); }, 4000) : null;
    return this.fetchFn(this.bridge + "/health", { signal: ctrl ? ctrl.signal : undefined })
      .then(function (res) { return res.json(); })
      .then(function (d) { if (timer) clearTimeout(timer); return d; },
            function (e) {
              if (timer) clearTimeout(timer);
              throw new Error("bridge unreachable at " + self.bridge);
            });
  };

  // Resolves to {dir, label, probabilities, confidence, ms, tokens,
  // model, forced}. A single legal move is taken without asking (the
  // reference projects do the same: nothing to decide).
  DecisionClient.prototype.decide = function (board, lastDir) {
    var self = this;
    var dirs = legalDirs(board);
    if (!dirs.length) return Promise.reject(new Error("no legal move"));
    if (dirs.length === 1) {
      this.stats.forced++;
      return Promise.resolve({ dir: dirs[0], forced: true, ms: 0, tokens: 0,
                               model: this.lastModel, probabilities: null, confidence: 1 });
    }
    var values = this.assist ? this.assist.moveValues(board, lastDir) : null;
    var built = buildDecision(board, { variant: this.variant, model: this.model,
                                       rng: this.rng, values: values });
    var t0 = Date.now();
    var answered = this.model === "jsmock"
      ? Promise.resolve(mockAnswer(built.request))
      : this.post("/systemone", built.request);
    return answered.then(function (result) {
      var move = answerToMove(result, built.mapping, board);
      var ms = Date.now() - t0;
      var tokens = result.usage && result.usage.input_tokens || 0;
      self.stats.calls++;
      self.stats.ms += ms;
      self.stats.tokens += tokens;
      self.lastModel = result.model || self.model;
      move.ms = ms;
      move.tokens = tokens;
      move.model = self.lastModel;
      move.forced = false;
      move.truncated = !!(result.bridge && result.bridge.truncated);
      return move;
    }, function (err) {
      self.stats.errors++;
      throw err;
    });
  };

  // ------------------------------------------------------------------
  // Whole games, asynchronously
  // ------------------------------------------------------------------

  // The honest runner's loop with the move awaited from the client.
  // options: model, bridge, variant, tiles (regular|evil), undo
  // (disabled|regular), goal (tile|score), maxMoves, seed, fetch.
  function DecisionRunner(corner, options) {
    options = options || {};
    this.corner = corner;
    this.tiles = options.tiles === "evil" ? "evil" : "regular";
    this.undo = options.undo === "regular" ? "regular" : "disabled";
    this.goal = options.goal === "score" ? "score" : "tile";
    this.maxMoves = options.maxMoves || 0;
    this.client = new DecisionClient({
      model: options.model, bridge: options.bridge, variant: options.variant,
      corner: corner, goal: this.goal, tiles: this.tiles, seed: options.seed,
      timeoutMs: options.timeoutMs, fetch: options.fetch
    });
    this.stats = { moves: 0, attempts: 0, undos: 0, backtracks: 0, restarts: 0,
                   deaths: 0, score: 0, maxTile: 0, calls: 0, forced: 0, ms: 0,
                   tokens: 0 };
    this.ladder = new Honest.Ladder();
    this.hist = [];
    this.lastDir = 0;
    this.board = this.freshBoard();
    this.stats.maxTile = maxTile(this.board);
    this.done = false;
    this.stopped = false;
    this.reason = null;
    this.error = null;
    this.t0 = Date.now();
  }

  DecisionRunner.prototype.spawn = function (b) {
    var sp = this.tiles === "evil" ? Honest.evilSpawn(b, this.lastDir) : Honest.randomSpawn(b);
    if (sp) b[sp.cell] = sp.value;
    return sp;
  };

  DecisionRunner.prototype.freshBoard = function () {
    var b = [];
    for (var i = 0; i < CELLS; i++) b.push(0);
    this.spawn(b);
    this.spawn(b);
    return b;
  };

  DecisionRunner.prototype.stop = function () { this.stopped = true; };

  DecisionRunner.prototype.finish = function (reason, error) {
    this.done = true;
    this.reason = reason;
    if (error) this.error = error;
    return true;
  };

  // One decision. Resolves to true when the game is over.
  DecisionRunner.prototype.step = function () {
    var self = this;
    if (this.done) return Promise.resolve(true);
    if (this.stopped) return Promise.resolve(this.finish("stopped"));
    var b = this.board;
    if (this.goal !== "score" && maxTile(b) >= 131072) return Promise.resolve(this.finish("won"));
    if (this.maxMoves && this.stats.moves >= this.maxMoves) return Promise.resolve(this.finish("move cap"));
    if (!legalDirs(b).length) {
      if (this.undo === "regular" && this.hist.length && !this.ladder.outOfLuck()) {
        var k = this.ladder.death(this.hist.length);
        while (k-- > 0) {
          var h = this.hist.pop();
          this.board = h.b;
          this.stats.score -= h.g;
          this.stats.moves--;
          this.stats.undos++;
        }
        this.lastDir = this.hist.length ? this.hist[this.hist.length - 1].d : 0;
        this.stats.deaths++;
        this.stats.backtracks++;
        return Promise.resolve(false);
      }
      return Promise.resolve(this.finish(
        this.undo === "regular" && this.hist.length ? "out of luck" : "game over"));
    }
    return this.client.decide(b, this.lastDir).then(function (r) {
      var sim = simMove(b, r.dir);
      var gain = 0;
      for (var m = 0; m < sim.merges.length; m++) gain += sim.merges[m];
      self.hist.push({ b: b, g: gain, d: r.dir });
      if (self.hist.length > 3000) self.hist.splice(0, 100);
      self.lastDir = r.dir;
      self.board = sim.board;
      self.spawn(self.board);
      self.stats.score += gain;
      self.stats.moves++;
      self.stats.attempts++;
      if (!r.forced) {
        self.stats.calls++;
        self.stats.ms += r.ms;
        self.stats.tokens += r.tokens;
      } else {
        self.stats.forced++;
      }
      var mt = maxTile(self.board);
      if (mt > self.stats.maxTile) self.stats.maxTile = mt;
      self.ladder.progress(self.stats.score);
      return false;
    }, function (err) {
      return self.finish("bridge error", (err && err.message) || String(err));
    });
  };

  // Plays to the end. onProgress(runner) after every step; resolves to
  // the runner.
  DecisionRunner.prototype.run = function (onProgress) {
    var self = this;
    function loop() {
      return self.step().then(function (done) {
        if (onProgress) onProgress(self);
        if (done) return self;
        return loop();
      });
    }
    return loop();
  };

  DecisionRunner.prototype.model = function () { return this.client.lastModel; };

  // ------------------------------------------------------------------

  var api = {
    DecisionClient: DecisionClient,
    DecisionRunner: DecisionRunner,
    buildDecision: buildDecision,
    answerToMove: answerToMove,
    boardFeatures: boardFeatures,
    boardStr: boardStr,
    parseBoard: parseBoard,
    mockAnswer: mockAnswer,
    estimateTokens: estimateTokens,
    legalDirs: legalDirs,
    mulberry32: mulberry32,
    DECISION_MODELS: MODELS,
    DECISION_VARIANTS: VARIANTS,
    DEFAULT_BRIDGE: DEFAULT_BRIDGE
  };

  if (isNode) {
    module.exports = api;
  } else {
    var S = global.Super2048;
    for (var k in api) if (api.hasOwnProperty(k)) S[k] = api[k];
  }
})(this);
