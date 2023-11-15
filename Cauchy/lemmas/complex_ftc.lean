lemma complex_ftc (z w : ℂ )(f : ℂ → ℂ) (γ : Path z w) 
: pathIntegral1 z w (deriv f) γ = f w -f z := by
unfold pathIntegral1
unfold aux
simp

sorry
