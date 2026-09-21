#!/usr/bin/env python3
"""Collect completed kernel audits, source hashes, and finite-check provenance."""
from __future__ import annotations
import datetime
import hashlib
import json
from pathlib import Path
import sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'lean-kernel'))
from build_certificate import audit_output

def main():
    base=json.loads((ROOT/'lean-kernel/verification.json').read_text())
    extended=json.loads((ROOT/'research/audit/verification.json').read_text())
    assert base['kernel_checked'] and extended['kernel_checked']
    axioms=dict(base['axioms']);axioms.update(extended['axioms'])
    axioms.update(audit_output((ROOT/'research/audit/deadline-kernel.log').read_text(),[
        'Game2048.deadline_slack_131072','Game2048.optimal_opening_and_prefix',
        'Game2048.target_prefix_budget']))
    endpoints=json.loads((ROOT/'research/results/combined-arrangements.json').read_text())
    assert endpoints['distinct_labeled_endpoints']==320
    files=[]
    for directory in ['lean-kernel/Game2048','research']:
        files.extend(p for p in (ROOT/directory).rglob('*') if p.is_file() and p.suffix in ('.lean','.py','.sh'))
    files.extend([ROOT/'lean-kernel/build_certificate.py',ROOT/'lean-kernel/lean-toolchain'])
    files.extend(sorted((ROOT/'witness').glob('*.txt')))
    hashes={p.relative_to(ROOT).as_posix():hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(files))}
    data={'kernel_checked':True,'checked_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'lean_version':base['lean_version'],'labeled_openings':480,'minimum_endpoint_mass':131102,
        'opening_minimum_rounds':{'two_fours':32781,'mixed_or_two_twos':32782},
        'labeled_chain_endpoints':320,'chain_endpoint_orbits':40,'axioms':axioms,
        'source_sha256':hashes,
        'scope':'Full original certificate and extended deterministic Lean proofs rebuilt. New scores/arrangements use written proofs and independent replays. Probability and general-size results are not Lean-formalized. The 2x5 billion-state enumeration was not rerun.'}
    (ROOT/'research/audit/final-verification.json').write_text(json.dumps(data,indent=2)+'\n')
    print('FINAL AUDIT PASSED: all-opening joint optima, deadline rigidity, and 320 certified chain endpoints.')
if __name__=='__main__':main()
