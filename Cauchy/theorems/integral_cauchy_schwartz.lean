import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.NNReal
import Mathlib.Tactic
import Mathlib.Analysis.Complex.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral
import Mathlib.Order.CompleteLattice
import Mathlib.Topology.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral
import Mathlib.Analysis.SpecialFunctions.Integrals
import Mathlib.Analysis.Convolution
import Mathlib.Data.Complex.Exponential
import Mathlib.Analysis.InnerProductSpace.Basic

namespace theorems

theorem integral_inequality {a b : ℝ} {f : ℝ → ℂ} (h_cont : ContinuousOn f (Set.Icc a b)) : --If I change ℝ by Set.Icc a b errors occur (??)
 Complex.abs (∫ x in a..b, f x) ≤ (b - a) * sSup ((Complex.abs ∘ f) '' (Set.Icc a b)):=
by
let θ : ℝ  := Complex.arg (∫ x in a..b, f x)
let M : ℝ  := sSup ((Complex.abs ∘ f) '' (Set.Icc a b))
sorry

-- this theorem already exists! see intervalIntegral.norm_integral_le_of_norm_le_const
-- and I think it will be difficult to prove otherwise
