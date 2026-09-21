// Honest play for 2048-ai: the AIs that take the tiles as they come.
//
// Four of them are ports of AJ Richardson's 2048-AI — SMART, ALGORITHM,
// PRIORITY and RANDOM — together with his EVIL tile generator, rewritten
// over flat 16-cell arrays so the same code runs in the worker, in Node
// and against the real board, and made corner-relative (his are written
// for the top-left corner). GENIUS is this fork's own: a depth-adaptive
// expectimax over row tables with a heuristic in the nneonneo tradition
// (empties, merges, monotonicity, tile sum) plus a pull toward the
// chosen corner, and an exact model of the Evil generator when that is
// what it is up against.
//
// DOM-free: the browser, the Web Worker and test/honest.js share it.

(function (global) {
  "use strict";

  var Super = (typeof module !== "undefined" && module.exports)
    ? require("./super_ai.js") : global.Super2048;
  var simMove = Super.simMove;
  var maxTile = Super.maxTile;
  var snakeCells = Super.snakeCells;
  var CELLS = 16;

  // Direction codes match game_manager.js: 0 up, 1 right, 2 down, 3 left.
  var VEC = [{ x: 0, y: -1 }, { x: 1, y: 0 }, { x: 0, y: 1 }, { x: -1, y: 0 }];

  function emptyCount(b) {
    var n = 0;
    for (var i = 0; i < CELLS; i++) if (!b[i]) n++;
    return n;
  }
  function legal(b, dir) { return simMove(b, dir).moved; }
  function anyLegal(b) {
    for (var d = 0; d < 4; d++) if (legal(b, d)) return d;
    return -1;
  }

  // Corner-relative move order. aj-r's AIs chase the top-left corner
  // (Up > Left > Right > Down); the corner picker moves the target.
  var PRIORITY = { tl: [0, 3, 1, 2], tr: [0, 1, 3, 2],
                   bl: [2, 3, 1, 0], br: [2, 1, 3, 0] };

  // ------------------------------------------------------------------
  // aj-r's AIs
  // ------------------------------------------------------------------

  // RANDOM: "Random number generator!" — a random legal direction.
  function RandomAI() {}
  RandomAI.prototype.nextMove = function (b) {
    var dirs = [];
    for (var d = 0; d < 4; d++) if (legal(b, d)) dirs.push(d);
    if (!dirs.length) return -1;
    return dirs[(Math.random() * dirs.length) | 0];
  };

  // PRIORITY: "Up > Left > Right > Down" — the first legal move in a
  // fixed order.
  function PriorityAI(corner) { this.order = PRIORITY[corner] || PRIORITY.tl; }
  PriorityAI.prototype.nextMove = function (b) {
    for (var i = 0; i < 4; i++) if (legal(b, this.order[i])) return this.order[i];
    return -1;
  };

  // ALGORITHM: "Up, Left, Up, Left, etc." — alternate the two
  // corner-ward moves; when the alternate is blocked, fall back to the
  // priority order.
  function AlgorithmAI(corner) {
    this.order = PRIORITY[corner] || PRIORITY.tl;
    this.prev = -1;
  }
  AlgorithmAI.prototype.nextMove = function (b) {
    var move = this.order[0];
    if (move === this.prev) move = this.order[1];
    if (!legal(b, move)) {
      for (var i = 0; i < 4; i++) {
        move = this.order[i];
        if (legal(b, move)) break;
      }
    }
    this.prev = move;
    return legal(b, move) ? move : -1;
  };

  // SMART: "Fancy intelligentness" — aj-r's hand-written strategy.
  // Grid quality = monotonicity of every row and column (a tile against
  // the run costs max(current, previous)) plus 8 per empty cell; the
  // planner looks three moves ahead, assumes a 2 spawns in the worst
  // cell adjacent to a tile, and picks the move with the least expected
  // loss of quality, then the best quality, then the lowest chance of
  // the worst case.
  function SmartAI() {}

  SmartAI.prototype.gridQuality = function (b) {
    var mono = 0, prev, inc, dec, v, x, y;
    for (x = 0; x < 4; x++) {
      prev = -1; inc = 0; dec = 0;
      for (y = 0; y < 4; y++) {
        v = b[y * 4 + x];
        inc += v;
        if (v <= prev || prev === -1) {
          dec += v;
          if (v < prev) inc -= prev;
        }
        prev = v;
      }
      mono += Math.max(inc, dec);
    }
    for (y = 0; y < 4; y++) {
      prev = -1; inc = 0; dec = 0;
      for (x = 0; x < 4; x++) {
        v = b[y * 4 + x];
        inc += v;
        if (v <= prev || prev === -1) {
          dec += v;
          if (v < prev) inc -= prev;
        }
        prev = v;
      }
      mono += Math.max(inc, dec);
    }
    return mono + emptyCount(b) * 8;
  };

  function hasNeighbor(b, c) {
    var x = c % 4, y = (c / 4) | 0;
    for (var d = 0; d < 4; d++) {
      var nx = x + VEC[d].x, ny = y + VEC[d].y;
      if (nx < 0 || nx > 3 || ny < 0 || ny > 3) continue;
      if (b[ny * 4 + nx]) return true;
    }
    return false;
  }

  SmartAI.prototype.planAhead = function (b, numMoves, originalQuality) {
    var results = [null, null, null, null];
    for (var d = 0; d < 4; d++) {
      var sim = simMove(b, d);
      if (!sim.moved) continue;
      var result = { quality: -1, probability: 1, qualityLoss: 0, direction: d };
      var cells = [];
      for (var i = 0; i < CELLS; i++) if (!sim.board[i]) cells.push(i);
      var n = cells.length;
      for (i = 0; i < n; i++) {
        if (!hasNeighbor(sim.board, cells[i])) continue;
        var b2 = sim.board.slice();
        b2[cells[i]] = 2;
        var tr;
        if (numMoves > 1) {
          tr = this.chooseBestMove(this.planAhead(b2, numMoves - 1, originalQuality),
                                   originalQuality);
        } else {
          var q = this.gridQuality(b2);
          tr = { quality: q, probability: 1,
                 qualityLoss: Math.max(originalQuality - q, 0) };
        }
        if (result.quality === -1 || tr.quality < result.quality) {
          result.quality = tr.quality;
          result.probability = tr.probability / n;
        } else if (tr.quality === result.quality) {
          result.probability += tr.probability / n;
        }
        result.qualityLoss += tr.qualityLoss / n;
      }
      results[d] = result;
    }
    return results;
  };

  SmartAI.prototype.chooseBestMove = function (results, originalQuality) {
    var best = null;
    for (var i = 0; i < 4; i++) {
      var r = results[i];
      if (!r) continue;
      if (!best || r.qualityLoss < best.qualityLoss ||
          (r.qualityLoss === best.qualityLoss && r.quality > best.quality) ||
          (r.qualityLoss === best.qualityLoss && r.quality === best.quality &&
           r.probability < best.probability)) {
        best = r;
      }
    }
    if (!best) {
      best = { quality: -1, probability: 1, qualityLoss: originalQuality, direction: 0 };
    }
    return best;
  };

  SmartAI.prototype.nextMove = function (b) {
    var oq = this.gridQuality(b);
    var best = this.chooseBestMove(this.planAhead(b, 3, oq), oq);
    return legal(b, best.direction) ? best.direction : anyLegal(b);
  };

  // ------------------------------------------------------------------
  // aj-r's EVIL tile generator
  // ------------------------------------------------------------------

  // "Adds a tile in (hopefully) the worst position possible": along the
  // edge the last move packed the tiles against — the first empty cell
  // of every line scanning from that edge — pick the cell whose
  // smallest neighbour is largest (nothing for the new tile to merge
  // with), as a 2 unless those neighbours are 2s, then a 4. Ties break
  // at random. `lastDir` is the direction of the move just made.
  function evilChoices(b, lastDir) {
    var v = VEC[lastDir >= 0 && lastDir <= 3 ? lastDir : 0];
    var vx = -v.x, vy = -v.y;
    var options = [];
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        var x = vx === 1 ? j : vx === -1 ? 3 - j : i;
        var y = vy === 1 ? j : vy === -1 ? 3 - j : i;
        if (!b[y * 4 + x]) { options.push(y * 4 + x); break; }
      }
    }
    var bestScore = 0, winners = [];
    for (i = 0; i < options.length; i++) {
      var c = options[i], cx = c % 4, cy = (c / 4) | 0;
      var minValue = 65536;
      for (var d = 0; d < 4; d++) {
        var nx = cx + VEC[d].x, ny = cy + VEC[d].y;
        if (nx < 0 || nx > 3 || ny < 0 || ny > 3) continue;
        var t = b[ny * 4 + nx];
        if (t) minValue = Math.min(minValue, t);
      }
      if (minValue > bestScore) { winners = []; bestScore = minValue; }
      if (minValue >= bestScore) winners.push(c);
    }
    return { cells: winners, value: bestScore !== 2 ? 2 : 4 };
  }

  function evilSpawn(b, lastDir) {
    var ch = evilChoices(b, lastDir);
    if (!ch.cells.length) return null;
    return { cell: ch.cells[(Math.random() * ch.cells.length) | 0], value: ch.value };
  }

  function randomSpawn(b) {
    var empt = [];
    for (var i = 0; i < CELLS; i++) if (!b[i]) empt.push(i);
    if (!empt.length) return null;
    return { cell: empt[(Math.random() * empt.length) | 0],
             value: Math.random() < 0.9 ? 2 : 4 };
  }

  // ------------------------------------------------------------------
  // GENIUS: expectimax over rank tables
  // ------------------------------------------------------------------

  // Tiles are handled as ranks (log2: 2 -> 1, 131072 -> 17) and every
  // row or column as one base-18 index, so a slide is a table lookup
  // and the whole-board heuristic is eight of them.
  var N = 18, N2 = N * N, N3 = N2 * N, N4 = N3 * N;
  var slideL = null, slideR = null, gainL = null, gainR = null;

  function revIdx(i) {
    var r3 = i % N; i = (i / N) | 0;
    var r2 = i % N; i = (i / N) | 0;
    var r1 = i % N; i = (i / N) | 0;
    return ((r3 * N + r2) * N + r1) * N + i;
  }

  function buildSlides() {
    slideL = new Int32Array(N4);
    slideR = new Int32Array(N4);
    gainL = new Float64Array(N4);
    gainR = new Float64Array(N4);
    var r = [0, 0, 0, 0];
    for (var i = 0; i < N4; i++) {
      var t = i;
      r[3] = t % N; t = (t / N) | 0;
      r[2] = t % N; t = (t / N) | 0;
      r[1] = t % N; r[0] = (t / N) | 0;
      var vals = [], out = [], gain = 0, k;
      for (k = 0; k < 4; k++) if (r[k]) vals.push(r[k]);
      k = 0;
      while (k < vals.length) {
        if (k + 1 < vals.length && vals[k] === vals[k + 1] && vals[k] < N - 1) {
          out.push(vals[k] + 1);
          gain += Math.pow(2, vals[k] + 1);
          k += 2;
        } else {
          out.push(vals[k]);
          k++;
        }
      }
      while (out.length < 4) out.push(0);
      slideL[i] = ((out[0] * N + out[1]) * N + out[2]) * N + out[3];
      gainL[i] = gain;
    }
    for (i = 0; i < N4; i++) {
      var rev = revIdx(i);
      slideR[i] = revIdx(slideL[rev]);
      gainR[i] = gainL[rev];
    }
  }

  // Heuristic weights. MAX BLOCK is the classic set; MAX SCORE leans a
  // little harder on staying alive (empties and merges), since score
  // is nothing but the number of merges the game survives to make.
  var WEIGHTS = {
    tile:  { lost: 200000, empty: 270, merges: 700, mono: 47, sum: 11, corner: 20000 },
    score: { lost: 200000, empty: 350, merges: 900, mono: 40, sum: 11, corner: 12000 }
  };
  var heurTables = {};

  function heurTable(w) {
    var key = [w.lost, w.empty, w.merges, w.mono, w.sum].join("/");
    if (heurTables[key]) return heurTables[key];
    var h = new Float64Array(N4);
    var pow4 = [], pow35 = [];
    for (var k = 0; k < N; k++) {
      pow4[k] = Math.pow(k, 4);
      pow35[k] = Math.pow(k, 3.5);
    }
    var r = [0, 0, 0, 0];
    for (var i = 0; i < N4; i++) {
      var t = i;
      r[3] = t % N; t = (t / N) | 0;
      r[2] = t % N; t = (t / N) | 0;
      r[1] = t % N; r[0] = (t / N) | 0;
      var empty = 0, merges = 0, prev = 0, counter = 0, sum = 0;
      for (k = 0; k < 4; k++) {
        var rank = r[k];
        sum += pow35[rank];
        if (!rank) {
          empty++;
        } else {
          if (prev === rank) {
            counter++;
          } else if (counter > 0) {
            merges += 1 + counter;
            counter = 0;
          }
          prev = rank;
        }
      }
      if (counter > 0) merges += 1 + counter;
      var monoL = 0, monoR = 0;
      for (k = 1; k < 4; k++) {
        if (r[k - 1] > r[k]) monoL += pow4[r[k - 1]] - pow4[r[k]];
        else monoR += pow4[r[k]] - pow4[r[k - 1]];
      }
      h[i] = w.lost + w.empty * empty + w.merges * merges -
             w.mono * Math.min(monoL, monoR) - w.sum * sum;
    }
    heurTables[key] = h;
    return h;
  }

  function toRanks(board) {
    var b = new Array(CELLS);
    for (var i = 0; i < CELLS; i++) {
      var v = board[i], r = 0;
      while (v > 1) { v >>= 1; r++; }
      b[i] = r;
    }
    return b;
  }

  function rowIdx(b, y) {
    var o = y * 4;
    return ((b[o] * N + b[o + 1]) * N + b[o + 2]) * N + b[o + 3];
  }
  function colIdx(b, x) {
    return ((b[x] * N + b[4 + x]) * N + b[8 + x]) * N + b[12 + x];
  }

  // Slide a rank board; returns null when nothing moves.
  function moveRanks(b, dir) {
    var nb = new Array(CELLS);
    var moved = false, gain = 0, i, s, r3, r2, r1;
    if (dir === 1 || dir === 3) {
      var tabH = dir === 3 ? slideL : slideR;
      var gH = dir === 3 ? gainL : gainR;
      for (var y = 0; y < 4; y++) {
        i = rowIdx(b, y);
        s = tabH[i];
        if (s !== i) { moved = true; gain += gH[i]; }
        r3 = s % N; s = (s / N) | 0;
        r2 = s % N; s = (s / N) | 0;
        r1 = s % N; s = (s / N) | 0;
        var o = y * 4;
        nb[o] = s; nb[o + 1] = r1; nb[o + 2] = r2; nb[o + 3] = r3;
      }
    } else {
      var tabV = dir === 0 ? slideL : slideR;
      var gV = dir === 0 ? gainL : gainR;
      for (var x = 0; x < 4; x++) {
        i = colIdx(b, x);
        s = tabV[i];
        if (s !== i) { moved = true; gain += gV[i]; }
        r3 = s % N; s = (s / N) | 0;
        r2 = s % N; s = (s / N) | 0;
        r1 = s % N; s = (s / N) | 0;
        nb[x] = s; nb[4 + x] = r1; nb[8 + x] = r2; nb[12 + x] = r3;
      }
    }
    if (!moved) return null;
    return { board: nb, gain: gain };
  }

  function keyOf(b) { return String.fromCharCode.apply(null, b); }

  function GeniusAI(corner, opts) {
    opts = opts || {};
    if (!slideL) buildSlides();
    this.corner = corner;
    this.goal = opts.goal === "score" ? "score" : "tile";
    this.evil = opts.tiles === "evil";
    this.w = WEIGHTS[this.goal];
    this.heur = heurTable(this.w);
    this.cornerCell = snakeCells(corner)[0];
    // Search depth in spawn plies. Deeper as the board gets busier
    // (more distinct tiles = a tighter, more dangerous position and a
    // smaller tree), capped to keep a move under a few tens of ms.
    this.maxDepth = opts.maxDepth || 3;
    this.cutoff = opts.cutoff || 0.0001;
    this.explored = 0;
    this.memo = null;
    this.lastDepth = 0;
  }

  GeniusAI.prototype.evalRanks = function (b) {
    var h = this.heur;
    var v = h[rowIdx(b, 0)] + h[rowIdx(b, 1)] + h[rowIdx(b, 2)] + h[rowIdx(b, 3)] +
            h[colIdx(b, 0)] + h[colIdx(b, 1)] + h[colIdx(b, 2)] + h[colIdx(b, 3)];
    // The corner picker: the biggest tile is worth extra where it was
    // asked to live. Small next to a monotonicity step, decisive early.
    var m = 0;
    for (var i = 0; i < CELLS; i++) if (b[i] > m) m = b[i];
    if (b[this.cornerCell] === m) v += this.w.corner * m;
    return v;
  };

  // Chance node: the spawn. Random tiles average over every empty cell
  // (90/10); Evil tiles are exactly aj-r's rule, its random tie-break
  // averaged.
  GeniusAI.prototype.chance = function (b, lastDir, depth, prob) {
    if (depth <= 0 || prob < this.cutoff) return this.evalRanks(b);
    var key = keyOf(b) + depth;
    var hit = this.memo.get(key);
    if (hit !== undefined) return hit;
    var res = 0;
    if (this.evil) {
      var ch = evilChoicesRanks(b, lastDir);
      var m = ch.cells.length;
      if (!m) {
        res = this.evalRanks(b);
      } else {
        for (var c = 0; c < m; c++) {
          b[ch.cells[c]] = ch.rank;
          res += this.player(b, depth - 1, prob / m);
          b[ch.cells[c]] = 0;
        }
        res /= m;
      }
    } else {
      var n = 0, i;
      for (i = 0; i < CELLS; i++) if (!b[i]) n++;
      if (!n) {
        res = this.evalRanks(b);
      } else {
        var p2 = prob * 0.9 / n, p4 = prob * 0.1 / n;
        for (i = 0; i < CELLS; i++) {
          if (b[i]) continue;
          b[i] = 1;
          res += 0.9 * this.player(b, depth - 1, p2);
          b[i] = 2;
          res += 0.1 * this.player(b, depth - 1, p4);
          b[i] = 0;
        }
        res /= n;
      }
    }
    this.memo.set(key, res);
    return res;
  };

  // Max node: the move. A dead board is worth nothing.
  GeniusAI.prototype.player = function (b, depth, prob) {
    var best = 0;
    for (var d = 0; d < 4; d++) {
      var mv = moveRanks(b, d);
      if (!mv) continue;
      this.explored++;
      var v = this.chance(mv.board, d, depth, prob);
      if (v > best) best = v;
    }
    return best;
  };

  function evilChoicesRanks(b, lastDir) {
    var vals = new Array(CELLS);
    for (var i = 0; i < CELLS; i++) vals[i] = b[i] ? Math.pow(2, b[i]) : 0;
    var ch = evilChoices(vals, lastDir);
    return { cells: ch.cells, rank: ch.value === 4 ? 2 : 1 };
  }

  // The expectimax value of every legal move (null where the move is
  // illegal). nextMove is the argmax; the decision models' ASSIST
  // evidence and the fine-tuning teacher read the whole vector.
  GeniusAI.prototype.moveValues = function (board, lastDir) {
    var b = toRanks(board);
    var seen = {}, distinct = 0;
    for (var i = 0; i < CELLS; i++) {
      if (b[i] && !seen[b[i]]) { seen[b[i]] = true; distinct++; }
    }
    var depth = Math.max(2, Math.min(this.maxDepth, distinct - 2));
    if (this.evil) depth = Math.min(depth + 2, this.maxDepth + 2);
    this.lastDepth = depth;
    this.memo = new Map();
    var values = [null, null, null, null];
    for (var d = 0; d < 4; d++) {
      var mv = moveRanks(b, d);
      if (!mv) continue;
      this.explored++;
      values[d] = this.chance(mv.board, d, depth, 1.0);
    }
    this.memo = null;
    return values;
  };

  GeniusAI.prototype.nextMove = function (board, lastDir) {
    var values = this.moveValues(board, lastDir);
    var bestDir = -1, bestVal = -Infinity;
    for (var d = 0; d < 4; d++) {
      if (values[d] !== null && values[d] > bestVal) { bestVal = values[d]; bestDir = d; }
    }
    return bestDir;
  };

  // ------------------------------------------------------------------

  function makeAI(algo, corner, opts) {
    switch (algo) {
      case "random": return new RandomAI();
      case "priority": return new PriorityAI(corner);
      case "algorithm": return new AlgorithmAI(corner);
      case "smart": return new SmartAI();
      default: return new GeniusAI(corner, opts);
    }
  }

  // UNDO REGULAR: the undo button as a human uses it — only to escape
  // game over. Each death unwinds a growing number of moves (1, 2, 4,
  // ... 64) and play resumes with fresh luck; any new best score resets
  // the ladder. A run that dies 40 times in a row without ever beating
  // its best score has run out of luck, and 1,000 deaths is the hard
  // cap.
  var LADDER_MAX = 64, STALL_DEATHS = 40, DEATH_CAP = 1000;

  function Ladder() {
    this.step = 1;
    this.sinceBest = 0;
    this.bestScore = -1;
    this.deaths = 0;
  }
  Ladder.prototype.progress = function (score) {
    if (score > this.bestScore) {
      this.bestScore = score;
      this.step = 1;
      this.sinceBest = 0;
    }
  };
  Ladder.prototype.death = function (available) {
    this.deaths++;
    this.sinceBest++;
    var k = Math.min(this.step, available);
    this.step = Math.min(this.step * 2, LADDER_MAX);
    return k;
  };
  Ladder.prototype.outOfLuck = function () {
    return this.sinceBest >= STALL_DEATHS || this.deaths >= DEATH_CAP;
  };

  // ------------------------------------------------------------------
  // Headless honest runner: the whole game as flat arrays
  // ------------------------------------------------------------------

  // options: algo (genius|smart|algorithm|priority|random), tiles
  // (regular|evil), undo (disabled|regular), goal (tile|score).
  function HonestRunner(corner, options) {
    options = options || {};
    this.corner = corner;
    this.algo = options.algo || "genius";
    this.tiles = options.tiles === "evil" ? "evil" : "regular";
    this.undo = options.undo === "regular" ? "regular" : "disabled";
    this.goal = options.goal === "score" ? "score" : "tile";
    this.ai = makeAI(this.algo, corner, { goal: this.goal, tiles: this.tiles,
                                          maxDepth: options.maxDepth });
    this.stats = { moves: 0, attempts: 0, undos: 0, backtracks: 0,
                   restarts: 0, deaths: 0, score: 0, explored: 0, maxTile: 0 };
    this.ladder = new Ladder();
    this.hist = [];
    this.lastDir = 0;
    this.board = this.freshBoard();
    this.stats.maxTile = maxTile(this.board);
    this.done = false;
    this.reason = null;
  }

  HonestRunner.prototype.spawn = function (b) {
    var sp = this.tiles === "evil" ? evilSpawn(b, this.lastDir) : randomSpawn(b);
    if (sp) b[sp.cell] = sp.value;
    return sp;
  };

  HonestRunner.prototype.freshBoard = function () {
    var b = [];
    for (var i = 0; i < CELLS; i++) b.push(0);
    this.spawn(b);
    this.spawn(b);
    return b;
  };

  HonestRunner.prototype.goalDone = function (b) {
    if (this.goal === "score") return false; // plays until it dies
    return maxTile(b) >= 131072;
  };

  // Advance for about `ms` milliseconds. Returns true once the run is
  // over: the goal reached, the board dead, or (undo regular) the luck
  // exhausted; this.reason says which.
  HonestRunner.prototype.run = function (ms) {
    var until = Date.now() + (ms || 100);
    while (!this.done && Date.now() < until) {
      var b = this.board;
      if (this.goalDone(b)) { this.done = true; this.reason = "won"; break; }
      var dir = this.ai.nextMove(b, this.lastDir);
      if (dir < 0 || !legal(b, dir)) dir = anyLegal(b);
      if (dir < 0) {
        // Dead board.
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
          continue;
        }
        this.done = true;
        this.reason = this.undo === "regular" && this.hist.length ? "out of luck" : "game over";
        break;
      }
      var sim = simMove(b, dir);
      var gain = 0;
      for (var m = 0; m < sim.merges.length; m++) gain += sim.merges[m];
      this.hist.push({ b: b, g: gain, d: dir });
      if (this.hist.length > 3000) this.hist.splice(0, 100);
      this.lastDir = dir;
      this.board = sim.board;
      this.spawn(this.board);
      this.stats.score += gain;
      this.stats.moves++;
      this.stats.attempts++;
      if (this.ai.explored) { this.stats.explored = this.ai.explored; }
      var mt = maxTile(this.board);
      if (mt > this.stats.maxTile) this.stats.maxTile = mt;
      this.ladder.progress(this.stats.score);
    }
    return this.done;
  };

  // ------------------------------------------------------------------
  // Honest driver: the same play against the real GameManager
  // ------------------------------------------------------------------

  // options: algo, tiles, undo, goal, externalPlanner (the worker
  // answers "needmove" requests through setMove).
  function HonestDriver(gameManager, corner, TileCtor, options) {
    this.gm = gameManager;
    this.Tile = TileCtor;
    this.corner = corner;
    this.options = options || {};
    this.algo = this.options.algo || "genius";
    this.tiles = this.options.tiles === "evil" ? "evil" : "regular";
    this.undo = this.options.undo === "regular" ? "regular" : "disabled";
    this.goal = this.options.goal === "score" ? "score" : "tile";
    this.ai = this.options.externalPlanner
      ? null : makeAI(this.algo, corner, { goal: this.goal, tiles: this.tiles });
    this.stats = { moves: 0, attempts: 0, undos: 0, backtracks: 0,
                   restarts: 0, deaths: 0, score: 0, maxTile: 0 };
    this.ladder = new Ladder();
    this.lastDir = 0;
    this.injected = null;
    this.attached = false;
    this.reason = null;
  }

  HonestDriver.prototype.readBoard = function () {
    var b = new Array(CELLS);
    var cells = this.gm.grid.cells;
    for (var x = 0; x < 4; x++) {
      for (var y = 0; y < 4; y++) {
        var t = cells[x][y];
        b[y * 4 + x] = t ? t.value : 0;
      }
    }
    return b;
  };

  HonestDriver.prototype.setMove = function (board, dir) {
    this.injected = { key: board.join(","), dir: dir };
  };

  // The spawner: honest 90/10 over a uniform cell for REGULAR tiles
  // (the fork's original burns score-many PRNG draws per spawn, which
  // is unusable at speed), aj-r's rule for EVIL. Restored on detach.
  HonestDriver.prototype.attach = function () {
    if (this.attached) return;
    var self = this;
    var Tile = this.Tile;
    this.gm.addRandomTile = function () {
      var b = self.readBoard();
      var sp = self.tiles === "evil" ? evilSpawn(b, self.lastDir) : randomSpawn(b);
      if (!sp) return;
      this.grid.insertTile(new Tile({ x: sp.cell % 4, y: (sp.cell / 4) | 0 }, sp.value));
    };
    this.attached = true;
  };

  HonestDriver.prototype.detach = function () {
    if (!this.attached) return;
    delete this.gm.addRandomTile;
    this.attached = false;
  };

  // One step. {type: "accepted"|"needmove"|"backtrack"|"done"}
  HonestDriver.prototype.step = function () {
    var gm = this.gm;
    var board = this.readBoard();
    if (this.goal !== "score" && maxTile(board) >= 131072) {
      this.reason = "won";
      return { type: "done", reason: this.reason };
    }
    if (anyLegal(board) < 0) {
      if (this.undo === "regular" && gm.undoStack.length && !this.ladder.outOfLuck()) {
        var k = this.ladder.death(gm.undoStack.length);
        for (var u = 0; u < k; u++) {
          gm.move(-1);
          this.stats.undos++;
          this.stats.moves--; // moves counts the surviving line
        }
        this.stats.deaths++;
        this.stats.backtracks++;
        this.stats.score = gm.score;
        // The direction that produced the restored board is unknown to
        // the real game; the Evil rule only needs a direction, and
        // "up" is what aj-r's game starts with too.
        this.lastDir = 0;
        return { type: "backtrack", depth: k };
      }
      this.reason = this.undo === "regular" && gm.undoStack.length ? "out of luck" : "game over";
      return { type: "done", reason: this.reason };
    }
    var dir;
    if (this.options.externalPlanner) {
      if (this.injected && this.injected.key === board.join(",")) {
        dir = this.injected.dir;
        this.injected = null;
      } else {
        return { type: "needmove", board: board, lastDir: this.lastDir };
      }
    } else {
      if (!this.ai) {
        // The worker went away mid-run: think on this thread instead.
        this.ai = makeAI(this.algo, this.corner, { goal: this.goal, tiles: this.tiles });
      }
      dir = this.ai.nextMove(board, this.lastDir);
    }
    if (dir < 0 || !legal(board, dir)) dir = anyLegal(board);
    if (gm.won && !gm.keepPlaying) gm.keepPlaying = true;
    this.lastDir = dir;
    gm.move(dir);
    this.stats.moves++;
    this.stats.attempts++;
    this.stats.score = gm.score;
    var mt = maxTile(this.readBoard());
    if (mt > this.stats.maxTile) this.stats.maxTile = mt;
    this.ladder.progress(gm.score);
    if (gm.undoStack && gm.undoStack.length > 3000) gm.undoStack.splice(0, 500);
    return { type: "accepted", phase: "build" };
  };

  // ------------------------------------------------------------------

  var api = {
    RandomAI: RandomAI,
    PriorityAI: PriorityAI,
    AlgorithmAI: AlgorithmAI,
    SmartAI: SmartAI,
    GeniusAI: GeniusAI,
    makeAI: makeAI,
    evilSpawn: evilSpawn,
    evilChoices: evilChoices,
    randomSpawn: randomSpawn,
    HonestRunner: HonestRunner,
    HonestDriver: HonestDriver,
    Ladder: Ladder,
    legal: legal,
    anyLegal: anyLegal,
    emptyCount: emptyCount,
    ALGOS: ["genius", "smart", "algorithm", "priority", "random"]
  };

  if (typeof module !== "undefined" && module.exports) {
    module.exports = api;
  } else {
    var S = global.Super2048;
    for (var k in api) if (api.hasOwnProperty(k)) S[k] = api[k];
  }
})(this);
