import Cauchy.definitions.triangle
import Mathlib.Data.Complex.Basic
import Mathlib.Algebra.Field.Defs
import Mathlib.Tactic
import Cauchy.lemmas.triangle_inequality
import Cauchy.lemmas.complex_real_norm_equiv
import Mathlib.Topology.Connected.PathConnected
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Data.Complex.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.MeasureTheory.Integral.Bochner
import Mathlib.MeasureTheory.Integral.FundThmCalculus
import Mathlib.Analysis.Calculus.Deriv.Comp
import Mathlib.Data.Set.Intervals.UnorderedInterval
import Mathlib.MeasureTheory.Integral.SetIntegral
import Mathlib.MeasureTheory.Integral.IntervalIntegral

-- Probably there are more imports than what we actually need for this lemma

lemma aux1 {f : ℂ → ℂ} {γ : ℝ → ℂ} (h : DifferentiableAt ℝ (f ∘ γ) x) :
    DifferentiableAt ℂ f (γ x) := by
  sorry

open Set
open Nat Real MeasureTheory Set Filter Function intervalIntegral Interval
lemma complex_ftc (f : ℂ → ℂ) (γ : ℝ → ℂ)
    (hf_deriv : ∀ x ∈ (Set.uIcc 0 1), DifferentiableAt ℝ (f ∘ γ) x)
    (hγ_deriv : ∀ x ∈ (Set.uIcc 0 1), DifferentiableAt ℝ γ x)
    (h_int : IntervalIntegrable (deriv (f ∘ γ)) volume 0 1) :
    ∫ y in (0)..(1), deriv f (γ y) * deriv γ y = f (γ 1) - f (γ 0) := by
  have : ∀ y ∈ (Set.uIcc 0 1), deriv f (γ y) * deriv γ y = deriv (f ∘ γ) y := by
    intro y hy
    rw [deriv.comp]
    · exact aux1 (hf_deriv y hy)
    · exact hγ_deriv y hy
  rw [integral_congr this, integral_deriv_eq_sub hf_deriv h_int]
  trivial
