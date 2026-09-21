"""Independent standard 2048 rules and witness helpers; no game/AI imports."""
from pathlib import Path
from functools import lru_cache
ROOT=Path(__file__).resolve().parents[1]
DIRECTIONS='URDL'
LINES={d:[] for d in DIRECTIONS}
for d in DIRECTIONS:
 for line in range(4):
  cells=[4*line+i for i in range(4)] if d in 'LR' else [4*i+line for i in range(4)]
  if d in 'RD':cells.reverse()
  LINES[d].append(cells)
@lru_cache(maxsize=100000)
def slide(b,d):
 out=list(b);gain=0
 for cells in LINES[d]:
  vs=[b[i] for i in cells if b[i]];ms=[];j=0
  while j<len(vs):
   if j+1<len(vs) and vs[j]==vs[j+1]:ms.append(2*vs[j]);gain+=2*vs[j];j+=2
   else:ms.append(vs[j]);j+=1
  ms += [0]*(4-len(ms))
  for i,v in zip(cells,ms):out[i]=v
 return tuple(out),gain
PERMS=[]
for f in range(2):
 for turns in range(4):
  p=[]
  for i in range(16):
   x,y=i%4,i//4
   if f:x=3-x
   for _ in range(turns):x,y=3-y,x
   p.append(4*y+x)
  PERMS.append(p)
def transform(b,p):
 out=[0]*16
 for i,v in enumerate(b):out[p[i]]=v
 return tuple(out)
def canonical(b):return min(transform(b,p) for p in PERMS)
def transform_step(s,p):
 d,r,c,v=s;k=p[4*r+c];i,j={'U':(5,1),'R':(5,6),'D':(5,9),'L':(5,4)}[d]
 return {-4:'U',1:'R',4:'D',-1:'L'}[p[j]-p[i]],k//4,k%4,v

def load(name):
 rows=[s.split() for s in (ROOT/'witness'/name).read_text().splitlines() if s.strip() and not s.lstrip().startswith('#')]
 b=[0]*16
 for op,r,c,v in rows[:2]:
  assert op=='start';r,c,v=int(r),int(c),int(v);assert b[4*r+c]==0;b[4*r+c]=v
 moves=[(d,int(r),int(c),int(v)) for d,r,c,v in rows[2:]];boards=[tuple(b)]
 for d,r,c,v in moves:
  a,_=slide(tuple(b),d);assert a!=tuple(b) and not a[4*r+c] and v in (2,4)
  b=list(a);b[4*r+c]=v;boards.append(tuple(b))
 return moves,boards

def write_witness(path,start,moves,description):
 starts=[f'start {i//4} {i%4} {v}' for i,v in enumerate(start) if v];assert len(starts)==2
 Path(path).write_text('# '+description+'\n'+'\n'.join(starts)+'\n'+'\n'.join(f'{d} {r} {c} {v}' for d,r,c,v in moves)+'\n')
def board_literal(b):return '⟨'+','.join('⟨'+','.join(map(str,b[4*r:4*r+4]))+'⟩' for r in range(4))+'⟩'
def step_literal(s):
 d,r,c,v=s
 return f'⟨.{dict(U="up",R="right",D="down",L="left")[d]}, .i{r}, .i{c}, {v}⟩'
