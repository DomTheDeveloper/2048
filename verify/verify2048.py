#!/usr/bin/env python3
"""Independent checker for 2048 witness files (no dependencies).

    python3 verify/verify2048.py witness/131072.txt

A witness lists the two starting tiles and then every move of a game:
the direction slid and the tile that appeared afterwards. This program
replays the game under the rules of Gabriele Cirulli's 2048 and stops
at the first illegal step: a slide that changes nothing, a tile that
appears on an occupied cell, or a tile that is neither 2 nor 4. If it
reaches the end, everything printed about the final position is a fact
about a legal game that the standard 4x4 game produces with positive
probability.

The rules, as in the original game_manager.js: all tiles slide as far
as they can in the chosen direction; a tile that runs into a tile of
equal value that has not merged during this move merges with it into a
tile of twice the value, and the score grows by that value; tiles are
processed starting from the wall they move toward. The slide is
implemented twice below, once cell by cell as in the original and once
line by line, and the two must agree at every move.
"""
import re
import sys

N = 4


def slide_original(board, d):
    """Cell-by-cell rule of the original game. d: 0 up, 1 right, 2 down, 3 left."""
    dr, dc = [(-1, 0), (0, 1), (1, 0), (0, -1)][d]
    rows = list(range(N))
    cols = list(range(N))
    if dr == 1:
        rows.reverse()
    if dc == 1:
        cols.reverse()
    new = [row[:] for row in board]
    merged = [[False] * N for _ in range(N)]
    moved = False
    gain = 0
    for r in rows:
        for c in cols:
            v = new[r][c]
            if v == 0:
                continue
            new[r][c] = 0
            fr, fc = r, c
            while 0 <= fr + dr < N and 0 <= fc + dc < N and new[fr + dr][fc + dc] == 0:
                fr, fc = fr + dr, fc + dc
            nr, nc = fr + dr, fc + dc
            if 0 <= nr < N and 0 <= nc < N and new[nr][nc] == v and not merged[nr][nc]:
                new[nr][nc] = 2 * v
                merged[nr][nc] = True
                gain += 2 * v
                moved = True
            else:
                new[fr][fc] = v
                if (fr, fc) != (r, c):
                    moved = True
    return new, moved, gain


def slide_lines(board, d):
    """Line-by-line rule: pack, then merge equal neighbours from the wall."""
    new = [[0] * N for _ in range(N)]
    moved = False
    gain = 0
    for i in range(N):
        if d in (0, 2):
            cells = [(r, i) for r in range(N)]
        else:
            cells = [(i, c) for c in range(N)]
        if d in (1, 2):
            cells.reverse()
        vals = [board[r][c] for r, c in cells if board[r][c]]
        out = []
        k = 0
        while k < len(vals):
            if k + 1 < len(vals) and vals[k] == vals[k + 1]:
                out.append(2 * vals[k])
                gain += 2 * vals[k]
                k += 2
            else:
                out.append(vals[k])
                k += 1
        for idx, (r, c) in enumerate(cells):
            v = out[idx] if idx < len(out) else 0
            new[r][c] = v
            if v != board[r][c]:
                moved = True
    return new, moved, gain


def main(path):
    board = [[0] * N for _ in range(N)]
    starts = 0
    moves = 0
    score = 0
    fours = 0
    twos = 0
    dirs = {"U": 0, "R": 1, "D": 2, "L": 3}
    with open(path) as f:
        for lineno, raw in enumerate(f, 1):
            line = raw.split("#", 1)[0].strip()
            if not line:
                continue
            parts = line.split()
            if len(parts) != 4:
                sys.exit("line %d: expected exactly four fields\nCertificate: INVALID" % lineno)
            if any(re.fullmatch(r"[+-]?[0-9]+", token) is None for token in parts[1:]):
                sys.exit("line %d: coordinates and value must be decimal integers\nCertificate: INVALID" % lineno)
            try:
                r, c, v = (int(token) for token in parts[1:])
            except ValueError:
                sys.exit("line %d: coordinates and value must be integers\nCertificate: INVALID" % lineno)
            # Check BEFORE indexing: Python otherwise accepts negative coordinates.
            if not (0 <= r < N and 0 <= c < N):
                sys.exit("line %d: coordinates outside the board\nCertificate: INVALID" % lineno)
            if v not in (2, 4):
                sys.exit("line %d: a new tile must be 2 or 4\nCertificate: INVALID" % lineno)
            if parts[0] == "start":
                if starts >= 2:
                    sys.exit("line %d: more than two starting tiles\nCertificate: INVALID" % lineno)
                if moves:
                    sys.exit("line %d: start after moves began" % lineno)
                if v not in (2, 4) or board[r][c]:
                    sys.exit("line %d: bad starting tile" % lineno)
                board[r][c] = v
                starts += 1
                fours += v == 4
                twos += v == 2
                continue
            if starts != 2:
                sys.exit("line %d: a game starts with exactly two tiles" % lineno)
            if parts[0] not in dirs:
                sys.exit("line %d: direction must be U, R, D, or L\nCertificate: INVALID" % lineno)
            d = dirs[parts[0]]
            a, moved_a, gain_a = slide_original(board, d)
            b, moved_b, gain_b = slide_lines(board, d)
            if a != b or moved_a != moved_b or gain_a != gain_b:
                sys.exit("line %d: the two rule implementations disagree" % lineno)
            if not moved_a:
                sys.exit("line %d: ILLEGAL MOVE, the slide changes nothing\nCertificate: INVALID" % lineno)
            if v not in (2, 4):
                sys.exit("line %d: ILLEGAL SPAWN, a new tile must be 2 or 4\nCertificate: INVALID" % lineno)
            if a[r][c]:
                sys.exit("line %d: ILLEGAL SPAWN, the new tile lands on an occupied cell\nCertificate: INVALID" % lineno)
            a[r][c] = v
            board = a
            moves += 1
            score += gain_a
            fours += v == 4
            twos += v == 2
    if starts != 2:
        sys.exit("a game starts with exactly two tiles")
    tiles = sorted((v for row in board for v in row if v), reverse=True)
    dead = all(not slide_lines(board, d)[1] for d in range(4))
    print("Steps verified:      %d" % moves)
    print("Illegal moves:       0")
    print("Illegal spawns:      0")
    print("Spawned 2s / 4s:     %d / %d   (the two starting tiles included)" % (twos, fours))
    print("Score:               %d" % score)
    print("Final board:")
    for row in board:
        print("  " + " ".join("%6d" % v if v else "     ." for v in row))
    print("Final maximum tile:  %d" % tiles[0])
    chain = [2 ** k for k in range(N * N + 1, 1, -1)]
    if tiles == chain:
        print("Final position:      every power of two from %d down to 4, one per cell" % chain[0])
    print("Game over:           %s" % ("yes, no move changes the board" if dead else "no"))
    print("Certificate:         VALID")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("usage: python3 verify/verify2048.py WITNESS")
    try:
        main(sys.argv[1])
    except OSError as exc:
        sys.exit("Cannot read witness: %s" % exc)
