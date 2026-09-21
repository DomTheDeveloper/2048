"""Exhaustive shortest-cascade search from the witnessed primed arrangement."""
from common import *
import json,sys

def main(values=(2,4),cap=1000000,zero_junk=False,one_four=False):
 moves,boards=load('max-score.txt' if one_four else '131072.txt');cut=65533 if one_four else 32766;layer={boards[cut]:(0,[])};counts=[];complete=True
 for t in range(15):
  expected=1<<(t+3);nxt={};counts.append(len(layer));print('depth',t,'states',len(layer),flush=True)
  for b,(fours,path) in layer.items():
   for d in DIRECTIONS:
    a,gain=slide(b,d)
    if zero_junk and gain!=expected:continue
    if a.count(expected)!=b.count(expected)+1:continue
    for k,v in enumerate(a):
     if not v:
      for nv in values:
       z=a[:k]+(nv,)+a[k+1:];nf=fours+(nv==4)
       if z not in nxt or nf<nxt[z][0]:nxt[z]=(nf,path+[(d,k//4,k%4,nv)])
  layer=nxt
  if len(layer)>cap:complete=False;break
  if not layer:break
 results=[(f,p,b) for b,(f,p) in layer.items() if 131072 in b] if complete else []
 report={'spawn_values':values,'complete':complete,'layer_counts':counts,'final_states':len(results)}
 if results:
  f,p,b=min(results,key=lambda x:(x[0],-sum((v.bit_length()-2)*v for v in x[2] if v)));report.update(minimum_fold_fours=f,tail=p,final_board=b,final_mass=sum(b))
  write_witness(ROOT/('witness/131072-one-four.txt' if one_four else ('witness/131072-no-junk-merges.txt' if zero_junk else ('witness/131072-minimum-fold-fours.txt' if values==(2,) else 'witness/131072-fold-'+''.join(map(str,values))+'.txt'))),boards[0],moves[:cut]+p,'Shortest tile witness with the fewest 4s in the final 15-round cascade from this primed arrangement.')
 (ROOT/f'research/results/fold-{"one-four" if one_four else ("zero" if zero_junk else "".join(map(str,values)))}.json').write_text(json.dumps(report,indent=2)+'\n')
 print(json.dumps(report,indent=2),flush=True)
if __name__=='__main__':main((2,) if len(sys.argv)>1 and sys.argv[1]=='twos' else (2,4))
