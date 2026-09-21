#!/usr/bin/env python3
"""Apply the reviewed manuscript changes once, rejecting concurrent source edits."""
import hashlib
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
PAPER_BLOB = 'fcc49bc9751b739a6f0e3cc69990a89abe96c13f'
README_BLOB = '2ff6e9864d0daf844efe372799ea241cf78c142c'
SECTION = '\\input{state-space}'
HEADER = '### State-space research'


def git_blob(path):
    data = path.read_bytes()
    return hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()


def main():
    paper = ROOT / 'paper/main.tex'
    readme = ROOT / 'README.md'
    text = paper.read_text()
    intro = readme.read_text()
    if SECTION in text and HEADER in intro:
        print('Manuscript integration already present; no source overwritten.')
        return
    if git_blob(paper) != PAPER_BLOB or git_blob(readme) != README_BLOB:
        raise SystemExit('Refusing to overwrite a changed manuscript or README; review the patch against the new source.')
    patch = Path(__file__).with_name('paper-equality-fix.patch')
    subprocess.run(['git', 'apply', '--check', str(patch)], cwd=ROOT, check=True)
    subprocess.run(['git', 'apply', str(patch)], cwd=ROOT, check=True)
    text = paper.read_text()
    marker = '\\bibliographystyle{plain}'
    if text.count(marker) != 1:
        raise SystemExit('Expected exactly one bibliography insertion point')
    text = text.replace(marker, '\\fussy\n' + SECTION + '\n\n' + marker)
    paper.write_text(text)
    marker = '### Lean-verified exact move counts'
    if intro.count(marker) != 1:
        raise SystemExit('Expected exactly one README insertion point')
    note = '''### State-space research

The [audited state-space package](research/state-space/README.md) provides human
proofs, exact inverse-slide rules, independent integer counters, and reproducible
enumeration. It bounds the continued 4×4 game by **22,851,583,961,907,351,152 labeled
boards** or **2,856,448,098,561,271,997 symmetry classes**. These are upper bounds,
not the exact reachable-state count. It also corrects the score theorem's equality
clause: the final 4 can be replaced by a 2 without changing the score. The new
state-space arguments do not extend the Lean claims below.

```sh
bash research/state-space/run.sh --large
```

'''
    readme.write_text(intro.replace(marker, note + marker))
    print('Applied the score-equality correction and integrated the state-space section and README.')


if __name__ == '__main__':
    main()
