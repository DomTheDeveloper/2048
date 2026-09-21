# Perfect 2048

**Kernel-verified optima, replayable certificates, and reproducible experiments for 2048.**

[Interactive demonstration](https://domthedeveloper.github.io/2048/) ·
[Research manuscript](paper/main.pdf) ·
[Reproduction guide](docs/REPRODUCIBILITY.md) ·
[User guide](docs/USER_GUIDE.md) ·
[Citation](CITATION.cff)

**Dominic Dabish** · San Diego State University · ddabish@sdsu.edu

This repository studies extremal play in the continued 4×4 game: which boards
can occur, how quickly a target can be reached, and which claims can be checked
independently. It combines a browser demonstration with plain-text move
certificates, two independent replay paths, a Lean 4 formalization, and
state-space experiments. The manuscript is a research preprint, not a claim
of journal acceptance or peer review. The affiliation identifies the author
and does not imply institutional endorsement.

> **Scope.** A legal sequence of favorable tile spawns establishes possibility,
> not a strategy that wins for every random or adversarial spawn sequence.
> The project does not claim to have solved the stochastic 4×4 game, counted
> every reachable 4×4 board, or attained the unrestricted maximum-score bound.

## Principal results and evidence

A **round** is one board-changing slide followed by one legal spawn. The two
opening tiles are not counted as rounds. Play continues after the 2048 tile.

| Result | Value | Evidence and scope |
| :--- | :--- | :--- |
| Minimum rounds to 131072 from two initial 4s | **32,781** | Lean-kernel-checked witness and matching lower bound. |
| Minimum rounds from every other ordinary opening | **32,782** | Lean-kernel-checked all-opening theorem; all **480** labeled opening boards are covered. |
| Minimum endpoint mass when reaching 131072 | **131,102** | Lean-kernel-checked lower bound and joint time/mass attainment for every opening. |
| Full chain, 131072 through 4 on one board | **65,533 rounds** | Replayed construction and written minimum-round argument; at least **320** distinct labeled endpoints, not an exhaustive classification. |
| Shipped high-score construction | **3,925,224 points** | Independently replayed legal game. The manuscript's **3,932,100** ceiling is an upper bound whose attainment is not established here. |
| Continued 4×4 state space | **≤ 22,851,583,961,907,351,152 labeled boards** | Written necessary-condition proof and independent exact-integer counters; not the exact reachable count. |
| State space modulo square symmetries | **≤ 2,856,448,098,561,271,997 classes** | Burnside-counted upper bound under the same necessary conditions. |

The largest-tile upper bound of **131072** is supported by a written rank-envelope
argument; its **attainability** is separately established by the checked witness.
The upper-bound argument is not presented as a Lean theorem.

See the [formal theorem statements](lean-kernel/README.md),
[extremal deductions](research/DEDUCTIONS.md),
[state-space proofs](research/state-space/PROOFS.md), and
[manuscript scope](paper/README.md). Exact definitions and theorem statements,
not interface labels, determine what has been proved.

## Run the demonstration

The application is static: no application server, account, or JavaScript build
step is required. To serve a local checkout, use Python 3:

```sh
git clone --branch gh-pages https://github.com/DomTheDeveloper/2048.git
cd 2048
python3 -m http.server 8000 --bind 127.0.0.1
```

Open `http://127.0.0.1:8000/`. Use HTTP rather than opening `index.html` directly,
so the worker and local assets are served consistently.

The demonstration distinguishes ordinary random spawning, an adversarial
spawner, and controlled certificate playback. Undo-assisted replay is a separate
mode and is not an ordinary no-undo game. The high-score playback is a specific
construction, not a certified globally optimal policy. See the
[user guide](docs/USER_GUIDE.md) for controls and interpretation.

### Decision models: Laya and Jev

The AI rows also offer two *decision models*: **LAYA**, Convai Innovations'
open-weights System One model
([`convaiinnovations/laya`](https://huggingface.co/convaiinnovations/laya),
Apache 2.0), and **JEV**, TypeSafe's hosted model. Neither searches the game.
Each position is put to the model as a typed question: the legal moves
shuffled and labelled A–D, every candidate with the board it produces and,
at the richer evidence levels, the features a player looks at or GENIUS's
search value. The model answers with a probability per candidate in one
forward pass. The presentation follows the blind design of
[JEV2048](https://github.com/amansoory/JEV2048). Both run through a small
local bridge:

```sh
pip install -r ai/requirements.txt
python3 ai/bridge.py                       # Laya loads on the first move
TYPESAFE_API_KEY=... python3 ai/bridge.py  # and Jev
python3 ai/bridge.py --mock                # the test path: no weights, no key
node test/decision.js laya 5               # headless games from Node
```

Pick REGULAR tiles, LAYA or JEV, an evidence level, and RUN AI; the bridge
row reports what the bridge answered. Results with decision models are not
part of this repository's evidence: Laya's authors report their base
checkpoints near random on typed decisions they were not trained for, and
JEV2048's published runs put raw Jev far below its search baselines.
[`ai/README.md`](ai/README.md) documents the bridge, the harness, the
evidence levels, and the teacher-labelled dataset and fine-tuning recipe for
a 2048-specialised Laya. The models were not run in the environment this was
built in; the path is verified with the bridge's mock.

## Verify a result independently

Python 3 and Node.js are sufficient to replay the main certificate:

```sh
python3 verify/verify2048.py witness/131072.txt
node test/replay_engine.js witness/131072.txt
```

Both checks must report **32,781** verified steps, **131072** as the maximum tile,
zero illegal moves or spawns, and `Certificate: VALID`.

The Python checker implements the slide rules twice and compares the results
at every move. The JavaScript checker loads the original-derived game engine;
it does not import the AI or the Python checker. Both validate the witness
format, opening cells, coordinates, and spawn values before accepting a game.
Replaying a witness proves that trajectory is legal; it does **not** by itself
prove a universal upper or lower bound.

For the full formal development, install the pinned **Lean 4.19.0** toolchain:

```sh
bash lean-kernel/check.sh       # original witness and minimum-round theorems
bash research/finish.sh full    # also all-opening, mass, and deadline results
```

No Mathlib is required for `lean-kernel/`. Certificate generation is untrusted:
the generated transition proofs are checked by the Lean kernel. The original
reachability theorem has no axiom dependencies; the exact-optimum theorem uses
only Lean's standard `propext` and `Quot.sound`. The
[axiom audit](lean-kernel/AUDIT.md) documents the trust boundary. The historical
`lean/` prototype is not the evidence for these claims.

Additional checks:

```sh
python3 test/release_checks.py
node test/paper_facts.js
bash research/finish.sh --computations-only
bash research/state-space/run.sh --large
```

The computational-only command does not run Lean and cannot establish a fresh
kernel audit. The [reproduction guide](docs/REPRODUCIBILITY.md) explains
requirements, output files, audit scope, browser checks, and manuscript builds.

## Repository organization

| Path | Purpose |
| :--- | :--- |
| [`index.html`](index.html), [`js/`](js/), [`style/`](style/) | Browser game, AI strategies, worker, and interface. |
| [`witness/`](witness/) | Plain-text openings and complete move/spawn certificates. |
| [`verify/`](verify/), [`test/`](test/) | Independent replay, structural checks, and regression tests. |
| [`lean-kernel/`](lean-kernel/) | Canonical kernel-only formalization and proof generator. |
| [`research/`](research/), [`STATE_SPACE.md`](STATE_SPACE.md) | Extremal constructions, bounds, enumeration, and audit records. |
| [`paper/`](paper/), [`submission/`](submission/) | Manuscript, bibliography, PDF, source package, and build receipts. |
| [`docs/`](docs/) | Use, reproduction, and release guidance. |
| [`ai/`](ai/) | Decision-model bridge (Laya, Jev, mock), harness data, and fine-tuning recipe. |
| [`maintenance/`](maintenance/) | Reviewed branch-consolidation record and maintenance tooling. |

`gh-pages` is the canonical development and publication branch. Historical
branches are consolidated without treating obsolete experiments or failed
prototype builds as current evidence. Contributions should target `gh-pages`;
see [CONTRIBUTING.md](CONTRIBUTING.md).

## Citation and attribution

Please cite the manuscript when using its proofs, certificates, or research
results. Machine-readable metadata is provided in [CITATION.cff](CITATION.cff)
and [CITATION.bib](CITATION.bib). For reproducible references, also record the
commit used. No DOI or arXiv identifier is assigned by this repository.

```bibtex
@unpublished{dabish2026perfect2048,
  author = {Dabish, Dominic},
  title = {Perfect {2048}: Kernel-Verified Optima and Extremal Play},
  year = {2026},
  note = {Research preprint. San Diego State University},
  url = {https://github.com/DomTheDeveloper/2048/blob/gh-pages/paper/main.pdf}
}
```

The application builds on [Gabriele Cirulli's 2048](https://github.com/gabrielecirulli/2048),
[Alok Menghrajani's undo modification](https://github.com/alokmenghrajani/2048),
and [A. J. Richardson's 2048-AI](https://github.com/aj-r/2048-AI).
The expectimax implementation acknowledges
[Robert Xiao's 2048-ai](https://github.com/nneonneo/2048-ai).
The original game's 1024/Threes lineage is retained in the application credits.
Research references and generative-AI assistance disclosures are in the
[manuscript](paper/main.pdf) and [bibliography](paper/refs.bib).

The original [MIT license and copyright notice](LICENSE.txt) are retained.
That software license is not a substitute for choosing a manuscript-submission
license or completing the author's publication declarations.
