"""Necessary reachability conditions for standard post-spawn 2048 boards.

These predicates reject impossible candidates; passing does NOT prove reachability.
Tiles are values (0, 2, 4, ...), not encoded ranks. The exact line-image shortcut
is restricted to lines of at most four cells, as proved in PROOFS.md, section 5.
"""
from collections import Counter
from typing import Sequence


def validate(board: Sequence[int], height: int, width: int) -> tuple[int, ...]:
    if type(height) is not int or type(width) is not int:
        raise ValueError("dimensions must be integers")
    if not (1 <= height <= 4 and 1 <= width <= 4 and height * width >= 2):
        raise ValueError("supported dimensions are 1..4 by 1..4, at least two cells")
    result = tuple(board)
    if len(result) != height * width:
        raise ValueError("board length does not match dimensions")
    if any(type(v) is not int or v < 0 or v == 1 or v & (v - 1) for v in result):
        raise ValueError("tiles must be zero or powers of two at least two")
    return result


def is_initial(board: Sequence[int]) -> bool:
    return sum(v != 0 for v in board) == 2 and all(v in (0, 2, 4) for v in board)


def rank_envelope(board: Sequence[int]) -> bool:
    ranks = sorted((v.bit_length() - 1 for v in board if v), reverse=True)
    return all(rank <= len(board) + 1 - index for index, rank in enumerate(ranks))


def line_in_slide_image(line: Sequence[int]) -> bool:
    """Closed characterization of the slide image; identity slides are included."""
    if not 1 <= len(line) <= 4:
        raise ValueError("closed line characterization requires length 1..4")
    values = tuple(v for v in line if v)
    if tuple(line) != values + (0,) * (len(line) - len(values)):
        return False
    pairs = tuple(zip(values, values[1:]))
    if len(values) == len(line):
        return all(a != b for a, b in pairs)
    return all((a, b) != (2, 2) for a, b in pairs)


def eligible_spawns(board: Sequence[int], height: int, width: int,
                    *, exact_image: bool = False) -> tuple[int, ...]:
    """Cells whose removal permits a compact or exact nonidentity slide image.

    exact_image checks values as well as occupancy. It does not require an image's
    predecessor to be reachable, or even to satisfy all post-spawn invariants.
    """
    board = validate(board, height, width)
    directions = []
    rows = [tuple(range(r * width, (r + 1) * width)) for r in range(height)]
    cols = [tuple(range(c, height * width, width)) for c in range(width)]
    for lines in (rows, cols):
        directions.extend((lines, [line[::-1] for line in lines]))
    eligible = []
    for index, value in enumerate(board):
        if value not in (2, 4):
            continue
        after = list(board)
        after[index] = 0
        for lines in directions:
            sequences = [tuple(after[i] for i in line) for line in lines]
            if exact_image:
                valid = all(line_in_slide_image(line) for line in sequences)
                changed = any(0 < sum(v != 0 for v in line) < len(line)
                              for line in sequences)
                valid = valid and changed
            else:
                valid = all(line == tuple(v for v in line if v) + (0,) * line.count(0)
                            for line in sequences)
            if valid:
                eligible.append(index)
                break
    return tuple(eligible)


def causal_supply(board: Sequence[int], eligible: Sequence[int]) -> bool:
    counts = Counter(v.bit_length() - 1 for v in board if v)
    if not counts:
        return False
    has_two = any(board[i] == 2 for i in eligible)
    has_four = any(board[i] == 4 for i in eligible)
    if not (has_two or has_four):
        return False
    fours = 0 if has_two else 1
    units = counts[1] + 2 * counts[2]
    for rank in range(3, max(counts) + 1):
        if units <= rank - 2 + fours:
            if not counts[rank]:
                return False
            fours += 1
        units += (1 << (rank - 1)) * counts[rank]
    return True


def necessary(board: Sequence[int], height: int, width: int,
              *, exact_image: bool = True) -> bool:
    board = validate(board, height, width)
    if not rank_envelope(board):
        return False
    if is_initial(board):
        return True  # Openings have no preceding slide.
    if sum(v != 0 for v in board) < 2:
        return False
    eligible = eligible_spawns(board, height, width, exact_image=exact_image)
    return causal_supply(board, eligible)
