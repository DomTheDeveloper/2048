#!/usr/bin/env python3
"""Exact superset counts, not reachable-state enumeration. Standard library only.
New implementation: low ranks first, then a memoized rank-assignment recurrence.
Counts labeled boards and D4 orbits; optional light-mass latency inequalities.
"""
from functools import lru_cache
from itertools import product
from math import comb
from collections import Counter
import json

C = 16

def permutations():
    return [tuple(4*rr+cc for r in range(4) for c in range(4)
                  for rr,cc in [f(r,c)]) for f in
            (lambda r,c:(r,c),lambda r,c:(c,3-r),lambda r,c:(3-r,3-c),
             lambda r,c:(3-c,r),lambda r,c:(r,3-c),lambda r,c:(3-r,c),
             lambda r,c:(c,r),lambda r,c:(3-c,3-r))]

PERMS=permutations()

def cycles(p):
    todo=set(range(16)); out=[]
    while todo:
        x=min(todo); cyc=[]
        while x in todo:
            todo.remove(x);cyc.append(x);x=p[x]
        out.append(tuple(cyc))
    return out

def compact_mask(mask,d):
    for line in range(4):
        cells=([4*line+j for j in range(4)] if d<2 else [4*j+line for j in range(4)])
        if d%2: cells.reverse()
        bits=sum(((mask>>x)&1)<<j for j,x in enumerate(cells))
        if bits & (bits+1): return False
    return True

@lru_cache(None)
def eligible(mask):
    return sum(1<<x for x in range(16) if mask>>x&1 and
               any(compact_mask(mask^(1<<x),d) for d in range(4)))

@lru_cache(None)
def high_counts(length_counts,rank,mass,latency):
    """Uncolored remaining cycles, lengths 1,2,4, assigned ranks rank..17.
    'mass' is mass of already assigned lower ranks, saturated at 30.
    """
    cells=sum(a*b for a,b in zip((1,2,4),length_counts))
    if not cells: return 1
    if rank>17 or cells>18-rank: return 0
    if latency and mass<2*(rank-2): return 0
    ans=0
    for take in product(*(range(n+1) for n in length_counts)):
        n=sum(a*b for a,b in zip((1,2,4),take))
        ways=1
        for a,b in zip(length_counts,take): ways*=comb(a,b)
        rem=tuple(a-b for a,b in zip(length_counts,take))
        ans+=ways*high_counts(rem,rank+1,min(30,mass+(1<<rank)*n),latency)
    return ans

@lru_cache(None)
def fixed_assignments(types,latency):
    """types = tuple of (cycle length, eligible flag, multiplicity).
    A cycle's cells have one common value in a board fixed by the symmetry.
    """
    # For each type, choose cycles carrying 2,4, or a later high value.
    dp={( (0,0,0),0,False ):1}
    for length,flag,num in types:
        nxt=Counter(); idx={1:0,2:1,4:2}[length]
        for twos in range(num+1):
            for fours in range(num-twos+1):
                high=num-twos-fours
                ways=comb(num,twos)*comb(num-twos,fours)
                add=length*(2*twos+4*fours)
                for (hist,mass,has),v in dp.items():
                    nh=list(hist);nh[idx]+=high
                    nxt[(tuple(nh),min(30,mass+add),has or (flag and twos+fours>0))]+=ways*v
        dp=nxt
    return sum(v*high_counts(hist,3,mass,latency)
               for (hist,mass,has),v in dp.items() if has)

@lru_cache(None)
def high_causal(counts,rank,units,fours):
    cells=sum(a*b for a,b in zip((1,2,4),counts))
    if not cells:return 1
    if rank>17 or cells>18-rank:return 0
    j=rank-2
    forced_four=units<=j+fours
    ans=0
    for take in product(*(range(n+1) for n in counts)):
        n=sum(a*b for a,b in zip((1,2,4),take))
        if forced_four and n==0:continue
        ways=1
        for a,b in zip(counts,take):ways*=comb(a,b)
        rem=tuple(a-b for a,b in zip(counts,take))
        ans+=ways*high_causal(rem,rank+1,min(32,units+(1<<(rank-1))*n),fours+forced_four)
    return ans

@lru_cache(None)
def fixed_causal(types):
    dp={((0,0,0),0,False,False):1}
    for length,flag,num in types:
        nxt=Counter();idx={1:0,2:1,4:2}[length]
        for twos in range(num+1):
            for fours in range(num-twos+1):
                high=num-twos-fours
                ways=comb(num,twos)*comb(num-twos,fours)
                add=length*(twos+2*fours)
                for (hist,units,e2,e4),v in dp.items():
                    nh=list(hist);nh[idx]+=high
                    nxt[(tuple(nh),min(32,units+add),e2 or (flag and twos>0),e4 or (flag and fours>0))]+=ways*v
        dp=nxt
    return sum(v*high_causal(hist,3,units,0 if e2 else 1)
               for (hist,units,e2,e4),v in dp.items() if e2 or e4)

def count_all():
    result={}
    for geometry in (False,True):
        # Histogram of fixed occupancy masks by occupied-cycle type.
        histograms=[]
        for perm in PERMS:
            cs=cycles(perm); hist=Counter()
            for bits in range(1<<len(cs)):
                occ=[cy for j,cy in enumerate(cs) if bits>>j&1]
                if sum(map(len,occ))<2: continue
                mask=sum(1<<x for cy in occ for x in cy)
                e=eligible(mask) if geometry else mask
                if not e: continue
                counter=Counter()
                for cy in occ:
                    flags=[bool(e>>x&1) for x in cy]
                    assert all(flags) or not any(flags)
                    counter[(len(cy),flags[0])]+=1
                key=tuple(sorted((l,f,n) for (l,f),n in counter.items()))
                hist[key]+=1
            histograms.append(hist)
        for latency in (False,True):
            fixed=[sum(m*fixed_assignments(key,latency) for key,m in hist.items())
                   for hist in histograms]
            assert sum(fixed)%8==0
            name=('geometry' if geometry else 'rank')+('_latency' if latency else '')
            result[name]={'fixed':fixed,'labeled':fixed[0],'orbits':sum(fixed)//8}
        fixed=[sum(m*fixed_causal(key) for key,m in hist.items()) for hist in histograms]
        assert sum(fixed)%8==0
        name=('geometry' if geometry else 'rank')+'_causal'
        result[name]={'fixed':fixed,'labeled':fixed[0],'orbits':sum(fixed)//8}
    # Initial positions are an exception to last-move conditions, NOT
    # an exception to the light-mass inequalities (max rank is <=2).
    extras=[]
    for i in range(16):
        for j in range(i+1,16):
            if eligible((1<<i)|(1<<j)):continue
            for a,b in product((1,2),repeat=2):
                board=[0]*16;board[i]=a;board[j]=b;extras.append(board)
    ef=[sum(all(b[i]==b[p[i]] for i in range(16)) for b in extras) for p in PERMS]
    result['initial_extras']={'fixed':ef,'labeled':ef[0],'orbits':sum(ef)//8}
    for key in ('geometry','geometry_latency','geometry_causal'):
        result[key]['including_initial_labeled']=result[key]['labeled']+ef[0]
        result[key]['including_initial_orbits']=result[key]['orbits']+sum(ef)//8
    result['eligible_occupancy_masks']=sum(1 for m in range(1<<16) if m.bit_count()>=2 and eligible(m))
    # Historical assertions are validation targets, not inputs to any recurrence.
    assert result['rank']['labeled']==42680958038114579072
    assert result['rank']['orbits']==5335119967984859212
    assert result['geometry']['labeled']==23408633018322063456
    assert result['geometry']['orbits']==2926079231642763759
    assert ef==[24,0,4,0,4,4,6,6]
    return result

if __name__=='__main__':
    print(json.dumps(count_all(),indent=2))
