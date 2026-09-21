import Game2048.LowerBound
import Game2048.SemanticsChecks

/-!
Quantitative rigidity: near-minimum trajectories have very few early 2s.
The hypotheses describe actual rule-checked replays, not an ancestry relaxation.
No stochastic probability theorem is claimed by this module.
-/
namespace Game2048

def earlyTwos : List Step → Nat
  | [] => 0
  | s :: ss => (if s.value = 2 then 1 else 0) + earlyTwos ss

/-- Exact mass ledger, counting only the post-opening spawns. -/
theorem replay_mass_twos {a b : Board} {ss : List Step}
    (h : replay a ss = some b) :
    b.mass + 2 * earlyTwos ss = a.mass + 4 * ss.length := by
  induction ss generalizing a b with
  | nil =>
    simp only [replay, Option.some.injEq] at h
    subst b
    simp [earlyTwos]
  | cons s ss ih =>
    cases hs : step a s with
    | none => simp [replay, hs] at h
    | some c =>
      have hr : replay c ss = some b := by simpa [replay, hs] using h
      have ht := ih hr
      have hm := step_mass_exact hs
      have hv := (step_spec hs).1
      rcases hv with hv | hv
      · simp [earlyTwos, hv]
        simp only [hv] at hm
        omega
      · have hn : s.value ≠ 2 := by omega
        simp [earlyTwos, hn]
        simp only [hv] at hm
        omega

/-- At most two early 2-spawns per extra round beyond the optimum.
The deficit 8-a.mass also charges for 2s in the opening. -/
theorem deadline_slack_131072 {a b c : Board} {pre post : List Step}
    {d : Nat} (hi : IsInitial a)
    (hp : replay a pre = some b) (hs : replay b post = some c)
    (hlen : pre.length = 32766 + d) (htail : post.length = 15)
    (hit : c.Contains 131072) :
    2 * earlyTwos pre + (8 - a.mass) ≤ 4*d := by
  have hm := initial_mass_le hi
  have he := replay_mass_twos hp
  have hh := Plays.latency_bound (replay_sound hs)
  have hc : cutoff post.length = 65536 := by rw [htail]; decide
  rw [hc] at hh
  have hl := Board.contains_heavy_lower c 65536 131072 (by decide) hit
  have hb := Board.heavy_le_mass b 2
  omega

/-- An optimal trajectory must start from mass 8 and spawn no early 2s. -/
theorem optimal_opening_and_prefix {a b c : Board} {pre post : List Step}
    (hi : IsInitial a) (hp : replay a pre = some b)
    (hs : replay b post = some c)
    (hlen : pre.length = 32766) (htail : post.length = 15)
    (hit : c.Contains 131072) : a.mass = 8 ∧ earlyTwos pre = 0 := by
  have hd := deadline_slack_131072 (d := 0) hi hp hs (by omega) htail hit
  have hm := initial_mass_le hi
  omega

/-- General target version; no fixed target rank is assumed. -/
theorem target_prefix_budget {a b c : Board} {pre post : List Step}
    (hp : replay a pre = some b) (hs : replay b post = some c)
    (target : Nat) (hcut : cutoff post.length < target)
    (hit : c.Contains target) :
    target + 2 * earlyTwos pre ≤ a.mass + 4 * pre.length := by
  have he := replay_mass_twos hp
  have hh := Plays.latency_bound (replay_sound hs)
  have hl := Board.contains_heavy_lower c (cutoff post.length) target hcut hit
  have hb := Board.heavy_le_mass b 2
  omega

#print axioms deadline_slack_131072
#print axioms optimal_opening_and_prefix
#print axioms target_prefix_budget
end Game2048
