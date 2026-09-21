#!/usr/bin/env python3
"""Apply reviewed editorial changes, verify the PDF, and record a finished release."""
from __future__ import annotations
import argparse
from datetime import datetime, timezone
from hashlib import sha256
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
PAPER = ROOT / 'paper'
AUTHOR = 'Dominic Dabish'
TITLE = 'Perfect 2048: Kernel-Verified Optima and Extremal Play'

def require(ok, message):
    if not ok:
        raise RuntimeError(message)

def digest(path):
    return sha256(path.read_bytes()).hexdigest()

def apply():
    marker = r'\input{author}'
    if marker in (PAPER/'main.tex').read_text():
        require(AUTHOR in (ROOT/'README.md').read_text(), 'Partially applied editorial update')
        print('Reviewed editorial changes already present.')
        return
    baseline = json.loads((PAPER/'final-editorial-inputs.json').read_text())
    for name, expected in baseline.items():
        require(digest(ROOT/name) == expected, f'Refusing to overwrite concurrent changes in {name}')
    for check in (True, False):
        cmd = ['git', 'apply'] + (['--check'] if check else []) + [str(PAPER/'final-editorial.patch')]
        subprocess.run(cmd, cwd=ROOT, check=True)
    print('Applied exact reviewed author, citation and scope corrections.')

def check():
    author = (PAPER/'author.tex').read_text()
    for value in (AUTHOR, 'San Diego State University', 'ddabish@sdsu.edu'):
        require(value in author, f'Missing author detail: {value}')
    cff = (ROOT/'CITATION.cff').read_text()
    for value in ('family-names: "Dabish"', 'given-names: "Dominic"',
                  'affiliation: "San Diego State University"', 'email: "ddabish@sdsu.edu"',
                  'type: unpublished', TITLE):
        require(value in cff, f'Citation metadata mismatch: {value}')
    require('author = {Dabish, Dominic}' in (ROOT/'CITATION.bib').read_text(), 'Wrong BibTeX author')
    log = (PAPER/'main.log').read_text(errors='replace')
    forbidden = (r'undefined references', r'Citation .* undefined', r'Reference .* undefined',
                 r'Overfull \\hbox', r'Overfull \\vbox', r'Rerun to get cross-references right',
                 r'Label\(s\) may have changed', r'There were multiply-defined labels')
    for pattern in forbidden:
        require(not re.search(pattern, log), f'Unresolved manuscript build diagnostic: {pattern}')
    first = subprocess.check_output(['pdftotext','-f','1','-l','1',str(PAPER/'main.pdf'),'-'], text=True)
    for value in (AUTHOR, 'San Diego State University', 'ddabish@sdsu.edu'):
        require(value in first, f'Author information absent from PDF title page: {value}')
    info = subprocess.check_output(['pdfinfo', str(PAPER/'main.pdf')], text=True)
    require(re.search(r'^Author:\s+Dominic Dabish\s*$',info,re.M), 'Incorrect PDF author metadata')
    require(re.search(r'^Title:\s+'+re.escape(TITLE)+r'\s*$',info,re.M), 'Incorrect PDF title metadata')
    text = subprocess.check_output(['pdftotext',str(PAPER/'main.pdf'),'-'],text=True)
    for value in ('480','131102','320','22,851,583','2,856,448','Structural reachability'):
        require(value in text, f'Consolidated manuscript content missing: {value}')
    print('PASS: author, affiliation, correspondence, citations, PDF metadata and cross-references.')
    return info

def record():
    info=check()
    formal=json.loads((ROOT/'research/audit/final-verification.json').read_text())
    require(formal['kernel_checked'] is True, 'Missing successful fresh formal audit')
    require(formal['labeled_openings']==480 and formal['minimum_endpoint_mass']==131102,
            'Incorrect all-opening result')
    for name, expected in formal['source_sha256'].items():
        require(digest(ROOT/name)==expected, f'Formal/experiment source changed after verification: {name}')
    state_path=Path(os.environ['STATE_SPACE_RUN'])
    state=json.loads((state_path/'manifest.json').read_text())
    require(state['status']=='passed' and len(state['completed_cases'])==7,
            'Release requires seven fresh enumeration cases')
    for name, expected in state['source_sha256'].items():
        require(digest(ROOT/'research/state-space'/name)==expected,
                f'State-space source changed after verification: {name}')
    source_commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip()
    receipt={'schema_version':1,'manuscript_title':TITLE,'author':AUTHOR,
       'affiliation':'San Diego State University','email':'ddabish@sdsu.edu',
       'manuscript_status':'research preprint; not a claim of peer review or acceptance',
       'checked_source_commit':source_commit,'workflow_run':os.environ.get('GITHUB_RUN_ID'),
       'completed_at_utc':datetime.now(timezone.utc).isoformat(),
       'fresh_kernel_rebuild':True,'kernel_version':formal['lean_version'],
       'labeled_openings':480,'endpoint_mass':131102,
       'fresh_state_space_cases':state['completed_cases'],
       'pdf_sha256':digest(PAPER/'main.pdf'),
       'paper_source_sha256':{p.name:digest(p) for p in sorted(PAPER.iterdir())
                              if p.suffix in ('.tex','.bib')},
       'scope':'Fresh kernel-only original witness and every-opening/mass/deadline proofs; fresh finite replays and seven state-space cases. General state-space proofs remain human proofs. Exact full 4x4 count and unrestricted score attainment are not established.'}
    (PAPER/'release.json').write_text(json.dumps(receipt,indent=2)+'\n')
    release_audit=ROOT/'research/audit/release'
    release_audit.mkdir(parents=True,exist_ok=True)
    shutil.copy2(state_path/'manifest.json',release_audit/'state-space-manifest.json')
    for name in ('bounds.json','results/regressions.json','results/verified_enumeration.json','results/verified_bounds.json'):
        shutil.copy2(state_path/name,release_audit/Path(name).name)
    out=ROOT/'publication';out.mkdir(exist_ok=True)
    shutil.copy2(PAPER/'main.pdf',out/'Perfect-2048-Dominic-Dabish.pdf')
    shutil.copy2(PAPER/'release.json',out/'release.json')
    (out/'pdfinfo.txt').write_text(info)
    print('PASS: completed release receipt matches all checked sources.')

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('operation',choices=('apply','check','record'))
    args=parser.parse_args()
    {'apply':apply,'check':check,'record':record}[args.operation]()
