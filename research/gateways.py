"""Check gateway deductions, the exact mass-only recurrence, and line constructions.
The general mathematical proofs are in DEDUCTIONS.md; tests do not replace them.
"""
from common import *
from fractions import Fraction
from decimal import Decimal,localcontext
import json,math

def gates(c):return [(1<<(c+2))-(1<<(j+2)) for j in range(c-1,-1,-1)]

def line_merge(b):
 vs=[v for v in b if v];out=[];j=0;score=0
 while j<len(vs):
  if j+1<len(vs) and vs[j]==vs[j+1]:out.append(2*vs[j]);score+=2*vs[j];j+=2
  else:out.append(vs[j]);j+=1
 return out+[0]*(len(b)-len(out)),score

def line_test(c,mode):
 b=[0]*c;b[0]=b[-1]=4 if mode=='fours' else 2;mass=sum(b);score=0;n4=2 if mode=='fours' else 0;n2=2-n4;t=0;first=None;forced={x-4 for x in gates(c)};target=[1<<k for k in range(c+1,1,-1)]
 while b!=target:
  a,gain=line_merge(b)
  if a==b or a[-1]:raise AssertionError((c,mode,t,b,a))
  v=4 if mode=='fours' or mass in forced else 2
  a[-1]=v;b=a;t+=1;mass+=v;score+=gain;n4+=v==4;n2+=v==2
  vals=[v for v in b if v];assert vals==sorted(vals,reverse=True)
  if first is None and (1<<(c+1)) in b:first=t
  assert t<=(1<<(c+1))-4-c
 expected=(c-1)*(1<<(c+2))+4-4*c
 if mode=='twos':assert (score,t,n4)==(expected,(1<<(c+1))-4-c,c)
 else:assert t==(1<<c)-3 and first==(1<<(c-1))+c-3
 return dict(cells=c,policy=mode,rounds=t,first_largest=first,score=score,twos=n2,fours=n4)

def main():
 reports={}
 for name in ('131072.txt','full-chain.txt','max-score.txt'):
  moves,boards=load(name);by_mass={sum(b):(i,b) for i,b in enumerate(boards)};out=[]
  for j,age in zip(range(15,-1,-1),gates(16)):
   if age>sum(boards[-1]):continue
   i,b=by_mass[age];want=sorted([1<<k for k in range(2,18) if k!=j+2]+[4]);assert sorted(b)==want and moves[i-1][3]==4
   out.append({'mass':age,'round':i,'missing_tile':1<<(j+2),'forced_spawn':4})
  reports[name]=out
 (ROOT/'research/results/gateways.json').write_text(json.dumps(reports,indent=2)+'\n')
 # Exact rational recurrence versus closed form, many sizes and probabilities.
 for p in (Fraction(1,10),Fraction(1,2),Fraction(1,3),Fraction(9,10)):
  u=[Fraction(1),1-p]
  for n in range(2,256):u.append((1-p)*u[-1]+p*u[-2])
  for n,x in enumerate(u):assert x==(1-(-p)**(n+1))/(1+p)
  for c in range(3,8):
   target=(1<<(c+1))-2;dead={(x-2)//2 for x in gates(c)}
   hits=[Fraction(0)]*(target+1);hits[0]=1
   for n in range(target):
    if n in dead:continue
    if n+1<=target:hits[n+1]+=(1-p)*hits[n]
    if n+2<=target:hits[n+2]+=p*hits[n]
   closed=Fraction(1)
   for k in range(1,c+1):closed*=p/(1+p)*(1+p**((1<<k)-1))
   assert hits[target]==closed
 with localcontext() as ctx:
  ctx.prec=70;p=Decimal('0.1');q=1-p;bound=Decimal(1)
  for k in range(1,17):bound*=p/(1+p)*(1+p**((1<<k)-1))
  score_bound=q**131038*p**15
  numbers={'full_chain_probability_upper':str(bound),'score_ceiling_probability_upper':str(score_bound),'score_ceiling_log10':str(score_bound.log10()),'largest_tile_probability_upper_exact':'(1 + 10^(-65535))/11','largest_tile_probability_upper_safe_decimal':'0.090909091','probability_model':'independent standard 90/10 values; arbitrary adaptive directions and uniform empty-cell placement'}
 (ROOT/'research/results/probability-bounds.json').write_text(json.dumps(numbers,indent=2)+'\n')
 tests=[]
 for c in range(2,17):
  for mode in ('fours','twos'):
   result=line_test(c,mode);tests.append(result);print(result,flush=True)
 (ROOT/'research/results/line-constructions.json').write_text(json.dumps(tests,indent=2)+'\n')
 print('Gateway checks, rational recurrence checks, and line constructions all pass.',flush=True)
 print(json.dumps(numbers,indent=2),flush=True)
if __name__=='__main__':main()
