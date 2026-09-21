#!/usr/bin/env python3
"""Construct sharp monotone-direction 2048 endpoints, without search.

For a d-dimensional box, use only the negative direction on each axis.
Target at x is 4 * product(2**(n_i-1-x_i)).
Modes: fast (all 4s, minimum moves to target), rich (maximum score and
maximum length among monotone plays), pure (all 2s, half-sized target).
The recursive implementation starts with one source tile. To obtain the
ordinary two-tile opening, its first nonmerging slide/spawn is omitted.
"""
from __future__ import annotations
import argparse
import itertools
import json
from pathlib import Path
from typing import Iterator

Coord=tuple[int,...]
Board=tuple[int,...]

def size(dims:Coord)->int:
    out=1
    for n in dims:out*=n
    return out

def strides(dims:Coord)->Coord:
    result=[];v=1
    for n in reversed(dims):result.append(v);v*=n
    return tuple(reversed(result))

def coordinates(dims:Coord):return itertools.product(*(range(n) for n in dims))

def index(x:Coord,st:Coord)->int:return sum(a*b for a,b in zip(x,st))

def slide_line(b:Board,dims:Coord,axis:int)->tuple[Board,int]:
    st=strides(dims);out=list(b);score=0
    bases=[range(n) if j!=axis else (0,) for j,n in enumerate(dims)]
    for x0 in itertools.product(*bases):
        start=index(x0,st);ii=[start+t*st[axis] for t in range(dims[axis])]
        vals=[b[i] for i in ii if b[i]];v=[];j=0
        while j<len(vals):
            if j+1<len(vals) and vals[j]==vals[j+1]:
                v.append(2*vals[j]);score+=2*vals[j];j+=2
            else:v.append(vals[j]);j+=1
        for j,i in enumerate(ii):out[i]=v[j] if j<len(v) else 0
    return tuple(out),score

def slide_cell(b:Board,dims:Coord,axis:int)->tuple[Board,int]:
    # Deliberately different: move each cell, tracking merged destinations.
    st=strides(dims);out=list(b);merged=set();score=0
    for x in coordinates(dims):
        i=index(x,st);v=out[i]
        if not v:continue
        pos=x[axis];j=i
        while pos>0 and out[j-st[axis]]==0:j-=st[axis];pos-=1
        if pos>0 and out[j-st[axis]]==v and j-st[axis] not in merged:
            dest=j-st[axis];out[i]=0;out[dest]=2*v;score+=2*v;merged.add(dest)
        elif i!=j:out[i]=0;out[j]=v
    return tuple(out),score

def pack(values:list[int])->list[int]:
    nz=[x for x in values if x];out=[];j=0
    while j<len(nz):
        if j+1<len(nz) and nz[j]==nz[j+1]:out.append(nz[j]*2);j+=2
        else:out.append(nz[j]);j+=1
    return out+[0]*(len(values)-len(out))

def scalar_spawns(n:int,mode:str)->Iterator[int]:
    if n<2:raise ValueError('scalar counters require n >= 2')
    seed=4 if mode=='fast' else 2
    b=[0]*(n-1)+[seed]
    while True:
        a=pack(b)
        if a==b:break
        nz=[v for v in a if v]
        critical=(len(nz)==n-1 and len(set(nz))==len(nz) and min(nz)>=4)
        spawn=4 if mode=='fast' or (mode=='rich' and critical) else 2
        assert a[-1]==0
        a[-1]=spawn;b=a
        yield spawn
    expected=[(2 if mode=='pure' else 4)*2**j for j in range(n-1,-1,-1)]
    if b!=expected:raise AssertionError((n,mode,b,expected))

def planned_steps(dims:Coord,mode:str)->Iterator[tuple[int,int]]:
    active=tuple(i for i,n in enumerate(dims) if n>1)
    if not active:raise ValueError('board must have at least two cells')
    def fill(axes:tuple[int,...],m:str):
        a=axes[0];inner=axes[1:]
        # Rich counters start with a virtual 2, hence a pure initial slice.
        if inner:yield from fill(inner,'fast' if m=='fast' else 'pure')
        for virtual_spawn in scalar_spawns(dims[a],m):
            if not inner:yield a,virtual_spawn
            elif m=='fast':
                yield a,4;yield from fill(inner,'fast')
            else:
                yield a,2
                yield from fill(inner,'pure' if virtual_spawn==2 else 'rich')
    yield from fill(active,mode)

def target(dims:Coord,mode:str='rich')->Board:
    base=2 if mode=='pure' else 4
    return tuple(base*2**sum(n-1-y for n,y in zip(dims,x)) for x in coordinates(dims))

def formulas(dims:Coord)->dict:
    c=size(dims);k=1
    for n in dims:k*=2**n-1
    d=target(dims)
    phi=sum((v.bit_length()-2)*v for v in d)
    return {'cells':c,'K':k,'maximum_tile':max(d),'maximum_mass':4*k,
            'maximum_score':phi-4*c,'longest_game':2*k-c-2,
            'minimum_moves_to_full_target':k-2,'optimal_rich_fours':c}

def make(dims:Coord,mode:str,path:Path|None=None,max_moves:int=2000000)->dict:
    if any(n<1 for n in dims) or size(dims)<2:raise ValueError('bad dimensions')
    if mode not in ('fast','rich','pure'):raise ValueError('unknown mode')
    f=formulas(dims)
    estimate=f['longest_game'] if mode=='rich' else f['K']-2
    if estimate>max_moves:raise ValueError(f'construction has {estimate:,} moves; exceeds max_moves={max_moves:,}')
    source=size(dims)-1;seed=4 if mode=='fast' else 2
    b=[0]*size(dims);b[source]=seed;b=tuple(b)
    planned=list(planned_steps(dims,mode))
    first_axis,first_spawn=planned.pop(0)
    opening,gain=slide_line(b,dims,first_axis)
    assert gain==0 and first_spawn==seed and not opening[source]
    opening=list(opening);opening[source]=first_spawn;b=tuple(opening)
    score=0;q=2 if seed==4 else 0;twos=2 if seed==2 else 0
    reached={v:0 for v in b if v};directions={str(a):0 for a in range(len(dims))}
    records=[]
    for step,(a,s) in enumerate(planned,1):
        after,g=slide_line(b,dims,a)
        assert (after,g)==slide_cell(b,dims,a) and after!=b and not after[source]
        nb=list(after);nb[source]=s;b=tuple(nb);score+=g;q+=s==4;twos+=s==2
        directions[str(a)]+=1;records.append((a,s))
        for v in b:
            if v:reached.setdefault(v,step)
    assert b==target(dims,mode)
    moves=len(planned);phi=sum((v.bit_length()-2)*v for v in b)
    assert score==phi-4*q and moves==twos+q-2
    f=formulas(dims)
    if mode=='rich':assert (q,score,moves)==(f['cells'],f['maximum_score'],f['longest_game'])
    if mode=='fast':assert moves==f['minimum_moves_to_full_target']
    if mode=='pure':assert q==0
    if path:
        path.parent.mkdir(parents=True,exist_ok=True)
        st=strides(dims)
        if len(dims)==2:
            h,w=dims
            lines=['# Search-free monotone 2048 certificate; zero-based coordinates.',
                   f'# Mode: {mode}. Target is the geometric matrix, NOT the unrestricted full chain.',
                   f'SIZE {h} {w}']
            lines += [f'START {i//w} {i%w} {v}' for i,v in enumerate(opening) if v]
            lines += [f'{"U" if a==0 else "L"} {h-1} {w-1} {s}' for a,s in records]
        else:
            lines=['# Monotone n-dimensional certificate. MOVE a is toward coordinate 0 on axis a.',
                   'DIMS '+' '.join(map(str,dims))]
            lines += ['START '+' '.join(map(str,x))+f' {opening[index(x,st)]}' for x in coordinates(dims) if opening[index(x,st)]]
            far=' '.join(str(n-1) for n in dims)
            lines += [f'MOVE {a} {far} {s}' for a,s in records]
        path.write_text('\n'.join(lines)+'\n')
    return {'shape':list(dims),'mode':mode,'moves':moves,'score':score,
            'spawned_4s':q,'spawned_2s':twos,'maximum_tile':max(b),
            'first_maximum_at':reached[max(b)],'final_mass':sum(b),
            'directions_by_axis':directions,'final_board':list(b),
            'both_slide_algorithms_agree':True,'status':'PASS'}

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('shape',help='e.g. 4x4 or 2x2x2')
    parser.add_argument('--mode',choices=['fast','rich','pure'],default='rich')
    parser.add_argument('--out',type=Path)
    parser.add_argument('--max-moves',type=int,default=2000000)
    args=parser.parse_args()
    try:print(json.dumps(make(tuple(map(int,args.shape.split('x'))),args.mode,args.out,args.max_moves),indent=2))
    except (ValueError,OSError) as e:parser.exit(1,str(e)+'\n')
