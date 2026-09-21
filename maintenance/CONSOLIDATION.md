# 2048 branch consolidation — 8 September 2026 UTC

`gh-pages` is the canonical development and publication branch. The repository was renamed from `DomTheDeveloper/2048-undo` to `DomTheDeveloper/2048` during consolidation; its repository ID remains 80335655.

## Reviewed integration

The working tree is based on verified publication `d2d954fd77218248246db4ea8b30cd2f6333c75b`, including its current PDF, complete manuscript, literal verification logs, all-opening proofs, witnesses, state-space research, monotone constructions and game improvements. Its publication run 34175273325 completed successfully.

The consolidation commit retains all reviewed branch tips as ancestors. Deleting branch names therefore does not discard their commits: the manifest records their exact tips and `git show <tip>:<path>` still recovers old files.

The older verified proof branch is superseded by `lean-kernel/`, which includes its lower bound and main theorem plus strengthened semantics and verification. Its older files are retained in history, not overlaid onto the unrelated Mathlib prototype in `lean/`.

The extremal research branch's substantive witnesses, deadline theorem, independent replayers, mass computations and endpoint results already appear in the newer canonical development. The missing machine-readable score-ceiling spawn-word descriptor is restored. It specifies a conditional value word, NOT a legal direction/location witness or a solved unrestricted score optimum. Superseded manuscript drafts and build transcripts remain available in history.

The Sun 2.14 audit experiment is unrelated to 2048; its history is retained without activating its workflow or adding its download bridge to the canonical source.

Seven completed one-off publication/reconciliation workflows are retired. The maintained monotone/paper workflow targets `gh-pages` and uploads build artifacts instead of racing to push a PDF. Existing full Lean and state-space checks are retained, and a read-only production game/witness regression workflow is added.

## Verification boundary

Before integration, the game syntax checks, paper facts, original-engine and independent-Python witness replays, monotone tests and complete computational research suite passed. All 17 recorded formal-source/witness hashes matched the completed Lean audit. The publication run separately preserved its successful kernel audit after exact input comparison and reran state-space, monotone and manuscript/standalone-source checks.

Branch maintenance does not constitute a new Lean kernel rebuild and does not rerun the billion-state 2x5 enumeration. Cleanup requires successful fresh computational checks, ancestry checks, exact branch-tip leases and termination of obsolete branch-specific workflow runs. An administrator-only default-branch change may be required before GitHub permits deleting `master`.
