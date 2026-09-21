# 2048: structural reachability, exact inverse rules, and audited enumeration

Research record, 7 September 2026. Standard rules: two initial tiles independently
chosen from {2,4}, one nonidentity global slide followed by exactly one 2/4 spawn,
and continued play past 2048. Counts concern boards, not accumulated score, random
generator state, or complete histories. All coordinates are labeled unless a
symmetry quotient is explicitly specified.

## Scope

These are human proofs with executable finite checks. They do not determine the
full exact 4x4 reachable-state count, complete a target-64/128 enumeration, extend
the existing Lean formalization, or establish attainment of the 4x4 maximum-score
and longest-game ceilings. The large integers below are exact sizes of proved
supersets, not estimates of the actual reachable set. No novelty priority is
claimed. The separate existing 131072 witnesses supply attainability results;
upper bounds alone do not.

## 1. A rank invariant proved directly from actual moves

Let c >= 2 be the number of cells and let N_q(B) count tiles of value at least
2^q. Every reachable board satisfies

    N_q(B) <= c + 2 - q       (2 <= q <= c+2).

**Proof.** The opening has two tiles of rank at most 2. The q=2 inequality is
cell capacity. Suppose all inequalities hold before a slide. Fix q >= 3, let
H=N_q(B), and let j count disjoint merges of two rank-(q-1) tiles. These are the
only merges that can increase N_q; merging larger tiles can only decrease it.
If j=0 the old bound persists. Otherwise the old high tiles and the 2j consumed
lower tiles are all counted by N_(q-1), so

    H + 2j <= N_(q-1)(B) <= c+3-q,
    N_q(after) <= H+j <= c+3-q-j <= c+2-q.

The spawn has rank at most 2, so induction closes, including parallel merges.
The q=c+2 case rules out all tiles of that rank or larger. QED.

If the nonzero ranks are sorted decreasingly, this is equivalent to

    r_p <= c+2-p        (1 <= p <= number of occupied cells).

Violation of a sorted slot would violate its corresponding threshold count.
Summing the slotwise bounds proves

    largest tile <= 2^(c+1),
    mass <= 2^(c+2)-4.

Equality in mass requires the unique multiset {2^(c+1),2^c,...,4}. A legal
nonidentity slide leaves at most c-1 tiles before its mandatory spawn, so its
afterstate has mass at most 2^(c+2)-8. On 4x4 these are a largest-tile bound of
131072 and a post-spawn mass bound of 262140. This proof is independent of the
paper's earlier historical tight-moment argument.

### Independent age-barrier proof of finiteness

Put M=2^(c+2). At a first crossing from mass below M to at least M, the preceding
post-spawn mass must be M-2 or M-4. The first has binary popcount c+1, impossible
for a sum of at most c powers of two. The second has popcount c. Its only
representation with at most c powers of two uses exactly the c distinct tiles
{4,8,...,2^(c+1)}: any repeated power would cause a carry and reduce popcount.
That full, distinct-valued board is dead, so it cannot perform the crossing.
Thus no crossing is possible, and M-2 itself is impossible. Again mass <= M-4.
This argument applies for c >= 2, since the opening mass is at most 8 < M.

## 2. Recent spawns force lower-rank mass

Let L_q(B) be the total value of tiles strictly below 2^q. If B contains a tile
of rank at least q >= 3, then

    L_q(B) >= 2(q-2).

**Proof.** A spawn made j rounds before B can have undergone at most j subsequent
merges along its ancestry. Its current descendant has rank at most j+2. Thus the
latest q-2 spawns all have descendants below rank q and contribute at least
2(q-2) mass there. Their ancestral masses are disjoint even when several have
merged into one current tile. Reaching rank q from a rank-at-most-2 opening
requires at least q-2 rounds, so those recent spawns exist. QED.

The same observation gives the target-time lower bound. For a rank-k tile reached
after t rounds, the last k-2 spawns cannot contribute to it. Hence

    2^k <= 8 + 4(t-k+2),
    t >= 2^(k-2)+k-4       (k >= 3).

With two initial 2s replace 8 by 4, obtaining t >= 2^(k-2)+k-3. At k=17 the
bounds are 32781 and 32782. The project has separate witnesses and existing Lean
certificates attaining these values; this package does not rebuild those Lean
certificates or infer their correctness merely from these human arguments.

## 3. A stronger causal-supply test

Let n_r count current rank-r tiles and K be the maximum rank. Let E(B) contain
occupied cells whose deletion leaves an occupancy mask compact toward some wall.
In a noninitial reachable board, the most recent spawn is an eligible 2 or 4:
deleting it leaves precisely the preceding slide's compact afterstate.

Use the following necessary test:

1. Set f=0 if there is an eligible 2; otherwise f=1 if there is an eligible 4;
   otherwise reject.
2. For r=3,...,K, set j=r-2 and U_r=sum_(s<r) n_s 2^(s-1).
3. When U_r <= j+f, require n_r > 0 and increment f; otherwise keep f unchanged.

The variable f is a lower bound on recent 4-spawns, not the minimum count of
4-spawns in a complete game.

**Proof of necessity.** Let F_j be the actual number of 4-spawns among the latest
j spawns. Those spawns carry mass 2j+2F_j, all below rank r=j+2. Inductively
f <= F_j. The initialization is sound because absence of an eligible 2 forces
the actual last spawn to be a 4; choosing the lower bound zero when an eligible
2 exists only relaxes the test.

If U_r <= j+f, the lower-rank mass 2U_r has no room for the next older spawn to
be a 2, whose descendant would still lie below rank r. That older spawn must
be a 4, and a rank-r tile must receive mass that cannot fit below r. Increasing
f preserves the lower bound. If the inequality fails, not increasing f remains
a sound relaxation. A rejection at a missing rank r <= K implies K >= r+1=j+3,
so at least K-2 >= j+1 actual rounds have occurred: the older spawn used for the
contradiction exists. At the top rank the test ends; no nonexistent pre-opening
spawn is used in a rejection. Initial boards have K <= 2 and are included
separately. QED.

For example {128,8,2} passes the simpler lower-mass test, since 8+2=10=2(7-2),
but is impossible. The latest spawn must be the 2. The preceding spawn must
be a 4 to contribute to the 8 after at most one further merge. The latest five
spawns would therefore carry at least 2+4+2+2+2=12 mass below 128, not 10.

## 4. Exact sizes of structural supersets

For each of the 65536 occupancy masks, calculate E(B). Exactly 11743 masks with
at least two occupied cells have a nonempty eligible set. Assign ranks subject
to the rank envelope, eligible-small-tile condition, and causal-supply test.
Every noninitial reachable board is included. Of 480 labeled initial boards,
exactly 24 (six D4 orbits) fall outside the compaction set and must be added.

The count is an exact finite dynamic program, not a sample. For each square
symmetry, invariant occupancy masks are unions of permutation cycles; invariant
values are constant on each cycle. Group occupied cycles by length and
eligibility. Select cycles carrying 2 and 4, then assign ranks 3 through 17.
At rank r, the remaining occupied *cell* count, not cycle count, is at most
18-r. Binomial coefficients choose cycles of each type. The running lower-rank
mass and f implement the causal test. Saturating mass at 32 units of value 2
is safe because each future comparison threshold is at most j+f <= 31.

The fixed counts, before opening corrections, are listed in the order identity,
90-degree rotation, 180-degree rotation, 270-degree rotation, vertical reflection,
horizontal reflection, main diagonal, and other diagonal:

    22,851,583,961,907,351,128
    9,616
    1,074,108,288
    9,616
    1,296,452,906
    1,296,452,906
    411,457,895,734
    411,457,895,734

The opening corrections are

    24, 0, 4, 0, 4, 4, 6, 6.

Burnside's lemma therefore gives

    N_labeled <= 22,851,583,961,907,351,152,
    N_D4      <=  2,856,448,098,561,271,997.

The separate Python and JavaScript/BigInt programs agree on every fixed count
and correction, not just the final total. The improvement over the earlier
rank-plus-compaction labeled bound is 557,049,056,414,712,328 candidates, about
2.38 percent. This is a modest upper-bound improvement. The stronger exact
inverse-slide value conditions below are NOT included in this large count.

## 5. Exact inverse of one line slide

Let the desired output be a compact line y=(y_1,...,y_m,0,...,0) of length ell.
Each positive y_i is a power of two at least 2. Choose s_i in {0,1}; use input
block [y_i] when s_i=0 or [y_i/2,y_i/2] when s_i=1, the latter allowed only for
y_i >= 4. The complete conditions are

    m + sum_i s_i <= ell,
    s_i=0 implies y_i != y_(i+1)/2^(s_(i+1))      (i < m).

Concatenate the blocks and insert zeros in any remaining positions. This gives
exactly every preimage, including identity preimages where appropriate.

**Proof.** Each output of a greedy non-chaining merge consumes one input or
exactly two equal inputs. Those give the two block forms. A pair consumes
itself and cannot merge onward during the same slide. A singleton must differ
from the next block's first input, or a merge would cross the proposed boundary.
These conditions are necessary and make the scan consume precisely the selected
blocks, proving sufficiency. Zeros do not change nonzero order. QED.

### Closed image characterization for four-cell lines

A target must be compact. If it has one, two, or three nonzero entries, it is in
the slide image exactly when its nonzero sequence has no adjacent 2,2. A full
four-entry target is in the image exactly when all neighboring entries differ.
The empty line maps to itself.

**Proof.** A resulting 2 must be a singleton input 2, so adjacent output 2s would
have merged and cannot occur. A full output cannot have lost a tile to a merge
or have had a hole, so it is its own input and has no equal neighbors. For a
partial output without equal neighbors, shift the same sequence away from the
wall to obtain a nonidentity preimage. For a,a,b with a!=b split the first a;
for a,b,b split the last b; for a,a,a split the middle a. Repeated values here
are at least 4. The inverse-block rule checks each case, using at most four
input cells. A repeated two-entry target a,a is obtained by splitting its first
a. Full image lines and the empty line have only identity preimages; every
nonempty partial image line has a nonidentity preimage. QED.

With q=17 positive ranks the image size within the same rank range is

    1 + q + (q^2-1) + (q^3-2q+1) + q(q-1)^3 = 74818.

The checker exhausts all 18^4=104976 input rows. Synthetic inputs with two
rank-17 tiles can output rank 18; 836 additional output patterns are handled
separately, not misclassified as reachable 4x4 boards.

### Board predecessors and a concrete obstruction

Delete each proposed last 2/4, choose a common slide direction, combine the line
preimages, and retain only changed slides and predecessors with at least two
tiles and a 2 or 4. This is the complete immediate predecessor relation within
the ordinary post-spawn domain. It does not claim predecessor reachability.

The board

     2    4    8    8
     4    4    8   16
    16   32   64   64
    16   32  128  256

passes the rank and old deletion-compaction tests. It has equal adjacent pairs
in three rows and three columns. Removing the last spawn leaves 15 tiles. In
a horizontal afterstate, three rows remain full and must be merge-free exact
image lines; too many rows violate this. The vertical case fails similarly.
The exact inverse code returns zero predecessors. Since it is not an opening,
it is unreachable. This disproves sufficiency of the older structural tests.

## 6. Root-aware backward filtering

Let I be the initial boards, R the reachable boards, and U any proved finite
superset of R. Let Succ denote exact legal post-spawn successors. Define

    F_0 = U,
    F_(k+1) = I union (U intersect Succ(F_k)).

The sequence decreases, contains R at every step, and stabilizes at exactly R.

**Proof.** The operator is monotone and F_1 is a subset of U, giving descent.
Reachable boards survive because they are initial or have a reachable
predecessor. At a fixed point every noninitial member has a predecessor in the
same set. Following predecessors strictly decreases mass by 2 or 4, so the
chain must end at an initial board. Every fixed-point member is reachable.
Finiteness guarantees stabilization. QED.

For the 4x4 rank-bounded universe with mass at least 4, a chain has at most
(262140-4)/2=131068 edges. Unrolling the recurrence shows F_131069=R: survivors
have either reached an initial board or an impossible 131069-edge orphan chain.
This is a finite exact characterization, not an efficient numerical evaluation.
The initial union is essential; arbitrarily long predecessor chains without
retaining roots would ultimately reject every board in the finite DAG.

## 7. What an enumeration certificate must establish

Let A_a be the exact afterstates from all nonidentity slides of R_a. Then

    R_a = I_a union Spawn_2(A_(a-2)) union Spawn_4(A_(a-4)).

These set equalities prove soundness and completeness by induction on mass.
Equivalently, for a proposed finite full set, verify inclusion of all openings,
a legal lower-mass predecessor for every noninitial member, and inclusion of
every legal successor. Uniqueness and symmetry handling must also be checked.
With a cutoff, closure applies inside the declared cutoff; excluded successors
must be justified by it rather than silently dropped.

SHA-256 and Merkle digests establish byte identity, not completeness. Repeated
runs of the same generator are not independent rules implementations. A sound
necessary reachability test cannot eliminate a genuine successor of an already
reachable board. Such tests help ambient candidate counting, reverse search,
unreachability proofs, or indexing, not miraculous pruning of an exact forward
reachable-state search.

## 8. Executed benchmarks and conventions

All columns include distinct losing boards. A stopped-at-T run counts only
boards whose maximum tile is strictly below T; it excludes winning boards and
has no artificial win/loss nodes.

| Board and rule | Orbits | Labeled boards |
|---|---:|---:|
| 2x2, continued | 110 | 662 |
| 2x3, continued | 21752 | 85844 |
| 3x3, continued | 48713519 | 388921077 |
| 4x4, stop at first 8 | 84660 | 675154 |
| 4x4, stop at first 16 | 23483970 | 187809874 |
| 4x4, mass at most 24 | 67104 | 535148 |

The 3x3 run matches the published 48713519 state, 31431374 afterstate, and
7388502 terminal-state benchmarks. These are reproduction/validation results,
not record claims. The 2x2 game stopped at 32 has 75 board orbits including 18
losing orbits. Collapsing losing and winning boards to one abstract node each
gives 75-18+2=59, reconciling the historical convention. The earlier conversation's
176 full 2x2 states was incorrect under this convention.

The independent Python engine moves physical tiles and performs raw BFS without
symmetry reduction. It matches the entire symmetry-expanded C++ sets for 2x2
and 2x3. The inverse checker compares all 1296 syntactic 2x2 targets through
32, including unreachable boards. On 2x2, rooted filtering gives

    896 -> 686 -> 666 -> 662,

then stabilizes at the independent reachable set. Initial inclusion, predecessor
soundness, and legal successor closure are checked on the actual sets.

## 9. Correcting the score theorem's equality clause

The baseline paper's numerical ceiling survives, but its statement that equality
requires a full chain ending in 4 is false. Changing the last spawned 4 to a 2
changes no merge and therefore no score. This is not merely a conditional issue
about unattained 4x4 optima: complete 2x2 dynamic programming finds and replays
a 24-round score-180 trajectory ending with {32,16,8,2}. It uses three 4-spawns
including the opening; the complete certificate records every move and score.

A direct proof of both the ceiling and correct equality classification avoids
the ordering of historical tight moments. Tag a tile h=1 if its ancestry includes
a spawned 4, otherwise h=0. For rank r define s=r-h. Both possible spawned values
have s=1. An equal-value merge gives parent cost max(s_1,s_2) if the costs differ,
or s_1+1 if they agree, by the three cases of no, one, or two tagged children.

Induction as in section 1 gives

    #{tiles of cost at least q} <= c+1-q       (1 <= q <= c+1).

Only merging two cost-(q-1) children can increase the q-threshold count. If j
such pairs merge and H high-cost tiles existed, H+2j <= c+2-q implies
H+j <= c+1-q when j >= 1. Other merges cannot increase the count and new
cost-1 spawns preserve it. Therefore sorted costs satisfy s_p <= c+1-p,
and r_p <= c+1-p+h_p.

Let F count all 4-spawns, including initial tiles. Telescoping merge rewards give

    score = sum_p (r_p-1)2^r_p - 4F,
    F >= sum_p h_p.

For slot p<c the best contribution is uniquely h_p=1, r_p=c+2-p. For p=c,
(r,h)=(2,1) and (1,0) both contribute zero. Summing yields

    score <= Phi_c-4c = 4(c-1)(2^c-1).

For post-spawn equality, the positive slots 1 through c-1 must be filled
optimally. Omitting the last slot would leave only tiles at least 8, impossible
for a post-spawn board, which contains its latest 2 or 4. Equality therefore
requires exactly one of the following endpoint/ancestry combinations:

* {2^(c+1),2^c,...,8,4}, with exactly one 4-leaf per tile;
* {2^(c+1),2^c,...,8,2}, with exactly one 4-leaf in each tile at least 8.

The final 2 in the second case is itself a spawned tile. For the longest game,
every round and each opening tile accounts for one spawn, hence

    rounds = mass/2 - F - 2
           <= sum_p (2^(r_p-1)-h_p) - 2
           <= 2^(c+1)-4-c.

Here every slot maximum is positive, so equality requires all c slots and the
same two endpoint/4-leaf alternatives. The 4x4 ceilings are 3932100 points and
131052 rounds. Attainability on 4x4 is not established by this proof or these
runs. The corrected clause does not contradict the numerical ceiling, rank
invariant, or existing minimum-move Lean certificates.

## 10. Reproducibility audit

Run `bash research/state-space/run.sh --large` from the repository root. Python
3.10+, Node.js with BigInt, and a C++17 compiler are required; all language
libraries are standard. The default suite omits the 3x3 and target-16 runs and
never claims their archived outputs were regenerated. Output goes to a new or
empty directory; Python -O/PYTHONOPTIMIZE is rejected. Every requested case is
freshly executed, all summary fields are compared with explicit benchmarks,
and all CSV layer totals must match their summaries.

The manifest records exact source hashes, software versions, executed commands,
exit codes, and output hashes. A failure is recorded as failure. The forward
binary uses four-bit ranks and rejects unrestricted 4x4 and unsafe caps; Python
counting/inverse routines support ranks 16 and 17. Wider forward encoding remains
necessary for unrestricted continued 4x4 enumeration.

The audit found and fixed silent state-file/stdout write failures, permissive
numeric CLI parsing, dimension multiplication before validation, and cached
invalid-value acceptance. Python equates 2 and 2.0, so a cached integer result
could bypass validation performed inside a cached function. Validation now
precedes the private memoized inverse routine.

Eleven adversarial tests cover those failures, malformed/duplicate/noncanonical
or wrong-mass dumps, no-chain merging, the image rule on 1554 short lines,
every small reachable board against the exact-image filter, and finite cases
of the tagged-cost induction. These finite tests supplement the human proofs;
they do not make the general statements formally verified.

The temporary publication workflow applies the manuscript correction only when
its baseline source hashes match, rebuilds the paper, and records a fresh run.
Subsequent verification CI is read-only. The separately preserved older scripts
still reproduce the weaker valid rank-plus-compaction bounds.

## Sources and attribution

* Project baseline: `DomTheDeveloper/2048-undo`, research branch
  `claude/super-mode-speed-corners-doxfcj`, commit
  `5952debbb1733708a970809b26b3eb0ffc728e9a`.
* Jonathan Lees-Miller, *The Mathematics of 2048: Counting States by Exhaustive
  Enumeration*, 10 December 2017, especially the counting conventions, Appendix B,
  and footnote 2. https://jdlm.info/articles/2017/12/10/counting-states-enumeration-2048.html
* Original 3x3 solver README, read 7 September 2026, blob
  `e7fb8748b9bfe5171e9bdf2fe6590458cb2a0d72`:
  https://github.com/shuymst/solving_2048_on_3x3_board/blob/master/README.md
* Tomoyuki Kaneko and Shuhei Yamashita, *Strongly Solving 2048 4x3*,
  arXiv:2510.04580 (2025), ICGA Journal 48(1) (2026),
  DOI 10.1177/13896911261443437. https://arxiv.org/abs/2510.04580

Lees-Miller already used mass layers and MapReduce in 2017. The age-layer
principle is not new to this project or the 2025/26 paper; the later work's
completed 4x3 result and implementation refinements are distinct contributions.
