#!/usr/bin/env python3
"""Independent exact 2x2 counterexample to the old score equality clause."""
from itertools import combinations, product
from pathlib import Path
import json

def slide(b,d):
    a=list(b);gain=0
    for r in range(2):
        cells=[2*r,2*r+1] if d in 'LR' else [r,r+2]
        if d in 'RD':cells.reverse()
        vs=[b[i] for i in cells if b[i]]
        if len(vs)==2 and vs[0]==vs[1]:vs=[2*vs[0]];gain+=vs[0]
        for j,i in enumerate(cells):a[i]=vs[j] if j<len(vs) else 0
    return tuple(a),gain


def main():
    levels={};info={}
    for cells in combinations(range(4),2):
        for vals in product((2,4),repeat=2):
            b=[0]*4
            for i,v in zip(cells,vals):b[i]=v
            b=tuple(b);f=vals.count(4)
            info[b]=(f,None,[(i//2,i%2,v) for i,v in zip(cells,vals)])
            levels.setdefault(sum(b),set()).add(b)
    for mass in range(4,61,2):
        for b in levels.get(mass,set()):
            f=info[b][0]
            for d in 'URDL':
                a,gain=slide(b,d)
                if a==b:continue
                for i,v in enumerate(a):
                    if v:continue
                    for x in (2,4):
                        q=list(a);q[i]=x;q=tuple(q);nf=f+(x==4)
                        if q not in info or nf<info[q][0]:
                            info[q]=(nf,b,(d,i//2,i%2,x));levels.setdefault(mass+x,set()).add(q)
    def score(b):return sum((v.bit_length()-2)*v for v in b if v)-4*info[b][0]
    best=max(map(score,info));assert best==180
    end=next(b for b in info if score(b)==180 and sorted(b)==[2,8,16,32])
    moves=[];b=end
    while info[b][1] is not None:
        _,parent,move=info[b];moves.append(move);b=parent
    moves.reverse();opening=info[b][2]
    replay=[0]*4;total=0
    for r,c,v in opening:replay[2*r+c]=v
    for d,r,c,v in moves:
        a,gain=slide(tuple(replay),d);assert a!=tuple(replay) and a[2*r+c]==0
        replay=list(a);replay[2*r+c]=v;total+=gain
    assert tuple(replay)==end and total==180 and len(moves)==24
    lines=['# 2x2 board; maximum score 180 with a final 2, not a full chain.']
    lines += ['start %d %d %d'%s for s in opening]
    lines += ['%s %d %d %d'%s for s in moves]
    root=Path(__file__).resolve().parent
    (root/'2x2-score-equality-counterexample.txt').write_text('\n'.join(lines)+'\n')
    report={'raw_reachable_states':len(info),'maximum_score':best,'moves':len(moves),'spawned_fours':info[end][0],'final_board':end,'old_full_chain_only_equality_clause':'false'}
    (root/'score-equality-test.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))

if __name__=='__main__':main()
