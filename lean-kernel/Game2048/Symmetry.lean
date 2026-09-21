import Game2048.Basic

namespace Game2048

def mirrorIx : Ix → Ix
  | .i0 => .i3 | .i1 => .i2 | .i2 => .i1 | .i3 => .i0

def mirrorDir : Dir → Dir
  | .up => .up | .right => .left | .down => .down | .left => .right

def transposeDir : Dir → Dir
  | .up => .left | .right => .down | .down => .right | .left => .up

def Board.mirror (b : Board) : Board := b.mapRows Row.reverse

theorem Board.mirror_mirror (b : Board) : b.mirror.mirror = b := by rfl

theorem Board.transpose_transpose (b : Board) : b.transpose.transpose = b := by rfl

theorem Board.slide_mirror (b : Board) (d : Dir) :
    b.mirror.slide (mirrorDir d) = (b.slide d).mirror := by
  cases d <;> rfl

theorem Board.slide_transpose (b : Board) (d : Dir) :
    b.transpose.slide (transposeDir d) = (b.slide d).transpose := by
  cases d <;> rfl

theorem Board.get_mirror (b : Board) (r c : Ix) :
    b.mirror.get r (mirrorIx c) = b.get r c := by
  cases r <;> cases c <;> rfl

theorem Board.get_transpose (b : Board) (r c : Ix) :
    b.transpose.get c r = b.get r c := by
  cases r <;> cases c <;> rfl

theorem Board.set_mirror (b : Board) (r c : Ix) (v : Nat) :
    (b.set r c v).mirror = b.mirror.set r (mirrorIx c) v := by
  cases r <;> cases c <;> rfl

theorem Board.set_transpose (b : Board) (r c : Ix) (v : Nat) :
    (b.set r c v).transpose = b.transpose.set c r v := by
  cases r <;> cases c <;> rfl

def Step.mirror (s : Step) : Step :=
  ⟨mirrorDir s.dir, s.row, mirrorIx s.col, s.value⟩

def Step.transpose (s : Step) : Step :=
  ⟨transposeDir s.dir, s.col, s.row, s.value⟩

theorem step_mirror {b c : Board} {s : Step} (h : step b s = some c) :
    step b.mirror s.mirror = some c.mirror := by
  obtain ⟨hv,hm,hz,rfl⟩ := step_spec h
  have hm' : (b.slide s.dir).mirror ≠ b.mirror := by
    intro he
    have hh := congrArg Board.mirror he
    exact hm hh
  simp only [step, Step.mirror, Board.slide_mirror, Board.get_mirror]
  rw [if_pos ⟨hv,hm',hz⟩]
  rw [Board.set_mirror]

theorem step_transpose {b c : Board} {s : Step} (h : step b s = some c) :
    step b.transpose s.transpose = some c.transpose := by
  obtain ⟨hv,hm,hz,rfl⟩ := step_spec h
  have hm' : (b.slide s.dir).transpose ≠ b.transpose := by
    intro he
    have hh := congrArg Board.transpose he
    exact hm hh
  simp only [step, Step.transpose, Board.slide_transpose, Board.get_transpose]
  rw [if_pos ⟨hv,hm',hz⟩]
  rw [Board.set_transpose]

theorem Plays.mirror {a b : Board} {n : Nat} (p : Plays a n b) :
    Plays a.mirror n b.mirror := by
  induction p with
  | refl => exact Plays.refl
  | snoc p s hs ih => exact Plays.snoc ih s.mirror (step_mirror hs)

theorem Plays.transpose {a b : Board} {n : Nat} (p : Plays a n b) :
    Plays a.transpose n b.transpose := by
  induction p with
  | refl => exact Plays.refl
  | snoc p s hs ih => exact Plays.snoc ih s.transpose (step_transpose hs)

def Board.rotate (b : Board) : Board := b.transpose.mirror

theorem Plays.rotate {a b : Board} {n : Nat} (p : Plays a n b) :
    Plays a.rotate n b.rotate := p.transpose.mirror

theorem Board.Contains.mirror {b : Board} {v : Nat} (h : b.Contains v) :
    b.mirror.Contains v := by
  obtain ⟨r,c,h⟩ := h
  exact ⟨r,mirrorIx c, by simpa only [Board.get_mirror] using h⟩

theorem Board.Contains.transpose {b : Board} {v : Nat} (h : b.Contains v) :
    b.transpose.Contains v := by
  obtain ⟨r,c,h⟩ := h
  exact ⟨c,r, by simpa only [Board.get_transpose] using h⟩

theorem Board.Contains.rotate {b : Board} {v : Nat} (h : b.Contains v) :
    b.rotate.Contains v := h.transpose.mirror

#print axioms Plays.rotate
end Game2048
