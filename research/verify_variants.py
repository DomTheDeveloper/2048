"""Replay each of the 32 representative full-chain constructions through BOTH existing checkers."""
from common import *
from tempfile import TemporaryDirectory
from hashlib import sha256
import json,subprocess,sys

def main():
 report=json.loads((ROOT/'research/results/tails-64.json').read_text());moves,boards=load('full-chain.txt');out=[]
 assert report['complete'] and report['symmetry_orbits']==32
 seen=set()
 with TemporaryDirectory(prefix='2048-variants-') as tmp:
  for i,v in enumerate(report['variants']):
   b=tuple(v['board']);assert canonical(b) not in seen;seen.add(canonical(b))
   assert len({transform(b,p) for p in PERMS})==8
   path=Path(tmp)/f'variant-{i:02d}.txt';write_witness(path,boards[0],moves[:report['cut']]+v['tail'],'Optimal full-chain variant from the exact 64-round tail enumeration.')
   outputs=[]
   for cmd in ([sys.executable,str(ROOT/'verify/verify2048.py'),str(path)],['node',str(ROOT/'test/replay_engine.js'),str(path)]):
    p=subprocess.run(cmd,cwd=ROOT,text=True,capture_output=True,timeout=30)
    if p.returncode or 'VALID' not in p.stdout or 'INVALID' in p.stdout:raise RuntimeError(p.stdout+p.stderr)
    assert '65533' in p.stdout and '3670024' in p.stdout
    if len(outputs) == 0:
     got=[int(x) for row in p.stdout.split('Final board:\n',1)[1].splitlines()[:4] for x in row.split()]
    else:
     got=[int(x) for row in p.stdout.splitlines()[:4] for x in row.split()]
    assert tuple(got)==b, (i,got,b)
    outputs.append(p.stdout)
   out.append({'variant':i,'endpoint':b,'witness_sha256':sha256(path.read_bytes()).hexdigest(),'python':outputs[0],'original_engine':outputs[1]})
   print('independently verified variant',i,flush=True)
 data={'representative_variants':len(out),'distinct_D4_orbits':len(seen),'certified_labeled_arrangements':8*len(seen),'steps_each':65533,'score_each':3670024,'results':out}
 (ROOT/'research/results/verified-variants.json').write_text(json.dumps(data,indent=2)+'\n')
 print('All 32 representatives pass both independent full replayers.',flush=True)
if __name__=='__main__':main()
