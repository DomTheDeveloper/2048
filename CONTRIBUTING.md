# Contributing

`gh-pages` is the canonical development and publication branch. Work in a branch
of your fork and open a pull request targeting `gh-pages`. Keep changes focused;
do not recreate retired branches in this repository as part of routine work.

## Before submitting

Explain the change, its motivation, and how it was tested. For a bug, include a
minimal reproduction, relevant mode settings, and browser/tool versions. For a
research claim, identify the exact rules, quantifiers, theorem or certificate,
and evidence. Distinguish a bound from its attainment and an experiment from a
proof. Do not call controlled-spawn playback a guaranteed random-spawn policy.

Start with:

```sh
python3 test/release_checks.py
for file in js/*.js test/*.js; do node --check "$file"; done
python3 verify/verify2048.py witness/131072.txt
node test/replay_engine.js witness/131072.txt
```

For interface changes, run `python3 test/browser_smoke.py` with Playwright and
Chromium installed, then inspect desktop and mobile behavior. Preserve keyboard
access, zoom, reduced-motion preferences, and the distinction between ordinary
and controlled play. Avoid introducing third-party tracking or credentials.

For proof changes, run `bash research/finish.sh full` with Lean 4.19.0. For
state-space changes, run `bash research/state-space/run.sh --large`. For paper
changes, rebuild the manuscript and source package. The
[reproduction guide](docs/REPRODUCIBILITY.md) explains dependencies and scope.

## Research and artifact integrity

Preserve the independent checker implementations: do not replace them with a
shared simulation core. Add negative tests when changing a parser or verifier.
Do not edit a historical audit to make it describe newer code; create a new
record with the actual commit and commands instead. Generated results should
include their inputs and reproducible derivation, not only a final number.

Retain original authorship and licensing notices. Use the established citation
metadata, avoid unverified novelty or peer-review claims, and do not add a DOI,
affiliation, publication status, or author declaration without evidence.
