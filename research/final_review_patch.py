#!/usr/bin/env python3
"""Apply the reviewed consolidation to the exact recovered manuscript baseline."""
from pathlib import Path
from hashlib import sha256
import shutil
R=Path(__file__).resolve().parents[1]
S=R/'.review-sibling'
if (R/'research/FINAL_REVIEW.md').exists():
    raise SystemExit('Final review is already applied; refusing to apply it twice.')
expected={'paper/main.tex':'6f7019dfe0b25f9245c95c84baa80b35c2b88106b16c9e92a0611e0046b26587','paper/deductions.tex':'928393acc7ace8b29e93261480f103dabc47284b87166530dd486073af2e5d0f','paper/refs.bib':'bc4305abcb198bff203a70ae497b57f0d2fb63822e645b19117d686f3969069a','README.md':'c324973498d2c827e82fbe9eb7f8ea862d23bd6c7a7529ab15051366db20edde'}
for f,h in expected.items():
    assert sha256((R/f).read_bytes()).hexdigest()==h, f
for f in ['research/arrangement_endings.py','research/spliced_certificates.py','research/noncorner-splice.json','research/noncorner-bridge.txt','research/score_equality_test.py','research/2x2-score-equality-counterexample.txt','research/mass_interval.py','research/mass_barriers.py','lean-kernel/Game2048/DeadlineSlack.lean']:
    shutil.copy2(S/f,R/f)
p=R/'research/score_bounds.py';s=p.read_text();s=s[:s.index("# Keep the prose's finite table synchronized")]+"\nassert [r['score_upper'] for r in rows] == [68,64,120,116,116,112,120,116,116,112,136,132,132,128,136]\n";p.write_text(s)
p=R/'research/verify_variants.py';s=p.read_text();s=s.replace('    outputs.append(p.stdout)',"    if len(outputs) == 0:\n     got=[int(x) for row in p.stdout.split('Final board:\\n',1)[1].splitlines()[:4] for x in row.split()]\n    else:\n     got=[int(x) for row in p.stdout.splitlines()[:4] for x in row.split()]\n    assert tuple(got)==b, (i,got,b)\n    outputs.append(p.stdout)");p.write_text(s)
p=R/'paper/refs.bib';extra=(S/'paper/refs.bib').read_text();p.write_text(p.read_text()+'\n'+extra[extra.index('@misc{ripa2014,'):])
p=R/'paper/main.tex';s=p.read_text();other=(S/'paper/main.tex').read_text()
a=s.index('\\begin{theorem}\\label{thm:score}');b=s.index('\\begin{corollary}\\label{cor:4x4}',a);c=other.index('\\begin{theorem}\\label{thm:score}');d=other.index('\\begin{corollary}\\label{cor:4x4}',c);s=s[:a]+other[c:d]+s[b:]
a=s.index('\\title{');b=s.index('\\author{',a);s=s[:a]+r'\title{Perfect 2048:\\ Kernel-Verified Optima and Extremal Play}'+'\n'+s[b:]
a=s.index('\\begin{abstract}');b=s.index('\\end{abstract}',a)
s=s[:a]+r'''\begin{abstract}
We study extremal \emph{possible play} in 2048: player moves and legal
spawn outcomes together specify a trajectory, without asserting that
those outcomes can be forced in random play. For every ordinary two-tile
opening of the standard $4\times4$ game, we determine the exact minimum
number of rounds to reach $131072$: $32{,}781$ from two 4s and $32{,}782$
otherwise. Every opening attains its time optimum jointly with the
minimum post-spawn endpoint mass $131102$. These results, including
coverage of all 480 labeled openings, are checked by Lean~4's kernel.
The constructive theorem has no axiom dependencies; the combined
optimum theorem uses only \texttt{propext} and \texttt{Quot.sound}.

Written bounds and independently replayed witnesses further establish
the maximum score $1{,}966{,}216$ among fastest target-reaching games,
and a $65{,}548$-round optimum when exactly one 4-birth is permitted.
We certify 320 distinct minimum-length full-chain arrangements in 40
symmetry orbits, including every boundary location of the largest tile
and diagonally opposite placements of the smallest and largest tiles.
Unavoidable total-mass configurations yield policy-independent
probability bounds, a fixed spawn-value word for any ceiling-score game,
and a scalar relaxation of optimal expected score. We also give a
uniform one-dimensional construction and a moving-window embedding lemma.

The broader score and game-length bounds are checked on enumerated
small boards: the $2\times5$ possible-play computation has
$1{,}814{,}373{,}350$ positions up to symmetry and attains $36{,}828$
points and $2{,}034$ rounds; the cube and the published $3\times3$
count supply further comparisons. Attainment of the $4\times4$ score
ceiling $3{,}932{,}100$ remains conjectural. The Lean scope is the fixed-board
time--mass optima and supporting deterministic lemmas, not all stochastic,
score, or arbitrary-board arguments. Plaintext witnesses, two independent
replayers, proof sources, and reproducible audits accompany the manuscript.
'''+s[b:]
s=s.replace('The third and fourth questions we have not seen\nasked in print; their answers fall out of the same accounting.',"The numerical score and longest-game figures already appear in\nRip\\`a's 2014 analysis \\cite{ripa2014,ripaoeis2014}. We contribute\nexplicit proof arguments and certificates rather than claiming those\nnumbers as new.")
s=s.replace('\\paragraph{Learning agents.}',r'''\paragraph{Numerical prior art and scope.}
Rip\`a \cite{ripa2014,ripaoeis2014} already gives the numerical score
formula, the $131052$-round figure, and the necessary rare spawn-value
word probability in 2014. A contemporaneous account \cite{amo2014}
observes that the final 2 or 4 does not affect the score. We retain
this credit when proving bounds and correcting the equality case;
we do not treat successful computation or formalization as evidence of
historical priority. No uniform arbitrary-rectangle construction or
$4\times4$ score-ceiling witness is asserted here.

\paragraph{Learning agents.}''')
s=s.replace('On every board up to ten cells, the','On every enumerated board up to ten cells, the').replace('every tile on every board of at most\nten cells','every relevant tile on each enumerated board of at most\nten cells').replace('What is established: on every\nboard up to ten cells, the cube included, by exhaustive enumeration','What is established: on the enumerated\nboards up to ten cells, the cube included, by exhaustive enumeration')
s=s.replace('forward-only pass that keeps only the open layers; its honest game, which\nneeds every layer, did not fit in memory here and is left to a bigger\nmachine.','forward-only pass that keeps only the open layers. Our implementation\nof the stochastic backward pass retained all layers and exceeded available\nmemory; that stochastic solution was not completed. This is an\nimplementation limitation, not a necessity to retain all layers in RAM.')
s=s.replace('eight spiral arrangements reachable (Theorem~\\ref{thm:eight}); every reachable arrangement','at least 320 arrangements have minimum-length certificates (Section~\\ref{sec:deductions}), with the largest tile in every boundary cell; every reachable arrangement')
s=s.replace('At least 256 arrangements have optimal-length certificates (Section~\\ref{sec:deductions}); every reachable one has its 4 on the\nboundary beside the 8 (Proposition~\\ref{prop:lastmove}). Can the $131072$ sit off the corners? The opposite-corner\nplacement of the 4 is now realized in Section~\\ref{sec:deductions}.','At least 320 arrangements have optimal-length certificates, including\nevery boundary location of $131072$ and the opposite-corner placement of\nthe 4 (Section~\\ref{sec:deductions}). Can the $131072$ occupy an\ninterior cell of a full chain? A complete classification remains open.')
s=s.replace('the full chain is the unique position of maximum mass','the full chain is the unique tile multiset of maximum mass').replace('the possible-play half of $4\\times3$ at negligible cost','the possible-play half of $4\\times3$ with additional per-state storage').replace('the obstacle is purely size','a central obstacle is the state-space size')
s=s.replace('A uniform\nconstruction with a proven invariant remains an unresolved verification\ntask in this work;','A uniform multidimensional\nconstruction with a proven invariant remains an unresolved verification\ntask in this work; the line family is handled in Section~\\ref{sec:deductions};')
s=s.replace('10^{-48{,}608}','10^{-48{,}607}')
pos=s.index('\\section*{Reproducibility}');s=s[:pos]+s[pos:].replace('\\paragraph{Formal proof.}',r'''\paragraph{Research expansion.}
Run \texttt{bash research/finish.sh} to rebuild the original certificate,
the every-opening and minimum-mass theorems, the deadline-slack lemmas,
and the finite calculations and new arrangement certificates.
The optional \texttt{--computations-only} mode explicitly makes no fresh
Lean-checking claim. \path{research/audit/final-verification.json}
records the checked source hashes and the exact theorem dependencies.
The multi-billion-state $2\times5$ enumeration is not rerun by these checks.

\paragraph{Formal proof.}''',1)
s=s.replace('\\bibliographystyle{plain}',r'''\section*{AI-assisted development}
Generative AI assisted with conjecture exploration, manuscript drafting,
programming, and Lean proof development. Kernel verification applies to
the named formal statements under the displayed definitions; executable
replay applies to the supplied finite witnesses. Neither constitutes
peer review of the unformalized arguments or establishes historical
priority. The proof and experiment sources are provided for independent
checking.

\bibliographystyle{plain}''');p.write_text(s)
p=R/'paper/deductions.tex';s=p.read_text().replace('2.3963170889','2.3963146538').replace('1.0714006665','1.0714006617').replace('10^{-48608}','10^{-48607}').replace('8440','8441')
s=s.replace('The score-oriented witness first\nreaches $131072$ at round $65{,}550$. Its exact rational probability,','The one-4 witness first\nreaches $131072$ at round $65{,}548$. Its exact rational probability,')
s=s.replace('This necessary-event bound does not assume that the score ceiling is',"Rip\\`a already gave this value-word probability and the numerical\nscore and length formulas in 2014 \\cite{ripa2014,ripaoeis2014}; we do\nnot claim them as new. This necessary-event bound does not assume that the score ceiling is")
s=s.replace('stabilizer and eight labeled boards per orbit. This establishes at least\n\\textbf{256} arrangements','stabilizer and eight labeled boards per orbit. A separate 70-round\ncheckpoint bridge supplies eight further noncorner-largest-tile orbits.\nDeduplicating the union gives 40 orbits and at least\n\\textbf{320} arrangements')
s=s.replace('The question of an off-corner largest tile at a full-chain endpoint\nremains unresolved here. The shared-prefix variants and their independent\nreplay checks are retained under \\texttt{research/results/}.',r'''The off-corner question also has a positive answer. A 70-round legal
bridge between rounds $49{,}166$ and $49{,}236$, followed by a reflected
suffix with the two distinct inert largest labels exchanged, produces
\[
\begin{array}{rrrr}
4&8&16&32\\
512&256&128&64\\
1024&2048&4096&8192\\
65536&131072&32768&16384
\end{array}.
\]
The explicit transcript \path{witness/full-chain-noncorner.txt} is
replayed in its entirety; no arbitrary label exchange is permitted as
an operation in the actual game. The exchange describes how the
candidate suffix was found, not how its legality is justified.
Symmetries put the largest tile in every boundary cell. Interior
placement in a full-chain endpoint and a complete classification remain
unresolved. Forty-eight representative histories (including overlaps)
are independently replayed by both rule implementations, and the
endpoint union is explicitly deduplicated. Reports are retained under
\path{research/results/}.''')
other=(S/'paper/deductions.tex').read_text();extras=other[other.index('\\subsection{A computable upper bound on optimal expected score}'):]
extras=extras.replace('There is also a Bellman relaxation with only $H+1$ scalar mass states.','Use mass units of 2, put $H=2^{c+1}-2$, and let $F(m)$ be the\npotential of the binary expansion of actual mass $2m$. For $c\\ge3$,\nthere is a Bellman relaxation with only $H+1$ scalar mass states.')
s=s.replace('\\paragraph{Reproduction and scope.}',extras+'\n\\paragraph{Reproduction and scope.}').replace('The symmetry, every-opening,\nand endpoint-mass theorems are kernel-checked.','The symmetry, every-opening,\nendpoint-mass, and deterministic deadline-slack theorems are kernel-checked.').replace('bash research/check.sh','bash research/finish.sh');p.write_text(s)
p=R/'research/DEDUCTIONS.md';s=p.read_text().replace('2.3963170889','2.3963146538').replace('1.0714006665','1.0714006617').replace('8440','8441').replace('10^(-48608)','10^(-48607)').replace('At least 256','At least 320')
s=s.replace('More usefully, the score-oriented witness first reaches 131072 at round\n65550 and has log10 probability about **-48607.7169**.','More usefully, the new one-4 witness first reaches 131072 at round\n65548 and has log10 probability about **-48606.13637**.')
s=s.replace('Therefore at least **256** full-chain arrangements have 65533-round\nwitnesses','This corner family supplies 256 arrangements; eight additional\nnoncorner orbits increase the union to **320** full-chain arrangements with\n65533-round witnesses').replace('The question whether the largest tile can be\noff a corner in a FULL-CHAIN endpoint remains unresolved here.','The companion 70-round splice supplies eight noncorner-largest-tile\norbits. The combined union has 40 orbits, or 320 distinct labeled\nminimum-length full-chain endpoints. Every boundary location of the\nlargest tile is covered. Interior placement remains unresolved.')
s+='\n## Final audit additions\n\nThe completed expansion also checks the independent noncorner bridge,\nthe corrected score-equality counterexample on all 662 raw 2x2 states,\npolicy-independent mass-only expected-value bounds with outward rounding,\nand the Lean deterministic deadline-slack theorem. See\n`audit/final-verification.json` and `results/combined-arrangements.json`.\nThe core unrestricted 4x4 maximum-score/longest-game conjecture and\narbitrary-rectangle attainability are not settled.\n';p.write_text(s.replace('bash research/check.sh','bash research/finish.sh'))
p=R/'README.md';s=p.read_text().replace('at least 256','at least 320').replace('**256**','**320**').replace('bash research/check.sh','bash research/finish.sh')
s=s.replace('is attained on every board up to nine cells — always on the full chain,\nalways with exactly one 4 per tile.','is attained on the enumerated boards through ten cells, including 2×5.\nEquality permits the full chain with one 4-birth per tile, or the same\nchain with its final 4 replaced by a 2 and one fewer 4-birth; the final\nspawn itself changes no score.')
s+='''\n### Completed broader research\n\nThe expanded [paper](paper/main.pdf) and [research summary](research/DEDUCTIONS.md)\nnow distinguish kernel-checked all-opening joint time–mass optima,\nwritten and independently replayed restricted score optima, and 320\ndistinct minimum-length full-chain endpoints in 40 symmetry orbits.\nThe largest tile can finish in every boundary cell. Interior placement\nand the unrestricted 4x4 maximum-score conjecture remain unresolved.\n\nRun `bash research/finish.sh` for the complete consolidated rebuild.\nThe `--computations-only` option does not claim a fresh Lean audit.\nHistorical numerical score, length, and rare-value-word formulas are\ncredited to Marco Ripà (2014) in the paper.\n''';p.write_text(s)
(R/'research/FINAL_REVIEW.md').write_text('''# Completed consolidation\n\nThe research combines the saved every-opening/minimum-mass extension with\nthe independently checked noncorner splice and deadline-slack development.\nThe 32 corner-ending orbits and eight noncorner-ending orbits yield 320\ndistinct labeled endpoints after deduplication. Both complete-history\nreplayers are required, including a check that their endpoint matches the\nclaimed board.\n\nThe score equality statement now admits a final 2 as well as a final 4.\nThe stochastic decimals and the constructive probability lower bound are\ncorrected; historical numerical formulas receive explicit 2014 credit.\nThe 2x5 possible-play row and the original Lean evidence are preserved.\n\nRun bash research/finish.sh. The actual completed audit, not this review\nsummary, records the theorem dependencies and checked input hashes.\n''')
print('Reviewed consolidation applied to the exact recovered baseline.')
