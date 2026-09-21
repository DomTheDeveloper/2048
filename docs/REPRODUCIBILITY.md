# Reproducing the results

[Project overview](../README.md) · [User guide](USER_GUIDE.md)

Run commands from the repository root. Record `git rev-parse HEAD`, the exact
command, tool versions, and complete output. Use a clean checkout when making
an audit claim: several research commands regenerate tracked witnesses,
results, or proof inputs. Do not interpret the presence of an old log as a
successful new run.

## Requirements

The browser application has no package-install or build step. Basic checks
require **Python 3** and **Node.js**. State-space enumeration also needs a
**C++17 compiler**. The formal development requires exactly **Lean 4.19.0**,
selected by `lean-kernel/lean-toolchain`; it does not require Mathlib.

Typesetting requires `latexmk`, `pdflatex`, BibTeX, and Poppler (`pdfinfo` and
`pdftotext`). The optional browser smoke test requires Python Playwright and a
Chromium executable; it is separate from the dependency-free certificate checks.

## 1. Check the public interface and witness parsers

```sh
python3 test/release_checks.py
for file in js/*.js test/*.js; do node --check "$file"; done
```

The release regression tests check active documentation links and exercise both
certificate parsers on valid inputs and malformed or illegal examples. They
cover negative/out-of-range coordinates, duplicate or extra opening tiles,
wrong field counts, invalid directions or spawn values, no-op slides, and
occupied spawn cells. These are rejection tests, not a universal proof that
an implementation is correct.

An optional real-browser check starts a temporary local HTTP server, uses
Chromium, and checks ordinary interaction, keyboard activation, responsive
layout, and controlled certificate playback:

```sh
python3 test/browser_smoke.py
```

Set `CHROMIUM_PATH` when Chromium is not available as `chromium` on PATH.
Screenshots and browser reports are written to the directory selected with
`--output-dir` (the default is a temporary directory). This test is not a full
accessibility certification or a cross-browser compatibility survey.

## 2. Replay the certificates by independent routes

```sh
for name in 131072 full-chain max-score; do
  python3 verify/verify2048.py "witness/$name.txt"
  node test/replay_engine.js "witness/$name.txt"
done
```

| Certificate | Rounds | Endpoint or score |
| :--- | ---: | :--- |
| `witness/131072.txt` | 32,781 | Contains 131072. |
| `witness/full-chain.txt` | 65,533 | One tile of every power of two from 131072 through 4. |
| `witness/max-score.txt` | 129,333 | Full chain; 3,925,224 points. |

Also replay `witness/131072-two-twos.txt` to check the 32,782-round two-2s
construction. The filename `max-score.txt` is historical: its score is an
attained lower bound on the optimum, not an equality certificate for the
manuscript's unrestricted score ceiling.

The Python verifier compares independently implemented cell-based and
line-based slides. The JavaScript verifier uses the original-derived game
engine without importing the AI. Both must exit successfully and report
`Certificate: VALID`; compare the step count, maximum tile, score, and spawn
counts as well. Neither route proves that a different legal game cannot be
shorter or score higher.

## 3. Rebuild the kernel-checked proofs

First confirm `lean --version` reports **4.19.0**. Then run:

```sh
bash lean-kernel/check.sh
bash research/finish.sh full
```

The first command rebuilds the original 32,781-round witness, lower bounds,
and two-2s extension. The second repeats the base build and adds the
all-opening, endpoint-mass, and deadline-slack results and their associated
computations. Running only the second command is sufficient for that complete
suite; the first is useful when auditing the narrower result separately.

The generator produces explicit proof inputs from the text witness. Those
inputs are not trusted: the Lean kernel checks the transition proofs and their
composition. See [lean-kernel/README.md](../lean-kernel/README.md) for the formal
rules, named theorems, and exact trust boundary, and
[lean-kernel/AUDIT.md](../lean-kernel/AUDIT.md) for historical run evidence.
The extended source identities and axiom outputs are recorded under
`research/audit/`. A compiler success or a hash match alone does not establish
that the formal definitions model the intended game.

## 4. Reproduce the nonformal computations

```sh
node test/paper_facts.js
bash research/finish.sh --computations-only
bash research/state-space/run.sh --large
```

The computational-only suite replays extremal constructions and combines the
checked endpoint families. It explicitly does not claim a fresh Lean audit.
The state-space runner writes a fresh manifest containing commands, source
hashes, environment, exit codes, and result hashes. An output directory can be
selected explicitly:

```sh
bash research/state-space/run.sh --large --output-dir /tmp/2048-state-space-audit
```

The larger regression suite includes continued 3×3 enumeration and a bounded
4×4 benchmark, not full 4×4 enumeration or the historical billion-state 2×5
run. Necessary-condition counts remain upper bounds on reachable boards;
independent arithmetic agreement is not a proof that every counted board is
reachable. Read the [state-space scope](../STATE_SPACE.md) and
[proofs](../research/state-space/PROOFS.md) alongside the output.

## 5. Build the manuscript and source package

```sh
bash paper/build.sh
python3 submission/build.py
```

The typesetting and packaging checks are distinct from proof verification.
Read [submission/README.md](../submission/README.md) for author metadata,
source-package contents, and portal-specific responsibilities. Building or
hosting the package does not submit it to arXiv or a journal. Historical build
receipts identify their original source revisions; later interface or parser
changes do not retroactively extend those audits.

## Continuous integration

The publication checks exercise the current public documentation, witness
rejection tests, JavaScript syntax, and independent certificate replays.
Dedicated Lean and state-space workflows retain their separate scopes. A green
lightweight check must not be described as a full kernel rebuild or an exhaustive
4×4 enumeration. Use the workflow attached to the exact commit being cited.
