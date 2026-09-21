"""Finite arithmetic for the geometry-free junk-score upper bound."""
from common import ROOT
import json

def phi_binary(mass):
 total=0;k=0
 while mass:
  if mass&1:total+=(k-1)*(1<<k)
  mass>>=1;k+=1
 return total
rows=[{'four_births':y,'mass':28+2*y,'potential_upper':phi_binary(28+2*y),'score_upper':phi_binary(28+2*y)-4*y} for y in range(15)]
assert max(r['score_upper'] for r in rows)==136
report={'unscored_last_spawn_excluded':True,'scoring_junk_sources':14,'target_tree_score':1966080,'rows':rows,'maximum_fastest_game_score':1966216}
(ROOT/'research/results/fastest-score-bound.json').write_text(json.dumps(report,indent=2)+'\n')
print([r['score_upper'] for r in rows])

assert [r['score_upper'] for r in rows] == [68,64,120,116,116,112,120,116,116,112,136,132,132,128,136]
