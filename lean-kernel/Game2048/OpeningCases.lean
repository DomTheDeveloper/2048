import Game2048.OpeningTails

set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace Game2048.Openings
open OpeningTails
namespace Case000
def b0 : Board := ⟨⟨2,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case000
namespace Case001
def b0 : Board := ⟨⟨2,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case001
namespace Case002
def b0 : Board := ⟨⟨4,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case002
namespace Case003
def b0 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p0 tail2_0, hit2, mass2⟩
end Case003
namespace Case004
def b0 : Board := ⟨⟨2,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case004
namespace Case005
def b0 : Board := ⟨⟨2,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case005
namespace Case006
def b0 : Board := ⟨⟨4,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case006
namespace Case007
def b0 : Board := ⟨⟨4,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_1, hit5, mass5⟩
end Case007
namespace Case008
def b0 : Board := ⟨⟨2,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case008
namespace Case009
def b0 : Board := ⟨⟨2,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case009
namespace Case010
def b0 : Board := ⟨⟨4,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case010
namespace Case011
def b0 : Board := ⟨⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_1, hit5, mass5⟩
end Case011
namespace Case012
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p1 tail2_0, hit2, mass2⟩
end Case012
namespace Case013
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case013
namespace Case014
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case014
namespace Case015
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p0 tail5_0, hit5, mass5⟩
end Case015
namespace Case016
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case016
namespace Case017
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case017
namespace Case018
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case018
namespace Case019
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case019
namespace Case020
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case020
namespace Case021
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case021
namespace Case022
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,2,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case022
namespace Case023
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case023
namespace Case024
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case024
namespace Case025
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case025
namespace Case026
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case026
namespace Case027
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case027
namespace Case028
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p1 tail2_0, hit2, mass2⟩
end Case028
namespace Case029
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case029
namespace Case030
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case030
namespace Case031
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨8,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p1 tail2_1, hit2, mass2⟩
end Case031
namespace Case032
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case032
namespace Case033
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case033
namespace Case034
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case034
namespace Case035
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case035
namespace Case036
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case036
namespace Case037
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case037
namespace Case038
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case038
namespace Case039
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case039
namespace Case040
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case040
namespace Case041
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case041
namespace Case042
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case042
namespace Case043
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,4,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case043
namespace Case044
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case044
namespace Case045
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case045
namespace Case046
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case046
namespace Case047
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_1, hit4, mass4⟩
end Case047
namespace Case048
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case048
namespace Case049
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case049
namespace Case050
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case050
namespace Case051
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case051
namespace Case052
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case052
namespace Case053
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case053
namespace Case054
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case054
namespace Case055
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case055
namespace Case056
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case056
namespace Case057
def b0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case057
namespace Case058
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case058
namespace Case059
def b0 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case059
namespace Case060
def b0 : Board := ⟨⟨0,2,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case060
namespace Case061
def b0 : Board := ⟨⟨0,2,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case061
namespace Case062
def b0 : Board := ⟨⟨0,4,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case062
namespace Case063
def b0 : Board := ⟨⟨0,4,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_1, hit5, mass5⟩
end Case063
namespace Case064
def b0 : Board := ⟨⟨0,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p1 tail3_0, hit3, mass3⟩
end Case064
namespace Case065
def b0 : Board := ⟨⟨0,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case065
namespace Case066
def b0 : Board := ⟨⟨0,4,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case066
namespace Case067
def b0 : Board := ⟨⟨0,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,8⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p1 tail3_1, hit3, mass3⟩
end Case067
namespace Case068
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case068
namespace Case069
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case069
namespace Case070
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case070
namespace Case071
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case071
namespace Case072
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case072
namespace Case073
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,4,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,2,0,2⟩,⟨0,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case073
namespace Case074
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case074
namespace Case075
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,8,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case075
namespace Case076
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,2,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case076
namespace Case077
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case077
namespace Case078
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,2,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case078
namespace Case079
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case079
namespace Case080
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case080
namespace Case081
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case081
namespace Case082
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case082
namespace Case083
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case083
namespace Case084
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case084
namespace Case085
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case085
namespace Case086
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case086
namespace Case087
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case087
namespace Case088
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p1 tail2_0, hit2, mass2⟩
end Case088
namespace Case089
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case089
namespace Case090
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case090
namespace Case091
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,8,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case091
namespace Case092
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case092
namespace Case093
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case093
namespace Case094
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case094
namespace Case095
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_3, hit5, mass5⟩
end Case095
namespace Case096
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case096
namespace Case097
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case097
namespace Case098
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case098
namespace Case099
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_3, hit5, mass5⟩
end Case099
namespace Case100
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case100
namespace Case101
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case101
namespace Case102
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case102
namespace Case103
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case103
namespace Case104
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case104
namespace Case105
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case105
namespace Case106
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case106
namespace Case107
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,8,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case107
namespace Case108
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case108
namespace Case109
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case109
namespace Case110
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case110
namespace Case111
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case111
namespace Case112
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case112
namespace Case113
def b0 : Board := ⟨⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case113
namespace Case114
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case114
namespace Case115
def b0 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_3, hit5, mass5⟩
end Case115
namespace Case116
def b0 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p1 tail3_0, hit3, mass3⟩
end Case116
namespace Case117
def b0 : Board := ⟨⟨0,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case117
namespace Case118
def b0 : Board := ⟨⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case118
namespace Case119
def b0 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p0 tail6_0, hit6, mass6⟩
end Case119
namespace Case120
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case120
namespace Case121
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case121
namespace Case122
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case122
namespace Case123
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case123
namespace Case124
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case124
namespace Case125
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case125
namespace Case126
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case126
namespace Case127
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case127
namespace Case128
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p1 tail0_0, hit0, mass0⟩
end Case128
namespace Case129
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨2,0,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨2,0,2,0⟩,⟨4,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case129
namespace Case130
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨2,0,2,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case130
namespace Case131
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,8,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case131
namespace Case132
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case132
namespace Case133
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case133
namespace Case134
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case134
namespace Case135
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case135
namespace Case136
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case136
namespace Case137
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case137
namespace Case138
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case138
namespace Case139
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨8,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_3, hit4, mass4⟩
end Case139
namespace Case140
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case140
namespace Case141
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case141
namespace Case142
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case142
namespace Case143
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,8⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case143
namespace Case144
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case144
namespace Case145
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case145
namespace Case146
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case146
namespace Case147
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,8,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case147
namespace Case148
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case148
namespace Case149
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case149
namespace Case150
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case150
namespace Case151
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case151
namespace Case152
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case152
namespace Case153
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case153
namespace Case154
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case154
namespace Case155
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,8⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case155
namespace Case156
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case156
namespace Case157
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case157
namespace Case158
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case158
namespace Case159
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,8⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case159
namespace Case160
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case160
namespace Case161
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case161
namespace Case162
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case162
namespace Case163
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,8,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case163
namespace Case164
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case164
namespace Case165
def b0 : Board := ⟨⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case165
namespace Case166
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case166
namespace Case167
def b0 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case167
namespace Case168
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨2,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case168
namespace Case169
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case169
namespace Case170
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case170
namespace Case171
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case171
namespace Case172
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case172
namespace Case173
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case173
namespace Case174
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case174
namespace Case175
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case175
namespace Case176
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case176
namespace Case177
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case177
namespace Case178
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case178
namespace Case179
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case179
namespace Case180
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case180
namespace Case181
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case181
namespace Case182
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case182
namespace Case183
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p0 tail3_0, hit3, mass3⟩
end Case183
namespace Case184
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨2,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case184
namespace Case185
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case185
namespace Case186
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case186
namespace Case187
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨8,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_3, hit4, mass4⟩
end Case187
namespace Case188
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case188
namespace Case189
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case189
namespace Case190
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case190
namespace Case191
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨8,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_3, hit4, mass4⟩
end Case191
namespace Case192
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case192
namespace Case193
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case193
namespace Case194
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case194
namespace Case195
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case195
namespace Case196
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case196
namespace Case197
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case197
namespace Case198
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case198
namespace Case199
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_1, hit6, mass6⟩
end Case199
namespace Case200
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,2⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case200
namespace Case201
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case201
namespace Case202
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case202
namespace Case203
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,8⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case203
namespace Case204
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case204
namespace Case205
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case205
namespace Case206
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case206
namespace Case207
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨8,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_3, hit4, mass4⟩
end Case207
namespace Case208
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case208
namespace Case209
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case209
namespace Case210
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case210
namespace Case211
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case211
namespace Case212
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case212
namespace Case213
def b0 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case213
namespace Case214
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case214
namespace Case215
def b0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_1, hit6, mass6⟩
end Case215
namespace Case216
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p1 tail3_0, hit3, mass3⟩
end Case216
namespace Case217
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨2,4,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case217
namespace Case218
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case218
namespace Case219
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case219
namespace Case220
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case220
namespace Case221
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case221
namespace Case222
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case222
namespace Case223
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case223
namespace Case224
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case224
namespace Case225
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case225
namespace Case226
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case226
namespace Case227
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case227
namespace Case228
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case228
namespace Case229
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case229
namespace Case230
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case230
namespace Case231
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_1, hit4, mass4⟩
end Case231
namespace Case232
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case232
namespace Case233
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case233
namespace Case234
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case234
namespace Case235
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case235
namespace Case236
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case236
namespace Case237
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case237
namespace Case238
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case238
namespace Case239
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨8,4,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i1, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_3, hit5, mass5⟩
end Case239
namespace Case240
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case240
namespace Case241
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case241
namespace Case242
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case242
namespace Case243
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨8,4,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i1, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_3, hit5, mass5⟩
end Case243
namespace Case244
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case244
namespace Case245
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case245
namespace Case246
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case246
namespace Case247
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_1, hit4, mass4⟩
end Case247
namespace Case248
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case248
namespace Case249
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case249
namespace Case250
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case250
namespace Case251
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case251
namespace Case252
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case252
namespace Case253
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case253
namespace Case254
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case254
namespace Case255
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case255
namespace Case256
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case256
namespace Case257
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case257
namespace Case258
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case258
namespace Case259
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨8,4,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i1, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_3, hit5, mass5⟩
end Case259
namespace Case260
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case260
namespace Case261
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case261
namespace Case262
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case262
namespace Case263
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case263
namespace Case264
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p1 tail3_0, hit3, mass3⟩
end Case264
namespace Case265
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case265
namespace Case266
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case266
namespace Case267
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case267
namespace Case268
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case268
namespace Case269
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,2,2⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case269
namespace Case270
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case270
namespace Case271
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case271
namespace Case272
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case272
namespace Case273
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case273
namespace Case274
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case274
namespace Case275
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,8,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case275
namespace Case276
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case276
namespace Case277
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case277
namespace Case278
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case278
namespace Case279
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case279
namespace Case280
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case280
namespace Case281
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case281
namespace Case282
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,8,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case282
namespace Case283
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,4,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case283
namespace Case284
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case284
namespace Case285
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case285
namespace Case286
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case286
namespace Case287
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case287
namespace Case288
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case288
namespace Case289
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case289
namespace Case290
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case290
namespace Case291
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,8,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case291
namespace Case292
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case292
namespace Case293
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case293
namespace Case294
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case294
namespace Case295
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_3, hit7, mass7⟩
end Case295
namespace Case296
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case296
namespace Case297
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case297
namespace Case298
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case298
namespace Case299
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_3, hit5, mass5⟩
end Case299
namespace Case300
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p1 tail5_0, hit5, mass5⟩
end Case300
namespace Case301
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨2,4,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case301
namespace Case302
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨4,2,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i3, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case302
namespace Case303
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case303
namespace Case304
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case304
namespace Case305
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case305
namespace Case306
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case306
namespace Case307
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨8,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_3, hit4, mass4⟩
end Case307
namespace Case308
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case308
namespace Case309
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case309
namespace Case310
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case310
namespace Case311
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,8⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case311
namespace Case312
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case312
namespace Case313
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case313
namespace Case314
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case314
namespace Case315
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,8,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case315
namespace Case316
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case316
namespace Case317
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,2,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case317
namespace Case318
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case318
namespace Case319
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case319
namespace Case320
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case320
namespace Case321
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case321
namespace Case322
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case322
namespace Case323
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,8⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case323
namespace Case324
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case324
namespace Case325
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case325
namespace Case326
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case326
namespace Case327
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨8,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_3, hit4, mass4⟩
end Case327
namespace Case328
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p1 tail0_0, hit0, mass0⟩
end Case328
namespace Case329
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case329
namespace Case330
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case330
namespace Case331
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,8,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p2 tail0_2, hit0, mass0⟩
end Case331
namespace Case332
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case332
namespace Case333
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case333
namespace Case334
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case334
namespace Case335
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i3, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case335
namespace Case336
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,2⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case336
namespace Case337
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case337
namespace Case338
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case338
namespace Case339
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,8⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case339
namespace Case340
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case340
namespace Case341
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case341
namespace Case342
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case342
namespace Case343
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,8⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case343
namespace Case344
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case344
namespace Case345
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case345
namespace Case346
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case346
namespace Case347
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case347
namespace Case348
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case348
namespace Case349
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case349
namespace Case350
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case350
namespace Case351
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_1, hit6, mass6⟩
end Case351
namespace Case352
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,2⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case352
namespace Case353
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case353
namespace Case354
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case354
namespace Case355
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,8⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case355
namespace Case356
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case356
namespace Case357
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case357
namespace Case358
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case358
namespace Case359
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,8⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i1, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_3, hit6, mass6⟩
end Case359
namespace Case360
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case360
namespace Case361
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case361
namespace Case362
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case362
namespace Case363
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p2 tail4_2, hit4, mass4⟩
end Case363
namespace Case364
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p1 tail0_0, hit0, mass0⟩
end Case364
namespace Case365
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case365
namespace Case366
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case366
namespace Case367
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,8⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p1 tail0_1, hit0, mass0⟩
end Case367
namespace Case368
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case368
namespace Case369
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,2,4⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨2,4,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i0, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case369
namespace Case370
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case370
namespace Case371
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case371
namespace Case372
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p1 tail1_0, hit1, mass1⟩
end Case372
namespace Case373
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case373
namespace Case374
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case374
namespace Case375
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case375
namespace Case376
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case376
namespace Case377
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case377
namespace Case378
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case378
namespace Case379
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case379
namespace Case380
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p1 tail4_0, hit4, mass4⟩
end Case380
namespace Case381
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case381
namespace Case382
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case382
namespace Case383
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p0 tail1_0, hit1, mass1⟩
end Case383
namespace Case384
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case384
namespace Case385
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case385
namespace Case386
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case386
namespace Case387
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case387
namespace Case388
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case388
namespace Case389
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case389
namespace Case390
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case390
namespace Case391
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case391
namespace Case392
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,2⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case392
namespace Case393
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case393
namespace Case394
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case394
namespace Case395
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case395
namespace Case396
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case396
namespace Case397
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case397
namespace Case398
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,2,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case398
namespace Case399
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,4,0⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case399
namespace Case400
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i3, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case400
namespace Case401
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case401
namespace Case402
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case402
namespace Case403
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p2 tail7_2, hit7, mass7⟩
end Case403
namespace Case404
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case404
namespace Case405
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case405
namespace Case406
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,2,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i2, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case406
namespace Case407
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case407
namespace Case408
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p1 tail2_0, hit2, mass2⟩
end Case408
namespace Case409
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,2,0,2⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p3 tail1_2, hit1, mass1⟩
end Case409
namespace Case410
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,0,2⟩,⟨0,2,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,4⟩,⟨0,2,0,2⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i3, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case410
namespace Case411
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,8,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case411
namespace Case412
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,2,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case412
namespace Case413
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,2,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case413
namespace Case414
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case414
namespace Case415
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case415
namespace Case416
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case416
namespace Case417
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,2,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case417
namespace Case418
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case418
namespace Case419
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p2 tail5_2, hit5, mass5⟩
end Case419
namespace Case420
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i3, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p1 tail1_0, hit1, mass1⟩
end Case420
namespace Case421
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i0, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p3 tail0_2, hit0, mass0⟩
end Case421
namespace Case422
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i0, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p3 tail4_2, hit4, mass4⟩
end Case422
namespace Case423
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i3, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p2 tail1_2, hit1, mass1⟩
end Case423
namespace Case424
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case424
namespace Case425
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case425
namespace Case426
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case426
namespace Case427
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case427
namespace Case428
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case428
namespace Case429
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case429
namespace Case430
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case430
namespace Case431
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case431
namespace Case432
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p1 tail6_0, hit6, mass6⟩
end Case432
namespace Case433
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,0⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case433
namespace Case434
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,4,0⟩,⟨0,0,2,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,0⟩,⟨2,0,2,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p3 tail3_2, hit3, mass3⟩
end Case434
namespace Case435
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,8,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p2 tail6_2, hit6, mass6⟩
end Case435
namespace Case436
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case436
namespace Case437
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case437
namespace Case438
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case438
namespace Case439
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case439
namespace Case440
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,2⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,4⟩,⟨4,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i0, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.right, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p3 tail7_2, hit7, mass7⟩
end Case440
namespace Case441
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case441
namespace Case442
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨2,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case442
namespace Case443
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,0,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case443
namespace Case444
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case444
namespace Case445
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case445
namespace Case446
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case446
namespace Case447
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i0, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end3, Plays.append p2 tail3_2, hit3, mass3⟩
end Case447
namespace Case448
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case448
namespace Case449
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case449
namespace Case450
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case450
namespace Case451
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i1, .i2, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p2 tail2_2, hit2, mass2⟩
end Case451
namespace Case452
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.down, .i3, .i2, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p1 tail0_0, hit0, mass0⟩
end Case452
namespace Case453
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨4,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i2, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case453
namespace Case454
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.down, .i3, .i1, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.left, .i0, .i1, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end5, Plays.append p3 tail5_2, hit5, mass5⟩
end Case454
namespace Case455
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p0 tail7_0, hit7, mass7⟩
end Case455
namespace Case456
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p1 tail1_0, hit1, mass1⟩
end Case456
namespace Case457
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,4,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case457
namespace Case458
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,2,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,2,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case458
namespace Case459
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end4, Plays.append p0 tail4_0, hit4, mass4⟩
end Case459
namespace Case460
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p1 tail1_0, hit1, mass1⟩
end Case460
namespace Case461
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 4⟩ (by rfl)
def b2 : Board := ⟨⟨2,8,0,0⟩,⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i0, 2⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case461
namespace Case462
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case462
namespace Case463
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨8,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.left, .i2, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end1, Plays.append p1 tail1_1, hit1, mass1⟩
end Case463
namespace Case464
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case464
namespace Case465
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨2,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i1, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case465
namespace Case466
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i2, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case466
namespace Case467
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_1, hit7, mass7⟩
end Case467
namespace Case468
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case468
namespace Case469
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case469
namespace Case470
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,2,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,4,2,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i3, 2⟩ (by rfl)
def b2 : Board := ⟨⟨4,4,0,0⟩,⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.left, .i1, .i1, 4⟩ (by rfl)
def b3 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end6, Plays.append p3 tail6_2, hit6, mass6⟩
end Case470
namespace Case471
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,4,0⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_1, hit7, mass7⟩
end Case471
namespace Case472
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case472
namespace Case473
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,2,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,2,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case473
namespace Case474
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,4,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case474
namespace Case475
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_1, hit7, mass7⟩
end Case475
namespace Case476
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.right, .i2, .i3, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end7, Plays.append p1 tail7_0, hit7, mass7⟩
end Case476
namespace Case477
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,2,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨2,0,2,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 2⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i2, 4⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case477
namespace Case478
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,2⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
def b1 : Board := ⟨⟨4,0,4,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p1 : Plays b0 1 b1 := Plays.snoc p0 ⟨.up, .i0, .i0, 4⟩ (by rfl)
def b2 : Board := ⟨⟨0,0,8,2⟩,⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p2 : Plays b0 2 b2 := Plays.snoc p1 ⟨.right, .i1, .i3, 2⟩ (by rfl)
def b3 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem p3 : Plays b0 3 b3 := Plays.snoc p2 ⟨.up, .i1, .i0, 4⟩ (by rfl)
theorem upper : ∃ b : Board, Plays b0 32782 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end2, Plays.append p3 tail2_2, hit2, mass2⟩
end Case478
namespace Case479
def b0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem p0 : Plays b0 0 b0 := Plays.refl
theorem upper : ∃ b : Board, Plays b0 32781 b ∧ b.Contains 131072 ∧ b.mass = 131102 :=
  ⟨end0, Plays.append p0 tail0_0, hit0, mass0⟩
end Case479
end Game2048.Openings
