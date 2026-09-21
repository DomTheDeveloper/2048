"""Exact, bounded all-4 suffix enumeration; any cap is reported as incomplete."""
from common import *
import json,sys

def main(depth=16,limit=500000):
 moves,boards=load('full-chain.txt');cut=len(moves)-depth;layer={boards[cut]:[]};total=0;counts=[];complete=True
 for t in range(depth):
  counts.append(len(layer));print('tail',depth,'step',t,'states',len(layer),flush=True);nxt={}
  for b,path in layer.items():
   for d in DIRECTIONS:
    a,_=slide(b,d)
    if a==b:continue
    for k,v in enumerate(a):
     if not v:
      z=a[:k]+(4,)+a[k+1:]
      if z not in nxt:nxt[z]=path+[(d,k//4,k%4,4)]
  total+=len(layer);layer=nxt
  if len(layer)>limit:complete=False;break
 answers={b:path for b,path in layer.items() if sorted(b)==[1<<k for k in range(2,18)]} if complete else {}
 reps={}
 for b,path in answers.items():reps.setdefault(canonical(b),(b,path))
 selected={}
 for b,path in answers.items():
  loc=b.index(131072)
  for label,cond in [('noncorner',loc not in (0,3,12,15)),('interior',loc in (5,6,9,10)),('opposite',(loc,b.index(4)) in ((0,15),(15,0),(3,12),(12,3)))]:
   if cond and label not in selected:
    selected[label]={'board':b,'tail':path}
 if depth==16 and 'opposite' in selected:
  write_witness(ROOT/'witness/full-chain-opposite.txt',boards[0],moves[:cut]+selected['opposite']['tail'],'Optimal full-chain endpoint with smallest and largest tiles at diagonally opposite corners.')
 report={'depth':depth,'cut':cut,'complete':complete,'layer_counts':counts+[len(layer)],'nonterminal_states':total,'terminal_boards':len(answers),'symmetry_orbits':len(reps),'max_locations':sorted({b.index(131072) for b in answers}),'selected':selected,'variants':[{'board':b,'tail':p} for b,p in reps.values()]}
 (ROOT/f'research/results/tails-{depth}.json').write_text(json.dumps(report,indent=2)+'\n')
 print(json.dumps({k:v for k,v in report.items() if k not in ('variants','selected','layer_counts')},indent=2),flush=True)
if __name__=='__main__':main(int(sys.argv[1]) if len(sys.argv)>1 else 16)
