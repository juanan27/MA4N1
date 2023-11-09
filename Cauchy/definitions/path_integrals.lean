import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Data.Complex.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.Normed.Field.Basic

namespace definitions

---Explicitly building maps (as f(x,y)+g(x,y)*i)

def complexMap (f g : ℝ × ℝ → ℝ) : ℂ → ℂ :=
λ z => Complex.mk (f (z.re, z.im)) (g (z.re, z.im) )

--- Defining Paths from its parametrization

def isPath (f g : ℝ → ℝ) : Prop :=
  ContinuousOn f (Set.Icc 0 1) ∧
  ContinuousOn g (Set.Icc 0 1)

def isClosedPath (f g : ℝ → ℝ ): Prop :=
 isPath f g  ∧ f 1 = f 0 ∧ g 1 = g 0
def isC1Path (f g : ℝ → ℝ ): Prop :=
 isPath f g  ∧ DifferentiableOn ℝ f (Set.Icc 0 1) ∧ DifferentiableOn ℝ g (Set.Icc 0 1)

--- Defining the lenght of a path (whether as before, with parametrizations, or as a \R \r \C map)

noncomputable def lengthOfPath (f g: ℝ → ℝ ) (h: isC1Path f g) : ℝ :=
 have aux : ℝ → ℝ := λ x => Real.sqrt ((deriv f x)^2 + (deriv g x)^2)
 ∫t in (Set.Icc 0 1), aux t

noncomputable def arc_length {a b : ℝ} {γ : ℝ → ℂ} : ℝ := ∫ t in a..b, norm ((deriv γ) t) 

--- (Juan) In the second definition I didn't use a lambda function, which may make us avoid some problems (?). Errors keep coming, that's why I used noncomputable as well
--- I'm pretty there has to be some way in which we can solve this problem. We may ask Damiano is this will affect when proving theorems or lemmas

noncomputable def lengthOfPath1 (f : ℝ → ℂ) (h: DifferentiableOn ℝ f (Set.Icc 0 1) )  : ℝ :=
 have aux : ℝ → ℝ := λ x => Complex.abs (f x)
 ∫t in (Set.Icc 0 1), aux t

noncomputable def ComplexPath (f g : ℝ → ℝ): ℝ → ℂ := λ x => Complex.mk (f x) (g x)

noncomputable def DerivativePath (f g : ℝ → ℝ) (h: isC1Path f g) : ℝ → ℂ := ComplexPath (deriv f) (deriv g)

noncomputable def pathIntegral (f: ℂ → ℂ ) (α β : ℝ → ℝ ): ℂ  :=
have aux : ℝ → ℂ := λ t => ((Function.comp f  (ComplexPath α β)) t) * ((ComplexPath (deriv α) (deriv β)) t)
∫t in (Set.Icc 0 1), aux t

---The hypothesis of differentiability seem like the are not needed even if we define the derivative of the function (?)

---The noncomputable before some definitions is to avoid errors

end definitions
