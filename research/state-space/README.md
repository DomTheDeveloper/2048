# 2048 state-space research

Human proofs, exact integer superset counts, inverse transitions, and reproducible
finite enumeration. **The full 4×4 reachable-state count has not been determined.**

## Results and evidence

[PROOFS.md](PROOFS.md) contains the direct rank induction, recent-spawn and
causal-supply bounds, exact inverse-line rule, rooted backward-filter theorem,
and corrected score-equality classification. The manuscript includes a typeset
[research section](../../paper/state-space.tex).

The full continued-play bounds are

$$N_{\mathrm{labeled}}\le22,851,583,961,907,351,152,$$
$$N_{/D_4}\le2,856,448,098,561,271,997.$$

These are exact sizes of proved supersets, **not** exact reachable counts or
estimates. Python and JavaScript/BigInt implementations independently reproduce
all eight Burnside fixed counts and all opening corrections. Exact inverse-slide
value restrictions are implemented and tested, but are not included in these
large numerical bounds.

| Completed enumeration | Orbits | Labeled boards |
|---|---:|---:|
| 2×2, continued | 110 | 662 |
| 2×3, continued | 21,752 | 85,844 |
| 3×3, continued | 48,713,519 | 388,921,077 |
| 4×4, stop at first 8 | 84,660 | 675,154 |
| 4×4, stop at first 16 | 23,483,970 | 187,809,874 |
| 4×4, mass at most 24 | 67,104 | 535,148 |

These runs are validation/reproduction results, not enumeration-record claims.
An independent raw-board Python engine compares the **entire** 2×2 and 2×3
reachable sets with the symmetry-expanded C++ dumps. A separate inverse check
exhausts 104,976 four-cell inputs and all 1,296 syntactic 2×2 targets through 32.

The score-equality counterexample is a replayed 24-round 2×2 game scoring 180 and
ending with `{32,16,8,2}`. It repairs an equality clause, not the score ceiling.
The general score and length ceilings remain human theorems; this work does not
establish their attainment on 4×4 or extend the existing Lean formalization.

## Reproduce from the repository root

Requirements: Python 3.10+, Node.js with BigInt, and a C++17 compiler (`g++`, or
set `CXX`). There are no third-party Python or JavaScript packages.

```sh
bash research/state-space/run.sh
bash research/state-space/run.sh --large
bash research/state-space/run.sh --large --output-dir /tmp/2048-audit
```

The output directory must be new or empty. A default invocation creates a unique
`runs/` subdirectory. Every requested case is regenerated; archived results are
never reused to make a run pass. Do not enable `PYTHONOPTIMIZE` or Python `-O`.

`manifest.json` records executed stages, exit codes, exact source hashes, software
versions, completed cases, and output hashes. On failure it records failure, not
success. CSV layer totals are checked against **every** summary count. The small
state dumps are checked for ordering, uniqueness, canonical orientation, mass,
reachability, and closure. Eleven adversarial tests cover malformed arguments,
failed output writes, corrupted dumps, cached invalid inputs, causal obstructions,
and the tagged-cost invariant. Ordinary quick runs do not claim the large cases
were rerun.

## Layout

`bounds.py` / `verify_bounds.js`: separate exact superset counters.
`enumerate.cpp`: rolling-age forward enumeration and orbit-weighted labeled counts.
`inverse.py`: complete inverse-line construction and immediate predecessors.
`filters.py`: reusable necessary tests; passing is not sufficient for reachability.
`verify_enumeration.py`: independent physical-movement engine and raw BFS.
`score_counterexample.py`: reconstructs and replays the equality counterexample.
`test_regressions.py`: adversarial and finite invariant tests.
`run.py` / `run.sh`: fresh-run orchestration and machine-readable audit.
`expected.json`: explicit regression targets, never used to generate states.
`results/`: checked-in outputs from an identified completed run.

The import/build step uses `integrate_paper.py` to apply the reviewed equality
patch and add the research section. It refuses an unexpected manuscript or README
blob rather than overwriting newer work. Subsequent CI is read-only and verifies
this package; it does not publish the website.

## Limits

No complete 4×4 count, target-64/128 completion, or new Lean compilation is claimed.
The C++ implementation uses four-bit ranks and intentionally refuses unrestricted
4×4. It supports only the declared safe small-board or target/age-limited runs;
Python inverse/counting code handles ranks 16 and 17. Higher thresholds require
a wider forward-enumeration encoding, not silently wrapping a nibble.

Digests establish byte identity, not completeness. The 3×3/4×4 results are exhaustive
generator runs checked against benchmarks; full stored-state closure certificates
are supplied only by the independently executed small-board checks. The age-layer
principle predates this work and is credited in PROOFS.md.
