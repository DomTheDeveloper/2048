# Monotone-direction and robust-fold checks

This directory accompanies `paper/monotone.tex`.

The **monotone theorem** restricts play to one fixed direction on each nontrivial axis (for a rectangle, Up and Left after reflection). It is not the unrestricted arbitrary-rectangle theorem. `construct.py` is a search-free implementation of the recursive slice proof. `exhaustive.py` independently exhausts all ordinary openings and all legal spawn cells/values on several small boxes.

The **rectangle fold theorem** is an unrestricted endgame statement conditional on the displayed primed arrangement `Q_{h,w}`. `test_rectangle_fold.py` exhausts all legal spawn branches on small rectangles and performs randomized adversarial-spawn checks on larger rectangles.

The standalone certificate replayers do not import the constructor:

```sh
python3 research/monotone/construct.py 4x4 --mode rich --out /tmp/monotone-4x4.txt
python3 research/monotone/verify_2d.py /tmp/monotone-4x4.txt
python3 research/monotone/exhaustive.py
python3 research/monotone/test_rectangle_fold.py
```

For higher-dimensional certificates use `verify_box.py`.

The unrestricted two-row frontier through `2x8` is reproduced separately under `research/strip/`; it uses three direction types and must not be confused with the two-direction monotone family.

These scripts check the written proofs but are **not Lean formalizations**. The Lean scope remains exactly the one stated in `paper/lean.tex`.
