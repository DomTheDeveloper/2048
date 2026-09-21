#!/usr/bin/env python3
"""Publish a completed kernel audit without overwriting concurrent research.

The pinned artifact's verification steps passed; its commit step failed only on
literal trailing whitespace in a raw TeX transcript. Preserve those bytes and
reuse the proof evidence only after matching every audited input. Rebuild the
current complete manuscript rather than publishing the older artifact's PDF.
"""
from __future__ import annotations
import argparse
from datetime import datetime, timezone
from hashlib import sha256
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import subprocess
from zipfile import ZipFile, ZIP_DEFLATED

ROOT = Path(__file__).resolve().parents[1]
PREFIX = '2048-undo/2048-undo/'
AUDIT_SHA = '1eee87081dc812c341ea6a080b4ac45fbd303c64ec9933255e391211e04056c8'
AUDIT_RUN = 34173916457
AUDIT_COMMIT = '2d301bc52d14ced8a91bbbbfe3af6600a6edee7b'


def require(ok: bool, message: str) -> None:
    if not ok:
        raise RuntimeError(message)


def digest(path: Path) -> str:
    return sha256(path.read_bytes()).hexdigest()


def write_json(path: Path, data: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2) + '\n')


def verify_inputs(report: dict) -> None:
    require(report['kernel_checked'] is True, 'The original kernel audit did not pass')
    require(report['labeled_openings'] == 480 and report['minimum_endpoint_mass'] == 131102,
            'Incorrect all-opening or mass theorem')
    require('4.19.0' in report['lean_version'], 'Wrong Lean version')
    for name, expected in report['source_sha256'].items():
        path = ROOT / name
        require(path.is_file() and digest(path) == expected,
                f'Refusing stale proof evidence: audited input changed: {name}')


def restore(archive: Path) -> None:
    require(digest(archive) == AUDIT_SHA, 'Completed-audit archive digest mismatch')
    with ZipFile(archive) as z:
        for name in z.namelist():
            p = PurePosixPath(name)
            require(not p.is_absolute() and '..' not in p.parts, 'Unsafe archive path')
        report = json.loads(z.read(PREFIX + 'research/audit/final-verification.json'))
        # Only generated, ignored Lean input is restored. Never replace a tracked
        # proof or witness merely to make a stale hash pass.
        for name, expected in report['source_sha256'].items():
            if name.startswith('lean-kernel/Game2048/Generated/'):
                data = z.read(PREFIX + name)
                require(sha256(data).hexdigest() == expected, f'Corrupt generated input: {name}')
                path = ROOT / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(data)
        verify_inputs(report)
        for name in z.namelist():
            if name.startswith(PREFIX + 'research/audit/') and not name.endswith('/'):
                rel = name[len(PREFIX):]
                path = ROOT / rel
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(z.read(name))
        # Retain the original paper's receipt and raw transcript separately.
        destination = ROOT / 'research/audit/release'
        (destination / 'verified-source-release-34173916457.json').write_bytes(
            z.read(PREFIX + 'publication/release.json'))
        (destination / 'verified-paper-build-34173916457.log').write_bytes(
            z.read(PREFIX + 'research/audit/release/paper-build.log'))
    write_json(ROOT / 'research/audit/release/recovery.json', {
        'verified_artifact_id': 10036891180, 'verified_artifact_sha256': AUDIT_SHA,
        'kernel_audit_run': AUDIT_RUN, 'kernel_checked_source_commit': AUDIT_COMMIT,
        'audited_inputs_identical': True,
        'reason': 'Verification succeeded; publication was blocked only by raw-log whitespace. '
                  'No proof test is waived. Concurrent manuscript/monotone additions are preserved.'})
    print('PASS: restored literal audit and matched every verified Lean/experiment input.')


def record() -> None:
    subprocess.run(['python3', 'paper/finalize.py', 'check'], cwd=ROOT, check=True)
    formal = json.loads((ROOT / 'research/audit/final-verification.json').read_text())
    verify_inputs(formal)
    state_dir = Path(os.environ['STATE_SPACE_RUN'])
    state = json.loads((state_dir / 'manifest.json').read_text())
    require(state['status'] == 'passed' and len(state['completed_cases']) == 7,
            'All seven current state-space cases must pass')
    for name, expected in state['source_sha256'].items():
        require(digest(ROOT / 'research/state-space' / name) == expected,
                f'State-space input changed after execution: {name}')
    dest = ROOT / 'research/audit/release'
    for name in ('manifest.json', 'bounds.json', 'results/regressions.json',
                 'results/verified_bounds.json', 'results/verified_enumeration.json'):
        filename = 'state-space-manifest.json' if name == 'manifest.json' else Path(name).name
        shutil.copy2(state_dir / name, dest / filename)
    source_commit = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
    receipt = {
        'schema_version': 2,
        'manuscript_title': 'Perfect 2048: Kernel-Verified Optima and Extremal Play',
        'author': 'Dominic Dabish', 'affiliation': 'San Diego State University',
        'email': 'ddabish@sdsu.edu', 'manuscript_status': 'research preprint; not submitted or accepted',
        'publication_source_commit': source_commit,
        'publication_workflow_run': os.environ.get('GITHUB_RUN_ID'),
        'completed_at_utc': datetime.now(timezone.utc).isoformat(),
        'kernel_verification_run': AUDIT_RUN, 'kernel_checked_source_commit': AUDIT_COMMIT,
        'kernel_version': formal['lean_version'], 'all_audited_inputs_unchanged': True,
        'kernel_rebuilt_in_this_publication_job': False,
        'kernel_evidence': 'The fresh full rebuild in the identified audit passed. '
                           'This publication reuses it only after exact source-hash verification.',
        'labeled_openings': 480, 'endpoint_mass': 131102,
        'fresh_state_space_cases': state['completed_cases'],
        'monotone_constructive_tests': 'rerun in this publication job; conventional proofs, not Lean',
        'pdf_sha256': digest(ROOT / 'paper/main.pdf'),
        'source_bundle_sha256': digest(ROOT / 'submission/arxiv-source.tar.gz'),
        'paper_source_sha256': {p.name: digest(p) for p in sorted((ROOT/'paper').iterdir())
                                if p.suffix in ('.tex', '.bib')},
        'scope': 'Named fixed-4x4 time/mass/deadline theorems are kernel checked. '
                 'State-space, score and monotone arguments remain human proofs with executable checks. '
                 'Exact full 4x4 count and unrestricted score-ceiling attainment are not established.'}
    write_json(ROOT / 'paper/release.json', receipt)
    print('PASS: complete current manuscript is bound to current checks and identical formal inputs.')


def bundle() -> None:
    out = ROOT / 'publication'
    out.mkdir(exist_ok=True)
    for src, name in [('paper/main.pdf', 'Perfect-2048-Dominic-Dabish.pdf'),
                      ('paper/release.json', 'release.json'),
                      ('submission/arxiv-source.tar.gz', 'Perfect-2048-LaTeX-Source.tar.gz')]:
        shutil.copy2(ROOT / src, out / name)
    commit = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
    (out/'publication-commit.txt').write_text(commit+'\n')
    allowed = {'paper','lean-kernel','research','witness','verify','test','js','submission','release','.github'}
    single = {'README.md','STATE_SPACE.md','CITATION.cff','CITATION.bib','LICENSE.txt','.gitattributes','.gitignore'}
    names = subprocess.check_output(['git','ls-files','-z'],cwd=ROOT).decode().split('\0')
    with ZipFile(out/'Perfect-2048-Source-and-Evidence.zip','w',ZIP_DEFLATED) as z:
        for name in sorted(filter(None,names)):
            p = PurePosixPath(name)
            if p.parts[0] not in allowed and name not in single:
                continue
            if '__pycache__' in p.parts or 'fonts' in p.parts or p.suffix.lower() in {
                    '.pyc','.woff','.woff2','.ttf','.otf','.eot','.zip','.gz'}:
                continue
            z.write(ROOT/name,name)
        z.writestr('PUBLICATION_COMMIT.txt',commit+'\n')
    print('Publication files and source/evidence bundle created from the committed revision.')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('operation', choices=('restore','record','bundle'))
    parser.add_argument('archive', nargs='?', type=Path)
    args = parser.parse_args()
    if args.operation == 'restore':
        parser.error('restore requires an audit ZIP') if args.archive is None else restore(args.archive)
    elif args.operation == 'record':
        record()
    else:
        bundle()
