#!/usr/bin/env python3
"""Exhaust all legal monotone-direction histories on small boxes.
No tile cutoff, source restriction, or heuristic pruning is imposed.
All ordinary two-tile openings and all legal spawn cells/values are used.
"""
from __future__ import annotations
import heapq,itertools,json,time
from construct import slide_line,slide_cell,size,formulas,target

def enumerate_box(dims,limit=500000):
    start=time.monotonic();c=size(dims);qmin={};queue=[]
    for i,j in itertools.combinations(range(c),2):
        for x,y in itertools.product((2,4),repeat=2):
            b=[0]*c;b[i]=x;b[j]=y;b=tuple(b)
            if b not in qmin:heapq.heappush(queue,(sum(b),b))
            qmin[b]=int(x==4)+int(y==4)
    maximum=best_score=best_length=best_mass=0;processed=0;arcs=0
    while queue:
        mass,b=heapq.heappop(queue);processed+=1
        q=qmin[b];maximum=max(maximum,max(b));best_mass=max(best_mass,mass)
        phi=sum((v.bit_length()-2)*v for v in b if v)
        best_score=max(best_score,phi-4*q);best_length=max(best_length,mass//2-q-2)
        for axis,n in enumerate(dims):
            if n==1:continue
            a,g=slide_line(b,dims,axis)
            assert (a,g)==slide_cell(b,dims,axis)
            if a==b:continue
            for i,v in enumerate(a):
                if v:continue
                for s in (2,4):
                    child=list(a);child[i]=s;child=tuple(child);arcs+=1
                    if child not in qmin:
                        heapq.heappush(queue,(mass+s,child));qmin[child]=q+(s==4)
                    elif q+(s==4)<qmin[child]:qmin[child]=q+(s==4)
        if len(qmin)>limit:
            return {'shape':dims,'status':'UNKNOWN: state budget exceeded','states_seen':len(qmin)}
    f=formulas(dims)
    assert (maximum,best_score,best_length,best_mass)==(f['maximum_tile'],f['maximum_score'],f['longest_game'],f['maximum_mass'])
    assert qmin[target(dims)]==c
    return {'shape':dims,'raw_reachable_states':len(qmin),'processed_states':processed,
            'legal_slide_spawn_arcs':arcs,'maximum_tile':maximum,'maximum_score':best_score,
            'longest_game':best_length,'maximum_mass':best_mass,'minimum_fours_to_target':qmin[target(dims)],
            'seconds':round(time.monotonic()-start,3),'status':'PASS: exhaustive'}

if __name__=='__main__':
    print(json.dumps([enumerate_box(d) for d in [(1,4),(2,2),(2,3),(2,2,2)]],indent=2))
