# Kernel-checked 2048: 131072 in exactly 32,781 rounds

This is the independent development whose entire 32,781-round witness and
universal lower bound passed Lean 4.19.0 kernel checking in run
[34092192490](https://github.com/DomTheDeveloper/2048-undo/actions/runs/34092192490).
That historical check covered the original certificate and lower bound. The
current development additionally includes every-opening joint time/mass optima
and deadline-slack lemmas; its exact source identities and axiom dependencies
are recorded in `research/audit/final-verification.json`. The release build
rebuilds this kernel-only development with pinned Lean 4.19.0 and no Mathlib.
The separate `lean/` Mathlib prototype remains preserved as historical source;
its older workflow failed at recursion depth and is not the evidence for this
paper. Both workflow entrypoints now invoke the documented kernel-only build.

## Reproduce

With Python 3 and the locally pinned Lean 4.19.0 toolchain:

```sh
bash lean-kernel/check.sh       # original certificate and lower bounds
bash research/finish.sh full   # also every-opening, mass, and deadline results
```

No Mathlib or third-party Lean package is needed. The script compiles the
handwritten proofs, generates all certificate source from the existing
`witness/131072.txt`, checks every prescribed transition in the kernel,
composes the proof blocks, compiles the main theorem, and audits its
transitive axiom dependencies. `verification.json` is written only after
success. Existing generated source and compiled files are not trusted as
external evidence.

## Exact theorem

`Game2048.standard2048_exact_131072` states:

```lean
(∃ initial terminal : Board,
  IsInitial initial ∧ Plays initial 32781 terminal ∧
  terminal.Contains 131072)
∧
(∀ (initial terminal : Board) (rounds : Nat),
  IsInitial initial → Plays initial rounds terminal →
  terminal.Contains 131072 → 32781 ≤ rounds)
```

This combines a concrete attained upper bound with a lower bound over
**all legal plays from all ordinary two-tile openings**. The witness starts
with two 4s. The result is the existential minimum over openings, not a
claim that every opening admits a 32,781-round win.

## Formal rules

`Basic.lean` independently defines a 4×4 board. Each coordinate has exactly
four constructors. Slides act on entire rows or columns, remove zeros,
merge adjacent equal inputs once, and pad with zeros. A newly produced tile
cannot merge again in that slide. A declarative `PairMerge` relation
specifies the pair-merge rules separately; `merge_spec` proves the
executable evaluator obeys them. `Row.left_length` rules out truncation.

A round is accepted only when the slide changes the board, the prescribed
spawn cell is empty afterward, and the new value is 2 or 4. Exactly one
tile is inserted. `Plays` has no undo, restart, deletion, or arbitrary edit
operation. Continuation after obtaining the 2048 tile is allowed.

## Lower bound: threshold mass

For a board B, let H_k(B) be the mass in tiles strictly larger than k.
Each slide satisfies H_(2k)(slide(B)) ≤ H_k(B). For k≥2, the new 2/4 tile
contributes no mass above 2k, so this inequality also holds for a whole
round. With `cutoff n = 2^(n+1)`, iterating through k final rounds gives

    H_(cutoff k)(terminal) ≤ initial.mass + 4*(rounds-k)

when rounds≥k. A separate latency argument handles rounds<k.
Take k=15: a 131072 tile is larger than cutoff 15=65536. Since every
standard opening has mass at most 8:

    131072 ≤ 8 + 4*(rounds-15), hence rounds ≥ 32781.

This argument does not assume a snake, a primed board, a merge-tree
ancestry representation, or the correctness of Das–Paul's induction.
The same formal development proves the 519-round lower bound for 2048.

## Certificate and trust boundary

The Python generator is an untrusted producer of explicit boards and
proof terms. Each individual move is checked by `decide +kernel`; the
results are composed into 258 blocks and 17 source modules. Wrong
intermediate states cannot pass the Lean step equality. A deliberate
false empty-board move must be rejected. No native decision shortcut,
unfinished declaration, or problem-specific axiom is permitted.

Actual full-run audit:

```text
'Game2048.Cert131072.certified_play' does not depend on any axioms
'Game2048.reachable_131072' does not depend on any axioms
'Game2048.standard2048_exact_131072' depends on axioms: [propext, Quot.sound]
```

The reachability proof has no axiom dependencies. The optimality proof
uses only standard Lean foundational axioms, not compiler-trust axioms.
As with any formalization, human review that the definitions match the
intended game remains distinct from kernel checking.

## Scope

This proves reachability and the exact minimum round count for 131072 on
standard 4×4 2048. It does not formalize the entire paper, the largest-tile
upper bound, maximum score, longest game, a stochastic optimal policy,
or a uniform strategy on arbitrary rectangles. The probability
interpretation of permitted finite random outcomes is not separately
formalized. Successful compilation does not establish historical priority
or peer review.

See `AUDIT.md` for the completed run, artifact, hashes, and exact outputs.
