"""Check the floating-window embedding of a legal 4x4 witness into larger rectangles."""
from common import *
import json

def rectangular_slide(b,h,w,d):
 out=list(b);gain=0
 lines=([list(range(r*w,(r+1)*w)) for r in range(h)] if d in 'LR'
        else [[r*w+c for r in range(h)] for c in range(w)])
 for cells in lines:
  if d in 'RD':cells.reverse()
  vals=[b[i] for i in cells if b[i]];merged=[];j=0
  while j<len(vals):
   if j+1<len(vals) and vals[j]==vals[j+1]:merged.append(2*vals[j]);gain+=2*vals[j];j+=2
   else:merged.append(vals[j]);j+=1
  merged += [0]*(len(cells)-len(merged))
  for i,v in zip(cells,merged):out[i]=v
 return tuple(out),gain

def embed(small,h,w,ro,co):
 big=[0]*(h*w)
 for r in range(4):
  for c in range(4):big[(r+ro)*w+c+co]=small[4*r+c]
 return tuple(big)

def main():
 moves,boards=load('131072.txt');reports=[]
 for h,w in ((5,5),(5,7),(4,8)):
  ro=co=0;b=embed(boards[0],h,w,ro,co);score=0
  for t,(d,r,c,v) in enumerate(moves,1):
   a,gain=rectangular_slide(b,h,w,d)
   assert a!=b
   if d=='U':ro=0
   if d=='D':ro=h-4
   if d=='L':co=0
   if d=='R':co=w-4
   k=(r+ro)*w+c+co;assert not a[k]
   b=a[:k]+(v,)+a[k+1:];score+=gain
   assert b==embed(boards[t],h,w,ro,co)
  assert max(b)==131072 and score==1966092
  reports.append({'height':h,'width':w,'rounds':len(moves),'score':score,'largest_tile':max(b),'every_translated_state_checked':True})
 (ROOT/'research/results/embeddings.json').write_text(json.dumps(reports,indent=2)+'\n')
 print(json.dumps(reports,indent=2))
if __name__=='__main__':main()
