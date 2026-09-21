#!/usr/bin/env python3
"""Independent finite checks for the proved all-rectangle fold.
Uses the two independently organized slide implementations from verify_2d.py.
"""
from __future__ import annotations
import json,random
from verify_2d import line_slide,cell_slide

def primed(h,w):
    if h<2 or w<1:raise ValueError('requires h >= 2, w >= 1')
    b=[0]*(h*w)
    for j in range(w-1):
        for r in range(h):b[r*w+j]=1 << (h*(w-1-j)+r+1)
    for r in range(h):b[r*w+w-1]=1 << (2 if r<2 else r+1)
    return tuple(b)

def word(h,w):return ('U'*(h-1)+'L')*(w-1)+'U'*(h-1)

def run_exhaustive(h,w):
    initial=primed(h,w)
    assert sum(initial)==1 << (h*w+1)
    states={initial};counts=[1]
    for d in word(h,w):
        new=set()
        for b in states:
            a,g=line_slide(b,h,w,d)
            assert (a,g)==cell_slide(b,h,w,d)
            assert a!=b
            for i,v in enumerate(a):
                if not v:
                    for spawn in (2,4):
                        nxt=list(a);nxt[i]=spawn;new.add(tuple(nxt))
        states=new;counts.append(len(states))
    assert all(max(b)==1<<(h*w+1) for b in states)
    return {'shape':[h,w],'word':word(h,w),'distinct_boards_per_step':counts,'status':'PASS'}

def run_random(h,w,seed,all_four=False):
    b=primed(h,w);rng=random.Random(seed)
    for d in word(h,w):
        a,g=line_slide(b,h,w,d)
        assert (a,g)==cell_slide(b,h,w,d) and a!=b
        empty=[i for i,v in enumerate(a) if not v]
        b=list(a);b[rng.choice(empty)]=4 if all_four else rng.choice((2,4));b=tuple(b)
    assert max(b)==1 << (h*w+1)

if __name__=='__main__':
    out={'exhaustive':[run_exhaustive(h,w) for h,w in [(2,2),(2,3),(3,1),(3,2),(4,2),(3,3),(5,2)]], 'random_runs':0}
    for h,w in [(2,20),(3,10),(4,4),(4,12),(5,5),(10,10),(2,100),(20,20)]:
        for seed in range(20):
            run_random(h,w,seed,seed%3==0);out['random_runs']+=1
    out['status']='PASS';print(json.dumps(out,indent=2))
