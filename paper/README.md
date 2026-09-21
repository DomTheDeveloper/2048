# Perfect 2048: Kernel-Verified Optima and Extremal Play

**Dominic Dabish**  
San Diego State University  
Correspondence: [ddabish@sdsu.edu](mailto:ddabish@sdsu.edu)

Research preprint, September 7, 2026. [PDF](main.pdf) ·
[Machine-readable citation](../CITATION.cff) · [BibTeX](../CITATION.bib).
The affiliation identifies the author; it does not imply institutional endorsement.
No journal acceptance, peer review, DOI, or arXiv identifier is asserted.

## What is established

The pinned Lean 4.19.0 kernel-only development checks the original legal
32,781-round certificate, its universal lower bound, and the extended theorem
covering all 480 ordinary openings. Two initial 4s take 32,781 rounds; every
other opening takes 32,782. Each opening jointly attains endpoint mass 131102.
The exact theorem statements, definitions, and axiom lists are authoritative.

The state-space and general-size arguments are human proofs supplemented by
independent executable checks. The continued 4×4 state-space bounds are
22,851,583,961,907,351,152 labeled boards and 2,856,448,098,561,271,997 symmetry
classes. They are upper bounds, not exact reachable counts. The 320 full-chain
endpoints are a certified lower bound on arrangements, not a classification.
The manuscript explicitly distinguishes these from kernel-checked claims.

The exact full 4×4 state count, attainment of the unrestricted maximum-score
and longest-game ceilings, and a uniform construction for all rectangular
boards remain unproved here. Finalizing this preprint does not resolve those
questions. The historical 2×5 billion-state computation is preserved, not
rerun by the release checks.

## Reproduce from the repository root

```sh
bash research/finish.sh full
bash research/state-space/run.sh --large
bash paper/build.sh
```

The first command requires Python 3, Node.js, and the **direct Lean 4.19.0
binary** on PATH (or the equivalent pinned elan toolchain). It checks every
transition of the original witness in the kernel, compiles all-opening,
minimum-mass and deadline results, and performs the independent finite replays.
The second command also needs a C++17 compiler. The PDF build needs LaTeX,
BibTeX, latexmk and Poppler (`pdfinfo`, `pdftotext`). No Mathlib is required.
An optional `BIBTEX` environment variable selects an alternate BibTeX binary.

The release workflow installs the pinned Lean binary in an isolated directory,
runs both suites from fresh source, checks author/PDF metadata and every
reference, and commits the rebuilt PDF and fresh audit only after success.
The old `lean/` Mathlib prototype is retained; its failed recursion-depth build
is not the paper's formal evidence. Both Lean workflow entrypoints now use the
canonical kernel-only build rather than silently treating that failure as a pass.

## Source and audit trail

`main.tex` is the manuscript; `author.tex` holds the author and PDF metadata.
`lean.tex`, `deductions.tex` and `state-space.tex` provide the included sections.
`refs.bib` preserves original research credits and identifies this work's author.
`release.json` records the completed release's checked source commit, workflow,
PDF hash and verification scope. The underlying proofs are not altered for
an author or typesetting change. Historical audits remain separately labeled.
