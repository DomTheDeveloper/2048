#!/usr/bin/env python3
"""Build a self-contained manuscript submission bundle; does not submit it."""
from __future__ import annotations
import gzip
import hashlib
import io
import json
import os
from pathlib import Path
import re
import subprocess
import tarfile

ROOT = Path(__file__).resolve().parents[1]
PAPER = ROOT / 'paper'
OUT = ROOT / 'submission'
EPOCH = 1788782400  # Fixed 2026-09-07 12:00 UTC; not an audit timestamp.
def manuscript_inputs():
    pending, found = ['main.tex'], set()
    while pending:
        name = pending.pop()
        if name in found:
            continue
        path = PAPER / name
        if not path.is_file() or path.parent != PAPER:
            raise RuntimeError(f'Unsupported or missing TeX input: {name}')
        found.add(name)
        for item in re.findall(r'\\(?:input|include)\{([^}]+)\}', path.read_text()):
            pending.append(item if item.endswith('.tex') else item + '.tex')
    return sorted(found | {'refs.bib'})
INPUTS = manuscript_inputs()
TITLE = 'Perfect 2048: Kernel-Verified Optima and Extremal Play'


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    OUT.mkdir(exist_ok=True)
    work = OUT / '_build'
    work.mkdir(exist_ok=True)
    env = dict(os.environ, SOURCE_DATE_EPOCH=str(EPOCH), FORCE_SOURCE_DATE='1')
    result = subprocess.run(['latexmk', '-g', '-pdf', '-interaction=nonstopmode',
        '-halt-on-error', '-file-line-error', 'main.tex'], cwd=PAPER, env=env,
        text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
    (work / 'latexmk.log').write_text(result.stdout)
    if result.returncode:
        raise RuntimeError(f'LaTeX failed; see {work / "latexmk.log"}')
    log = (PAPER / 'main.log').read_text(errors='replace')
    if re.search(r'undefined references|(?:Citation|Reference).*undefined|Overfull \\[hv]box|Label .*multiply defined', log):
        raise RuntimeError('Unresolved reference, duplicate label, or overflowing text in main.log')
    text = subprocess.check_output(['pdftotext', str(PAPER / 'main.pdf'), '-'], text=True)
    for required in ['Dominic Dabish', 'San Diego State University', 'ddabish@sdsu.edu']:
        if required not in text:
            raise RuntimeError(f'Missing author information in PDF: {required}')
    info = subprocess.check_output(['pdfinfo', str(PAPER / 'main.pdf')], text=True)
    if not re.search(r'^Author:\s+Dominic Dabish\s*$', info, re.M):
        raise RuntimeError('Incorrect PDF author metadata')
    pages = int(re.search(r'^Pages:\s+(\d+)', info, re.M).group(1))
    (work / 'pdfinfo.txt').write_text(info)
    payload = io.BytesIO()
    with gzip.GzipFile(fileobj=payload, mode='wb', filename='', mtime=EPOCH) as gz:
        with tarfile.open(fileobj=gz, mode='w') as archive:
            for name in sorted(INPUTS + ['main.bbl']):
                raw = (PAPER / name).read_bytes()
                entry = tarfile.TarInfo(name)
                entry.size, entry.mtime, entry.mode = len(raw), EPOCH, 0o644
                archive.addfile(entry, io.BytesIO(raw))
    bundle = OUT / 'arxiv-source.tar.gz'
    bundle.write_bytes(payload.getvalue())
    abstract = text.split('Abstract', 1)[1].split('\n1\n', 1)[0].strip()
    # pdftotext may place the section number and title on the same line.
    abstract = re.split(r'\n1\s+Introduction', abstract, maxsplit=1)[0].strip()
    metadata = {'title': TITLE, 'authors': [{'name': 'Dominic Dabish',
        'affiliation': 'San Diego State University', 'email': 'ddabish@sdsu.edu'}],
        'date': '2026-09-07', 'status': 'preprint; not submitted by this update',
        'abstract': abstract, 'pages': pages, 'main_tex': 'main.tex',
        'processor': 'pdflatex', 'artifact_repository': 'https://github.com/DomTheDeveloper/2048-undo',
        'artifact_branch': 'gh-pages'}
    (OUT / 'metadata.json').write_text(json.dumps(metadata, ensure_ascii=False, indent=2)+'\n')
    report = {'title': TITLE, 'author': metadata['authors'][0], 'pages': pages,
        'baseline_commit': '1f6b7160b8e79444f35bb69aff0e26b78f6fe535',
        'source_date_epoch': EPOCH, 'build_engine': subprocess.check_output(['pdflatex', '--version'], text=True).splitlines()[0],
        'pdf_sha256': digest(PAPER/'main.pdf'), 'source_bundle_sha256': digest(bundle),
        'source_sha256': {name: digest(PAPER/name) for name in INPUTS+['main.bbl']},
        'checks': {'latex_build': True, 'no_unresolved_references_or_overflow': True,
            'author_information_present': True, 'pdf_author_metadata_correct': True},
        'scope': 'Manuscript compilation and source packaging; not journal submission, peer review, or a Lean rebuild.'}
    (OUT / 'BUILD.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__':
    main()
