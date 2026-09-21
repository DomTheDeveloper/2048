"""Exact factorization of the probability of each certified target-reaching prefix.
Decimal logarithms locate a power-of-ten bound; an integer comparison certifies it.
"""
from common import *
from collections import Counter
from decimal import Decimal,localcontext
import json,math

def factor(n):
 out=Counter();p=2
 while p*p<=n:
  while n%p==0:out[p]+=1;n//=p
  p+=1
 if n>1:out[n]+=1
 return out

def probability(name):
 moves,boards=load(name);hit=next(i for i,b in enumerate(boards) if 131072 in b)
 # An unordered prescribed two-cell opening: 2/(16*15), independent values.
 ex=Counter({2:1});ex.subtract(factor(16*15))
 for v in boards[0]:
  if v:
   ex.subtract(factor(10))
   if v==2:ex.update(factor(9))
 empty=Counter();counts=Counter()
 for i,(d,r,c,v) in enumerate(moves[:hit]):
  after,_=slide(boards[i],d);e=after.count(0);assert e>0
  empty[e]+=1;counts[v]+=1;ex.subtract(factor(10*e))
  if v==2:ex.update(factor(9))
 with localcontext() as ctx:
  ctx.prec=60
  lp=sum(Decimal(e)*Decimal(p).log10() for p,e in ex.items())
  K=math.ceil(-lp)
 numerator=math.prod(p**e for p,e in ex.items() if e>0)
 denominator=math.prod(p**(-e) for p,e in ex.items() if e<0)
 assert numerator*10**K>=denominator
 assert numerator*10**(K-1)<denominator
 return {'witness':name,'first_hit':hit,'log10_probability':str(lp),'certified_lower_bound':f'10^(-{K})','integer_comparison_passed':True,'prime_exponents':dict(sorted(ex.items())),'postslide_empty_counts':dict(sorted(empty.items())),'move_spawn_counts':dict(counts)}
if __name__=='__main__':
 data=[probability(n) for n in ('131072.txt','131072-two-twos.txt','full-chain.txt','max-score.txt','131072-one-four.txt','131072-minimum-fold-fours.txt','131072-fold-4.txt')]
 (ROOT/'research/results/witness-probabilities.json').write_text(json.dumps(data,indent=2)+'\n')
 for r in data:print(r['witness'],r['first_hit'],r['log10_probability'],r['certified_lower_bound'])
