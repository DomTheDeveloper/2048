#!/usr/bin/env bash
# Complete reproducible build. The optional --computations-only mode makes NO kernel claim.
set -euo pipefail
cd "$(dirname "$0")/.."
mode="${1:-full}"
if [ "$mode" != '--computations-only' ]; then
  test "$mode" = full
  bash lean-kernel/check.sh
fi
mkdir -p research/results research/audit
python3 research/openings.py
python3 research/fold.py twos
(cd research && python3 -c 'from fold import main; main((4,)); main((2,),one_four=True)')
python3 research/tails.py 16
python3 research/tails.py 32
python3 research/tails.py 64
python3 research/gateways.py
python3 research/embedding.py
python3 research/score_bounds.py
python3 research/witness_probabilities.py
python3 research/verify_variants.py
for name in 131072-minimum-fold-fours 131072-fold-4 131072-one-four full-chain-opposite; do
  python3 verify/verify2048.py "witness/$name.txt" > "research/results/$name-python.log"
  node test/replay_engine.js "witness/$name.txt" > "research/results/$name-engine.log"
done
node test/paper_facts.js > research/results/paper-facts.log
python3 research/emit_opening_proofs.py
if [ "$mode" != '--computations-only' ]; then
  (
    cd lean-kernel
    export LEAN_PATH="$PWD"
    for module in Symmetry ResidualMass MinimumMass OpeningTails OpeningCases AllOpenings; do
      echo "CHECKING $module"
      lean -o "Game2048/$module.olean" "Game2048/$module.lean"
    done
  ) 2>&1 | tee research/audit/extended-kernel.log
  python3 - <<'PY'
from pathlib import Path
import sys,json,hashlib,datetime
sys.path.insert(0,'lean-kernel')
from build_certificate import audit_output
names=['Game2048.Plays.rotate','Game2048.lower_bound_mass_131072',
       'Game2048.MinimumMass.certified_play','Game2048.MinimumMass.joint_optimum',
       'Game2048.OpeningTails.tail7_3','Game2048.every_opening_attains_its_bound',
       'Game2048.standard2048_all_openings_exact']
text=Path('research/audit/extended-kernel.log').read_text()
audit=audit_output(text,names)
sources={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(Path('lean-kernel/Game2048').glob('*.lean'))}
report={'kernel_checked':True,'axioms':audit,'source_sha256':sources,
        'checked_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('research/audit/verification.json').write_text(json.dumps(report,indent=2)+'\n')
print('EXTENDED KERNEL AUDIT PASSED: every opening, joint minimum time and mass.')
PY
else
  echo 'COMPUTATIONAL CHECKS PASSED. This mode does not run or claim a fresh Lean check.'
fi
