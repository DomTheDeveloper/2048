#!/usr/bin/env python3
"""Reproduce and combine the two independent research extensions.

These are ordinary computational checks. Kernel checking is handled separately
by finish.sh. No stochastic formula is advertised as a Lean theorem here.
"""
from __future__ import annotations
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
from common import PERMS, canonical, transform

ROOT = Path(__file__).resolve().parents[1]

def run(script: str, log: str) -> None:
    completed = subprocess.run([sys.executable, script], cwd=ROOT, text=True,
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=600)
    (ROOT / log).write_text(completed.stdout)
    if completed.returncode:
        raise RuntimeError(f'{script} failed; see {log}\n{completed.stdout[-2000:]}')
    print(f'PASS: {script}', flush=True)

def main() -> None:
    run('research/spliced_certificates.py', 'research/spliced-checks.log')
    run('research/score_equality_test.py', 'research/score-equality-check.log')
    completed = subprocess.run([sys.executable, '-c',
        "import importlib.util;s=importlib.util.spec_from_file_location('v','verify/verify2048.py');"
        "v=importlib.util.module_from_spec(s);s.loader.exec_module(v);v.N=2;"
        "v.main('research/2x2-score-equality-counterexample.txt')"],
        cwd=ROOT,text=True,capture_output=True,check=True,timeout=30)
    assert 'Score:               180' in completed.stdout
    assert 'Steps verified:      24' in completed.stdout
    (ROOT/'research/score-equality-independent.log').write_text(completed.stdout)
    run('research/mass_barriers.py', 'research/mass-barrier-check.log')
    run('research/mass_interval.py', 'research/mass-interval-check.log')
    core=json.loads((ROOT/'research/results/verified-variants.json').read_text())
    sibling=json.loads((ROOT/'research/spliced-certificate-report.json').read_text())
    assert core['representative_variants']==32
    assert sibling['base_games_independently_checked']==16
    a={transform(tuple(v['endpoint']), p) for v in core['results'] for p in PERMS}
    b={tuple(v) for v in sibling['final_boards']}
    total=a|b
    assert (len(a),len(b),len(a&b),len(total))==(256,128,64,320)
    orbits={canonical(v) for v in total};assert len(orbits)==40
    cells=sorted({v.index(131072) for v in total})
    assert cells==[0,1,2,3,4,7,8,11,12,13,14,15]
    report={'distinct_labeled_endpoints':len(total),'distinct_D4_orbits':len(orbits),
        'complete_histories_checked_by_both_engines':48,'overlap_labeled_endpoints':len(a&b),
        'rounds_each':65533,'largest_tile_cells':cells,
        'scope':'Certified lower bound, not an exhaustive classification of full-chain arrangements.',
        'final_boards':sorted(total)}
    (ROOT/'research/results/combined-arrangements.json').write_text(json.dumps(report,indent=2)+'\n')
    print('PASS: 48 complete histories, 40 endpoint orbits, 320 distinct labeled endpoints.', flush=True)
    print('Interior full-chain placement and the unrestricted 4x4 score optimum remain unresolved.',flush=True)

if __name__=='__main__':main()
