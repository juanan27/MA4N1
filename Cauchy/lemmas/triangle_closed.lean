import Mathlib.Data.Complex.Basic
import Mathlib.Tactic
import Cauchy.definitions.triangle

open definitions

-- acc very difficult
lemma triangle_closed {T : Triangle} : IsClosed $ TriangularSet T := by
  refine closure_eq_iff_isClosed.mp ?_

  sorry
