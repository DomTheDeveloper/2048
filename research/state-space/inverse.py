#!/usr/bin/env python3
"""Exact line and board inverse transitions. Values, not nibble encodings.
The inverse construction does not call the forward merger to choose candidates.
"""
from itertools import product, combinations
from functools import lru_cache
from collections import Counter
import json

def forward_line(row):
    a=[v for v in row if v]; out=[]; i=0
    while i<len(a):
        if i+1<len(a) and a[i]==a[i+1]:out.append(2*a[i]);i+=2
        else:out.append(a[i]);i+=1
    return tuple(out+[0]*(len(row)-len(out)))

def inverse_line(row):
    if not row or any(type(v) is not int or v < 0 or v == 1 or v & (v-1) for v in row):
        raise ValueError("a line must contain zero or power-of-two tiles >=2")
    return _inverse_line(tuple(row))

@lru_cache(None)
def _inverse_line(row):
    n=len(row); y=tuple(v for v in row if v)
    if row!=y+(0,)*(n-len(y)):return ()
    answer=[]
    for split in product((0,1),repeat=len(y)):
        if any(s and v<4 for v,s in zip(y,split)):continue
        if len(y)+sum(split)>n:continue
        # A singleton cannot greedily merge into the next block.
        if any(not split[i] and y[i]==y[i+1]//(2**split[i+1]) for i in range(len(y)-1)):continue
        a=[]
        for v,s in zip(y,split):a.extend((v//2,v//2) if s else (v,))
        for where in combinations(range(n),len(a)):
            inp=[0]*n
            for x,v in zip(where,a):inp[x]=v
            answer.append(tuple(inp))
    assert len(answer)==len(set(answer))
    return tuple(answer)

def direction_lines(h,w):
    out=[]
    for d in range(4):
        ls=[]
        for l in range(h if d<2 else w):
            row=[l*w+j for j in range(w)] if d<2 else [j*w+l for j in range(h)]
            if d%2:row.reverse()
            ls.append(row)
        out.append(ls)
    return out

def forward_board(b,h,w,d):
    out=list(b)
    for line in direction_lines(h,w)[d]:
        for x,v in zip(line,forward_line(tuple(b[x] for x in line))):out[x]=v
    return tuple(out)

def initial(b):return sum(v!=0 for v in b)==2 and all(v in (0,2,4) for v in b)

def predecessors(b,h,w):
    if type(h) is not int or type(w) is not int or h < 1 or w < 1 or len(b) != h*w:
        raise ValueError("invalid board dimensions")
    if any(type(v) is not int or v < 0 or v == 1 or v & (v-1) for v in b):
        raise ValueError("invalid tile value")
    out=set()
    for x,v in enumerate(b):
        if v not in (2,4):continue
        after=list(b);after[x]=0;after=tuple(after)
        for ls in direction_lines(h,w):
            choices=[inverse_line(tuple(after[i] for i in line)) for line in ls]
            if not all(choices):continue
            for rows in product(*choices):
                p=[0]*len(b)
                for line,row in zip(ls,rows):
                    for i,val in zip(line,row):p[i]=val
                p=tuple(p)
                # Changed slide and ordinary post-spawn predecessor requirements.
                if p==after or sum(bool(z) for z in p)<2 or not any(z in (2,4) for z in p):continue
                out.add(p)
    return out

def exhaustive_line_check():
    alphabet=(0,)+tuple(2**r for r in range(1,18))
    counts=Counter()
    for row in product(alphabet,repeat=4):counts[forward_line(row)]+=1
    tested=0;images=0;nonempty=0
    for row in product(alphabet,repeat=4):
        ps=inverse_line(row)
        assert len(ps)==counts[row],(row,len(ps),counts[row])
        assert all(forward_line(p)==row for p in ps)
        tested+=1;images+=bool(ps);nonempty+=bool(ps) and any(row)
    # Include synthetic rank-18 outputs without mistaking them for reachable boards.
    overflow=0
    for row,n in counts.items():
        if max(row)>131072:
            assert sum(max(p)<=131072 for p in inverse_line(row))==n
            overflow+=1
    return {'input_rows':18**4,'candidate_rows_through_rank17':tested,
            'image_rows_through_rank17':images,'nonempty_image_rows_through_rank17':nonempty,
            'additional_synthetic_rank18_outputs':overflow}

if __name__=='__main__':
    stats=exhaustive_line_check()
    example=(2,4,8,8, 4,4,8,16, 16,32,64,64, 16,32,128,256)
    ps=predecessors(example,4,4)
    assert not ps
    stats['no_predecessor_example']=example
    stats['example_predecessors']=len(ps)
    print(json.dumps(stats,indent=2))
