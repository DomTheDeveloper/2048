#!/usr/bin/env python3
"""Reconstruct and independently replay 16 minimum-length full-chain games.
The 70-step bridge is explicit data. No heuristic search is required.
D4 symmetry then supplies 128 distinct final arrangements.
"""
from __future__ import annotations
from hashlib import sha256
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import arrangement_endings as endings

ROOT=Path(__file__).resolve().parents[1]


def main():
    endings.main()
    raw,states=endings.read()
    recipes=json.loads((ROOT/'research/arrangement-endings.json').read_text())['endings']
    splice=json.loads((ROOT/'research/noncorner-splice.json').read_text())
    start=splice['start'];bridge=splice['bridge'];resume=start+len(bridge)
    assert start==49166 and len(bridge)==70
    original=raw[2:]
    def reflect(line):
        d,r,c,v=line.split();return '%s %d %d %d'%({'U':'U','D':'D','L':'R','R':'L'}[d],int(r),3-int(c),int(v))
    bridge_lines=['%s %d %d %d'%('URDL'[s['dir']],s['cell']//4,s['cell']%4,s['value']) for s in bridge]
    manifest=[];all_images=set();named={}
    for family in ('corner','noncorner'):
        for i,recipe in enumerate(recipes):
            tail=['%s %d %d %d'%tuple(s) for s in recipe['suffix']]
            line_a=original[:65517]+tail
            moves=line_a if family=='corner' else original[:start]+bridge_lines+[reflect(s) for s in line_a[resume:]]
            assert len(moves)==65533
            text='# Standard 4x4 2048; complete minimum-length full-chain certificate.\n'+'\n'.join(raw[:2]+moves)+'\n'
            with tempfile.TemporaryDirectory(prefix='2048-proof-') as tmp:
                path=Path(tmp)/'certificate.txt';path.write_text(text)
                py=subprocess.run(['python3',str(ROOT/'verify/verify2048.py'),str(path)],cwd=ROOT,text=True,capture_output=True,check=True)
                js=subprocess.run(['node',str(ROOT/'test/replay_engine.js'),str(path)],cwd=ROOT,text=True,capture_output=True,check=True)
            for output in (py.stdout,js.stdout):
                assert 'Certificate:         VALID' in output
                assert 'Steps verified:      65533' in output
                assert 'Final position:      every power of two' in output
            b=list(recipe['final'])
            if family=='noncorner':
                b=[b[4*r+3-c] for r in range(4) for c in range(4)]
                b=[131072 if v==65536 else 65536 if v==131072 else v for v in b]
            py_board=[int(v) for row in py.stdout.split('Final board:\n',1)[1].splitlines()[:4] for v in row.split()]
            js_board=[int(v) for row in js.stdout.splitlines()[:4] for v in row.split()]
            assert py_board == js_board == b
            all_images.update(endings.images(b))
            record={'family':family,'index':i,'moves':65533,'sha256':sha256(text.encode()).hexdigest(),'final':b,'python':'VALID','original_engine':'VALID'}
            manifest.append(record)
            if family=='corner' and b[0]==4 and b[15]==131072 and b[:4]==[4,8,16,32]:
                named['full-chain-opposite-corners']=text
            if family=='noncorner' and b[:4]==[4,8,16,32]:
                named['full-chain-noncorner']=text
            print(f"{family} {i}: both independent checkers VALID",flush=True)
    assert len(manifest)==16 and len(all_images)==128 and len(named)==2
    for name,text in named.items():(ROOT/'witness'/f'{name}.txt').write_text(text)
    report={'base_games_independently_checked':16,'distinct_D4_images':128,'minimum_rounds':65533,
            'largest_tile_cells':sorted({b.index(131072) for b in all_images}),
            'scope':'A certified lower bound on the number of reachable arrangements, NOT a complete classification.',
            'games':manifest,'final_boards':sorted(all_images)}
    (ROOT/'research/spliced-certificate-report.json').write_text(json.dumps(report,indent=2)+'\n')
    print('ALL CHECKS PASSED: 16 base games; 128 distinct symmetry images.')

if __name__=='__main__':main()
