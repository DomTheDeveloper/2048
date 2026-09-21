"""Discover <=3-round bridges for all 480 ordinary openings."""
from common import *
from itertools import combinations,product
import json

def solve(start,targets):
 mixed=sum(start)==6;offset=int(sum(start)!=8);layer={start:[]}
 for t in range(4):
  ti=t-offset
  if 0<=ti<len(targets):
   for b,path in layer.items():
    if b in targets[ti]:return {'steps':path,'join':ti,'symmetry':targets[ti][b]}
  if t==3:break
  nxt={}
  for b,path in layer.items():
   used_two=sum(b)==sum(start)+4*t-2
   for d in DIRECTIONS:
    a,_=slide(b,d)
    if a==b:continue
    for k,v in enumerate(a):
     if not v:
      for nv in ((2,4) if mixed and not used_two else (4,)):
       z=a[:k]+(nv,)+a[k+1:]
       if z not in nxt:nxt[z]=path+[(d,k//4,k%4,nv)]
  layer=nxt
 raise RuntimeError(f'No bridge: {start}')

def main():
 moves,boards=load('131072.txt');targets=[{transform(b,p):i for i,p in enumerate(PERMS)} for b in boards[:4]]
 starts=[];reps={}
 for i,j in combinations(range(16),2):
  for v,w in product((2,4),repeat=2):
   b=[0]*16;b[i]=v;b[j]=w;b=tuple(b);starts.append(b);reps.setdefault(canonical(b),None)
 for i,b in enumerate(reps):
  reps[b]=solve(b,targets);print('orbit',i,'bridge',len(reps[b]['steps']),flush=True)
 results=[]
 for b in starts:
  rep=canonical(b);q=next(p for p in PERMS if transform(rep,p)==b);res=reps[rep]
  path=[transform_step(s,q) for s in res['steps']];a=b
  for d,r,c,v in path:
   z,_=slide(a,d);assert z!=a and not z[4*r+c];a=z[:4*r+c]+(v,)+z[4*r+c+1:]
  sym=targets[res['join']][a];total=len(path)+len(moves)-res['join'];assert total==(32781 if sum(b)==8 else 32782)
  results.append({'opening':b,'steps':path,'join':res['join'],'symmetry':sym,'minimum_moves':total})
 report={'labeled_openings':480,'symmetry_orbits':75,'maximum_bridge_length':max(len(r['steps']) for r in results),'results':results}
 (ROOT/'research/results/openings.json').write_text(json.dumps(report,indent=2)+'\n')
 print('ALL 480 OPENINGS COVERED; maximum bridge length 3',flush=True)
if __name__=='__main__':main()
