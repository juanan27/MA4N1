import Mathlib.Tactic
import Cauchy.definitions.triangle
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic

open definitions

lemma boundary_in_set {T : Triangle} : TriangularBoundary T ⊆ TriangularSet T := by
  unfold TriangularBoundary TriangularSet
  repeat intro x
  simp at *
  have ⟨a, b, c, d, e, f, g, _, i⟩ := x
  exact ⟨a, b, c, d, e, f, g, i⟩
