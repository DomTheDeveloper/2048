#!/usr/bin/env python3
"""A fully replayed counterexample to the paper's score equality clause.
The score ceiling itself is not contradicted.
"""
from verify_enumeration import raw_bfs,starts,move
import json

def phi(b):return sum((v.bit_length()-2)*v for v in b if v)
R=raw_bfs(2,2);cost={b:sum(v==4 for v in b) for b in starts(2,2)};parents={}
for b in sorted(R,key=lambda b:(sum(b),b)):
    assert b in cost
    for d in range(4):
        a=move(b,2,2,d)
        if a==b:continue
        for i,z in enumerate(a):
            if z:continue
            for v in (2,4):
                n=list(a);n[i]=v;n=tuple(n);k=cost[b]+(v==4)
                if n not in cost or k<cost[n]:
                    cost[n]=k;parents[n]=(b,d,i,v)
max_score=max(phi(b)-4*cost[b] for b in R)
end=min(b for b in R if sorted(b)==[2,8,16,32] and phi(b)-4*cost[b]==max_score)
trace=[];b=end
while b in parents:
    p,d,i,v=parents[b];trace.append((d,i,v));b=p
trace.reverse();initial=b;score=0;fours=sum(v==4 for v in initial);steps=[]
for d,i,v in trace:
    a=move(b,2,2,d);assert a!=b and a[i]==0
    gain=phi(a)-phi(b);score+=gain
    n=list(a);n[i]=v;b=tuple(n);fours+=v==4
    steps.append({'direction':['left','right','up','down'][d],
                  'spawn_row':i//2,'spawn_col':i%2,'spawn_value':v,'board_after':b,'score':score})
assert b==end and score==180 and fours==3 and len(steps)==24
print(json.dumps({'board_size':[2,2],'initial':initial,'final':end,
                  'score':score,'rounds':len(steps),'fours_including_initial':fours,
                  'maximum_score_from_complete_dp':max_score,'steps':steps},indent=2))
