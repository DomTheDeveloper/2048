# Further deductions for Perfect 2048

Research baseline: `5952debbb1733708a970809b26b3eb0ffc728e9a`.
The new results below distinguish Lean-checked theorems, written proofs,
and independently replayed computational constructions. None is a claim
of historical priority merely because it was absent from our manuscript.

## 1. Every ordinary opening has a jointly optimal continuation (Lean)

Let `a` be **any fixed ordinary 4x4 opening**: two distinct occupied cells,
with each tile 2 or 4. Define

    M(a) = 32781 if both tiles are 4, and 32782 otherwise.

For every such `a`, a legal possible play reaches 131072 in `M(a)` rounds
with final mass exactly **131102**. No legal play from that opening can
reach the tile in fewer rounds, and no legal play from any ordinary
opening can contain it at a smaller total board mass.

The universal opening quantifier is outside the existential trajectory
quantifier. This strengthens the former existence claim over openings.
There are 480 labeled openings: 120 two-4s, 240 mixed, and 120 two-2s;
they form 75 square-symmetry orbits (21, 33, and 21 respectively).

`research/openings.py` produces bridges of at most three rounds to a
symmetry of one of the first four states of the original witness.
The remainder of the original construction is reused through the primed
board, followed by a new all-2 final cascade. A separate Lean symmetry
proof transports legal plays, and Lean checks every bridge and the
exhaustive opening coverage. The final theorem is
`Game2048.standard2048_all_openings_exact`.

### Minimum endpoint mass

Write `H_k(B)` for the mass in tiles strictly greater than k. For a round
from A to B, with k >= 2,

    H_(2k)(B) <= H_k(A),             mass(B) >= mass(A) + 2.

Consequently, mass at or below the doubling threshold increases by at
least 2 per round. Applied over any final k rounds this gives

    H_(2^(k+1))(B) + 2k <= mass(B).

Take k=15. A 131072 tile exceeds 65536, hence

    mass(B) >= 131072 + 30 = 131102.

The already-proved move lower bound ensures that the play has at least
15 rounds. `ResidualMass.lean` proves this directly from the executable
slide rules and exact mass conservation; no assumed ancestry bridge is
used. `MinimumMass.lean` checks a 15-round all-2 cascade from the original
primed board, attaining the bound. Its complete plaintext witness is
`witness/131072-minimum-fold-fours.txt`.

The minimum-mass witness uses 32768 spawned 4s and 15 spawned 2s including
the opening, takes 32781 rounds, and scores 1966148. These accounting
figures are separately replayed, not advertised as Lean score theorems.

## 2. An exact score optimum among fastest 131072 games (written proof + witness)

Among plays that first reach 131072 in the minimum **32781** rounds, the
largest possible score at that time is

    1966216.

A new 15-round all-4 cascade appended to the same 32766-round primed
prefix attains it (`witness/131072-fold-4.txt`). It does NOT attain the
unrestricted whole-game maximum-score conjecture.

Here is an upper-bound proof. The latency equality case forces all
131072 mass at round 32766 to contribute to the target and all earlier
births to be 4s. Those 32768 source tiles contribute exactly

    Phi(131072) - 4*32768 = 1966080

to the score of the target's merge tree. None of the final 15 spawns can
contribute to that tree. The last spawn cannot contribute to any merge
score at the observation time, leaving only 14 potentially scoring junk
sources. If y of those 14 sources are 4s, their mass is 28+2y and their
score is Phi(junk)-4y. Repeatedly merging equal values in a geometry-free
multiset can only increase Phi and ends at the unique binary expansion
of its mass. Let Phi_bin(M) be that expansion's potential. Therefore the
junk score is bounded by Phi_bin(28+2y)-4y. For y=0,...,14 these values are

    68, 64, 120, 116, 116, 112, 120, 116, 116, 112, 136, 132, 132, 128, 136


The maximum is 136, giving 1966080+136=1966216. The all-4 cascade's final
junk consists of 32,16,8,4 and realizes this value. The final 4 can instead
be a 2 without changing the score.

### The opposite resource extreme: exactly one spawned 4

The gateway theorem requires at least one 4-birth to reach 131072.
Using the score-oriented witness through its first gateway and a new
all-2 fifteen-round fold gives **65548 rounds with exactly one 4-birth**,
opening included. Both independent replayers accept the complete line.
This is minimum time under the one-4 constraint: the mass fifteen rounds
earlier must be at least 131072, but with one 4-birth and two opening
tiles it is at most 4+2(T-15)+2. Hence T>=65548.

It also attains minimum mass 131102 and score **2097216**, the largest
score possible at a minimum-mass target endpoint. Indeed the binary
potential of the 30 non-target mass is at most 68, while the forced
4-birth costs at least four points: Phi(131072)+68-4=2097216.
This additional constrained-resource result has a written proof and
independent full replays; its 65533-round low-4 prefix is not part of
the new Lean certificate. See `witness/131072-one-four.txt`.

## 3. Unavoidable mass gateways (written proof)

Let c >= 3 and C=2^(c+2). For j=0,...,c-1 define

    G_j = C - 2^(j+2).

Any ordinary play reaching mass at least G_j must pass through **exactly
G_j**, entering by a **4-spawn**. Its tile multiset there is

    {4,8,...,2^(c+1)} minus {2^(j+2)}, with one additional 4.

Proof: G_j-2 has binary popcount c. A representation by at most c
powers of two must therefore be its binary expansion, occupying every
cell with different values. Such a board is dead. A first crossing of
G_j, with increments 2 or 4, consequently cannot use G_j-2: it must come
from G_j-4 by adding 4. Immediately before that spawn, at most c-1 cells
are occupied. Since popcount(G_j-4)=c-1, their multiset is forced to be
the binary expansion. Adding 4 gives the claimed multiset. This also
rules out jumping over the gateway. The hypothesis c >= 3 makes every
ordinary opening lie below the first gateway; smaller special cases can
be treated separately.

For 4x4 the gateways, in chronological order, are

    131072, 196608, 229376, 245760, 253952, 258048,
    260096, 261120, 261632, 261888, 262016, 262080,
    262112, 262128, 262136, 262140.

In particular, **every** route to 131072 passes the primed multiset
65536,32768,...,8,4,4, not merely shortest routes. Every full-chain play
must use a 4-spawn at every one of the sixteen gateway entries. This is
an explicit age-based necessity, independent of a snake policy and of
the Strahler argument. `results/gateways.json` records the gates in all
three original witnesses; those checks corroborate but do not replace
the general proof.

## 4. Policy-independent stochastic bounds (written proof + exact arithmetic checks)

Assume independent birth values, with P(4)=p and P(2)=q=1-p; directions
may be selected by any history-dependent policy. In units of 2, the
unrestricted birth-mass walk has increments 1 or 2. Its probability of
ever hitting integer n is

    u_n = [1 - (-p)^(n+1)]/(1+p).

This follows from u_0=1, u_1=q, u_n=q*u_(n-1)+p*u_(n-2). To cross a
gateway at even distance D without hitting the preceding dead layer,
the walk must hit D-2 and then add 2. Its probability is

    b(D)=p*u_(D-2)=p/(1+p) * [1+p^(D-1)].

Extend the birth sequence past any actual game's stopping time. Every
successful game is contained in the corresponding mass-walk event;
ignoring positions and other ways of dying only enlarges that event.
This establishes bounds for arbitrary adaptive policies, not just the
shipped scripts. The two opening tiles are the first two births; for
c>=3 both occur below the first barrier.

### Largest tile

For a c-cell board,

    P(reach 2^(c+1)) <= p/(1+p) * [1+p^(2^c-1)].

On standard 4x4 with p=1/10 this is exactly

    (1+10^(-65535))/11 < 0.090909091.

It is slightly GREATER than 1/11; the positive correction must not be
silently discarded in a rigorous upper bound. The bound is not claimed
to be the actual optimal win probability.

### Full chain

The successive unit-mass distances are 2^c,2^(c-1),...,2. By independence
of future increments at each gateway, the mass-only success probability
is exactly

    [p/(1+p)]^c * product_(k=1)^c [1+p^(2^k-1)].

This is an upper bound for the actual game's full-chain probability.
For standard 4x4 it is approximately **2.3963146538e-17**, independently
of the player's strategy. The exact product, not a rounded decimal,
is the certified expression. Rational dynamic programming for c=3,...,7
at four different rational p values checks the formula independently.

### An improved constructive lower bound

The original minimum-length witness has exact log10 probability about
-57047.3719, so the formerly printed lower bound 10^(-57047) rounded in
the WRONG direction. A valid power-of-ten lower bound for that witness
is 10^(-57048).

More usefully, the new one-4 witness first reaches 131072 at round
65548 and has log10 probability about **-48606.13637**. Factoring its exact
rational probability and comparing integers proves

    optimal P(reach 131072) >= 10^(-48607).

This is a larger lower bound by 8441 powers of ten than the corrected
bound from the fastest witness. It remains an extremely small witness
bound, not an estimate of an optimal agent's actual success rate.
`results/witness-probabilities.json` gives exact prime factorizations and
post-slide empty-cell counts, and the code certifies the decimal-power
inequality with integers rather than floating-point logarithms alone.

## 5. Correct score equality, and the remaining maximum-score search

The score ceiling S_c=Phi_c-4c is unchanged, but the manuscript's former
claim that equality requires the full chain was too narrow. After the
mandatory spawn, equality has two alternatives:

1. full chain 2^(c+1),...,8,4, with exactly c spawned 4s;
2. the same chain with final 4 replaced by 2, with exactly c-1 spawned 4s.

The last slot in the rank/Strahler inequality has zero score contribution
in either case. Every larger slot must be saturated. A post-spawn board
contains a new 2 or 4, so the corresponding pre-spawn c-1-tile high chain
must not be confused with a post-spawn equality case. Directly, changing
the last spawn from 4 to 2 preserves legality and every merge score.

Together with the gateway theorem, this means that any play attaining
S_c must have 4-births precisely at the c-1 mandatory nonfinal gateways,
all other births before its last spawn being 2s. Its final birth may be
2 or 4. Thus the birth-VALUE word is fixed: the remaining search chooses
only directions and empty cells. For 4x4 there are 131038 forced 2-births
and 15 forced 4-births before the final arbitrary birth, opening included.

For standard stochastic births this yields the policy-independent bound

    P(ever attain 3932100 points) <= (0.9)^131038 (0.1)^15
                                ~= 1.0714006617e-6011.

This does not assume that the ceiling is attainable. It states a
necessary event for attainment. A bounded attempt to follow that forced
word in the existing searcher stalled before completing the second act;
no new unrestricted maximum-score witness or impossibility claim results.
The complete 4x4 maximum-score and longest-game questions remain open
in this project.

## 6. At least 320 optimal full-chain arrangements; the opposite-corner question is settled

An exact 64-round all-4 suffix enumeration from round 65469 of the
existing full-chain witness yields 32 distinct terminal D4 orbits. Each
full-chain board has distinct values in all sixteen cells, so its D4
stabilizer is trivial; each orbit has eight labeled arrangements.
This corner family supplies 256 arrangements; eight additional
noncorner orbits increase the union to **320** full-chain arrangements with
65533-round witnesses, all optimal in round count by the existing full-chain bound.
This is a lower bound on all reachable arrangements, not a complete
classification. The search covers only continuations of its fixed prefix.

The previously asked opposite-corner question has a positive answer:

    4       8      16      32
    64      128    256     512
    8192    4096   2048    1024
    16384   32768  65536   131072

`witness/full-chain-opposite.txt` supplies the complete legal history.
Its last sixteen rounds replace the tail of the original witness.
The shared-prefix variants are recorded compactly in
`results/tails-64.json`. The companion 70-round splice supplies eight noncorner-largest-tile
orbits. The combined union has 40 orbits, or 320 distinct labeled
minimum-length full-chain endpoints. Every boundary location of the
largest tile is covered. Interior placement remains unresolved.

## 7. A uniform construction for every one-dimensional board (written proof + tests)

On a line of c>=2 cells, start with two 4s at opposite ends. Repeatedly
slide left and spawn 4 in the rightmost cell. Nonzero values stay in
nonincreasing order. A non-full board moves because the previous spawn
is at the far right; a full board with a duplicate has an adjacent
merge because it is sorted. The only full, distinct, all-4-or-larger
multiset under the tile ceiling is the full chain. Thus the procedure
ends there, in exactly 2^c-3 rounds. At the first gateway its primed
multiset folds by one carry per round, reaching 2^(c+1) after exactly
2^(c-1)+c-3 rounds, attaining the general lower bound.

For maximum score and maximum length, start instead with opposite-end
2s and always spawn 2, except spawn 4 when the mass just after sliding
is G_j-4. These exceptional afterstates have no 2s, so appending 4 also
preserves the nonincreasing order. A sorted full distinct board with a
2 has precisely one missing rank among 2,...,c+1, hence lies at a dead
layer G_j-2. The rule avoids each such layer by spawning 4 instead.
It cannot stop before the full chain. Exactly c 4s are spawned, so it
attains score Phi_c-4c and length 2^(c+1)-4-c.

This proves an infinite family, not merely a finite enumeration. It
is not the missing construction for arbitrary 2D rectangles. Executable
checks for all lengths 2 through 16 corroborate both policies and all
claimed counts, but the induction/invariant supplies generality.

## 8. Floating-window embedding (written proof + replay checks)

A legal play on a box with side lengths n_i embeds into any box with
side lengths N_i>=n_i. Allow its containing window to translate. After
a slide along axis j, put the window against the destination wall:
offset 0 toward the low wall and N_j-n_j toward the high wall. Leave
all other offsets unchanged. Place the prescribed spawn at its translated
coordinates.

An empty padding region cannot change the ordered nonzero sequence in
a line or its merges. Compression against the new wall is the translated
small-board slide. The window translation is in the SAME direction as
the slide, so it cannot cancel a nontrivial small-board displacement;
a merge also remains a merge. Spawn validity, move count, value word,
and merge score are all preserved. Induction proves the embedding.

This repairs the board-embedding step that was too quickly dismissed in
our earlier discussion of Das and Paul: a fixed-coordinate sub-board is
not isolated, but a moving window supplies a valid invariant. It does
NOT prove their additional claim that each newly available cell can be
used to double the attainable tile, and it does not settle the general
maximum-tile construction. Full witness lifts to 5x5, 5x7, and 4x8 were
checked against an independent rectangular slide implementation.

## Verification scope

New Lean checks: board symmetries, all-opening coverage, minimum endpoint
mass, and joint attainment of minimum mass and opening-dependent time.
The stochastic formulas, gateways, line construction, embedding theorem,
and fastest-game score optimum have written proofs and executable checks,
not complete Lean formalizations. The new full-chain arrangement claims
are supported by explicit trajectories and independent rule replays.
No completed result is inferred from a timeout or from a queued CI job.

## Final audit additions

The completed expansion also checks the independent noncorner bridge,
the corrected score-equality counterexample on all 662 raw 2x2 states,
policy-independent mass-only expected-value bounds with outward rounding,
and the Lean deterministic deadline-slack theorem. See
`audit/final-verification.json` and `results/combined-arrangements.json`.
The core unrestricted 4x4 maximum-score/longest-game conjecture and
arbitrary-rectangle attainability are not settled.
