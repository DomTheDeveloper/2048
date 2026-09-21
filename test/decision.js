// Decision models (Laya, Jev) playing honest 2048 through the bridge.
//
//   node test/decision.js [laya|jev|mock|jsmock] [games]
//
//   model    laya   Convai Innovations' open-weights model, hosted by ai/bridge.py
//            jev    TypeSafe's hosted model, relayed by the bridge with your key
//            mock   the bridge's fixed weighting of the evidence (no weights, no key)
//            jsmock the same mock in this process, no bridge at all
//   env      BRIDGE=http://127.0.0.1:2048   VARIANT=board|feature|assist
//            TILES=regular|evil  UNDO=disabled|regular  GOAL=tile|score
//            CORNER=br|bl|tr|tl  MAXMOVES=n  SEED=n  TIMEOUT=ms
//
//   node test/decision.js --selftest            question building, validation, mock
//   node test/decision.js --check [n]           bridge mock == js mock on n random positions
//   node test/decision.js --dataset FILE [n]    n GENIUS-labelled decisions as JSONL
//                                               (env TEACHER_DEPTH=3, the fine-tuning data
//                                               for ai/finetune_laya_2048.py)
//
// Plays each game headless (DecisionRunner, pure arrays) and prints the
// max-tile histogram, average score and moves, and the bridge's latency
// and token usage per decision.

"use strict";

var fs = require("fs");
var path = require("path");
var Super = require(path.join(__dirname, "..", "js", "super_ai.js"));
var Honest = require(path.join(__dirname, "..", "js", "honest_ai.js"));
var D = require(path.join(__dirname, "..", "js", "decision_ai.js"));

var argv = process.argv.slice(2);
var BRIDGE = process.env.BRIDGE || D.DEFAULT_BRIDGE;
var VARIANT = process.env.VARIANT || "feature";
var TILES = process.env.TILES === "evil" ? "evil" : "regular";
var UNDO = process.env.UNDO === "regular" ? "regular" : "disabled";
var GOAL = process.env.GOAL === "score" ? "score" : "tile";
var CORNER = process.env.CORNER || "br";
var MAXMOVES = Number(process.env.MAXMOVES) || 0;
var SEED = process.env.SEED ? Number(process.env.SEED) : undefined;
var TIMEOUT = Number(process.env.TIMEOUT) || 60000;

function fmtInt(n) { return String(n).replace(/\B(?=(\d{3})+(?!\d))/g, ","); }
function fail(msg) { console.error("FAIL: " + msg); process.exit(1); }
function ok(cond, what) { if (!cond) fail(what); console.log("  ok   " + what); }

// A random reachable-looking position: play GENIUS for k moves.
function randomPosition(rng, minMoves, maxMoves) {
  var runner = new Honest.HonestRunner(CORNER, { algo: "random", tiles: "regular" });
  var target = minMoves + Math.floor(rng() * (maxMoves - minMoves));
  var ai = new Honest.GeniusAI(CORNER, {});
  var b = runner.board, lastDir = 0;
  for (var i = 0; i < target; i++) {
    var dirs = D.legalDirs(b);
    if (!dirs.length) break;
    var dir = rng() < 0.7 ? ai.nextMove(b, lastDir) : dirs[Math.floor(rng() * dirs.length)];
    if (dir < 0 || !Honest.legal(b, dir)) dir = dirs[0];
    var sim = Super.simMove(b, dir);
    b = sim.board;
    var sp = Honest.randomSpawn(b);
    if (sp) b[sp.cell] = sp.value;
    lastDir = dir;
  }
  return b;
}

function selftest() {
  console.log("decision selftest");
  var b = [2, 4, 8, 16, 0, 0, 2, 4, 0, 0, 0, 2, 0, 0, 0, 0];
  var f = D.boardFeatures(b);
  // Up and right change nothing on this board; down and left do; no move merges.
  ok(f.empty === 9 && f.corner === 1 && f.max === 16 && f.moves === 2 && f.merges === 0 && f.order === 0,
     "features of a known board: " + JSON.stringify(f));
  // Row "2 2 4 4" on an otherwise empty board: left and right each
  // merge two pairs, down moves the row, up changes nothing.
  var b4 = [2, 2, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  var f4 = D.boardFeatures(b4);
  ok(f4.empty === 12 && f4.moves === 3 && f4.merges === 2 && f4.corner === 1 && f4.order === 0 && f4.max === 4,
     "features of a second board: " + JSON.stringify(f4));
  ok(D.parseBoard(D.boardStr(b)).join(",") === b.join(","), "board string round-trips: " + D.boardStr(b));
  var built = D.buildDecision(b4, { variant: "feature", model: "laya", rng: D.mulberry32(3) });
  ok(Object.keys(built.mapping).length === 3, "three candidates for a board with three legal moves");
  var seen = {};
  Object.keys(built.mapping).forEach(function (L) { seen[built.mapping[L]] = 1; });
  ok(Object.keys(seen).length === 3, "labels map to distinct directions");
  // A dense board where all four directions are legal (no merges: every
  // neighbour pair differs).
  var full = [0, 2, 4, 8, 2, 4, 8, 16, 4, 8, 16, 32, 8, 16, 32, 0];
  var built4 = D.buildDecision(full, { variant: "feature", rng: D.mulberry32(5) });
  var est4 = D.estimateTokens(built4.request.state) + D.estimateTokens(built4.request.questions);
  ok(Object.keys(built4.mapping).length === 4 && est4 < 512,
     "four candidates with features estimated at " + est4 + " tokens (" + JSON.stringify(built4.request.state).length + " chars)");
  ok(JSON.stringify(built.request).indexOf("up") < 0 && JSON.stringify(built.request).indexOf("left") < 0,
     "no direction name leaks into the request");
  var est = D.estimateTokens(built.request.state) + D.estimateTokens(built.request.questions);
  ok(est < 512, "feature request estimated at " + est + " tokens (Laya reads 512)");
  var estA = D.estimateTokens(D.buildDecision(b, { variant: "assist", values: [1, 2, null, 4] }).request);
  console.log("       assist variant estimated at " + estA + " tokens");
  var ans = D.mockAnswer(built.request);
  var mv = D.answerToMove(ans, built.mapping, b4);
  ok(Honest.legal(b4, mv.dir), "the mock's choice is a legal move (" + mv.label + " -> " + mv.dir + ")");
  var bad = JSON.parse(JSON.stringify(ans)); bad.answers.move.choice = "Z";
  var threw = false; try { D.answerToMove(bad, built.mapping, b4); } catch (e) { threw = true; }
  ok(threw, "an unknown candidate is rejected");
  var bad2 = JSON.parse(JSON.stringify(ans)); bad2.answers.move.probabilities.A = 0.9;
  bad2.answers.move.probabilities.B = 0.9;
  threw = false; try { D.answerToMove(bad2, built.mapping, b4); } catch (e) { threw = true; }
  ok(threw, "probabilities that do not sum to one are rejected");
  var boardOnly = D.buildDecision(b4, { variant: "board", rng: D.mulberry32(9) });
  var mvb = D.answerToMove(D.mockAnswer(boardOnly.request), boardOnly.mapping, b4);
  ok(Honest.legal(b4, mvb.dir), "the mock also works from boards alone (features derived)");
  var one = [2, 4, 8, 16, 4, 8, 16, 32, 8, 16, 32, 64, 0, 32, 64, 128];
  var dirsOne = D.legalDirs(one);
  console.log("       forced-move board has " + dirsOne.length + " legal move(s)");
  var client = new D.DecisionClient({ model: "jsmock", variant: "board" });
  return client.decide(b, 0).then(function (r) {
    ok(Honest.legal(b, r.dir) && !r.forced && r.model === "mock-2048", "jsmock client decides (" + r.ms + " ms)");
    var runner = new D.DecisionRunner(CORNER, { model: "jsmock", variant: "feature", seed: 11, maxMoves: 300 });
    return runner.run();
  }).then(function (r) {
    ok(r.stats.moves > 0 && (r.reason === "move cap" || r.reason === "game over"),
       "a jsmock game runs: " + r.reason + " after " + r.stats.moves + " moves, score " + r.stats.score +
       ", " + r.stats.calls + " decisions, " + r.stats.forced + " forced");
    console.log("SELFTEST OK");
  });
}

function check(n) {
  var rng = D.mulberry32(SEED || 2048);
  var agree = 0, tried = 0;
  var client = new D.DecisionClient({ model: "mock", bridge: BRIDGE, variant: VARIANT, timeoutMs: TIMEOUT });
  function next() {
    if (tried >= n) {
      console.log("bridge mock vs js mock: " + agree + "/" + tried + " same choice (" + VARIANT + ")");
      if (agree !== tried) fail("the two mocks disagree");
      console.log("CHECK OK");
      return;
    }
    var b = randomPosition(rng, 5, 400);
    var dirs = D.legalDirs(b);
    if (dirs.length < 2) return next();
    tried++;
    var built = D.buildDecision(b, { variant: VARIANT, model: "mock", rng: D.mulberry32(tried) });
    var local = D.answerToMove(D.mockAnswer(built.request), built.mapping, b);
    return client.post("/systemone", built.request).then(function (res) {
      var remote = D.answerToMove(res, built.mapping, b);
      if (remote.dir === local.dir) agree++;
      else console.log("  differ on " + b.join(",") + ": bridge " + remote.label + " js " + local.label);
      return next();
    });
  }
  return next();
}

// Fine-tuning data: positions from GENIUS self-play (and a few from
// weaker play, for coverage), each with GENIUS's value for every legal
// move turned into a target distribution over the shuffled labels.
function dataset(file, n) {
  var depth = Number(process.env.TEACHER_DEPTH) || 3;
  var rng = D.mulberry32(SEED || 1);
  var teacher = new Honest.GeniusAI(CORNER, { goal: GOAL, tiles: TILES, maxDepth: depth });
  var out = fs.createWriteStream(file);
  var written = 0, games = 0, t0 = Date.now();
  while (written < n) {
    games++;
    var weak = games % 4 === 0; // every fourth game is SMART's positions
    var actor = weak ? new Honest.SmartAI() : teacher;
    var runner = new Honest.HonestRunner(CORNER, { algo: "random", tiles: TILES });
    var b = runner.board, lastDir = 0;
    for (var mv = 0; written < n; mv++) {
      var dirs = D.legalDirs(b);
      if (!dirs.length) break;
      if (dirs.length >= 2) {
        var values = teacher.moveValues(b, lastDir);
        var built = D.buildDecision(b, { variant: VARIANT, model: "laya", rng: rng, values: values });
        var labels = Object.keys(built.mapping);
        var vmax = -Infinity, vmin = Infinity;
        labels.forEach(function (L) { var v = values[built.mapping[L]]; if (v > vmax) vmax = v; if (v < vmin) vmin = v; });
        var probs = {}, z = 0, best = labels[0], bestV = -Infinity;
        labels.forEach(function (L) {
          var v = values[built.mapping[L]];
          var p = vmax === vmin ? 1 : Math.exp(8 * (v - vmax) / (vmax - vmin));
          probs[L] = p; z += p;
          if (v > bestV) { bestV = v; best = L; }
        });
        labels.forEach(function (L) { probs[L] = Math.round(10000 * probs[L] / z) / 10000; });
        out.write(JSON.stringify({
          id: "2048-" + written, workflow: "2048-" + VARIANT,
          state: built.request.state, questions: built.request.questions,
          gold: { move: { label: best, probabilities: probs } },
          meta: { board: b, mapping: built.mapping, teacher: "genius", depth: depth, game: games, move: mv }
        }) + "\n");
        written++;
      }
      var dir = actor.nextMove(b, lastDir);
      if (dir < 0 || !Honest.legal(b, dir)) dir = dirs[0];
      var sim = Super.simMove(b, dir);
      b = sim.board;
      var sp = TILES === "evil" ? Honest.evilSpawn(b, dir) : Honest.randomSpawn(b);
      if (sp) b[sp.cell] = sp.value;
      lastDir = dir;
    }
  }
  out.end();
  console.log("wrote " + fmtInt(written) + " decisions from " + games + " games to " + file +
    " in " + ((Date.now() - t0) / 1000).toFixed(1) + "s (" + VARIANT + ", teacher depth " + depth + ")");
}

function bench(model, games) {
  var t0 = Date.now();
  var results = [], g = 0;
  var totals = { moves: 0, undos: 0, score: 0, calls: 0, forced: 0, ms: 0, tokens: 0 };
  var lastModel = null;
  function next() {
    if (g >= games) return summary();
    g++;
    var runner = new D.DecisionRunner(CORNER, {
      model: model, bridge: BRIDGE, variant: VARIANT, tiles: TILES, undo: UNDO, goal: GOAL,
      maxMoves: MAXMOVES, seed: SEED !== undefined ? SEED + g : undefined, timeoutMs: TIMEOUT
    });
    var lastLine = 0;
    return runner.run(function (r) {
      if (Date.now() - lastLine > 5000) {
        lastLine = Date.now();
        console.log("    game " + g + ": move " + r.stats.moves + ", max " + r.stats.maxTile +
          ", score " + fmtInt(r.stats.score) + ", " +
          (r.stats.calls ? Math.round(r.stats.ms / r.stats.calls) : 0) + " ms/decision");
      }
    }).then(function (r) {
      if (r.error) {
        console.error("  game " + g + " ended with a bridge error: " + r.error);
        process.exit(2);
      }
      lastModel = r.model() || lastModel;
      results.push(r);
      totals.moves += r.stats.moves; totals.undos += r.stats.undos; totals.score += r.stats.score;
      totals.calls += r.stats.calls; totals.forced += r.stats.forced; totals.ms += r.stats.ms;
      totals.tokens += r.stats.tokens;
      console.log("  game " + g + ": " + r.reason + " — max " + fmtInt(r.stats.maxTile) +
        ", score " + fmtInt(r.stats.score) + ", " + fmtInt(r.stats.moves) + " moves" +
        (UNDO === "regular" ? ", " + r.stats.undos + " undos" : "") +
        ", " + r.stats.calls + " decisions (" + r.stats.forced + " forced), " +
        (r.stats.calls ? Math.round(r.stats.ms / r.stats.calls) : 0) + " ms and " +
        (r.stats.calls ? Math.round(r.stats.tokens / r.stats.calls) : 0) + " tokens per decision");
      return next();
    });
  }
  function summary() {
    var secs = (Date.now() - t0) / 1000;
    var histo = {};
    results.forEach(function (r) { histo[r.stats.maxTile] = (histo[r.stats.maxTile] || 0) + 1; });
    console.log("[" + model + (lastModel ? " = " + lastModel : "") + "] " + games + " games, " + VARIANT +
      " evidence, " + TILES + " tiles, undo " + UNDO + ", goal " + GOAL + ", corner " + CORNER +
      " — " + secs.toFixed(1) + "s");
    Object.keys(histo).map(Number).sort(function (a, b) { return b - a; }).forEach(function (m) {
      console.log("  reached " + fmtInt(m) + ": " + histo[m] + "/" + games);
    });
    var endings = {};
    results.forEach(function (r) { endings[r.reason] = (endings[r.reason] || 0) + 1; });
    console.log("  avg score " + fmtInt(Math.round(totals.score / games)) +
      ", avg moves " + fmtInt(Math.round(totals.moves / games)) +
      (UNDO === "regular" ? ", avg undos " + fmtInt(Math.round(totals.undos / games)) : "") +
      ", endings " + JSON.stringify(endings));
    console.log("  " + fmtInt(totals.calls) + " decisions (" + fmtInt(totals.forced) + " forced moves skipped), " +
      (totals.calls ? Math.round(totals.ms / totals.calls) : 0) + " ms and " +
      (totals.calls ? Math.round(totals.tokens / totals.calls) : 0) + " input tokens per decision");
  }
  return next();
}

if (argv[0] === "--selftest") {
  selftest().catch(function (e) { fail(e.message); });
} else if (argv[0] === "--check") {
  check(Number(argv[1]) || 40).catch(function (e) { fail(e.message); });
} else if (argv[0] === "--dataset") {
  if (!argv[1]) fail("--dataset FILE [n]");
  dataset(argv[1], Number(argv[2]) || 1000);
} else {
  var model = argv[0] || "jsmock";
  if (["laya", "jev", "mock", "jsmock"].indexOf(model) < 0) fail("model must be laya, jev, mock or jsmock");
  bench(model, Number(argv[1]) || 3).catch(function (e) { fail(e.message); });
}
