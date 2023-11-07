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

-- this should be computable!
noncomputable def path (triangle : Triangle) : helpers.ComplexPath triangle.a triangle.a :=
  let p1 := linear_path_a_b triangle.a triangle.b
  let p2 := linear_path_a_b triangle.b triangle.c
  let p3 := linear_path_a_b triangle.c triangle.a
  Path.trans (Path.trans p1 p2) p3

end definitions
