#!/usr/bin/env python3
"""Standalone replay of a monotone DIMS/MOVE certificate.
This verifier imports no constructor or other game engine.
Only negative-axis slides are accepted. Use verify_2d.py for SIZE 2-D files.
"""
from __future__ import annotations
import argparse,json
from pathlib import Path

def verify(path:Path)->dict:
    rows=[line.split() for line in path.read_text().splitlines()
          if line.strip() and not line.lstrip().startswith('#')]
    if len(rows)<3 or rows[0][0]!='DIMS':raise ValueError('expected DIMS and two START records')
    dims=tuple(map(int,rows[0][1:]));d=len(dims)
    if not d or any(n<1 for n in dims):raise ValueError('invalid dimensions')
    stride=[1]*d
    for j in range(d-2,-1,-1):stride[j]=stride[j+1]*dims[j+1]
    count=dims[0]*stride[0]
    if count<2:raise ValueError('at least two cells required')
    board=[0]*count;q=twos=0
    def location(xs):
        if len(xs)!=d or any(not 0<=x<n for x,n in zip(xs,dims)):raise ValueError('invalid coordinates')
        return sum(x*s for x,s in zip(xs,stride))
    for row in rows[1:3]:
        if len(row)!=d+2 or row[0]!='START':raise ValueError('invalid opening')
        coords=tuple(map(int,row[1:-1]));v=int(row[-1]);i=location(coords)
        if v not in (2,4) or board[i]:raise ValueError('invalid opening tile')
        board[i]=v;q+=v==4;twos+=v==2
    score=0
    for t,row in enumerate(rows[3:],1):
        if len(row)!=d+3 or row[0]!='MOVE':raise ValueError(f'malformed move {t}')
        axis=int(row[1]);coord=tuple(map(int,row[2:-1]));v=int(row[-1]);spawn=location(coord)
        if not 0<=axis<d or v not in (2,4):raise ValueError(f'invalid move {t}')
        old=board[:];used=set();s=stride[axis]
        for i in range(count):
            value=board[i]
            if not value:continue
            x=(i//s)%dims[axis];j=i
            while x>0 and board[j-s]==0:j-=s;x-=1
            if x>0 and board[j-s]==value and j-s not in used:
                board[i]=0;board[j-s]=2*value;score+=2*value;used.add(j-s)
            elif j!=i:board[i]=0;board[j]=value
        if board==old:raise ValueError(f'no-op slide {t}')
        if board[spawn]:raise ValueError(f'occupied spawn {t}')
        if sum(board)!=sum(old):raise ValueError(f'mass changed on slide {t}')
        board[spawn]=v;q+=v==4;twos+=v==2
    moves=len(rows)-3
    phi=sum((v.bit_length()-2)*v for v in board if v)
    if score!=phi-4*q or moves!=q+twos-2 or sum(board)!=4*q+2*twos:
        raise ValueError('ledger disagreement')
    return {'file':path.name,'shape':dims,'moves':moves,'score':score,
            'spawned_4s':q,'maximum_tile':max(board),'final_mass':sum(board),'status':'VALID'}

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('certificate',type=Path);a=p.parse_args()
    try:print(json.dumps(verify(a.certificate),indent=2))
    except (OSError,ValueError,IndexError) as e:p.exit(1,f'INVALID: {e}\n')
