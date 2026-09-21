# Plain-text 2048 certificates

[Project overview](../README.md) · [Verification guide](../docs/REPRODUCIBILITY.md)

Each file specifies a legal opening and a sequence of slide/spawn rounds on a
4×4 board. Coordinates are **zero-based row, column**, each from 0 through 3.
Blank lines and text following `#` are ignored. Every nonempty record has
exactly four whitespace-separated fields:

```text
start 0 0 2
start 0 1 2
L 1 1 2
```

Exactly two `start` records must come first, in different cells, with value 2
or 4. Subsequent records begin with `U`, `R`, `D`, or `L`, followed by the row,
column, and value of the tile spawned **after** that slide. A slide must change
the board; the spawn cell must then be empty; its value must be 2 or 4. Tiles
created by a merge cannot merge again in the same slide.

`131072.txt` reaches the target in 32,781 rounds. `131072-two-twos.txt` uses two
initial 2s and 32,782 rounds. `full-chain.txt` reaches the complete descending
chain in 65,533 rounds. `max-score.txt` is the historical name for the supplied
3,925,224-point construction, not a claim of global score optimality. Additional
files support the opening, minimum-mass, and endpoint-arrangement experiments.

Check any file through both independent replay routes:

```sh
python3 verify/verify2048.py witness/131072.txt
node test/replay_engine.js witness/131072.txt
```

A valid certificate establishes existence of that legal trajectory. Universal
optimality statements require the separate lower-bound proofs. The files contain
no undo operations, hidden state edits, or probability guarantees.
