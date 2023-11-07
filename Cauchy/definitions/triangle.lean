import Mathlib.Data.Complex.Basic
import Mathlib.Data.Set.Basic
import Cauchy.helpers.linear_paths
import Mathlib.Topology.UnitInterval

namespace definitions
open helpers
open unitInterval

structure Triangle where
  a : ℂ
  b : ℂ
  c : ℂ

def nonTrivial (triangle : Triangle) : Prop :=
  ¬ ∃ t : ℝ, (triangle.a - triangle.b) * t = triangle.c

-- this should be computable!
noncomputable def subTriangle (triangle : Triangle) : Triangle :=
  { a := 0.5 * (triangle.b + triangle.a)
    b := 0.5 * (triangle.c + triangle.b)
    c := 0.5 * (triangle.a + triangle.c) : Triangle }

-- this should be computable!
noncomputable def path (triangle : Triangle) : helpers.ComplexPath triangle.a triangle.a :=
  let p1 := linear_path_a_b triangle.a triangle.b
  let p2 := linear_path_a_b triangle.b triangle.c
  let p3 := linear_path_a_b triangle.c triangle.a
  Path.trans (Path.trans p1 p2) p3

def TriangularSet {triangle : Triangle} : Set ℂ :=
  {z | ∃ (t₁ t₂ t₃ : ℝ), t₁ ≥ 0 ∧ t₂ ≥ 0 ∧ t₃ ≥ 0 ∧
    t₁ + t₂ + t₃ = 1 ∧
    (z = t₁*triangle.a + t₂*triangle.b + t₃*triangle.c) }

end definitions
