import Game2048.Generated.Certificate
import Game2048.MinimumMass
import Game2048.Symmetry

set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace Game2048.OpeningTails
open Cert131072
theorem q3 : Plays Segment0000.b3 0 Segment0000.b3 := Plays.refl
theorem q4 : Plays Segment0000.b3 1 Segment0000.b4 :=
  Plays.snoc q3 ⟨.right, .i2, .i2, 4⟩ (by rfl)
theorem q5 : Plays Segment0000.b3 2 Segment0000.b5 :=
  Plays.snoc q4 ⟨.down, .i3, .i1, 4⟩ (by rfl)
theorem q6 : Plays Segment0000.b3 3 Segment0000.b6 :=
  Plays.snoc q5 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q7 : Plays Segment0000.b3 4 Segment0000.b7 :=
  Plays.snoc q6 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q8 : Plays Segment0000.b3 5 Segment0000.b8 :=
  Plays.snoc q7 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q9 : Plays Segment0000.b3 6 Segment0000.b9 :=
  Plays.snoc q8 ⟨.right, .i1, .i1, 4⟩ (by rfl)
theorem q10 : Plays Segment0000.b3 7 Segment0000.b10 :=
  Plays.snoc q9 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem q11 : Plays Segment0000.b3 8 Segment0000.b11 :=
  Plays.snoc q10 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q12 : Plays Segment0000.b3 9 Segment0000.b12 :=
  Plays.snoc q11 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q13 : Plays Segment0000.b3 10 Segment0000.b13 :=
  Plays.snoc q12 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q14 : Plays Segment0000.b3 11 Segment0000.b14 :=
  Plays.snoc q13 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q15 : Plays Segment0000.b3 12 Segment0000.b15 :=
  Plays.snoc q14 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q16 : Plays Segment0000.b3 13 Segment0000.b16 :=
  Plays.snoc q15 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q17 : Plays Segment0000.b3 14 Segment0000.b17 :=
  Plays.snoc q16 ⟨.right, .i1, .i1, 4⟩ (by rfl)
theorem q18 : Plays Segment0000.b3 15 Segment0000.b18 :=
  Plays.snoc q17 ⟨.down, .i2, .i2, 4⟩ (by rfl)
theorem q19 : Plays Segment0000.b3 16 Segment0000.b19 :=
  Plays.snoc q18 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q20 : Plays Segment0000.b3 17 Segment0000.b20 :=
  Plays.snoc q19 ⟨.right, .i2, .i1, 4⟩ (by rfl)
theorem q21 : Plays Segment0000.b3 18 Segment0000.b21 :=
  Plays.snoc q20 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem q22 : Plays Segment0000.b3 19 Segment0000.b22 :=
  Plays.snoc q21 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q23 : Plays Segment0000.b3 20 Segment0000.b23 :=
  Plays.snoc q22 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q24 : Plays Segment0000.b3 21 Segment0000.b24 :=
  Plays.snoc q23 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q25 : Plays Segment0000.b3 22 Segment0000.b25 :=
  Plays.snoc q24 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q26 : Plays Segment0000.b3 23 Segment0000.b26 :=
  Plays.snoc q25 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q27 : Plays Segment0000.b3 24 Segment0000.b27 :=
  Plays.snoc q26 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q28 : Plays Segment0000.b3 25 Segment0000.b28 :=
  Plays.snoc q27 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q29 : Plays Segment0000.b3 26 Segment0000.b29 :=
  Plays.snoc q28 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q30 : Plays Segment0000.b3 27 Segment0000.b30 :=
  Plays.snoc q29 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q31 : Plays Segment0000.b3 28 Segment0000.b31 :=
  Plays.snoc q30 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem q32 : Plays Segment0000.b3 29 Segment0000.b32 :=
  Plays.snoc q31 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q33 : Plays Segment0000.b3 30 Segment0000.b33 :=
  Plays.snoc q32 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q34 : Plays Segment0000.b3 31 Segment0000.b34 :=
  Plays.snoc q33 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q35 : Plays Segment0000.b3 32 Segment0000.b35 :=
  Plays.snoc q34 ⟨.right, .i3, .i1, 4⟩ (by rfl)
theorem q36 : Plays Segment0000.b3 33 Segment0000.b36 :=
  Plays.snoc q35 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem q37 : Plays Segment0000.b3 34 Segment0000.b37 :=
  Plays.snoc q36 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q38 : Plays Segment0000.b3 35 Segment0000.b38 :=
  Plays.snoc q37 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q39 : Plays Segment0000.b3 36 Segment0000.b39 :=
  Plays.snoc q38 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q40 : Plays Segment0000.b3 37 Segment0000.b40 :=
  Plays.snoc q39 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q41 : Plays Segment0000.b3 38 Segment0000.b41 :=
  Plays.snoc q40 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q42 : Plays Segment0000.b3 39 Segment0000.b42 :=
  Plays.snoc q41 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q43 : Plays Segment0000.b3 40 Segment0000.b43 :=
  Plays.snoc q42 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q44 : Plays Segment0000.b3 41 Segment0000.b44 :=
  Plays.snoc q43 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q45 : Plays Segment0000.b3 42 Segment0000.b45 :=
  Plays.snoc q44 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q46 : Plays Segment0000.b3 43 Segment0000.b46 :=
  Plays.snoc q45 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q47 : Plays Segment0000.b3 44 Segment0000.b47 :=
  Plays.snoc q46 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem q48 : Plays Segment0000.b3 45 Segment0000.b48 :=
  Plays.snoc q47 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q49 : Plays Segment0000.b3 46 Segment0000.b49 :=
  Plays.snoc q48 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q50 : Plays Segment0000.b3 47 Segment0000.b50 :=
  Plays.snoc q49 ⟨.right, .i1, .i0, 4⟩ (by rfl)
theorem q51 : Plays Segment0000.b3 48 Segment0000.b51 :=
  Plays.snoc q50 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q52 : Plays Segment0000.b3 49 Segment0000.b52 :=
  Plays.snoc q51 ⟨.left, .i0, .i0, 4⟩ (by rfl)
theorem q53 : Plays Segment0000.b3 50 Segment0000.b53 :=
  Plays.snoc q52 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q54 : Plays Segment0000.b3 51 Segment0000.b54 :=
  Plays.snoc q53 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q55 : Plays Segment0000.b3 52 Segment0000.b55 :=
  Plays.snoc q54 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q56 : Plays Segment0000.b3 53 Segment0000.b56 :=
  Plays.snoc q55 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q57 : Plays Segment0000.b3 54 Segment0000.b57 :=
  Plays.snoc q56 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q58 : Plays Segment0000.b3 55 Segment0000.b58 :=
  Plays.snoc q57 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q59 : Plays Segment0000.b3 56 Segment0000.b59 :=
  Plays.snoc q58 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem q60 : Plays Segment0000.b3 57 Segment0000.b60 :=
  Plays.snoc q59 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q61 : Plays Segment0000.b3 58 Segment0000.b61 :=
  Plays.snoc q60 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem q62 : Plays Segment0000.b3 59 Segment0000.b62 :=
  Plays.snoc q61 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q63 : Plays Segment0000.b3 60 Segment0000.b63 :=
  Plays.snoc q62 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q64 : Plays Segment0000.b3 61 Segment0000.b64 :=
  Plays.snoc q63 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q65 : Plays Segment0000.b3 62 Segment0000.b65 :=
  Plays.snoc q64 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q66 : Plays Segment0000.b3 63 Segment0000.b66 :=
  Plays.snoc q65 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q67 : Plays Segment0000.b3 64 Segment0000.b67 :=
  Plays.snoc q66 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q68 : Plays Segment0000.b3 65 Segment0000.b68 :=
  Plays.snoc q67 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q69 : Plays Segment0000.b3 66 Segment0000.b69 :=
  Plays.snoc q68 ⟨.right, .i3, .i1, 4⟩ (by rfl)
theorem q70 : Plays Segment0000.b3 67 Segment0000.b70 :=
  Plays.snoc q69 ⟨.down, .i3, .i0, 4⟩ (by rfl)
theorem q71 : Plays Segment0000.b3 68 Segment0000.b71 :=
  Plays.snoc q70 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q72 : Plays Segment0000.b3 69 Segment0000.b72 :=
  Plays.snoc q71 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q73 : Plays Segment0000.b3 70 Segment0000.b73 :=
  Plays.snoc q72 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q74 : Plays Segment0000.b3 71 Segment0000.b74 :=
  Plays.snoc q73 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q75 : Plays Segment0000.b3 72 Segment0000.b75 :=
  Plays.snoc q74 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q76 : Plays Segment0000.b3 73 Segment0000.b76 :=
  Plays.snoc q75 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q77 : Plays Segment0000.b3 74 Segment0000.b77 :=
  Plays.snoc q76 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q78 : Plays Segment0000.b3 75 Segment0000.b78 :=
  Plays.snoc q77 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q79 : Plays Segment0000.b3 76 Segment0000.b79 :=
  Plays.snoc q78 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem q80 : Plays Segment0000.b3 77 Segment0000.b80 :=
  Plays.snoc q79 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q81 : Plays Segment0000.b3 78 Segment0000.b81 :=
  Plays.snoc q80 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q82 : Plays Segment0000.b3 79 Segment0000.b82 :=
  Plays.snoc q81 ⟨.right, .i1, .i0, 4⟩ (by rfl)
theorem q83 : Plays Segment0000.b3 80 Segment0000.b83 :=
  Plays.snoc q82 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q84 : Plays Segment0000.b3 81 Segment0000.b84 :=
  Plays.snoc q83 ⟨.left, .i0, .i0, 4⟩ (by rfl)
theorem q85 : Plays Segment0000.b3 82 Segment0000.b85 :=
  Plays.snoc q84 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q86 : Plays Segment0000.b3 83 Segment0000.b86 :=
  Plays.snoc q85 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q87 : Plays Segment0000.b3 84 Segment0000.b87 :=
  Plays.snoc q86 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q88 : Plays Segment0000.b3 85 Segment0000.b88 :=
  Plays.snoc q87 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q89 : Plays Segment0000.b3 86 Segment0000.b89 :=
  Plays.snoc q88 ⟨.left, .i1, .i0, 4⟩ (by rfl)
theorem q90 : Plays Segment0000.b3 87 Segment0000.b90 :=
  Plays.snoc q89 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q91 : Plays Segment0000.b3 88 Segment0000.b91 :=
  Plays.snoc q90 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem q92 : Plays Segment0000.b3 89 Segment0000.b92 :=
  Plays.snoc q91 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q93 : Plays Segment0000.b3 90 Segment0000.b93 :=
  Plays.snoc q92 ⟨.left, .i2, .i1, 4⟩ (by rfl)
theorem q94 : Plays Segment0000.b3 91 Segment0000.b94 :=
  Plays.snoc q93 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q95 : Plays Segment0000.b3 92 Segment0000.b95 :=
  Plays.snoc q94 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q96 : Plays Segment0000.b3 93 Segment0000.b96 :=
  Plays.snoc q95 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q97 : Plays Segment0000.b3 94 Segment0000.b97 :=
  Plays.snoc q96 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q98 : Plays Segment0000.b3 95 Segment0000.b98 :=
  Plays.snoc q97 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q99 : Plays Segment0000.b3 96 Segment0000.b99 :=
  Plays.snoc q98 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q100 : Plays Segment0000.b3 97 Segment0000.b100 :=
  Plays.snoc q99 ⟨.right, .i3, .i0, 4⟩ (by rfl)
theorem q101 : Plays Segment0000.b3 98 Segment0000.b101 :=
  Plays.snoc q100 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q102 : Plays Segment0000.b3 99 Segment0000.b102 :=
  Plays.snoc q101 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q103 : Plays Segment0000.b3 100 Segment0000.b103 :=
  Plays.snoc q102 ⟨.right, .i1, .i0, 4⟩ (by rfl)
theorem q104 : Plays Segment0000.b3 101 Segment0000.b104 :=
  Plays.snoc q103 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q105 : Plays Segment0000.b3 102 Segment0000.b105 :=
  Plays.snoc q104 ⟨.down, .i2, .i0, 4⟩ (by rfl)
theorem q106 : Plays Segment0000.b3 103 Segment0000.b106 :=
  Plays.snoc q105 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q107 : Plays Segment0000.b3 104 Segment0000.b107 :=
  Plays.snoc q106 ⟨.left, .i0, .i3, 4⟩ (by rfl)
theorem q108 : Plays Segment0000.b3 105 Segment0000.b108 :=
  Plays.snoc q107 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q109 : Plays Segment0000.b3 106 Segment0000.b109 :=
  Plays.snoc q108 ⟨.left, .i0, .i3, 4⟩ (by rfl)
theorem q110 : Plays Segment0000.b3 107 Segment0000.b110 :=
  Plays.snoc q109 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q111 : Plays Segment0000.b3 108 Segment0000.b111 :=
  Plays.snoc q110 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q112 : Plays Segment0000.b3 109 Segment0000.b112 :=
  Plays.snoc q111 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q113 : Plays Segment0000.b3 110 Segment0000.b113 :=
  Plays.snoc q112 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q114 : Plays Segment0000.b3 111 Segment0000.b114 :=
  Plays.snoc q113 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q115 : Plays Segment0000.b3 112 Segment0000.b115 :=
  Plays.snoc q114 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q116 : Plays Segment0000.b3 113 Segment0000.b116 :=
  Plays.snoc q115 ⟨.down, .i0, .i3, 4⟩ (by rfl)
theorem q117 : Plays Segment0000.b3 114 Segment0000.b117 :=
  Plays.snoc q116 ⟨.right, .i2, .i0, 4⟩ (by rfl)
theorem q118 : Plays Segment0000.b3 115 Segment0000.b118 :=
  Plays.snoc q117 ⟨.left, .i0, .i2, 4⟩ (by rfl)
theorem q119 : Plays Segment0000.b3 116 Segment0000.b119 :=
  Plays.snoc q118 ⟨.down, .i2, .i1, 4⟩ (by rfl)
theorem q120 : Plays Segment0000.b3 117 Segment0000.b120 :=
  Plays.snoc q119 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q121 : Plays Segment0000.b3 118 Segment0000.b121 :=
  Plays.snoc q120 ⟨.left, .i2, .i3, 4⟩ (by rfl)
theorem q122 : Plays Segment0000.b3 119 Segment0000.b122 :=
  Plays.snoc q121 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q123 : Plays Segment0000.b3 120 Segment0000.b123 :=
  Plays.snoc q122 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q124 : Plays Segment0000.b3 121 Segment0000.b124 :=
  Plays.snoc q123 ⟨.down, .i1, .i0, 4⟩ (by rfl)
theorem q125 : Plays Segment0000.b3 122 Segment0000.b125 :=
  Plays.snoc q124 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q126 : Plays Segment0000.b3 123 Segment0000.b126 :=
  Plays.snoc q125 ⟨.left, .i2, .i2, 4⟩ (by rfl)
theorem q127 : Plays Segment0000.b3 124 Segment0000.b127 :=
  Plays.snoc q126 ⟨.right, .i1, .i0, 4⟩ (by rfl)
theorem q128 : Plays Segment0000.b3 125 Segment0000.b128 :=
  Plays.snoc q127 ⟨.right, .i1, .i0, 4⟩ (by rfl)
theorem t0001 : Plays Segment0000.b3 125 c0001 := q128
theorem t0002 : Plays Segment0000.b3 253 c0002 :=
  Plays.append t0001 chunk0001
theorem t0003 : Plays Segment0000.b3 381 c0003 :=
  Plays.append t0002 chunk0002
theorem t0004 : Plays Segment0000.b3 509 c0004 :=
  Plays.append t0003 chunk0003
theorem t0005 : Plays Segment0000.b3 637 c0005 :=
  Plays.append t0004 chunk0004
theorem t0006 : Plays Segment0000.b3 765 c0006 :=
  Plays.append t0005 chunk0005
theorem t0007 : Plays Segment0000.b3 893 c0007 :=
  Plays.append t0006 chunk0006
theorem t0008 : Plays Segment0000.b3 1021 c0008 :=
  Plays.append t0007 chunk0007
theorem t0009 : Plays Segment0000.b3 1149 c0009 :=
  Plays.append t0008 chunk0008
theorem t0010 : Plays Segment0000.b3 1277 c0010 :=
  Plays.append t0009 chunk0009
theorem t0011 : Plays Segment0000.b3 1405 c0011 :=
  Plays.append t0010 chunk0010
theorem t0012 : Plays Segment0000.b3 1533 c0012 :=
  Plays.append t0011 chunk0011
theorem t0013 : Plays Segment0000.b3 1661 c0013 :=
  Plays.append t0012 chunk0012
theorem t0014 : Plays Segment0000.b3 1789 c0014 :=
  Plays.append t0013 chunk0013
theorem t0015 : Plays Segment0000.b3 1917 c0015 :=
  Plays.append t0014 chunk0014
theorem t0016 : Plays Segment0000.b3 2045 c0016 :=
  Plays.append t0015 chunk0015
theorem t0017 : Plays Segment0000.b3 2173 c0017 :=
  Plays.append t0016 chunk0016
theorem t0018 : Plays Segment0000.b3 2301 c0018 :=
  Plays.append t0017 chunk0017
theorem t0019 : Plays Segment0000.b3 2429 c0019 :=
  Plays.append t0018 chunk0018
theorem t0020 : Plays Segment0000.b3 2557 c0020 :=
  Plays.append t0019 chunk0019
theorem t0021 : Plays Segment0000.b3 2685 c0021 :=
  Plays.append t0020 chunk0020
theorem t0022 : Plays Segment0000.b3 2813 c0022 :=
  Plays.append t0021 chunk0021
theorem t0023 : Plays Segment0000.b3 2941 c0023 :=
  Plays.append t0022 chunk0022
theorem t0024 : Plays Segment0000.b3 3069 c0024 :=
  Plays.append t0023 chunk0023
theorem t0025 : Plays Segment0000.b3 3197 c0025 :=
  Plays.append t0024 chunk0024
theorem t0026 : Plays Segment0000.b3 3325 c0026 :=
  Plays.append t0025 chunk0025
theorem t0027 : Plays Segment0000.b3 3453 c0027 :=
  Plays.append t0026 chunk0026
theorem t0028 : Plays Segment0000.b3 3581 c0028 :=
  Plays.append t0027 chunk0027
theorem t0029 : Plays Segment0000.b3 3709 c0029 :=
  Plays.append t0028 chunk0028
theorem t0030 : Plays Segment0000.b3 3837 c0030 :=
  Plays.append t0029 chunk0029
theorem t0031 : Plays Segment0000.b3 3965 c0031 :=
  Plays.append t0030 chunk0030
theorem t0032 : Plays Segment0000.b3 4093 c0032 :=
  Plays.append t0031 chunk0031
theorem t0033 : Plays Segment0000.b3 4221 c0033 :=
  Plays.append t0032 chunk0032
theorem t0034 : Plays Segment0000.b3 4349 c0034 :=
  Plays.append t0033 chunk0033
theorem t0035 : Plays Segment0000.b3 4477 c0035 :=
  Plays.append t0034 chunk0034
theorem t0036 : Plays Segment0000.b3 4605 c0036 :=
  Plays.append t0035 chunk0035
theorem t0037 : Plays Segment0000.b3 4733 c0037 :=
  Plays.append t0036 chunk0036
theorem t0038 : Plays Segment0000.b3 4861 c0038 :=
  Plays.append t0037 chunk0037
theorem t0039 : Plays Segment0000.b3 4989 c0039 :=
  Plays.append t0038 chunk0038
theorem t0040 : Plays Segment0000.b3 5117 c0040 :=
  Plays.append t0039 chunk0039
theorem t0041 : Plays Segment0000.b3 5245 c0041 :=
  Plays.append t0040 chunk0040
theorem t0042 : Plays Segment0000.b3 5373 c0042 :=
  Plays.append t0041 chunk0041
theorem t0043 : Plays Segment0000.b3 5501 c0043 :=
  Plays.append t0042 chunk0042
theorem t0044 : Plays Segment0000.b3 5629 c0044 :=
  Plays.append t0043 chunk0043
theorem t0045 : Plays Segment0000.b3 5757 c0045 :=
  Plays.append t0044 chunk0044
theorem t0046 : Plays Segment0000.b3 5885 c0046 :=
  Plays.append t0045 chunk0045
theorem t0047 : Plays Segment0000.b3 6013 c0047 :=
  Plays.append t0046 chunk0046
theorem t0048 : Plays Segment0000.b3 6141 c0048 :=
  Plays.append t0047 chunk0047
theorem t0049 : Plays Segment0000.b3 6269 c0049 :=
  Plays.append t0048 chunk0048
theorem t0050 : Plays Segment0000.b3 6397 c0050 :=
  Plays.append t0049 chunk0049
theorem t0051 : Plays Segment0000.b3 6525 c0051 :=
  Plays.append t0050 chunk0050
theorem t0052 : Plays Segment0000.b3 6653 c0052 :=
  Plays.append t0051 chunk0051
theorem t0053 : Plays Segment0000.b3 6781 c0053 :=
  Plays.append t0052 chunk0052
theorem t0054 : Plays Segment0000.b3 6909 c0054 :=
  Plays.append t0053 chunk0053
theorem t0055 : Plays Segment0000.b3 7037 c0055 :=
  Plays.append t0054 chunk0054
theorem t0056 : Plays Segment0000.b3 7165 c0056 :=
  Plays.append t0055 chunk0055
theorem t0057 : Plays Segment0000.b3 7293 c0057 :=
  Plays.append t0056 chunk0056
theorem t0058 : Plays Segment0000.b3 7421 c0058 :=
  Plays.append t0057 chunk0057
theorem t0059 : Plays Segment0000.b3 7549 c0059 :=
  Plays.append t0058 chunk0058
theorem t0060 : Plays Segment0000.b3 7677 c0060 :=
  Plays.append t0059 chunk0059
theorem t0061 : Plays Segment0000.b3 7805 c0061 :=
  Plays.append t0060 chunk0060
theorem t0062 : Plays Segment0000.b3 7933 c0062 :=
  Plays.append t0061 chunk0061
theorem t0063 : Plays Segment0000.b3 8061 c0063 :=
  Plays.append t0062 chunk0062
theorem t0064 : Plays Segment0000.b3 8189 c0064 :=
  Plays.append t0063 chunk0063
theorem t0065 : Plays Segment0000.b3 8317 c0065 :=
  Plays.append t0064 chunk0064
theorem t0066 : Plays Segment0000.b3 8445 c0066 :=
  Plays.append t0065 chunk0065
theorem t0067 : Plays Segment0000.b3 8573 c0067 :=
  Plays.append t0066 chunk0066
theorem t0068 : Plays Segment0000.b3 8701 c0068 :=
  Plays.append t0067 chunk0067
theorem t0069 : Plays Segment0000.b3 8829 c0069 :=
  Plays.append t0068 chunk0068
theorem t0070 : Plays Segment0000.b3 8957 c0070 :=
  Plays.append t0069 chunk0069
theorem t0071 : Plays Segment0000.b3 9085 c0071 :=
  Plays.append t0070 chunk0070
theorem t0072 : Plays Segment0000.b3 9213 c0072 :=
  Plays.append t0071 chunk0071
theorem t0073 : Plays Segment0000.b3 9341 c0073 :=
  Plays.append t0072 chunk0072
theorem t0074 : Plays Segment0000.b3 9469 c0074 :=
  Plays.append t0073 chunk0073
theorem t0075 : Plays Segment0000.b3 9597 c0075 :=
  Plays.append t0074 chunk0074
theorem t0076 : Plays Segment0000.b3 9725 c0076 :=
  Plays.append t0075 chunk0075
theorem t0077 : Plays Segment0000.b3 9853 c0077 :=
  Plays.append t0076 chunk0076
theorem t0078 : Plays Segment0000.b3 9981 c0078 :=
  Plays.append t0077 chunk0077
theorem t0079 : Plays Segment0000.b3 10109 c0079 :=
  Plays.append t0078 chunk0078
theorem t0080 : Plays Segment0000.b3 10237 c0080 :=
  Plays.append t0079 chunk0079
theorem t0081 : Plays Segment0000.b3 10365 c0081 :=
  Plays.append t0080 chunk0080
theorem t0082 : Plays Segment0000.b3 10493 c0082 :=
  Plays.append t0081 chunk0081
theorem t0083 : Plays Segment0000.b3 10621 c0083 :=
  Plays.append t0082 chunk0082
theorem t0084 : Plays Segment0000.b3 10749 c0084 :=
  Plays.append t0083 chunk0083
theorem t0085 : Plays Segment0000.b3 10877 c0085 :=
  Plays.append t0084 chunk0084
theorem t0086 : Plays Segment0000.b3 11005 c0086 :=
  Plays.append t0085 chunk0085
theorem t0087 : Plays Segment0000.b3 11133 c0087 :=
  Plays.append t0086 chunk0086
theorem t0088 : Plays Segment0000.b3 11261 c0088 :=
  Plays.append t0087 chunk0087
theorem t0089 : Plays Segment0000.b3 11389 c0089 :=
  Plays.append t0088 chunk0088
theorem t0090 : Plays Segment0000.b3 11517 c0090 :=
  Plays.append t0089 chunk0089
theorem t0091 : Plays Segment0000.b3 11645 c0091 :=
  Plays.append t0090 chunk0090
theorem t0092 : Plays Segment0000.b3 11773 c0092 :=
  Plays.append t0091 chunk0091
theorem t0093 : Plays Segment0000.b3 11901 c0093 :=
  Plays.append t0092 chunk0092
theorem t0094 : Plays Segment0000.b3 12029 c0094 :=
  Plays.append t0093 chunk0093
theorem t0095 : Plays Segment0000.b3 12157 c0095 :=
  Plays.append t0094 chunk0094
theorem t0096 : Plays Segment0000.b3 12285 c0096 :=
  Plays.append t0095 chunk0095
theorem t0097 : Plays Segment0000.b3 12413 c0097 :=
  Plays.append t0096 chunk0096
theorem t0098 : Plays Segment0000.b3 12541 c0098 :=
  Plays.append t0097 chunk0097
theorem t0099 : Plays Segment0000.b3 12669 c0099 :=
  Plays.append t0098 chunk0098
theorem t0100 : Plays Segment0000.b3 12797 c0100 :=
  Plays.append t0099 chunk0099
theorem t0101 : Plays Segment0000.b3 12925 c0101 :=
  Plays.append t0100 chunk0100
theorem t0102 : Plays Segment0000.b3 13053 c0102 :=
  Plays.append t0101 chunk0101
theorem t0103 : Plays Segment0000.b3 13181 c0103 :=
  Plays.append t0102 chunk0102
theorem t0104 : Plays Segment0000.b3 13309 c0104 :=
  Plays.append t0103 chunk0103
theorem t0105 : Plays Segment0000.b3 13437 c0105 :=
  Plays.append t0104 chunk0104
theorem t0106 : Plays Segment0000.b3 13565 c0106 :=
  Plays.append t0105 chunk0105
theorem t0107 : Plays Segment0000.b3 13693 c0107 :=
  Plays.append t0106 chunk0106
theorem t0108 : Plays Segment0000.b3 13821 c0108 :=
  Plays.append t0107 chunk0107
theorem t0109 : Plays Segment0000.b3 13949 c0109 :=
  Plays.append t0108 chunk0108
theorem t0110 : Plays Segment0000.b3 14077 c0110 :=
  Plays.append t0109 chunk0109
theorem t0111 : Plays Segment0000.b3 14205 c0111 :=
  Plays.append t0110 chunk0110
theorem t0112 : Plays Segment0000.b3 14333 c0112 :=
  Plays.append t0111 chunk0111
theorem t0113 : Plays Segment0000.b3 14461 c0113 :=
  Plays.append t0112 chunk0112
theorem t0114 : Plays Segment0000.b3 14589 c0114 :=
  Plays.append t0113 chunk0113
theorem t0115 : Plays Segment0000.b3 14717 c0115 :=
  Plays.append t0114 chunk0114
theorem t0116 : Plays Segment0000.b3 14845 c0116 :=
  Plays.append t0115 chunk0115
theorem t0117 : Plays Segment0000.b3 14973 c0117 :=
  Plays.append t0116 chunk0116
theorem t0118 : Plays Segment0000.b3 15101 c0118 :=
  Plays.append t0117 chunk0117
theorem t0119 : Plays Segment0000.b3 15229 c0119 :=
  Plays.append t0118 chunk0118
theorem t0120 : Plays Segment0000.b3 15357 c0120 :=
  Plays.append t0119 chunk0119
theorem t0121 : Plays Segment0000.b3 15485 c0121 :=
  Plays.append t0120 chunk0120
theorem t0122 : Plays Segment0000.b3 15613 c0122 :=
  Plays.append t0121 chunk0121
theorem t0123 : Plays Segment0000.b3 15741 c0123 :=
  Plays.append t0122 chunk0122
theorem t0124 : Plays Segment0000.b3 15869 c0124 :=
  Plays.append t0123 chunk0123
theorem t0125 : Plays Segment0000.b3 15997 c0125 :=
  Plays.append t0124 chunk0124
theorem t0126 : Plays Segment0000.b3 16125 c0126 :=
  Plays.append t0125 chunk0125
theorem t0127 : Plays Segment0000.b3 16253 c0127 :=
  Plays.append t0126 chunk0126
theorem t0128 : Plays Segment0000.b3 16381 c0128 :=
  Plays.append t0127 chunk0127
theorem t0129 : Plays Segment0000.b3 16509 c0129 :=
  Plays.append t0128 chunk0128
theorem t0130 : Plays Segment0000.b3 16637 c0130 :=
  Plays.append t0129 chunk0129
theorem t0131 : Plays Segment0000.b3 16765 c0131 :=
  Plays.append t0130 chunk0130
theorem t0132 : Plays Segment0000.b3 16893 c0132 :=
  Plays.append t0131 chunk0131
theorem t0133 : Plays Segment0000.b3 17021 c0133 :=
  Plays.append t0132 chunk0132
theorem t0134 : Plays Segment0000.b3 17149 c0134 :=
  Plays.append t0133 chunk0133
theorem t0135 : Plays Segment0000.b3 17277 c0135 :=
  Plays.append t0134 chunk0134
theorem t0136 : Plays Segment0000.b3 17405 c0136 :=
  Plays.append t0135 chunk0135
theorem t0137 : Plays Segment0000.b3 17533 c0137 :=
  Plays.append t0136 chunk0136
theorem t0138 : Plays Segment0000.b3 17661 c0138 :=
  Plays.append t0137 chunk0137
theorem t0139 : Plays Segment0000.b3 17789 c0139 :=
  Plays.append t0138 chunk0138
theorem t0140 : Plays Segment0000.b3 17917 c0140 :=
  Plays.append t0139 chunk0139
theorem t0141 : Plays Segment0000.b3 18045 c0141 :=
  Plays.append t0140 chunk0140
theorem t0142 : Plays Segment0000.b3 18173 c0142 :=
  Plays.append t0141 chunk0141
theorem t0143 : Plays Segment0000.b3 18301 c0143 :=
  Plays.append t0142 chunk0142
theorem t0144 : Plays Segment0000.b3 18429 c0144 :=
  Plays.append t0143 chunk0143
theorem t0145 : Plays Segment0000.b3 18557 c0145 :=
  Plays.append t0144 chunk0144
theorem t0146 : Plays Segment0000.b3 18685 c0146 :=
  Plays.append t0145 chunk0145
theorem t0147 : Plays Segment0000.b3 18813 c0147 :=
  Plays.append t0146 chunk0146
theorem t0148 : Plays Segment0000.b3 18941 c0148 :=
  Plays.append t0147 chunk0147
theorem t0149 : Plays Segment0000.b3 19069 c0149 :=
  Plays.append t0148 chunk0148
theorem t0150 : Plays Segment0000.b3 19197 c0150 :=
  Plays.append t0149 chunk0149
theorem t0151 : Plays Segment0000.b3 19325 c0151 :=
  Plays.append t0150 chunk0150
theorem t0152 : Plays Segment0000.b3 19453 c0152 :=
  Plays.append t0151 chunk0151
theorem t0153 : Plays Segment0000.b3 19581 c0153 :=
  Plays.append t0152 chunk0152
theorem t0154 : Plays Segment0000.b3 19709 c0154 :=
  Plays.append t0153 chunk0153
theorem t0155 : Plays Segment0000.b3 19837 c0155 :=
  Plays.append t0154 chunk0154
theorem t0156 : Plays Segment0000.b3 19965 c0156 :=
  Plays.append t0155 chunk0155
theorem t0157 : Plays Segment0000.b3 20093 c0157 :=
  Plays.append t0156 chunk0156
theorem t0158 : Plays Segment0000.b3 20221 c0158 :=
  Plays.append t0157 chunk0157
theorem t0159 : Plays Segment0000.b3 20349 c0159 :=
  Plays.append t0158 chunk0158
theorem t0160 : Plays Segment0000.b3 20477 c0160 :=
  Plays.append t0159 chunk0159
theorem t0161 : Plays Segment0000.b3 20605 c0161 :=
  Plays.append t0160 chunk0160
theorem t0162 : Plays Segment0000.b3 20733 c0162 :=
  Plays.append t0161 chunk0161
theorem t0163 : Plays Segment0000.b3 20861 c0163 :=
  Plays.append t0162 chunk0162
theorem t0164 : Plays Segment0000.b3 20989 c0164 :=
  Plays.append t0163 chunk0163
theorem t0165 : Plays Segment0000.b3 21117 c0165 :=
  Plays.append t0164 chunk0164
theorem t0166 : Plays Segment0000.b3 21245 c0166 :=
  Plays.append t0165 chunk0165
theorem t0167 : Plays Segment0000.b3 21373 c0167 :=
  Plays.append t0166 chunk0166
theorem t0168 : Plays Segment0000.b3 21501 c0168 :=
  Plays.append t0167 chunk0167
theorem t0169 : Plays Segment0000.b3 21629 c0169 :=
  Plays.append t0168 chunk0168
theorem t0170 : Plays Segment0000.b3 21757 c0170 :=
  Plays.append t0169 chunk0169
theorem t0171 : Plays Segment0000.b3 21885 c0171 :=
  Plays.append t0170 chunk0170
theorem t0172 : Plays Segment0000.b3 22013 c0172 :=
  Plays.append t0171 chunk0171
theorem t0173 : Plays Segment0000.b3 22141 c0173 :=
  Plays.append t0172 chunk0172
theorem t0174 : Plays Segment0000.b3 22269 c0174 :=
  Plays.append t0173 chunk0173
theorem t0175 : Plays Segment0000.b3 22397 c0175 :=
  Plays.append t0174 chunk0174
theorem t0176 : Plays Segment0000.b3 22525 c0176 :=
  Plays.append t0175 chunk0175
theorem t0177 : Plays Segment0000.b3 22653 c0177 :=
  Plays.append t0176 chunk0176
theorem t0178 : Plays Segment0000.b3 22781 c0178 :=
  Plays.append t0177 chunk0177
theorem t0179 : Plays Segment0000.b3 22909 c0179 :=
  Plays.append t0178 chunk0178
theorem t0180 : Plays Segment0000.b3 23037 c0180 :=
  Plays.append t0179 chunk0179
theorem t0181 : Plays Segment0000.b3 23165 c0181 :=
  Plays.append t0180 chunk0180
theorem t0182 : Plays Segment0000.b3 23293 c0182 :=
  Plays.append t0181 chunk0181
theorem t0183 : Plays Segment0000.b3 23421 c0183 :=
  Plays.append t0182 chunk0182
theorem t0184 : Plays Segment0000.b3 23549 c0184 :=
  Plays.append t0183 chunk0183
theorem t0185 : Plays Segment0000.b3 23677 c0185 :=
  Plays.append t0184 chunk0184
theorem t0186 : Plays Segment0000.b3 23805 c0186 :=
  Plays.append t0185 chunk0185
theorem t0187 : Plays Segment0000.b3 23933 c0187 :=
  Plays.append t0186 chunk0186
theorem t0188 : Plays Segment0000.b3 24061 c0188 :=
  Plays.append t0187 chunk0187
theorem t0189 : Plays Segment0000.b3 24189 c0189 :=
  Plays.append t0188 chunk0188
theorem t0190 : Plays Segment0000.b3 24317 c0190 :=
  Plays.append t0189 chunk0189
theorem t0191 : Plays Segment0000.b3 24445 c0191 :=
  Plays.append t0190 chunk0190
theorem t0192 : Plays Segment0000.b3 24573 c0192 :=
  Plays.append t0191 chunk0191
theorem t0193 : Plays Segment0000.b3 24701 c0193 :=
  Plays.append t0192 chunk0192
theorem t0194 : Plays Segment0000.b3 24829 c0194 :=
  Plays.append t0193 chunk0193
theorem t0195 : Plays Segment0000.b3 24957 c0195 :=
  Plays.append t0194 chunk0194
theorem t0196 : Plays Segment0000.b3 25085 c0196 :=
  Plays.append t0195 chunk0195
theorem t0197 : Plays Segment0000.b3 25213 c0197 :=
  Plays.append t0196 chunk0196
theorem t0198 : Plays Segment0000.b3 25341 c0198 :=
  Plays.append t0197 chunk0197
theorem t0199 : Plays Segment0000.b3 25469 c0199 :=
  Plays.append t0198 chunk0198
theorem t0200 : Plays Segment0000.b3 25597 c0200 :=
  Plays.append t0199 chunk0199
theorem t0201 : Plays Segment0000.b3 25725 c0201 :=
  Plays.append t0200 chunk0200
theorem t0202 : Plays Segment0000.b3 25853 c0202 :=
  Plays.append t0201 chunk0201
theorem t0203 : Plays Segment0000.b3 25981 c0203 :=
  Plays.append t0202 chunk0202
theorem t0204 : Plays Segment0000.b3 26109 c0204 :=
  Plays.append t0203 chunk0203
theorem t0205 : Plays Segment0000.b3 26237 c0205 :=
  Plays.append t0204 chunk0204
theorem t0206 : Plays Segment0000.b3 26365 c0206 :=
  Plays.append t0205 chunk0205
theorem t0207 : Plays Segment0000.b3 26493 c0207 :=
  Plays.append t0206 chunk0206
theorem t0208 : Plays Segment0000.b3 26621 c0208 :=
  Plays.append t0207 chunk0207
theorem t0209 : Plays Segment0000.b3 26749 c0209 :=
  Plays.append t0208 chunk0208
theorem t0210 : Plays Segment0000.b3 26877 c0210 :=
  Plays.append t0209 chunk0209
theorem t0211 : Plays Segment0000.b3 27005 c0211 :=
  Plays.append t0210 chunk0210
theorem t0212 : Plays Segment0000.b3 27133 c0212 :=
  Plays.append t0211 chunk0211
theorem t0213 : Plays Segment0000.b3 27261 c0213 :=
  Plays.append t0212 chunk0212
theorem t0214 : Plays Segment0000.b3 27389 c0214 :=
  Plays.append t0213 chunk0213
theorem t0215 : Plays Segment0000.b3 27517 c0215 :=
  Plays.append t0214 chunk0214
theorem t0216 : Plays Segment0000.b3 27645 c0216 :=
  Plays.append t0215 chunk0215
theorem t0217 : Plays Segment0000.b3 27773 c0217 :=
  Plays.append t0216 chunk0216
theorem t0218 : Plays Segment0000.b3 27901 c0218 :=
  Plays.append t0217 chunk0217
theorem t0219 : Plays Segment0000.b3 28029 c0219 :=
  Plays.append t0218 chunk0218
theorem t0220 : Plays Segment0000.b3 28157 c0220 :=
  Plays.append t0219 chunk0219
theorem t0221 : Plays Segment0000.b3 28285 c0221 :=
  Plays.append t0220 chunk0220
theorem t0222 : Plays Segment0000.b3 28413 c0222 :=
  Plays.append t0221 chunk0221
theorem t0223 : Plays Segment0000.b3 28541 c0223 :=
  Plays.append t0222 chunk0222
theorem t0224 : Plays Segment0000.b3 28669 c0224 :=
  Plays.append t0223 chunk0223
theorem t0225 : Plays Segment0000.b3 28797 c0225 :=
  Plays.append t0224 chunk0224
theorem t0226 : Plays Segment0000.b3 28925 c0226 :=
  Plays.append t0225 chunk0225
theorem t0227 : Plays Segment0000.b3 29053 c0227 :=
  Plays.append t0226 chunk0226
theorem t0228 : Plays Segment0000.b3 29181 c0228 :=
  Plays.append t0227 chunk0227
theorem t0229 : Plays Segment0000.b3 29309 c0229 :=
  Plays.append t0228 chunk0228
theorem t0230 : Plays Segment0000.b3 29437 c0230 :=
  Plays.append t0229 chunk0229
theorem t0231 : Plays Segment0000.b3 29565 c0231 :=
  Plays.append t0230 chunk0230
theorem t0232 : Plays Segment0000.b3 29693 c0232 :=
  Plays.append t0231 chunk0231
theorem t0233 : Plays Segment0000.b3 29821 c0233 :=
  Plays.append t0232 chunk0232
theorem t0234 : Plays Segment0000.b3 29949 c0234 :=
  Plays.append t0233 chunk0233
theorem t0235 : Plays Segment0000.b3 30077 c0235 :=
  Plays.append t0234 chunk0234
theorem t0236 : Plays Segment0000.b3 30205 c0236 :=
  Plays.append t0235 chunk0235
theorem t0237 : Plays Segment0000.b3 30333 c0237 :=
  Plays.append t0236 chunk0236
theorem t0238 : Plays Segment0000.b3 30461 c0238 :=
  Plays.append t0237 chunk0237
theorem t0239 : Plays Segment0000.b3 30589 c0239 :=
  Plays.append t0238 chunk0238
theorem t0240 : Plays Segment0000.b3 30717 c0240 :=
  Plays.append t0239 chunk0239
theorem t0241 : Plays Segment0000.b3 30845 c0241 :=
  Plays.append t0240 chunk0240
theorem t0242 : Plays Segment0000.b3 30973 c0242 :=
  Plays.append t0241 chunk0241
theorem t0243 : Plays Segment0000.b3 31101 c0243 :=
  Plays.append t0242 chunk0242
theorem t0244 : Plays Segment0000.b3 31229 c0244 :=
  Plays.append t0243 chunk0243
theorem t0245 : Plays Segment0000.b3 31357 c0245 :=
  Plays.append t0244 chunk0244
theorem t0246 : Plays Segment0000.b3 31485 c0246 :=
  Plays.append t0245 chunk0245
theorem t0247 : Plays Segment0000.b3 31613 c0247 :=
  Plays.append t0246 chunk0246
theorem t0248 : Plays Segment0000.b3 31741 c0248 :=
  Plays.append t0247 chunk0247
theorem t0249 : Plays Segment0000.b3 31869 c0249 :=
  Plays.append t0248 chunk0248
theorem t0250 : Plays Segment0000.b3 31997 c0250 :=
  Plays.append t0249 chunk0249
theorem t0251 : Plays Segment0000.b3 32125 c0251 :=
  Plays.append t0250 chunk0250
theorem t0252 : Plays Segment0000.b3 32253 c0252 :=
  Plays.append t0251 chunk0251
theorem t0253 : Plays Segment0000.b3 32381 c0253 :=
  Plays.append t0252 chunk0252
theorem t0254 : Plays Segment0000.b3 32509 c0254 :=
  Plays.append t0253 chunk0253
theorem t0255 : Plays Segment0000.b3 32637 c0255 :=
  Plays.append t0254 chunk0254
theorem t0256 : Plays Segment0000.b3 32763 c0256 :=
  Plays.append t0255 chunk0255
theorem suffix3 : Plays Segment0000.b3 32778 MinimumMass.terminal := Plays.append t0256 MinimumMass.fold
theorem suffix2 : Plays Segment0000.b2 32779 MinimumMass.terminal :=
  Plays.append (Plays.snoc Plays.refl ⟨.right, .i2, .i2, 4⟩ (by rfl)) suffix3
theorem suffix1 : Plays Segment0000.b1 32780 MinimumMass.terminal :=
  Plays.append (Plays.snoc Plays.refl ⟨.left, .i2, .i3, 4⟩ (by rfl)) suffix2
theorem suffix0 : Plays Segment0000.b0 32781 MinimumMass.terminal :=
  Plays.append (Plays.snoc Plays.refl ⟨.right, .i3, .i2, 4⟩ (by rfl)) suffix1
def end0 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,16,8⟩,⟨0,0,0,131072⟩⟩
theorem hit0 : end0.Contains 131072 := MinimumMass.contains_terminal
theorem mass0 : end0.mass = 131102 := by rfl
def join0_0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩⟩
theorem tail0_0 : Plays join0_0 32781 end0 := suffix0
def join0_1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,8⟩⟩
theorem tail0_1 : Plays join0_1 32780 end0 := suffix1
def join0_2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨4,8,0,0⟩⟩
theorem tail0_2 : Plays join0_2 32779 end0 := suffix2
def join0_3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem tail0_3 : Plays join0_3 32778 end0 := suffix3
def end1 : Board := ⟨⟨0,0,0,2⟩,⟨0,0,0,0⟩,⟨0,16,0,0⟩,⟨131072,8,4,0⟩⟩
theorem hit1 : end1.Contains 131072 := MinimumMass.contains_terminal.rotate
theorem mass1 : end1.mass = 131102 := by rfl
def join1_0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem tail1_0 : Plays join1_0 32781 end1 := suffix0.rotate
def join1_1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨8,0,0,0⟩⟩
theorem tail1_1 : Plays join1_1 32780 end1 := suffix1.rotate
def join1_2 : Board := ⟨⟨4,0,0,0⟩,⟨8,0,0,0⟩,⟨0,0,0,0⟩,⟨0,4,0,0⟩⟩
theorem tail1_2 : Plays join1_2 32779 end1 := suffix2.rotate
def join1_3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem tail1_3 : Plays join1_3 32778 end1 := suffix3.rotate
def end2 : Board := ⟨⟨131072,0,0,0⟩,⟨8,16,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem hit2 : end2.Contains 131072 := MinimumMass.contains_terminal.rotate.rotate
theorem mass2 : end2.mass = 131102 := by rfl
def join2_0 : Board := ⟨⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail2_0 : Plays join2_0 32781 end2 := suffix0.rotate.rotate
def join2_1 : Board := ⟨⟨8,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail2_1 : Plays join2_1 32780 end2 := suffix1.rotate.rotate
def join2_2 : Board := ⟨⟨0,0,8,4⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail2_2 : Plays join2_2 32779 end2 := suffix2.rotate.rotate
def join2_3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail2_3 : Plays join2_3 32778 end2 := suffix3.rotate.rotate
def end3 : Board := ⟨⟨0,4,8,131072⟩,⟨0,0,16,0⟩,⟨0,0,0,0⟩,⟨2,0,0,0⟩⟩
theorem hit3 : end3.Contains 131072 := MinimumMass.contains_terminal.rotate.rotate.rotate
theorem mass3 : end3.mass = 131102 := by rfl
def join3_0 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail3_0 : Plays join3_0 32781 end3 := suffix0.rotate.rotate.rotate
def join3_1 : Board := ⟨⟨0,0,0,8⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail3_1 : Plays join3_1 32780 end3 := suffix1.rotate.rotate.rotate
def join3_2 : Board := ⟨⟨0,0,4,0⟩,⟨0,0,0,0⟩,⟨0,0,0,8⟩,⟨0,0,0,4⟩⟩
theorem tail3_2 : Plays join3_2 32779 end3 := suffix2.rotate.rotate.rotate
def join3_3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail3_3 : Plays join3_3 32778 end3 := suffix3.rotate.rotate.rotate
def end4 : Board := ⟨⟨0,0,0,2⟩,⟨4,0,0,0⟩,⟨8,16,0,0⟩,⟨131072,0,0,0⟩⟩
theorem hit4 : end4.Contains 131072 := MinimumMass.contains_terminal.mirror
theorem mass4 : end4.mass = 131102 := by rfl
def join4_0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩⟩
theorem tail4_0 : Plays join4_0 32781 end4 := suffix0.mirror
def join4_1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨8,4,0,0⟩⟩
theorem tail4_1 : Plays join4_1 32780 end4 := suffix1.mirror
def join4_2 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,8,4⟩⟩
theorem tail4_2 : Plays join4_2 32779 end4 := suffix2.mirror
def join4_3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨4,4,0,0⟩,⟨8,4,0,0⟩⟩
theorem tail4_3 : Plays join4_3 32778 end4 := suffix3.mirror
def end5 : Board := ⟨⟨131072,8,4,0⟩,⟨0,16,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,2⟩⟩
theorem hit5 : end5.Contains 131072 := MinimumMass.contains_terminal.mirror.rotate
theorem mass5 : end5.mass = 131102 := by rfl
def join5_0 : Board := ⟨⟨4,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail5_0 : Plays join5_0 32781 end5 := suffix0.mirror.rotate
def join5_1 : Board := ⟨⟨8,0,0,0⟩,⟨4,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail5_1 : Plays join5_1 32780 end5 := suffix1.mirror.rotate
def join5_2 : Board := ⟨⟨0,4,0,0⟩,⟨0,0,0,0⟩,⟨8,0,0,0⟩,⟨4,0,0,0⟩⟩
theorem tail5_2 : Plays join5_2 32779 end5 := suffix2.mirror.rotate
def join5_3 : Board := ⟨⟨8,4,0,0⟩,⟨4,4,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail5_3 : Plays join5_3 32778 end5 := suffix3.mirror.rotate
def end6 : Board := ⟨⟨0,0,0,131072⟩,⟨0,0,16,8⟩,⟨0,0,0,4⟩,⟨2,0,0,0⟩⟩
theorem hit6 : end6.Contains 131072 := MinimumMass.contains_terminal.mirror.rotate.rotate
theorem mass6 : end6.mass = 131102 := by rfl
def join6_0 : Board := ⟨⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail6_0 : Plays join6_0 32781 end6 := suffix0.mirror.rotate.rotate
def join6_1 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail6_1 : Plays join6_1 32780 end6 := suffix1.mirror.rotate.rotate
def join6_2 : Board := ⟨⟨4,8,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail6_2 : Plays join6_2 32779 end6 := suffix2.mirror.rotate.rotate
def join6_3 : Board := ⟨⟨0,0,4,8⟩,⟨0,0,4,4⟩,⟨0,0,0,0⟩,⟨0,0,0,0⟩⟩
theorem tail6_3 : Plays join6_3 32778 end6 := suffix3.mirror.rotate.rotate
def end7 : Board := ⟨⟨2,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,16,0⟩,⟨0,4,8,131072⟩⟩
theorem hit7 : end7.Contains 131072 := MinimumMass.contains_terminal.mirror.rotate.rotate.rotate
theorem mass7 : end7.mass = 131102 := by rfl
def join7_0 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,4⟩⟩
theorem tail7_0 : Plays join7_0 32781 end7 := suffix0.mirror.rotate.rotate.rotate
def join7_1 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,0,4⟩,⟨0,0,0,8⟩⟩
theorem tail7_1 : Plays join7_1 32780 end7 := suffix1.mirror.rotate.rotate.rotate
def join7_2 : Board := ⟨⟨0,0,0,4⟩,⟨0,0,0,8⟩,⟨0,0,0,0⟩,⟨0,0,4,0⟩⟩
theorem tail7_2 : Plays join7_2 32779 end7 := suffix2.mirror.rotate.rotate.rotate
def join7_3 : Board := ⟨⟨0,0,0,0⟩,⟨0,0,0,0⟩,⟨0,0,4,4⟩,⟨0,0,4,8⟩⟩
theorem tail7_3 : Plays join7_3 32778 end7 := suffix3.mirror.rotate.rotate.rotate

#print axioms tail7_3
end Game2048.OpeningTails
