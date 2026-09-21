#!/usr/bin/env python3
"""Independent raw-state BFS and finite inverse-transition/certification tests.
Does not import the C++ generator, its row tables, or its symmetry tables.
"""
from collections import deque,Counter,defaultdict
from itertools import combinations,product
from pathlib import Path
import json
from inverse import predecessors

def move(b,h,w,d):
    board=list(b);merged=set()
    dr,dc=((0,-1),(0,1),(-1,0),(1,0))[d]
    rows=list(range(h));cols=list(range(w))
    if dr>0:rows.reverse()
    if dc>0:cols.reverse()
    for r in rows:
        for c in cols:
            src=r*w+c;v=board[src]
            if not v:continue
            rr,cc=r,c
            while 0<=rr+dr<h and 0<=cc+dc<w and board[(rr+dr)*w+cc+dc]==0:
                rr+=dr;cc+=dc
            nr,nc=rr+dr,cc+dc
            if 0<=nr<h and 0<=nc<w and board[nr*w+nc]==v and nr*w+nc not in merged:
                board[src]=0;board[nr*w+nc]=2*v;merged.add(nr*w+nc)
            elif rr*w+cc!=src:
                board[src]=0;board[rr*w+cc]=v
    return tuple(board)

def starts(h,w):
    out=set()
    for i,j in combinations(range(h*w),2):
        for x,y in product((2,4),repeat=2):
            b=[0]*(h*w);b[i]=x;b[j]=y;out.add(tuple(b))
    return out

def successors(b,h,w):
    out=set()
    for d in range(4):
        a=move(b,h,w,d)
        if a==b:continue
        for i,v in enumerate(a):
            if v:continue
            for x in (2,4):
                n=list(a);n[i]=x;out.add(tuple(n))
    return out

def raw_bfs(h,w):
    R=starts(h,w);Q=deque(R)
    while Q:
        b=Q.popleft()
        for n in successors(b,h,w):
            if n not in R:R.add(n);Q.append(n)
    return R

def orbit(b,h,w):
    # Matrix flips and transpose, deliberately independent of C++ bit maps.
    A=[list(b[r*w:(r+1)*w]) for r in range(h)]; out=set()
    for tr in range(2 if h==w else 1):
        B=[list(row) for row in zip(*A)] if tr else A
        for v in (False,True):
            for hflip in (False,True):
                rows=B[::-1] if v else B
                out.add(tuple(x for row in rows for x in (row[::-1] if hflip else row)))
    return out

def decode(code,c):
    rs=[(code>>(4*i))&15 for i in range(c)]
    return tuple(2**r if r else 0 for r in rs)

def causal(b,eligible=None):
    n=Counter(v.bit_length()-1 for v in b if v)
    if not n:return False
    if eligible is None:eligible=[i for i,v in enumerate(b) if v in (2,4)]
    e2=any(b[i]==2 for i in eligible);e4=any(b[i]==4 for i in eligible)
    if not (e2 or e4):return False
    f=0 if e2 else 1;units=n[1]+2*n[2]
    for q in range(3,max(n)+1):
        if units<=q-2+f:
            if not n[q]:return False
            f+=1
        units+=(2**(q-1))*n[q]
    return True

def geometric_eligible(b,h,w):
    out=[]
    for i,v in enumerate(b):
        if not v:continue
        a=list(b);a[i]=0
        # Test only positions of occupied cells, not whether values merge.
        for d in range(4):
            lines=([a[r*w:(r+1)*w] for r in range(h)] if d<2 else [[a[r*w+c] for r in range(h)] for c in range(w)])
            if d%2:lines=[line[::-1] for line in lines]
            if all(all(not x for x in line[sum(bool(t) for t in line):]) for line in lines):
                out.append(i);break
    return out

def rank_ok(b,c):
    rs=sorted((v.bit_length()-1 for v in b if v),reverse=True)
    return all(r<=c+2-p for p,r in enumerate(rs,1))

def load_dump(h,w,directory=Path('states')):
    """Validate sorted, unique, canonical layers before expanding their orbits."""
    expanded=set(); canon=set()
    files=sorted(Path(directory).glob(f'{h}x{w}-*.txt'))
    if not files:
        raise ValueError('no state files found')
    for f in files:
        age=int(f.stem.split('-')[-1]);previous=-1
        for line in f.read_text().splitlines():
            code=int(line)
            if not 0 <= code < (1 << (4*h*w)) or code<=previous:
                raise ValueError(f'unsorted, duplicate, or out-of-range state in {f}')
            previous=code
            b=decode(code,h*w)
            if sum(b)!=age:
                raise ValueError(f'wrong mass layer in {f}')
            images=orbit(b,h,w)
            def encode_values(values):
                return sum((v.bit_length()-1 if v else 0) << (4*i)
                           for i,v in enumerate(values))
            if code!=min(map(encode_values,images)):
                raise ValueError(f'noncanonical state in {f}')
            if b in canon:
                raise ValueError(f'duplicate state across layers in {f}')
            expanded.update(images);canon.add(b)
    return expanded,canon

def verify_raw(h,w):
    R=raw_bfs(h,w);expanded,canon=load_dump(h,w)
    if expanded!=R:
        raise ValueError((h,w,len(expanded),len(R)))
    I=starts(h,w)
    for b in R:
        assert rank_ok(b,h*w)
        assert causal(b)
        if b not in I:assert causal(b,geometric_eligible(b,h,w))
    return R,{'labeled':len(R),'orbits':len(canon),'exact_set_match':True,
              'all_states_pass_rank_and_causal_tests':True}

def inverse_and_closure(R):
    allboards=list(product((0,2,4,8,16,32),repeat=4))
    U={b for b in allboards if sum(bool(v) for v in b)>=2 and any(v in (2,4) for v in b)}
    pred=defaultdict(set);succ={}
    for b in U:
        succ[b]=successors(b,2,2)
        for n in succ[b]:pred[n].add(b)
    for b in allboards:assert predecessors(b,2,2)==pred[b]
    I=starts(2,2)
    F={b for b in U if rank_ok(b,4)};history=[len(F)]
    while True:
        G=I|{b for b in F if pred[b]&F}
        assert G<=F
        if G==F:break
        F=G;history.append(len(F))
    assert F==R
    # Counts/hashes alone are not a completeness proof. Check the actual sets.
    assert all(b in I or pred[b]&R for b in R)
    assert all(n in R for b in R for n in successors(b,2,2))
    return {'all_2x2_syntactic_targets_checked':len(allboards),
            'predecessor_relation_exact':True,'rooted_filter_cardinalities':history,
            'fixed_point_equals_raw_reachability':True,
            'soundness_and_successor_closure_checked':True}

if __name__=='__main__':
    r2,s2=verify_raw(2,2)
    r3,s3=verify_raw(2,3)
    results={'2x2':s2,'2x3':s3,'inverse_and_closure':inverse_and_closure(r2)}
    assert len(r2)==662 and len(r3)==85844
    print(json.dumps(results,indent=2))
