import Game2048.Generated.Certificate
import Game2048.ResidualMass

namespace Game2048.MinimumMass
def b0 : Board := Cert131072.primed
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨16,8,8,2⟩,⟨32,64,128,256⟩,⟨4096,2048,1024,512⟩,⟨8192,16384,32768,65536⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨16,16,2,2⟩,⟨32,64,128,256⟩,⟨4096,2048,1024,512⟩,⟨8192,16384,32768,65536⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i0, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨32,4,2,0⟩,⟨32,64,128,256⟩,⟨4096,2048,1024,512⟩,⟨8192,16384,32768,65536⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i2, 2⟩ (by rfl)
def b4 : Board := ⟨⟨2,4,2,0⟩,⟨64,64,128,256⟩,⟨4096,2048,1024,512⟩,⟨8192,16384,32768,65536⟩⟩
theorem p4 : Plays b0 4 b4 := Plays.snoc p3 ⟨.down, .i0, .i0, 2⟩ (by rfl)
def b5 : Board := ⟨⟨2,2,4,2⟩,⟨0,128,128,256⟩,⟨4096,2048,1024,512⟩,⟨8192,16384,32768,65536⟩⟩
theorem p5 : Plays b0 5 b5 := Plays.snoc p4 ⟨.right, .i0, .i0, 2⟩ (by rfl)
def b6 : Board := ⟨⟨2,4,4,2⟩,⟨0,0,256,256⟩,⟨4096,2048,1024,512⟩,⟨8192,16384,32768,65536⟩⟩
theorem p6 : Plays b0 6 b6 := Plays.snoc p5 ⟨.right, .i0, .i0, 2⟩ (by rfl)
def b7 : Board := ⟨⟨2,2,8,2⟩,⟨0,0,0,512⟩,⟨4096,2048,1024,512⟩,⟨8192,16384,32768,65536⟩⟩
theorem p7 : Plays b0 7 b7 := Plays.snoc p6 ⟨.right, .i0, .i0, 2⟩ (by rfl)
def b8 : Board := ⟨⟨2,0,0,0⟩,⟨2,2,8,2⟩,⟨4096,2048,1024,1024⟩,⟨8192,16384,32768,65536⟩⟩
theorem p8 : Plays b0 8 b8 := Plays.snoc p7 ⟨.down, .i0, .i0, 2⟩ (by rfl)
def b9 : Board := ⟨⟨2,0,0,2⟩,⟨0,4,8,2⟩,⟨0,4096,2048,2048⟩,⟨8192,16384,32768,65536⟩⟩
theorem p9 : Plays b0 9 b9 := Plays.snoc p8 ⟨.right, .i0, .i0, 2⟩ (by rfl)
def b10 : Board := ⟨⟨4,2,0,0⟩,⟨4,8,2,0⟩,⟨4096,4096,0,0⟩,⟨8192,16384,32768,65536⟩⟩
theorem p10 : Plays b0 10 b10 := Plays.snoc p9 ⟨.left, .i0, .i1, 2⟩ (by rfl)
def b11 : Board := ⟨⟨4,2,2,0⟩,⟨4,8,2,0⟩,⟨8192,0,0,0⟩,⟨8192,16384,32768,65536⟩⟩
theorem p11 : Plays b0 11 b11 := Plays.snoc p10 ⟨.left, .i0, .i2, 2⟩ (by rfl)
def b12 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨8,8,4,2⟩,⟨16384,16384,32768,65536⟩⟩
theorem p12 : Plays b0 12 b12 := Plays.snoc p11 ⟨.down, .i2, .i3, 2⟩ (by rfl)
def b13 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨16,4,2,2⟩,⟨32768,32768,65536,0⟩⟩
theorem p13 : Plays b0 13 b13 := Plays.snoc p12 ⟨.left, .i2, .i3, 2⟩ (by rfl)
def b14 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,2⟩,⟨0,16,4,4⟩,⟨0,0,65536,65536⟩⟩
theorem p14 : Plays b0 14 b14 := Plays.snoc p13 ⟨.right, .i1, .i0, 2⟩ (by rfl)
def b15 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,16,8⟩,⟨0,0,0,131072⟩⟩
theorem p15 : Plays b0 15 b15 := Plays.snoc p14 ⟨.right, .i0, .i0, 2⟩ (by rfl)

def terminal : Board := b15

theorem fold : Plays Cert131072.primed 15 terminal := p15

theorem certified_play : Plays Cert131072.initial 32781 terminal :=
  Plays.append Cert131072.certified_primed_prefix fold

theorem contains_terminal : terminal.Contains 131072 := by
  exact ⟨.i3,.i3,by rfl⟩

theorem terminal_mass : terminal.mass = 131102 := by rfl

/-- The minimum move count and minimum endpoint mass are attained simultaneously. -/
theorem joint_optimum :
    (∃ a b : Board, IsInitial a ∧ Plays a 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102) ∧
    (∀ a b : Board, ∀ n : Nat, IsInitial a → Plays a n b → b.Contains 131072 →
      32781 ≤ n ∧ 131102 ≤ b.mass) := by
  constructor
  · exact ⟨Cert131072.initial, terminal, Cert131072.start_valid, certified_play,
      contains_terminal, terminal_mass⟩
  · intro a b n hi hp ht
    exact ⟨lower_bound_131072 hi hp ht, lower_bound_mass_131072 hi hp ht⟩

#print axioms certified_play
#print axioms joint_optimum
end Game2048.MinimumMass
