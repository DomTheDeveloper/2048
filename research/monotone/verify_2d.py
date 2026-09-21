#!/usr/bin/env python3
"""Independent, dependency-free 2048 certificate verifier.

Usage: python3 verify_2d.py certificate.txt
Coordinates are zero-based, and each move includes its mandatory spawn.
Checks two independently organized slide algorithms at every transition.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path

Board = tuple[int, ...]

def line_slide(board: Board, h: int, w: int, direction: str) -> tuple[Board, int]:
    if direction in 'LR':
        columns = range(w) if direction == 'L' else range(w-1, -1, -1)
        lines = [[r*w+c for c in columns] for r in range(h)]
    elif direction in 'UD':
        rows = range(h) if direction == 'U' else range(h-1, -1, -1)
        lines = [[r*w+c for r in rows] for c in range(w)]
    else:
        raise ValueError(f'Unknown direction: {direction}')
    result = [0] * (h*w)
    gain = 0
    for line in lines:
        values = [board[i] for i in line if board[i]]
        packed: list[int] = []
        k = 0
        while k < len(values):
            if k+1 < len(values) and values[k] == values[k+1]:
                packed.append(2*values[k]); gain += 2*values[k]; k += 2
            else:
                packed.append(values[k]); k += 1
        for i, value in zip(line, packed):
            result[i] = value
    return tuple(result), gain

def cell_slide(board: Board, h: int, w: int, direction: str) -> tuple[Board, int]:
    dr, dc = {'U': (-1, 0), 'D': (1, 0), 'L': (0, -1), 'R': (0, 1)}[direction]
    rows = range(h-1, -1, -1) if dr == 1 else range(h)
    cols = range(w-1, -1, -1) if dc == 1 else range(w)
    cells = [(r, c) for r in rows for c in cols]
    result = list(board); merged: set[int] = set(); gain = 0
    for r, c in cells:
        original = r*w+c; value = result[original]
        if not value: continue
        rr, cc = r, c
        while 0 <= rr+dr < h and 0 <= cc+dc < w and result[(rr+dr)*w+cc+dc] == 0:
            rr, cc = rr+dr, cc+dc
        nr, nc = rr+dr, cc+dc
        if 0 <= nr < h and 0 <= nc < w and result[nr*w+nc] == value and nr*w+nc not in merged:
            destination = nr*w+nc; result[original] = 0; result[destination] = 2*value
            gain += 2*value; merged.add(destination)
        else:
            destination = rr*w+cc
            if destination != original:
                result[original] = 0; result[destination] = value
    return tuple(result), gain

def verify(path: Path) -> dict:
    records = [s.strip().split() for s in path.read_text().splitlines()
               if s.strip() and not s.lstrip().startswith('#')]
    if len(records) < 3 or records[0][0] != 'SIZE':
        raise ValueError('Certificate must start with SIZE and two START records')
    h, w = map(int, records[0][1:])
    if h < 1 or w < 1 or h*w < 2: raise ValueError('Board must have at least two cells')
    b = [0] * (h*w); n2 = n4 = 0
    for entry in records[1:3]:
        if len(entry) != 4 or entry[0] != 'START': raise ValueError('Exactly two opening tiles are required')
        r, c, value = map(int, entry[1:])
        if not (0 <= r < h and 0 <= c < w) or value not in (2, 4) or b[r*w+c]:
            raise ValueError('Illegal opening tile')
        b[r*w+c] = value; n2 += value == 2; n4 += value == 4
    board = tuple(b); score = 0; first_reached = {v: 0 for v in board if v}; directions = {d: 0 for d in 'ULDR'}
    for step, entry in enumerate(records[3:], 1):
        if len(entry) != 4 or entry[0] not in directions: raise ValueError(f'Malformed move {step}')
        d = entry[0]; r, c, value = map(int, entry[1:])
        a, gain = line_slide(board, h, w, d); a2, gain2 = cell_slide(board, h, w, d)
        if (a, gain) != (a2, gain2): raise ValueError(f'Independent engines disagree at move {step}')
        if a == board: raise ValueError(f'No-op at move {step}')
        if not (0 <= r < h and 0 <= c < w) or value not in (2, 4) or a[r*w+c]:
            raise ValueError(f'Illegal spawn at move {step}')
        if sum(a) != sum(board): raise ValueError(f'Mass is not preserved at move {step}')
        b = list(a); b[r*w+c] = value; board = tuple(b); score += gain
        n2 += value == 2; n4 += value == 4; directions[d] += 1
        for tile in board:
            if tile: first_reached.setdefault(tile, step)
    moves = len(records)-3
    phi = sum((v.bit_length()-2)*v for v in board if v)
    if score != phi-4*n4 or sum(board) != 2*n2+4*n4 or moves != n2+n4-2:
        raise ValueError('Score/mass/spawn ledger disagreement')
    return {'file': path.name, 'board_size': [h, w], 'steps': moves,
            'maximum_tile': max(board), 'first_maximum_at': first_reached[max(board)],
            'score': score, 'spawned_2s': n2, 'spawned_4s': n4, 'mass': sum(board),
            'directions': directions, 'final_board': [list(board[r*w:(r+1)*w]) for r in range(h)],
            'certificate': 'VALID', 'slide_algorithms_agree': True}

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('certificate', type=Path); args = parser.parse_args()
    try: print(json.dumps(verify(args.certificate), indent=2))
    except (ValueError, OSError, KeyError) as exc: parser.exit(1, f'INVALID: {exc}\n')
