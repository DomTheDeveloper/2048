# Manuscript and submission package

**Perfect 2048: Kernel-Verified Optima and Extremal Play**  
**Dominic Dabish**  
San Diego State University  
ddabish@sdsu.edu

Dated preprint: 7 September 2026. This repository update prepares and
publishes the manuscript and its reproducible artifact. It does not submit
an article to arXiv or a journal, claim acceptance, assign a DOI, or make
statements about funding or conflicts of interest that the author has not
provided. Those portal declarations remain the author's responsibility.

## Files

- `../paper/main.pdf`: the complete author-identified manuscript.
- `arxiv-source.tar.gz`: clean LaTeX sources with `main.tex` at the root,
  all included TeX files, the bibliography database, and the generated
  `main.bbl`. It contains no compiled PDF, build logs, caches, or font files.
- `metadata.json` and `../CITATION.cff`: title, author, affiliation, email,
  date, abstract, public artifact link, and explicit preprint status.
- `BUILD.json`: exact source/PDF/bundle digests and build checks.
- `verification/`: the completed release-check report and literal theorem
  dependency output. The recorded kernel check and subsequent PDF build
  are distinct steps; the build alone does not prove any theorem.

## Rebuild

From the repository root, with Python 3, Node, Lean 4.19.0, and a LaTeX
installation providing `latexmk`, `pdflatex`, `bibtex`, and Poppler:

```sh
bash research/finish.sh
python3 submission/build.py
```

The first command rebuilds the full 32,781-step certificate, every-opening
joint time/mass optima, deterministic deadline lemmas, and the independent
finite witness checks. It does not rerun the 2×5 billion-state enumeration
or formally prove the unformalized score/probability/state-space arguments.
For the separate state-space suite, use `bash research/state-space/run.sh`;
its optional `--large` mode includes larger finite benchmarks.

The second command compiles the paper, rejects unresolved references or
clipped text reported by LaTeX, checks the author/affiliation/email in the
PDF, and packages exactly the inputs needed for a standalone TeX build.
The PDF metadata uses a fixed SOURCE_DATE_EPOCH for reproducibility; its
creation timestamp is not an audit-completion timestamp.

## Submission status and scope

The source bundle was built and checked locally. It has not been run
through arXiv's processing service. Select `main.tex` / PDFLaTeX and inspect
the service-generated PDF before completing any submission. Source-package
preparation follows https://info.arxiv.org/help/submit_tex.html (consulted
7 September 2026). A preprint license and any required author declarations
must be chosen by the author, not inferred from the game engine's license.

The manuscript distinguishes named Lean theorems, conventional proofs,
independent replay certificates, and enumeration. It retains unresolved
claims—including unrestricted 4×4 maximum-score attainment, interior
full-chain placement, and arbitrary-rectangle attainability—as unresolved.
Original game authors and licenses are preserved; the author's affiliation
does not imply institutional endorsement. Generative-AI assistance is
disclosed in the manuscript. No claim of historical priority follows from
successful compilation.
