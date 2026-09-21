import Game2048.LowerBound
import Game2048.SemanticsChecks

namespace Game2048

/-- A recent spawn remains below a doubling threshold and contributes at least two units. -/
theorem step_light_mass {a b : Board} {s : Step} (hs : step a s = some b)
    (k : Nat) (hk : 2 ≤ k) :
    b.heavy (2*k) + a.mass + 2 ≤ b.mass + a.heavy k := by
  have hh := step_heavy_le hs k hk
  have hm := step_mass_exact hs
  have hv := (step_spec hs).1
  have hv2 : 2 ≤ s.value := by rcases hv with h | h <;> omega
  omega

/-- After any k final rounds, at least 2k mass lies below the corresponding threshold. -/
theorem Plays.recent_light_mass {a b : Board} {n : Nat} (p : Plays a n b) :
    ∀ k : Nat, k ≤ n → b.heavy (cutoff k) + 2*k ≤ b.mass := by
  induction p with
  | refl =>
    intro k hk
    have he : k = 0 := by omega
    subst k
    simpa [cutoff] using Board.heavy_le_mass a 2
  | @snoc n b c p s hs ih =>
    intro k hk
    cases k with
    | zero => simpa [cutoff] using Board.heavy_le_mass c 2
    | succ k =>
      have hkn : k ≤ n := by omega
      have h1 := ih k hkn
      have h2 := step_light_mass hs (cutoff k) (cutoff_ge_two k)
      change c.heavy (2 * cutoff k) + 2*(k+1) ≤ c.mass
      omega

/-- A target 131072 cannot occur with less than 30 additional mass in the board. -/
theorem lower_bound_mass_131072 {a b : Board} {n : Nat}
    (hi : IsInitial a) (p : Plays a n b) (hit : b.Contains 131072) :
    131102 ≤ b.mass := by
  have hn := lower_bound_131072 hi p hit
  have hh := p.recent_light_mass 15 (by omega)
  have ht := Board.contains_heavy_lower b (cutoff 15) 131072 (by decide) hit
  omega

#print axioms lower_bound_mass_131072
end Game2048
