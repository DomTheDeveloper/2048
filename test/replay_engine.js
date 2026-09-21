// Replays a plain-text witness (see witness/ and verify/verify2048.py)
// through the ORIGINAL game engine -- Gabriele Cirulli's game_manager.js,
// grid.js and tile.js, unmodified -- with the random tile replaced by the
// tile the witness prescribes:
//
//   node test/replay_engine.js witness/131072.txt
//
// This is the second, deliberately different check of the certificate:
// verify/verify2048.py knows nothing of this repository, and this script
// knows nothing of the AI (it never loads js/super_ai.js). A move whose
// slide changes nothing never reaches the spawn (the engine only spawns
// after a move that moved something), and a prescribed cell that is
// occupied is reported; either fails the certificate.

"use strict";

var fs = require("fs");
var path = require("path");
var vm = require("vm");

var root = path.join(__dirname, "..");
var file = process.argv[2];
if (!file) { console.error("usage: node test/replay_engine.js WITNESS"); process.exit(2); }

var sandbox = { Math: Math, console: console, window: {} };
var ctx = vm.createContext(sandbox);
["tile.js", "grid.js", "game_manager.js"].forEach(function (f) {
  vm.runInContext(fs.readFileSync(path.join(root, "js", f), "utf8"), ctx, { filename: f });
});
vm.runInContext(
  "function FakeInput(){} FakeInput.prototype.on = function(){};\n" +
  "function FakeActuator(){} FakeActuator.prototype.actuate = function(){};\n" +
  "FakeActuator.prototype.continue = function(){};\n" +
  "function FakeScore(){} FakeScore.prototype.get = function(){return 0};\n" +
  "FakeScore.prototype.set = function(){};\n" +
  "Math.seedrandom = function(){};\n", ctx);
var gm = vm.runInContext("new GameManager(4, FakeInput, FakeActuator, FakeScore)", ctx);
var Grid = sandbox.Grid, Tile = sandbox.Tile;

// A fresh, empty board; the witness supplies the two starting tiles.
gm.grid = new Grid(4);
gm.score = 0;
gm.over = false;
gm.won = false;
gm.keepPlaying = true; // the engine would otherwise stop at the first 2048

var pending = null, spawned = false, illegalSpawns = 0;
gm.addRandomTile = function () {
  spawned = true;
  if (!pending || (pending.value !== 2 && pending.value !== 4) || !this.grid.cellAvailable(pending)) {
    illegalSpawns++;
    return;
  }
  this.grid.insertTile(new Tile({ x: pending.x, y: pending.y }, pending.value));
};

var DIRS = { U: 0, R: 1, D: 2, L: 3 };
var lines;
try {
  lines = fs.readFileSync(file, "utf8").split("\n");
} catch (error) {
  console.error("Cannot read witness: " + error.message);
  process.exit(1);
}
function reject(lineNumber, reason) {
  console.error("line " + lineNumber + ": " + reason + "\nCertificate: INVALID");
  process.exit(1);
}
var starts = 0, steps = 0, illegalMoves = 0, twos = 0, fours = 0, firstBad = null;
for (var i = 0; i < lines.length; i++) {
  var line = lines[i].split("#")[0].trim();
  if (!line) continue;
  var p = line.split(/\s+/);
  if (p.length !== 4) reject(i + 1, "expected exactly four fields");
  if (!p.slice(1).every(function (token) { return /^[+-]?\d+$/.test(token); })) {
    reject(i + 1, "coordinates and value must be integers");
  }
  var row = Number(p[1]), column = Number(p[2]), value = Number(p[3]);
  if (!Number.isInteger(row) || !Number.isInteger(column) ||
      row < 0 || row >= 4 || column < 0 || column >= 4) {
    reject(i + 1, "coordinates outside the board");
  }
  if (value !== 2 && value !== 4) reject(i + 1, "a new tile must be 2 or 4");
  if (p[0] === "start") {
    if (starts >= 2 || steps !== 0) reject(i + 1, "exactly two starting tiles must precede all moves");
    if (!gm.grid.cellAvailable({ x: column, y: row })) reject(i + 1, "duplicate starting cell");
    var sv = value;
    gm.grid.insertTile(new Tile({ x: column, y: row }, sv));
    starts++;
    if (sv === 2) twos++; else fours++;
    continue;
  }
  if (starts !== 2) { console.error("line " + (i + 1) + ": a game starts with exactly two tiles"); process.exit(1); }
  if (!Object.prototype.hasOwnProperty.call(DIRS, p[0])) reject(i + 1, "direction must be U, R, D, or L");
  pending = { x: column, y: row, value: value };
  spawned = false;
  var before = illegalSpawns;
  gm.move(DIRS[p[0]]);
  if (!spawned) { illegalMoves++; if (firstBad === null) firstBad = i + 1; }
  else if (illegalSpawns > before && firstBad === null) firstBad = i + 1;
  else { if (pending.value === 2) twos++; else fours++; }
  steps++;
  gm.undoStack.length = 0; // the engine keeps a full undo history; not needed here
  if (firstBad !== null) break;
}

var vals = [], max = 0;
for (var y = 0; y < 4; y++) {
  var row = [];
  for (var x = 0; x < 4; x++) {
    var t = gm.grid.cellContent({ x: x, y: y });
    var v = t ? t.value : 0;
    row.push(v ? String(v).padStart(6) : "     .");
    if (v) vals.push(v);
    if (v > max) max = v;
  }
  console.log("  " + row.join(" "));
}
vals.sort(function (a, b) { return b - a; });
var chain = [];
for (var k = 17; k >= 2; k--) chain.push(1 << k);
var isChain = vals.join(",") === chain.join(",");
console.log("Engine:              original game_manager.js / grid.js / tile.js");
console.log("Steps verified:      " + steps);
console.log("Illegal moves:       " + illegalMoves + (firstBad !== null ? "   (first problem at line " + firstBad + ")" : ""));
console.log("Illegal spawns:      " + illegalSpawns);
console.log("Spawned 2s / 4s:     " + twos + " / " + fours + "   (the two starting tiles included)");
console.log("Score:               " + gm.score);
console.log("Final maximum tile:  " + max);
if (isChain) console.log("Final position:      every power of two from 131072 down to 4, one per cell");
console.log("Game over:           " + (gm.movesAvailable() ? "no" : "yes, no move changes the board"));
var valid = illegalMoves === 0 && illegalSpawns === 0 && starts === 2;
console.log("Certificate:         " + (valid ? "VALID" : "INVALID"));
process.exit(valid ? 0 : 1);
