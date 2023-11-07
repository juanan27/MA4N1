-- Average of four numbers

import Mathlib.Data.Real.Basic
import Mathlib.Tactic

namespace lemmas

lemma mean_leq_max (a b c d : ℝ) : a+b+c+d ≤ 4*max a (max b (max c d)) := by
have h1 : a ≤ max a (max b (max c d)) := by apply le_max_left
have h2 : b ≤ max a (max b (max c d)) :=
  by
    rw[max_left_comm]
    apply le_max_left
have h3: c ≤ max a (max b (max c d)) :=
  by
    rw[max_left_comm b c, max_left_comm]
    apply le_max_left
have h4: d ≤ max a (max b (max c d)):=
  by
    rw[max_comm c d, max_left_comm b d, max_left_comm]
    apply le_max_left
linarith

end lemmas
