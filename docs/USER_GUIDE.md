# Using the 2048 demonstration

[Project overview](../README.md) · [Reproduce the research](REPRODUCIBILITY.md)

## Manual play

Move tiles with the arrow keys, WASD, or HJKL; swipe on a touch screen. Equal
adjacent tiles merge once per slide. Press **Z** to undo in this modified game,
or use **Try again** to restart. When no control has keyboard focus, the space
bar also restarts. Tab reaches the interface controls; Enter or Space activates
the focused control. The page permits browser zoom.

The manual undo facility is part of the application, not the formal no-undo
rule system. To compare ordinary AI runs, select regular tiles and disabled
undo in the AI panel.

## Choose the experiment before running it

**Tiles** determine the spawn process. **REGULAR** uses the game's random
spawner; **EVIL** uses the ported adversarial placement rule; **PERFECT** places
the prescribed tiles from a legal certificate. The last mode demonstrates
existence under favorable outcomes, not an AI's ability to force those outcomes
in an ordinary random game.

**Undo** applies to regular-tile AI runs. **DISABLED** provides no AI undo.
**REGULAR** lets the AI retreat after game-over positions. **PERFECT** rerolls
unfavorable outcomes until the prescribed line is followed, counting the undo
operations. Do not compare these modes as though they had the same rules.

**AI** selects a heuristic for uncontrolled play: the project's **GENIUS**
expectimax player or the ported **SMART**, **ALGORITHM**, **PRIORITY**, and
**RANDOM** strategies. These are implementations to explore, not a claim of
state-of-the-art benchmark performance. Hardware, random outcomes, search
budget, and undo settings affect results.

**LAYA** and **JEV** are decision models rather than search: the position is
sent as a typed question to a local bridge (`python3 ai/bridge.py`), which
runs Laya on your machine or relays to TypeSafe's Jev with your key. The
**Evidence** row chooses what the question carries beyond the candidate
boards (**BOARD**, **FEATURES**, **ASSIST**); the **Bridge** row shows the
bridge address and whether it answered. See [`ai/README.md`](../ai/README.md).

**Goal** selects the stopping objective. **MAX BLOCK** targets a large tile.
**FULL SPIRAL**, available for certificate playback, builds every power of two
from 131072 through 4 on one board. **HIGH SCORE** replays the shipped
3,925,224-point construction in controlled mode; it is not a proof that this
score is globally optimal. With an uncontrolled spawner, the selected AI simply
pursues the chosen objective.

## Playback and orientation

Select a corner and either spiral orientation before starting. The eight corner
spirals are square symmetries of the supplied line. The research contains
additional endpoint constructions that are not all selectable in the interface.

**1×–100×** shows individual moves at different rates. **AFAP** renders as
quickly as the application can. **HEADLESS** performs the run in a worker,
updates counters, and installs the final board when the run stops. Switching
between headless and rendered execution requires a fresh run. **SLOW MOTION**
shows the finale; **HYPERCOMPLETE** skips that presentation. Press **RUN AI** to
begin and **STOP** to interrupt.

The move counter records forward moves; the undo counter records rerolls or
retreats. Neither an animation nor a final screenshot is an independent proof.
Use the [plain-text certificates](../witness/README.md) and
[reproduction instructions](REPRODUCIBILITY.md) to check a claimed result.

## Local data and troubleshooting

The application stores preferences and the best score in browser local storage.
It does not require an account and includes no analytics script. Hosting and
external links have their own privacy policies.

Serve the repository over HTTP, allow JavaScript and workers, and refresh the
page after an update. A stopped headless run may show a different board from
the frozen preview because the worker was continuing the game. Report problems
with the browser version, selected modes, and steps to reproduce; do not submit
private browsing data or credentials.
