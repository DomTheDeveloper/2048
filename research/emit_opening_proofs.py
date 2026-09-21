"""Generate untrusted Lean proposals; every bridge and the final coverage theorem are kernel-checked.
Run after openings.py and the ordinary lean-kernel/check.sh build.
"""
from common import *
import json

K=ROOT/'lean-kernel/Game2048'
HEADER='set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n'

def main():
 report=json.loads((ROOT/'research/results/openings.json').read_text());entries=report['results']
 moves,boards=load('131072.txt');final=json.loads((ROOT/'research/results/fold-2.json').read_text())['final_board']
 cuts=sorted(set(range(0,len(moves)+1,128))|{32766,len(moves)})
 text='import Game2048.Generated.Certificate\nimport Game2048.MinimumMass\nimport Game2048.Symmetry\n\n'+HEADER+'\nnamespace Game2048.OpeningTails\nopen Cert131072\n'
 text+='theorem q3 : Plays Segment0000.b3 0 Segment0000.b3 := Plays.refl\n'
 for j in range(4,129):
  text+=f'theorem q{j} : Plays Segment0000.b3 {j-3} Segment0000.b{j} :=\n  Plays.snoc q{j-1} {step_literal(moves[j-1])} (by rfl)\n'
 text+='theorem t0001 : Plays Segment0000.b3 125 c0001 := q128\n'
 for i in range(1,cuts.index(32766)):
  text+=f'theorem t{i+1:04d} : Plays Segment0000.b3 {cuts[i+1]-3} c{i+1:04d} :=\n  Plays.append t{i:04d} chunk{i:04d}\n'
 text+=f'theorem suffix3 : Plays Segment0000.b3 32778 MinimumMass.terminal := Plays.append t{cuts.index(32766):04d} MinimumMass.fold\n'
 for j in range(2,-1,-1):
  text+=f'theorem suffix{j} : Plays Segment0000.b{j} {32781-j} MinimumMass.terminal :=\n  Plays.append (Plays.snoc Plays.refl {step_literal(moves[j])} (by rfl)) suffix{j+1}\n'
 for pi,p in enumerate(PERMS):
  op=('.mirror' if pi>=4 else '')+'.rotate'*(pi%4)
  text+=f'def end{pi} : Board := {board_literal(transform(final,p))}\n'
  text+=f'theorem hit{pi} : end{pi}.Contains 131072 := MinimumMass.contains_terminal{op}\n'
  text+=f'theorem mass{pi} : end{pi}.mass = 131102 := by rfl\n'
  for j in range(4):
   text+=f'def join{pi}_{j} : Board := {board_literal(transform(boards[j],p))}\n'
   text+=f'theorem tail{pi}_{j} : Plays join{pi}_{j} {32781-j} end{pi} := suffix{j}{op}\n'
 text+='\n#print axioms tail7_3\nend Game2048.OpeningTails\n'
 (K/'OpeningTails.lean').write_text(text)
 # Each ordinary labeled opening is independently bridged to a transformed suffix.
 text='import Game2048.OpeningTails\n\n'+HEADER+'\nnamespace Game2048.Openings\nopen OpeningTails\n'
 lookup={}
 for index,e in enumerate(entries):
  b=tuple(e['opening']);lookup[b]=index;path=e['steps'];pi=e['symmetry'];j=e['join'];length=e['minimum_moves'];state=b
  text+=f'namespace Case{index:03d}\ndef b0 : Board := {board_literal(b)}\n'
  text+='theorem p0 : Plays b0 0 b0 := Plays.refl\n'
  for t,step in enumerate(path,1):
   d,r,c,v=step;a,_=slide(state,d);state=a[:4*r+c]+(v,)+a[4*r+c+1:]
   text+=f'def b{t} : Board := {board_literal(state)}\n'
   text+=f'theorem p{t} : Plays b0 {t} b{t} := Plays.snoc p{t-1} {step_literal(step)} (by rfl)\n'
  text+=f'theorem upper : ∃ b : Board, Plays b0 {length} b ∧ b.Contains 131072 ∧ b.mass = 131102 :=\n  ⟨end{pi}, Plays.append p{len(path)} tail{pi}_{j}, hit{pi}, mass{pi}⟩\nend Case{index:03d}\n'
 text+='end Game2048.Openings\n'
 (K/'OpeningCases.lean').write_text(text)
 text='import Game2048.OpeningCases\nimport Game2048.ResidualMass\n\n'+HEADER+'''\nnamespace Game2048

/-- The optimum for a fixed ordinary opening, not a minimum over placements. -/
def openingOptimum (a : Board) : Nat := if a.mass = 8 then 32781 else 32782

theorem lower_bound_fixed_opening {a b : Board} {n : Nat}
    (hi : IsInitial a) (hp : Plays a n b) (hit : b.Contains 131072) :
    openingOptimum a ≤ n := by
  have hm := initial_mass_le hi
  have hl : a.mass < 131072 := by omega
  have h := Plays.target_deadline hp 15 131072 (by decide) hl hit
  unfold openingOptimum
  split <;> omega

theorem every_opening_attains_its_bound {a : Board} (hi : IsInitial a) :
    ∃ b : Board, Plays a (openingOptimum a) b ∧ b.Contains 131072 ∧ b.mass = 131102 := by
  obtain ⟨r1,c1,r2,c2,v1,v2,hv1,hv2,hne,rfl⟩ := hi
  rcases hv1 with h1 | h1
'''
 def cases_coords(level,prefix,vals,indent):
  vars=['r1','c1','r2','c2'];s=''
  if level==4:
   r1,c1,r2,c2=prefix
   if (r1,c1)==(r2,c2):return indent+'rcases hne with h | h <;> exact False.elim (h rfl)\n'
   b=[0]*16;b[4*r1+c1]=vals[0];b[4*r2+c2]=vals[1];idx=lookup[tuple(b)]
   return indent+f'exact Openings.Case{idx:03d}.upper\n'
  s+=indent+f'cases {vars[level]} with\n'
  for i in range(4):
   s+=indent+f'| i{i} =>\n'+cases_coords(level+1,prefix+[i],vals,indent+'  ')
  return s
 for v1 in (2,4):
  text+='  · subst v1\n    rcases hv2 with h2 | h2\n'
  for v2 in (2,4):
   text+='    · subst v2\n'+cases_coords(0,[],(v1,v2),'      ')
 text+='''
/-- Every one of the 480 ordinary labeled openings has the stated exact optimum.
    The existential quantifier is INSIDE the universal opening quantifier. -/
theorem standard2048_all_openings_exact :
    ∀ a : Board, IsInitial a →
      (∃ b : Board, Plays a (openingOptimum a) b ∧ b.Contains 131072 ∧ b.mass = 131102) ∧
      (∀ b : Board, ∀ n : Nat, Plays a n b → b.Contains 131072 → openingOptimum a ≤ n ∧ 131102 ≤ b.mass) := by
  intro a hi
  constructor
  · exact every_opening_attains_its_bound hi
  · intro b n hp ht
    exact ⟨lower_bound_fixed_opening hi hp ht, lower_bound_mass_131072 hi hp ht⟩

#print axioms every_opening_attains_its_bound
#print axioms standard2048_all_openings_exact
end Game2048
'''
 (K/'AllOpenings.lean').write_text(text)
 print('Generated OpeningTails, OpeningCases, and full all-openings theorem.')
if __name__=='__main__':main()
