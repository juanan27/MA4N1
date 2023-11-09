import Mathlib.Data.Complex.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Topology.ContinuousFunction.Basic
import Mathlib.Topology.Connected.PathConnected
import Mathlib.Topology.UnitInterval
import Cauchy.definitions.path_integrals

namespace helpers

open unitInterval

def ComplexPath := Path (X := ℂ)

def linear_path_a_b (a b : ℂ) : ComplexPath a b where -- this thing took me like 2/3 hours
  toFun := λ t : I => (1 - t)*a + t*b
  source' := by simp
  target' := by simp


end helpers
