import Game2048.OpeningCases
import Game2048.ResidualMass

set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace Game2048

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
  · subst v1
    rcases hv2 with h2 | h2
    · subst v2
      cases r1 with
      | i0 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case000.upper
            | i2 =>
              exact Openings.Case004.upper
            | i3 =>
              exact Openings.Case008.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case012.upper
            | i1 =>
              exact Openings.Case016.upper
            | i2 =>
              exact Openings.Case020.upper
            | i3 =>
              exact Openings.Case024.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case028.upper
            | i1 =>
              exact Openings.Case032.upper
            | i2 =>
              exact Openings.Case036.upper
            | i3 =>
              exact Openings.Case040.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case044.upper
            | i1 =>
              exact Openings.Case048.upper
            | i2 =>
              exact Openings.Case052.upper
            | i3 =>
              exact Openings.Case056.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case000.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case060.upper
            | i3 =>
              exact Openings.Case064.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case068.upper
            | i1 =>
              exact Openings.Case072.upper
            | i2 =>
              exact Openings.Case076.upper
            | i3 =>
              exact Openings.Case080.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case084.upper
            | i1 =>
              exact Openings.Case088.upper
            | i2 =>
              exact Openings.Case092.upper
            | i3 =>
              exact Openings.Case096.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case100.upper
            | i1 =>
              exact Openings.Case104.upper
            | i2 =>
              exact Openings.Case108.upper
            | i3 =>
              exact Openings.Case112.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case004.upper
            | i1 =>
              exact Openings.Case060.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case116.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case120.upper
            | i1 =>
              exact Openings.Case124.upper
            | i2 =>
              exact Openings.Case128.upper
            | i3 =>
              exact Openings.Case132.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case136.upper
            | i1 =>
              exact Openings.Case140.upper
            | i2 =>
              exact Openings.Case144.upper
            | i3 =>
              exact Openings.Case148.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case152.upper
            | i1 =>
              exact Openings.Case156.upper
            | i2 =>
              exact Openings.Case160.upper
            | i3 =>
              exact Openings.Case164.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case008.upper
            | i1 =>
              exact Openings.Case064.upper
            | i2 =>
              exact Openings.Case116.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case168.upper
            | i1 =>
              exact Openings.Case172.upper
            | i2 =>
              exact Openings.Case176.upper
            | i3 =>
              exact Openings.Case180.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case184.upper
            | i1 =>
              exact Openings.Case188.upper
            | i2 =>
              exact Openings.Case192.upper
            | i3 =>
              exact Openings.Case196.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case200.upper
            | i1 =>
              exact Openings.Case204.upper
            | i2 =>
              exact Openings.Case208.upper
            | i3 =>
              exact Openings.Case212.upper
      | i1 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case012.upper
            | i1 =>
              exact Openings.Case068.upper
            | i2 =>
              exact Openings.Case120.upper
            | i3 =>
              exact Openings.Case168.upper
          | i1 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case216.upper
            | i2 =>
              exact Openings.Case220.upper
            | i3 =>
              exact Openings.Case224.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case228.upper
            | i1 =>
              exact Openings.Case232.upper
            | i2 =>
              exact Openings.Case236.upper
            | i3 =>
              exact Openings.Case240.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case244.upper
            | i1 =>
              exact Openings.Case248.upper
            | i2 =>
              exact Openings.Case252.upper
            | i3 =>
              exact Openings.Case256.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case016.upper
            | i1 =>
              exact Openings.Case072.upper
            | i2 =>
              exact Openings.Case124.upper
            | i3 =>
              exact Openings.Case172.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case216.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case260.upper
            | i3 =>
              exact Openings.Case264.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case268.upper
            | i1 =>
              exact Openings.Case272.upper
            | i2 =>
              exact Openings.Case276.upper
            | i3 =>
              exact Openings.Case280.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case284.upper
            | i1 =>
              exact Openings.Case288.upper
            | i2 =>
              exact Openings.Case292.upper
            | i3 =>
              exact Openings.Case296.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case020.upper
            | i1 =>
              exact Openings.Case076.upper
            | i2 =>
              exact Openings.Case128.upper
            | i3 =>
              exact Openings.Case176.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case220.upper
            | i1 =>
              exact Openings.Case260.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case300.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case304.upper
            | i1 =>
              exact Openings.Case308.upper
            | i2 =>
              exact Openings.Case312.upper
            | i3 =>
              exact Openings.Case316.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case320.upper
            | i1 =>
              exact Openings.Case324.upper
            | i2 =>
              exact Openings.Case328.upper
            | i3 =>
              exact Openings.Case332.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case024.upper
            | i1 =>
              exact Openings.Case080.upper
            | i2 =>
              exact Openings.Case132.upper
            | i3 =>
              exact Openings.Case180.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case224.upper
            | i1 =>
              exact Openings.Case264.upper
            | i2 =>
              exact Openings.Case300.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case336.upper
            | i1 =>
              exact Openings.Case340.upper
            | i2 =>
              exact Openings.Case344.upper
            | i3 =>
              exact Openings.Case348.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case352.upper
            | i1 =>
              exact Openings.Case356.upper
            | i2 =>
              exact Openings.Case360.upper
            | i3 =>
              exact Openings.Case364.upper
      | i2 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case028.upper
            | i1 =>
              exact Openings.Case084.upper
            | i2 =>
              exact Openings.Case136.upper
            | i3 =>
              exact Openings.Case184.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case228.upper
            | i1 =>
              exact Openings.Case268.upper
            | i2 =>
              exact Openings.Case304.upper
            | i3 =>
              exact Openings.Case336.upper
          | i2 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case368.upper
            | i2 =>
              exact Openings.Case372.upper
            | i3 =>
              exact Openings.Case376.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case380.upper
            | i1 =>
              exact Openings.Case384.upper
            | i2 =>
              exact Openings.Case388.upper
            | i3 =>
              exact Openings.Case392.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case032.upper
            | i1 =>
              exact Openings.Case088.upper
            | i2 =>
              exact Openings.Case140.upper
            | i3 =>
              exact Openings.Case188.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case232.upper
            | i1 =>
              exact Openings.Case272.upper
            | i2 =>
              exact Openings.Case308.upper
            | i3 =>
              exact Openings.Case340.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case368.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case396.upper
            | i3 =>
              exact Openings.Case400.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case404.upper
            | i1 =>
              exact Openings.Case408.upper
            | i2 =>
              exact Openings.Case412.upper
            | i3 =>
              exact Openings.Case416.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case036.upper
            | i1 =>
              exact Openings.Case092.upper
            | i2 =>
              exact Openings.Case144.upper
            | i3 =>
              exact Openings.Case192.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case236.upper
            | i1 =>
              exact Openings.Case276.upper
            | i2 =>
              exact Openings.Case312.upper
            | i3 =>
              exact Openings.Case344.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case372.upper
            | i1 =>
              exact Openings.Case396.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case420.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case424.upper
            | i1 =>
              exact Openings.Case428.upper
            | i2 =>
              exact Openings.Case432.upper
            | i3 =>
              exact Openings.Case436.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case040.upper
            | i1 =>
              exact Openings.Case096.upper
            | i2 =>
              exact Openings.Case148.upper
            | i3 =>
              exact Openings.Case196.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case240.upper
            | i1 =>
              exact Openings.Case280.upper
            | i2 =>
              exact Openings.Case316.upper
            | i3 =>
              exact Openings.Case348.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case376.upper
            | i1 =>
              exact Openings.Case400.upper
            | i2 =>
              exact Openings.Case420.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case440.upper
            | i1 =>
              exact Openings.Case444.upper
            | i2 =>
              exact Openings.Case448.upper
            | i3 =>
              exact Openings.Case452.upper
      | i3 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case044.upper
            | i1 =>
              exact Openings.Case100.upper
            | i2 =>
              exact Openings.Case152.upper
            | i3 =>
              exact Openings.Case200.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case244.upper
            | i1 =>
              exact Openings.Case284.upper
            | i2 =>
              exact Openings.Case320.upper
            | i3 =>
              exact Openings.Case352.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case380.upper
            | i1 =>
              exact Openings.Case404.upper
            | i2 =>
              exact Openings.Case424.upper
            | i3 =>
              exact Openings.Case440.upper
          | i3 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case456.upper
            | i2 =>
              exact Openings.Case460.upper
            | i3 =>
              exact Openings.Case464.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case048.upper
            | i1 =>
              exact Openings.Case104.upper
            | i2 =>
              exact Openings.Case156.upper
            | i3 =>
              exact Openings.Case204.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case248.upper
            | i1 =>
              exact Openings.Case288.upper
            | i2 =>
              exact Openings.Case324.upper
            | i3 =>
              exact Openings.Case356.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case384.upper
            | i1 =>
              exact Openings.Case408.upper
            | i2 =>
              exact Openings.Case428.upper
            | i3 =>
              exact Openings.Case444.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case456.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case468.upper
            | i3 =>
              exact Openings.Case472.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case052.upper
            | i1 =>
              exact Openings.Case108.upper
            | i2 =>
              exact Openings.Case160.upper
            | i3 =>
              exact Openings.Case208.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case252.upper
            | i1 =>
              exact Openings.Case292.upper
            | i2 =>
              exact Openings.Case328.upper
            | i3 =>
              exact Openings.Case360.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case388.upper
            | i1 =>
              exact Openings.Case412.upper
            | i2 =>
              exact Openings.Case432.upper
            | i3 =>
              exact Openings.Case448.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case460.upper
            | i1 =>
              exact Openings.Case468.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case476.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case056.upper
            | i1 =>
              exact Openings.Case112.upper
            | i2 =>
              exact Openings.Case164.upper
            | i3 =>
              exact Openings.Case212.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case256.upper
            | i1 =>
              exact Openings.Case296.upper
            | i2 =>
              exact Openings.Case332.upper
            | i3 =>
              exact Openings.Case364.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case392.upper
            | i1 =>
              exact Openings.Case416.upper
            | i2 =>
              exact Openings.Case436.upper
            | i3 =>
              exact Openings.Case452.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case464.upper
            | i1 =>
              exact Openings.Case472.upper
            | i2 =>
              exact Openings.Case476.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
    · subst v2
      cases r1 with
      | i0 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case001.upper
            | i2 =>
              exact Openings.Case005.upper
            | i3 =>
              exact Openings.Case009.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case013.upper
            | i1 =>
              exact Openings.Case017.upper
            | i2 =>
              exact Openings.Case021.upper
            | i3 =>
              exact Openings.Case025.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case029.upper
            | i1 =>
              exact Openings.Case033.upper
            | i2 =>
              exact Openings.Case037.upper
            | i3 =>
              exact Openings.Case041.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case045.upper
            | i1 =>
              exact Openings.Case049.upper
            | i2 =>
              exact Openings.Case053.upper
            | i3 =>
              exact Openings.Case057.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case002.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case061.upper
            | i3 =>
              exact Openings.Case065.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case069.upper
            | i1 =>
              exact Openings.Case073.upper
            | i2 =>
              exact Openings.Case077.upper
            | i3 =>
              exact Openings.Case081.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case085.upper
            | i1 =>
              exact Openings.Case089.upper
            | i2 =>
              exact Openings.Case093.upper
            | i3 =>
              exact Openings.Case097.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case101.upper
            | i1 =>
              exact Openings.Case105.upper
            | i2 =>
              exact Openings.Case109.upper
            | i3 =>
              exact Openings.Case113.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case006.upper
            | i1 =>
              exact Openings.Case062.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case117.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case121.upper
            | i1 =>
              exact Openings.Case125.upper
            | i2 =>
              exact Openings.Case129.upper
            | i3 =>
              exact Openings.Case133.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case137.upper
            | i1 =>
              exact Openings.Case141.upper
            | i2 =>
              exact Openings.Case145.upper
            | i3 =>
              exact Openings.Case149.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case153.upper
            | i1 =>
              exact Openings.Case157.upper
            | i2 =>
              exact Openings.Case161.upper
            | i3 =>
              exact Openings.Case165.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case010.upper
            | i1 =>
              exact Openings.Case066.upper
            | i2 =>
              exact Openings.Case118.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case169.upper
            | i1 =>
              exact Openings.Case173.upper
            | i2 =>
              exact Openings.Case177.upper
            | i3 =>
              exact Openings.Case181.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case185.upper
            | i1 =>
              exact Openings.Case189.upper
            | i2 =>
              exact Openings.Case193.upper
            | i3 =>
              exact Openings.Case197.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case201.upper
            | i1 =>
              exact Openings.Case205.upper
            | i2 =>
              exact Openings.Case209.upper
            | i3 =>
              exact Openings.Case213.upper
      | i1 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case014.upper
            | i1 =>
              exact Openings.Case070.upper
            | i2 =>
              exact Openings.Case122.upper
            | i3 =>
              exact Openings.Case170.upper
          | i1 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case217.upper
            | i2 =>
              exact Openings.Case221.upper
            | i3 =>
              exact Openings.Case225.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case229.upper
            | i1 =>
              exact Openings.Case233.upper
            | i2 =>
              exact Openings.Case237.upper
            | i3 =>
              exact Openings.Case241.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case245.upper
            | i1 =>
              exact Openings.Case249.upper
            | i2 =>
              exact Openings.Case253.upper
            | i3 =>
              exact Openings.Case257.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case018.upper
            | i1 =>
              exact Openings.Case074.upper
            | i2 =>
              exact Openings.Case126.upper
            | i3 =>
              exact Openings.Case174.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case218.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case261.upper
            | i3 =>
              exact Openings.Case265.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case269.upper
            | i1 =>
              exact Openings.Case273.upper
            | i2 =>
              exact Openings.Case277.upper
            | i3 =>
              exact Openings.Case281.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case285.upper
            | i1 =>
              exact Openings.Case289.upper
            | i2 =>
              exact Openings.Case293.upper
            | i3 =>
              exact Openings.Case297.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case022.upper
            | i1 =>
              exact Openings.Case078.upper
            | i2 =>
              exact Openings.Case130.upper
            | i3 =>
              exact Openings.Case178.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case222.upper
            | i1 =>
              exact Openings.Case262.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case301.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case305.upper
            | i1 =>
              exact Openings.Case309.upper
            | i2 =>
              exact Openings.Case313.upper
            | i3 =>
              exact Openings.Case317.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case321.upper
            | i1 =>
              exact Openings.Case325.upper
            | i2 =>
              exact Openings.Case329.upper
            | i3 =>
              exact Openings.Case333.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case026.upper
            | i1 =>
              exact Openings.Case082.upper
            | i2 =>
              exact Openings.Case134.upper
            | i3 =>
              exact Openings.Case182.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case226.upper
            | i1 =>
              exact Openings.Case266.upper
            | i2 =>
              exact Openings.Case302.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case337.upper
            | i1 =>
              exact Openings.Case341.upper
            | i2 =>
              exact Openings.Case345.upper
            | i3 =>
              exact Openings.Case349.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case353.upper
            | i1 =>
              exact Openings.Case357.upper
            | i2 =>
              exact Openings.Case361.upper
            | i3 =>
              exact Openings.Case365.upper
      | i2 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case030.upper
            | i1 =>
              exact Openings.Case086.upper
            | i2 =>
              exact Openings.Case138.upper
            | i3 =>
              exact Openings.Case186.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case230.upper
            | i1 =>
              exact Openings.Case270.upper
            | i2 =>
              exact Openings.Case306.upper
            | i3 =>
              exact Openings.Case338.upper
          | i2 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case369.upper
            | i2 =>
              exact Openings.Case373.upper
            | i3 =>
              exact Openings.Case377.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case381.upper
            | i1 =>
              exact Openings.Case385.upper
            | i2 =>
              exact Openings.Case389.upper
            | i3 =>
              exact Openings.Case393.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case034.upper
            | i1 =>
              exact Openings.Case090.upper
            | i2 =>
              exact Openings.Case142.upper
            | i3 =>
              exact Openings.Case190.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case234.upper
            | i1 =>
              exact Openings.Case274.upper
            | i2 =>
              exact Openings.Case310.upper
            | i3 =>
              exact Openings.Case342.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case370.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case397.upper
            | i3 =>
              exact Openings.Case401.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case405.upper
            | i1 =>
              exact Openings.Case409.upper
            | i2 =>
              exact Openings.Case413.upper
            | i3 =>
              exact Openings.Case417.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case038.upper
            | i1 =>
              exact Openings.Case094.upper
            | i2 =>
              exact Openings.Case146.upper
            | i3 =>
              exact Openings.Case194.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case238.upper
            | i1 =>
              exact Openings.Case278.upper
            | i2 =>
              exact Openings.Case314.upper
            | i3 =>
              exact Openings.Case346.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case374.upper
            | i1 =>
              exact Openings.Case398.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case421.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case425.upper
            | i1 =>
              exact Openings.Case429.upper
            | i2 =>
              exact Openings.Case433.upper
            | i3 =>
              exact Openings.Case437.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case042.upper
            | i1 =>
              exact Openings.Case098.upper
            | i2 =>
              exact Openings.Case150.upper
            | i3 =>
              exact Openings.Case198.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case242.upper
            | i1 =>
              exact Openings.Case282.upper
            | i2 =>
              exact Openings.Case318.upper
            | i3 =>
              exact Openings.Case350.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case378.upper
            | i1 =>
              exact Openings.Case402.upper
            | i2 =>
              exact Openings.Case422.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case441.upper
            | i1 =>
              exact Openings.Case445.upper
            | i2 =>
              exact Openings.Case449.upper
            | i3 =>
              exact Openings.Case453.upper
      | i3 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case046.upper
            | i1 =>
              exact Openings.Case102.upper
            | i2 =>
              exact Openings.Case154.upper
            | i3 =>
              exact Openings.Case202.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case246.upper
            | i1 =>
              exact Openings.Case286.upper
            | i2 =>
              exact Openings.Case322.upper
            | i3 =>
              exact Openings.Case354.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case382.upper
            | i1 =>
              exact Openings.Case406.upper
            | i2 =>
              exact Openings.Case426.upper
            | i3 =>
              exact Openings.Case442.upper
          | i3 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case457.upper
            | i2 =>
              exact Openings.Case461.upper
            | i3 =>
              exact Openings.Case465.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case050.upper
            | i1 =>
              exact Openings.Case106.upper
            | i2 =>
              exact Openings.Case158.upper
            | i3 =>
              exact Openings.Case206.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case250.upper
            | i1 =>
              exact Openings.Case290.upper
            | i2 =>
              exact Openings.Case326.upper
            | i3 =>
              exact Openings.Case358.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case386.upper
            | i1 =>
              exact Openings.Case410.upper
            | i2 =>
              exact Openings.Case430.upper
            | i3 =>
              exact Openings.Case446.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case458.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case469.upper
            | i3 =>
              exact Openings.Case473.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case054.upper
            | i1 =>
              exact Openings.Case110.upper
            | i2 =>
              exact Openings.Case162.upper
            | i3 =>
              exact Openings.Case210.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case254.upper
            | i1 =>
              exact Openings.Case294.upper
            | i2 =>
              exact Openings.Case330.upper
            | i3 =>
              exact Openings.Case362.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case390.upper
            | i1 =>
              exact Openings.Case414.upper
            | i2 =>
              exact Openings.Case434.upper
            | i3 =>
              exact Openings.Case450.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case462.upper
            | i1 =>
              exact Openings.Case470.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case477.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case058.upper
            | i1 =>
              exact Openings.Case114.upper
            | i2 =>
              exact Openings.Case166.upper
            | i3 =>
              exact Openings.Case214.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case258.upper
            | i1 =>
              exact Openings.Case298.upper
            | i2 =>
              exact Openings.Case334.upper
            | i3 =>
              exact Openings.Case366.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case394.upper
            | i1 =>
              exact Openings.Case418.upper
            | i2 =>
              exact Openings.Case438.upper
            | i3 =>
              exact Openings.Case454.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case466.upper
            | i1 =>
              exact Openings.Case474.upper
            | i2 =>
              exact Openings.Case478.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
  · subst v1
    rcases hv2 with h2 | h2
    · subst v2
      cases r1 with
      | i0 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case002.upper
            | i2 =>
              exact Openings.Case006.upper
            | i3 =>
              exact Openings.Case010.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case014.upper
            | i1 =>
              exact Openings.Case018.upper
            | i2 =>
              exact Openings.Case022.upper
            | i3 =>
              exact Openings.Case026.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case030.upper
            | i1 =>
              exact Openings.Case034.upper
            | i2 =>
              exact Openings.Case038.upper
            | i3 =>
              exact Openings.Case042.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case046.upper
            | i1 =>
              exact Openings.Case050.upper
            | i2 =>
              exact Openings.Case054.upper
            | i3 =>
              exact Openings.Case058.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case001.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case062.upper
            | i3 =>
              exact Openings.Case066.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case070.upper
            | i1 =>
              exact Openings.Case074.upper
            | i2 =>
              exact Openings.Case078.upper
            | i3 =>
              exact Openings.Case082.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case086.upper
            | i1 =>
              exact Openings.Case090.upper
            | i2 =>
              exact Openings.Case094.upper
            | i3 =>
              exact Openings.Case098.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case102.upper
            | i1 =>
              exact Openings.Case106.upper
            | i2 =>
              exact Openings.Case110.upper
            | i3 =>
              exact Openings.Case114.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case005.upper
            | i1 =>
              exact Openings.Case061.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case118.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case122.upper
            | i1 =>
              exact Openings.Case126.upper
            | i2 =>
              exact Openings.Case130.upper
            | i3 =>
              exact Openings.Case134.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case138.upper
            | i1 =>
              exact Openings.Case142.upper
            | i2 =>
              exact Openings.Case146.upper
            | i3 =>
              exact Openings.Case150.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case154.upper
            | i1 =>
              exact Openings.Case158.upper
            | i2 =>
              exact Openings.Case162.upper
            | i3 =>
              exact Openings.Case166.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case009.upper
            | i1 =>
              exact Openings.Case065.upper
            | i2 =>
              exact Openings.Case117.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case170.upper
            | i1 =>
              exact Openings.Case174.upper
            | i2 =>
              exact Openings.Case178.upper
            | i3 =>
              exact Openings.Case182.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case186.upper
            | i1 =>
              exact Openings.Case190.upper
            | i2 =>
              exact Openings.Case194.upper
            | i3 =>
              exact Openings.Case198.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case202.upper
            | i1 =>
              exact Openings.Case206.upper
            | i2 =>
              exact Openings.Case210.upper
            | i3 =>
              exact Openings.Case214.upper
      | i1 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case013.upper
            | i1 =>
              exact Openings.Case069.upper
            | i2 =>
              exact Openings.Case121.upper
            | i3 =>
              exact Openings.Case169.upper
          | i1 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case218.upper
            | i2 =>
              exact Openings.Case222.upper
            | i3 =>
              exact Openings.Case226.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case230.upper
            | i1 =>
              exact Openings.Case234.upper
            | i2 =>
              exact Openings.Case238.upper
            | i3 =>
              exact Openings.Case242.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case246.upper
            | i1 =>
              exact Openings.Case250.upper
            | i2 =>
              exact Openings.Case254.upper
            | i3 =>
              exact Openings.Case258.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case017.upper
            | i1 =>
              exact Openings.Case073.upper
            | i2 =>
              exact Openings.Case125.upper
            | i3 =>
              exact Openings.Case173.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case217.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case262.upper
            | i3 =>
              exact Openings.Case266.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case270.upper
            | i1 =>
              exact Openings.Case274.upper
            | i2 =>
              exact Openings.Case278.upper
            | i3 =>
              exact Openings.Case282.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case286.upper
            | i1 =>
              exact Openings.Case290.upper
            | i2 =>
              exact Openings.Case294.upper
            | i3 =>
              exact Openings.Case298.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case021.upper
            | i1 =>
              exact Openings.Case077.upper
            | i2 =>
              exact Openings.Case129.upper
            | i3 =>
              exact Openings.Case177.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case221.upper
            | i1 =>
              exact Openings.Case261.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case302.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case306.upper
            | i1 =>
              exact Openings.Case310.upper
            | i2 =>
              exact Openings.Case314.upper
            | i3 =>
              exact Openings.Case318.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case322.upper
            | i1 =>
              exact Openings.Case326.upper
            | i2 =>
              exact Openings.Case330.upper
            | i3 =>
              exact Openings.Case334.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case025.upper
            | i1 =>
              exact Openings.Case081.upper
            | i2 =>
              exact Openings.Case133.upper
            | i3 =>
              exact Openings.Case181.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case225.upper
            | i1 =>
              exact Openings.Case265.upper
            | i2 =>
              exact Openings.Case301.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case338.upper
            | i1 =>
              exact Openings.Case342.upper
            | i2 =>
              exact Openings.Case346.upper
            | i3 =>
              exact Openings.Case350.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case354.upper
            | i1 =>
              exact Openings.Case358.upper
            | i2 =>
              exact Openings.Case362.upper
            | i3 =>
              exact Openings.Case366.upper
      | i2 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case029.upper
            | i1 =>
              exact Openings.Case085.upper
            | i2 =>
              exact Openings.Case137.upper
            | i3 =>
              exact Openings.Case185.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case229.upper
            | i1 =>
              exact Openings.Case269.upper
            | i2 =>
              exact Openings.Case305.upper
            | i3 =>
              exact Openings.Case337.upper
          | i2 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case370.upper
            | i2 =>
              exact Openings.Case374.upper
            | i3 =>
              exact Openings.Case378.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case382.upper
            | i1 =>
              exact Openings.Case386.upper
            | i2 =>
              exact Openings.Case390.upper
            | i3 =>
              exact Openings.Case394.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case033.upper
            | i1 =>
              exact Openings.Case089.upper
            | i2 =>
              exact Openings.Case141.upper
            | i3 =>
              exact Openings.Case189.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case233.upper
            | i1 =>
              exact Openings.Case273.upper
            | i2 =>
              exact Openings.Case309.upper
            | i3 =>
              exact Openings.Case341.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case369.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case398.upper
            | i3 =>
              exact Openings.Case402.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case406.upper
            | i1 =>
              exact Openings.Case410.upper
            | i2 =>
              exact Openings.Case414.upper
            | i3 =>
              exact Openings.Case418.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case037.upper
            | i1 =>
              exact Openings.Case093.upper
            | i2 =>
              exact Openings.Case145.upper
            | i3 =>
              exact Openings.Case193.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case237.upper
            | i1 =>
              exact Openings.Case277.upper
            | i2 =>
              exact Openings.Case313.upper
            | i3 =>
              exact Openings.Case345.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case373.upper
            | i1 =>
              exact Openings.Case397.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case422.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case426.upper
            | i1 =>
              exact Openings.Case430.upper
            | i2 =>
              exact Openings.Case434.upper
            | i3 =>
              exact Openings.Case438.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case041.upper
            | i1 =>
              exact Openings.Case097.upper
            | i2 =>
              exact Openings.Case149.upper
            | i3 =>
              exact Openings.Case197.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case241.upper
            | i1 =>
              exact Openings.Case281.upper
            | i2 =>
              exact Openings.Case317.upper
            | i3 =>
              exact Openings.Case349.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case377.upper
            | i1 =>
              exact Openings.Case401.upper
            | i2 =>
              exact Openings.Case421.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case442.upper
            | i1 =>
              exact Openings.Case446.upper
            | i2 =>
              exact Openings.Case450.upper
            | i3 =>
              exact Openings.Case454.upper
      | i3 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case045.upper
            | i1 =>
              exact Openings.Case101.upper
            | i2 =>
              exact Openings.Case153.upper
            | i3 =>
              exact Openings.Case201.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case245.upper
            | i1 =>
              exact Openings.Case285.upper
            | i2 =>
              exact Openings.Case321.upper
            | i3 =>
              exact Openings.Case353.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case381.upper
            | i1 =>
              exact Openings.Case405.upper
            | i2 =>
              exact Openings.Case425.upper
            | i3 =>
              exact Openings.Case441.upper
          | i3 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case458.upper
            | i2 =>
              exact Openings.Case462.upper
            | i3 =>
              exact Openings.Case466.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case049.upper
            | i1 =>
              exact Openings.Case105.upper
            | i2 =>
              exact Openings.Case157.upper
            | i3 =>
              exact Openings.Case205.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case249.upper
            | i1 =>
              exact Openings.Case289.upper
            | i2 =>
              exact Openings.Case325.upper
            | i3 =>
              exact Openings.Case357.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case385.upper
            | i1 =>
              exact Openings.Case409.upper
            | i2 =>
              exact Openings.Case429.upper
            | i3 =>
              exact Openings.Case445.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case457.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case470.upper
            | i3 =>
              exact Openings.Case474.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case053.upper
            | i1 =>
              exact Openings.Case109.upper
            | i2 =>
              exact Openings.Case161.upper
            | i3 =>
              exact Openings.Case209.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case253.upper
            | i1 =>
              exact Openings.Case293.upper
            | i2 =>
              exact Openings.Case329.upper
            | i3 =>
              exact Openings.Case361.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case389.upper
            | i1 =>
              exact Openings.Case413.upper
            | i2 =>
              exact Openings.Case433.upper
            | i3 =>
              exact Openings.Case449.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case461.upper
            | i1 =>
              exact Openings.Case469.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case478.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case057.upper
            | i1 =>
              exact Openings.Case113.upper
            | i2 =>
              exact Openings.Case165.upper
            | i3 =>
              exact Openings.Case213.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case257.upper
            | i1 =>
              exact Openings.Case297.upper
            | i2 =>
              exact Openings.Case333.upper
            | i3 =>
              exact Openings.Case365.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case393.upper
            | i1 =>
              exact Openings.Case417.upper
            | i2 =>
              exact Openings.Case437.upper
            | i3 =>
              exact Openings.Case453.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case465.upper
            | i1 =>
              exact Openings.Case473.upper
            | i2 =>
              exact Openings.Case477.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
    · subst v2
      cases r1 with
      | i0 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case003.upper
            | i2 =>
              exact Openings.Case007.upper
            | i3 =>
              exact Openings.Case011.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case015.upper
            | i1 =>
              exact Openings.Case019.upper
            | i2 =>
              exact Openings.Case023.upper
            | i3 =>
              exact Openings.Case027.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case031.upper
            | i1 =>
              exact Openings.Case035.upper
            | i2 =>
              exact Openings.Case039.upper
            | i3 =>
              exact Openings.Case043.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case047.upper
            | i1 =>
              exact Openings.Case051.upper
            | i2 =>
              exact Openings.Case055.upper
            | i3 =>
              exact Openings.Case059.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case003.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case063.upper
            | i3 =>
              exact Openings.Case067.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case071.upper
            | i1 =>
              exact Openings.Case075.upper
            | i2 =>
              exact Openings.Case079.upper
            | i3 =>
              exact Openings.Case083.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case087.upper
            | i1 =>
              exact Openings.Case091.upper
            | i2 =>
              exact Openings.Case095.upper
            | i3 =>
              exact Openings.Case099.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case103.upper
            | i1 =>
              exact Openings.Case107.upper
            | i2 =>
              exact Openings.Case111.upper
            | i3 =>
              exact Openings.Case115.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case007.upper
            | i1 =>
              exact Openings.Case063.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case119.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case123.upper
            | i1 =>
              exact Openings.Case127.upper
            | i2 =>
              exact Openings.Case131.upper
            | i3 =>
              exact Openings.Case135.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case139.upper
            | i1 =>
              exact Openings.Case143.upper
            | i2 =>
              exact Openings.Case147.upper
            | i3 =>
              exact Openings.Case151.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case155.upper
            | i1 =>
              exact Openings.Case159.upper
            | i2 =>
              exact Openings.Case163.upper
            | i3 =>
              exact Openings.Case167.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case011.upper
            | i1 =>
              exact Openings.Case067.upper
            | i2 =>
              exact Openings.Case119.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case171.upper
            | i1 =>
              exact Openings.Case175.upper
            | i2 =>
              exact Openings.Case179.upper
            | i3 =>
              exact Openings.Case183.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case187.upper
            | i1 =>
              exact Openings.Case191.upper
            | i2 =>
              exact Openings.Case195.upper
            | i3 =>
              exact Openings.Case199.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case203.upper
            | i1 =>
              exact Openings.Case207.upper
            | i2 =>
              exact Openings.Case211.upper
            | i3 =>
              exact Openings.Case215.upper
      | i1 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case015.upper
            | i1 =>
              exact Openings.Case071.upper
            | i2 =>
              exact Openings.Case123.upper
            | i3 =>
              exact Openings.Case171.upper
          | i1 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case219.upper
            | i2 =>
              exact Openings.Case223.upper
            | i3 =>
              exact Openings.Case227.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case231.upper
            | i1 =>
              exact Openings.Case235.upper
            | i2 =>
              exact Openings.Case239.upper
            | i3 =>
              exact Openings.Case243.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case247.upper
            | i1 =>
              exact Openings.Case251.upper
            | i2 =>
              exact Openings.Case255.upper
            | i3 =>
              exact Openings.Case259.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case019.upper
            | i1 =>
              exact Openings.Case075.upper
            | i2 =>
              exact Openings.Case127.upper
            | i3 =>
              exact Openings.Case175.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case219.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case263.upper
            | i3 =>
              exact Openings.Case267.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case271.upper
            | i1 =>
              exact Openings.Case275.upper
            | i2 =>
              exact Openings.Case279.upper
            | i3 =>
              exact Openings.Case283.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case287.upper
            | i1 =>
              exact Openings.Case291.upper
            | i2 =>
              exact Openings.Case295.upper
            | i3 =>
              exact Openings.Case299.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case023.upper
            | i1 =>
              exact Openings.Case079.upper
            | i2 =>
              exact Openings.Case131.upper
            | i3 =>
              exact Openings.Case179.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case223.upper
            | i1 =>
              exact Openings.Case263.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case303.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case307.upper
            | i1 =>
              exact Openings.Case311.upper
            | i2 =>
              exact Openings.Case315.upper
            | i3 =>
              exact Openings.Case319.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case323.upper
            | i1 =>
              exact Openings.Case327.upper
            | i2 =>
              exact Openings.Case331.upper
            | i3 =>
              exact Openings.Case335.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case027.upper
            | i1 =>
              exact Openings.Case083.upper
            | i2 =>
              exact Openings.Case135.upper
            | i3 =>
              exact Openings.Case183.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case227.upper
            | i1 =>
              exact Openings.Case267.upper
            | i2 =>
              exact Openings.Case303.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case339.upper
            | i1 =>
              exact Openings.Case343.upper
            | i2 =>
              exact Openings.Case347.upper
            | i3 =>
              exact Openings.Case351.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case355.upper
            | i1 =>
              exact Openings.Case359.upper
            | i2 =>
              exact Openings.Case363.upper
            | i3 =>
              exact Openings.Case367.upper
      | i2 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case031.upper
            | i1 =>
              exact Openings.Case087.upper
            | i2 =>
              exact Openings.Case139.upper
            | i3 =>
              exact Openings.Case187.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case231.upper
            | i1 =>
              exact Openings.Case271.upper
            | i2 =>
              exact Openings.Case307.upper
            | i3 =>
              exact Openings.Case339.upper
          | i2 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case371.upper
            | i2 =>
              exact Openings.Case375.upper
            | i3 =>
              exact Openings.Case379.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case383.upper
            | i1 =>
              exact Openings.Case387.upper
            | i2 =>
              exact Openings.Case391.upper
            | i3 =>
              exact Openings.Case395.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case035.upper
            | i1 =>
              exact Openings.Case091.upper
            | i2 =>
              exact Openings.Case143.upper
            | i3 =>
              exact Openings.Case191.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case235.upper
            | i1 =>
              exact Openings.Case275.upper
            | i2 =>
              exact Openings.Case311.upper
            | i3 =>
              exact Openings.Case343.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case371.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case399.upper
            | i3 =>
              exact Openings.Case403.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case407.upper
            | i1 =>
              exact Openings.Case411.upper
            | i2 =>
              exact Openings.Case415.upper
            | i3 =>
              exact Openings.Case419.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case039.upper
            | i1 =>
              exact Openings.Case095.upper
            | i2 =>
              exact Openings.Case147.upper
            | i3 =>
              exact Openings.Case195.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case239.upper
            | i1 =>
              exact Openings.Case279.upper
            | i2 =>
              exact Openings.Case315.upper
            | i3 =>
              exact Openings.Case347.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case375.upper
            | i1 =>
              exact Openings.Case399.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case423.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case427.upper
            | i1 =>
              exact Openings.Case431.upper
            | i2 =>
              exact Openings.Case435.upper
            | i3 =>
              exact Openings.Case439.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case043.upper
            | i1 =>
              exact Openings.Case099.upper
            | i2 =>
              exact Openings.Case151.upper
            | i3 =>
              exact Openings.Case199.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case243.upper
            | i1 =>
              exact Openings.Case283.upper
            | i2 =>
              exact Openings.Case319.upper
            | i3 =>
              exact Openings.Case351.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case379.upper
            | i1 =>
              exact Openings.Case403.upper
            | i2 =>
              exact Openings.Case423.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case443.upper
            | i1 =>
              exact Openings.Case447.upper
            | i2 =>
              exact Openings.Case451.upper
            | i3 =>
              exact Openings.Case455.upper
      | i3 =>
        cases c1 with
        | i0 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case047.upper
            | i1 =>
              exact Openings.Case103.upper
            | i2 =>
              exact Openings.Case155.upper
            | i3 =>
              exact Openings.Case203.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case247.upper
            | i1 =>
              exact Openings.Case287.upper
            | i2 =>
              exact Openings.Case323.upper
            | i3 =>
              exact Openings.Case355.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case383.upper
            | i1 =>
              exact Openings.Case407.upper
            | i2 =>
              exact Openings.Case427.upper
            | i3 =>
              exact Openings.Case443.upper
          | i3 =>
            cases c2 with
            | i0 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i1 =>
              exact Openings.Case459.upper
            | i2 =>
              exact Openings.Case463.upper
            | i3 =>
              exact Openings.Case467.upper
        | i1 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case051.upper
            | i1 =>
              exact Openings.Case107.upper
            | i2 =>
              exact Openings.Case159.upper
            | i3 =>
              exact Openings.Case207.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case251.upper
            | i1 =>
              exact Openings.Case291.upper
            | i2 =>
              exact Openings.Case327.upper
            | i3 =>
              exact Openings.Case359.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case387.upper
            | i1 =>
              exact Openings.Case411.upper
            | i2 =>
              exact Openings.Case431.upper
            | i3 =>
              exact Openings.Case447.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case459.upper
            | i1 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i2 =>
              exact Openings.Case471.upper
            | i3 =>
              exact Openings.Case475.upper
        | i2 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case055.upper
            | i1 =>
              exact Openings.Case111.upper
            | i2 =>
              exact Openings.Case163.upper
            | i3 =>
              exact Openings.Case211.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case255.upper
            | i1 =>
              exact Openings.Case295.upper
            | i2 =>
              exact Openings.Case331.upper
            | i3 =>
              exact Openings.Case363.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case391.upper
            | i1 =>
              exact Openings.Case415.upper
            | i2 =>
              exact Openings.Case435.upper
            | i3 =>
              exact Openings.Case451.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case463.upper
            | i1 =>
              exact Openings.Case471.upper
            | i2 =>
              rcases hne with h | h <;> exact False.elim (h rfl)
            | i3 =>
              exact Openings.Case479.upper
        | i3 =>
          cases r2 with
          | i0 =>
            cases c2 with
            | i0 =>
              exact Openings.Case059.upper
            | i1 =>
              exact Openings.Case115.upper
            | i2 =>
              exact Openings.Case167.upper
            | i3 =>
              exact Openings.Case215.upper
          | i1 =>
            cases c2 with
            | i0 =>
              exact Openings.Case259.upper
            | i1 =>
              exact Openings.Case299.upper
            | i2 =>
              exact Openings.Case335.upper
            | i3 =>
              exact Openings.Case367.upper
          | i2 =>
            cases c2 with
            | i0 =>
              exact Openings.Case395.upper
            | i1 =>
              exact Openings.Case419.upper
            | i2 =>
              exact Openings.Case439.upper
            | i3 =>
              exact Openings.Case455.upper
          | i3 =>
            cases c2 with
            | i0 =>
              exact Openings.Case467.upper
            | i1 =>
              exact Openings.Case475.upper
            | i2 =>
              exact Openings.Case479.upper
            | i3 =>
              rcases hne with h | h <;> exact False.elim (h rfl)

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
