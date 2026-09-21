#!/usr/bin/env python3
"""Certified finite counting bounds for continued-play 4x4 2048.

This script counts two *supersets* of the reachable post-spawn positions.
It does not claim to enumerate the reachable state graph.

The mathematical inputs are:

1. Rank envelope.  If the nonzero tile ranks of a reachable c-cell board
   are sorted r_1 >= ... >= r_m (tile value = 2**rank), then

       r_p <= c + 2 - p.

   For c=16 this is equivalent to

       #{tiles of rank >= q} <= 18-q,   q=2,...,17.

   This follows from the paper's Strahler/tight-moment inequality.

2. Last-spawn geometry.  Every noninitial post-spawn state B contains the
   most recent spawned 2 or 4.  Delete that cell.  What remains is the
   afterstate of a global slide, hence is compact toward one of the four
   walls (every row/column is packed against the slide wall).

Initial positions are handled separately.  Exactly 24 of the 480 labeled
ordinary two-tile openings are outside the last-spawn geometric superset.

The script also counts D4-orbits by Burnside's lemma.  All arithmetic is
integer/exact and only 2^16 occupancy masks are inspected.
"""

from __future__ import annotations

from collections import Counter, defaultdict
from functools import lru_cache
from itertools import product
from math import comb

N = 4
C = N * N
MAX_RANK = C + 1  # 17, i.e. 131072


def compact(mask: int, direction: int) -> bool:
    """Whether the occupancy mask is packed toward a wall.

    directions: 0 left, 1 right, 2 up, 3 down.
    """
    if direction in (0, 1):
        for r in range(N):
            seq = [((mask >> (N * r + c)) & 1) for c in range(N)]
            if direction == 1:
                seq.reverse()
            seen_empty = False
            for bit in seq:
                if not bit:
                    seen_empty = True
                elif seen_empty:
                    return False
        return True

    for c in range(N):
        seq = [((mask >> (N * r + c)) & 1) for r in range(N)]
        if direction == 3:
            seq.reverse()
        seen_empty = False
        for bit in seq:
            if not bit:
                seen_empty = True
            elif seen_empty:
                return False
    return True


def eligible_last_spawn_mask(mask: int) -> int:
    """Cells whose deletion makes the occupancy compact in some direction."""
    ans = 0
    for cell in range(C):
        if not ((mask >> cell) & 1):
            continue
        after = mask & ~(1 << cell)
        if any(compact(after, d) for d in range(4)):
            ans |= 1 << cell
    return ans


@lru_cache(None)
def value_assignments(m: int, eligible: int) -> int:
    """Rank-envelope assignments to m labeled occupied cells.

    Exactly `eligible` of the m cells are eligible last-spawn locations.
    At least one eligible cell must contain rank 1 or 2 (a 2 or 4).
    """
    # Process ranks 17..3.  State: (used cells, used eligible cells).
    dp = {(0, 0): 1}
    for rank in range(MAX_RANK, 2, -1):
        cap = C + 2 - rank
        nxt = defaultdict(int)
        for (used, used_eligible), ways in dp.items():
            rem_e = eligible - used_eligible
            rem_n = (m - eligible) - (used - used_eligible)
            room = min(m - used, cap - used)
            for take_e in range(rem_e + 1):
                for take_n in range(rem_n + 1):
                    take = take_e + take_n
                    if take > room:
                        continue
                    nxt[(used + take, used_eligible + take_e)] += (
                        ways * comb(rem_e, take_e) * comb(rem_n, take_n)
                    )
        dp = nxt

    # Every remaining occupied cell has rank 1 or 2.  Both are legal low
    # ranks, so the last-spawn condition is exactly: some eligible cell
    # remains after placing ranks >=3.
    total = 0
    for (used, used_eligible), ways in dp.items():
        if used_eligible < eligible:
            total += ways * (2 ** (m - used))
    return total


def d4_permutations() -> list[list[int]]:
    def ix(r: int, c: int) -> int:
        return N * r + c

    out = []
    for kind in range(8):
        p = []
        for r in range(N):
            for c in range(N):
                if kind == 0:
                    rr, cc = r, c
                elif kind == 1:
                    rr, cc = c, N - 1 - r
                elif kind == 2:
                    rr, cc = N - 1 - r, N - 1 - c
                elif kind == 3:
                    rr, cc = N - 1 - c, r
                elif kind == 4:
                    rr, cc = r, N - 1 - c
                elif kind == 5:
                    rr, cc = N - 1 - r, c
                elif kind == 6:
                    rr, cc = c, r
                else:
                    rr, cc = N - 1 - c, N - 1 - r
                p.append(ix(rr, cc))
        out.append(p)
    return out


def cycles_of(p: list[int]) -> list[tuple[int, ...]]:
    seen = [False] * C
    cycles = []
    for start in range(C):
        if seen[start]:
            continue
        cyc = []
        j = start
        while not seen[j]:
            seen[j] = True
            cyc.append(j)
            j = p[j]
        cycles.append(tuple(cyc))
    return cycles


@lru_cache(None)
def fixed_value_assignments(types: tuple[tuple[int, bool, int], ...]) -> int:
    """Assignments constant on permutation cycles, with a low eligible cycle.

    Each type is (cycle_length, eligible?, number_of_cycles).
    """
    init = tuple(t[2] for t in types)
    total_cells = sum(length * count for length, _, count in types)
    dp = {init: 1}

    for rank in range(MAX_RANK, 2, -1):
        cap = C + 2 - rank
        nxt = defaultdict(int)
        for rem, ways in dp.items():
            used = total_cells - sum(types[i][0] * rem[i] for i in range(len(types)))
            for chosen in product(*[range(r + 1) for r in rem]):
                add = sum(types[i][0] * chosen[i] for i in range(len(types)))
                if used + add > cap:
                    continue
                mult = 1
                rem2 = []
                for r, x in zip(rem, chosen):
                    mult *= comb(r, x)
                    rem2.append(r - x)
                nxt[tuple(rem2)] += ways * mult
        dp = nxt

    total = 0
    for rem, ways in dp.items():
        eligible_cycles_left = sum(
            rem[i] for i, (_, is_eligible, _) in enumerate(types) if is_eligible
        )
        if eligible_cycles_left:
            total += ways * (2 ** sum(rem))
    return total


def cycle_assignment_count(occupied_cycles: list[tuple[int, ...]], eligible_mask: int) -> int:
    kinds = Counter()
    for cyc in occupied_cycles:
        flags = [bool((eligible_mask >> cell) & 1) for cell in cyc]
        if any(flags) and not all(flags):
            raise AssertionError("eligible set must be invariant on a fixed occupancy mask")
        kinds[(len(cyc), all(flags))] += 1
    types = tuple(sorted((length, flag, n) for (length, flag), n in kinds.items()))
    return fixed_value_assignments(types)


def rank_only_raw() -> int:
    # For rank-only counting every occupied cell is an eligible low cell;
    # this simply enforces that the post-spawn board contains a 2 or 4.
    return sum(comb(C, m) * value_assignments(m, m) for m in range(2, C + 1))


def rank_only_burnside(perms: list[list[int]]) -> tuple[list[int], int]:
    fixed = []
    for p in perms:
        cycles = cycles_of(p)
        total = 0
        for sel in range(1 << len(cycles)):
            occupied_cycles = [cyc for j, cyc in enumerate(cycles) if (sel >> j) & 1]
            m = sum(len(cyc) for cyc in occupied_cycles)
            if m < 2:
                continue
            mask = sum(1 << cell for cyc in occupied_cycles for cell in cyc)
            total += cycle_assignment_count(occupied_cycles, mask)
        fixed.append(total)
    assert sum(fixed) % 8 == 0
    return fixed, sum(fixed) // 8


def last_spawn_raw() -> tuple[int, Counter]:
    shape_frequency = Counter()
    total = 0
    for mask in range(1 << C):
        m = mask.bit_count()
        if m < 2:
            continue
        eligible_mask = eligible_last_spawn_mask(mask)
        a = eligible_mask.bit_count()
        if not a:
            continue
        shape_frequency[(m, a)] += 1
        total += value_assignments(m, a)
    return total, shape_frequency


def last_spawn_burnside(perms: list[list[int]]) -> tuple[list[int], int]:
    fixed = []
    for p in perms:
        cycles = cycles_of(p)
        total = 0
        for sel in range(1 << len(cycles)):
            occupied_cycles = [cyc for j, cyc in enumerate(cycles) if (sel >> j) & 1]
            m = sum(len(cyc) for cyc in occupied_cycles)
            if m < 2:
                continue
            mask = sum(1 << cell for cyc in occupied_cycles for cell in cyc)
            eligible_mask = eligible_last_spawn_mask(mask)
            if not eligible_mask:
                continue
            total += cycle_assignment_count(occupied_cycles, eligible_mask)
        fixed.append(total)
    assert sum(fixed) % 8 == 0
    return fixed, sum(fixed) // 8


def initial_extras(perms: list[list[int]]) -> tuple[int, list[int], int]:
    """Ordinary two-tile openings not already in the last-spawn superset."""
    extras = []
    for i in range(C):
        for j in range(i + 1, C):
            mask = (1 << i) | (1 << j)
            if eligible_last_spawn_mask(mask):
                continue
            for vi in (1, 2):
                for vj in (1, 2):
                    b = [0] * C
                    b[i], b[j] = vi, vj
                    extras.append(tuple(b))

    def fixed_by(b: tuple[int, ...], p: list[int]) -> bool:
        return all(b[i] == b[p[i]] for i in range(C))

    fixed = [sum(1 for b in extras if fixed_by(b, p)) for p in perms]
    assert sum(fixed) % 8 == 0
    return len(extras), fixed, sum(fixed) // 8


def main() -> None:
    perms = d4_permutations()

    rank_raw = rank_only_raw()
    rank_fixed, rank_orbits = rank_only_burnside(perms)

    last_raw, shape_frequency = last_spawn_raw()
    last_fixed, last_orbits = last_spawn_burnside(perms)
    extra_raw, extra_fixed, extra_orbits = initial_extras(perms)

    reachable_upper_raw = last_raw + extra_raw
    reachable_upper_orbits = last_orbits + extra_orbits

    expected = {
        "rank_raw": 42_680_958_038_114_579_072,
        "rank_orbits": 5_335_119_967_984_859_212,
        "last_raw": 23_408_633_018_322_063_456,
        "last_orbits": 2_926_079_231_642_763_759,
        "initial_extra_raw": 24,
        "initial_extra_orbits": 6,
        "reachable_upper_raw": 23_408_633_018_322_063_480,
        "reachable_upper_orbits": 2_926_079_231_642_763_765,
    }
    actual = {
        "rank_raw": rank_raw,
        "rank_orbits": rank_orbits,
        "last_raw": last_raw,
        "last_orbits": last_orbits,
        "initial_extra_raw": extra_raw,
        "initial_extra_orbits": extra_orbits,
        "reachable_upper_raw": reachable_upper_raw,
        "reachable_upper_orbits": reachable_upper_orbits,
    }
    assert actual == expected, (actual, expected)

    print("4x4 continued-play 2048: rigorous finite state-space supersets")
    print(f"rank-envelope labeled:       {rank_raw:,}")
    print(f"rank-envelope D4 orbits:     {rank_orbits:,}")
    print(f"+ last-spawn labeled:        {last_raw:,}")
    print(f"+ last-spawn D4 orbits:      {last_orbits:,}")
    print(f"initial states outside set:  {extra_raw:,} labeled / {extra_orbits:,} orbits")
    print(f"reachable labeled upper:     {reachable_upper_raw:,}")
    print(f"reachable D4-orbit upper:    {reachable_upper_orbits:,}")
    print("Burnside fixed counts (rank):", rank_fixed)
    print("Burnside fixed counts (last):", last_fixed)
    print("Burnside initial extras:      ", extra_fixed)
    print(f"eligible occupancy masks:     {sum(shape_frequency.values()):,}")


if __name__ == "__main__":
    main()
