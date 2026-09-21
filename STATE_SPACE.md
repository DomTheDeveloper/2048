# Reachable states of continued 4×4 2048

The exact full count remains undetermined. The audited research package is in
[research/state-space](research/state-space/README.md); the proofs are in
[PROOFS.md](research/state-space/PROOFS.md), with a typeset section included in the
[paper](paper/main.pdf).

## Current proved upper bounds

For ordinary post-spawn boards, including every two-tile opening,

$$N_{\mathrm{labeled}}\le22,851,583,961,907,351,152,$$
$$N_{/D_4}\le2,856,448,098,561,271,997.$$

The calculation counts boards satisfying the rank envelope, last-spawn
compaction, and a recent-spawn causal-supply condition. The exact inverse-slide
value restrictions are tested separately and are **not** included in this count.
These are exact sizes of necessary-condition supersets, not the reachable counts.

For nonzero ranks in decreasing order, a direct induction on actual moves proves
$r_p\le18-p$. In particular, no tile exceeds 131072 and no board mass exceeds
262140. The separate existing witnesses establish attainment; the inequalities
alone do not. The new arguments are human proofs with executable checks, not new
Lean theorems.

## What has been executed

Separate Python and JavaScript/BigInt implementations agree on all eight
Burnside fixed counts and the opening corrections. The C++ enumerator reproduces
48,713,519 continued 3×3 orbits and 388,921,077 labeled boards. The 4×4 run stopped
at first 16 counts 23,483,970 orbits and 187,809,874 labeled boards. These are
regression/reproduction results, not claims of new enumeration records.

Independent raw-board BFS matches the full 2×2 and 2×3 sets. Exhaustive inverse
checks cover 104,976 four-cell input rows and 1,296 syntactic 2×2 target boards.
Root-aware backward filtering stabilizes on the exact 662 labeled 2×2 boards.

The score theorem's old equality clause omitted the endpoint with a 2 replacing
the final 4. A complete 24-round, score-180 2×2 counterexample is recorded in
[the replay certificate](research/state-space/results/score_equality_counterexample.json).
The corrected clause permits both endpoints; neither the numerical ceiling nor
the existing minimum-move Lean certificates is contradicted.

## Reproduce

```sh
bash research/state-space/run.sh --large
```

Each invocation rebuilds and writes to a fresh directory. The manifest records
exactly what ran, source hashes, environment, exit codes, and result hashes.
No archived result can make an unexecuted case pass. Small-board checks also
verify actual set equality and closure; a hash alone proves neither completeness
nor reachability.

## Earlier bound

The original scripts remain available:

```sh
python3 test/state_space_bounds.py
node verify/verify_state_space_bounds.js
```

They count the weaker rank-plus-compaction superset: 23,408,633,018,322,063,480
labeled boards and 2,926,079,231,642,763,765 orbits. The current bound removes
557,049,056,414,712,328 labeled candidates, approximately 2.38 percent. The older
numbers remain valid upper bounds; they are not the current best result here.

Full 4×4 enumeration, target-64/128 completion, and attainment of the 4×4
maximum-score/longest-game ceilings are not established by this package.
