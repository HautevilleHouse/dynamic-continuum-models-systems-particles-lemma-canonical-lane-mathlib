import DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean.MathlibStatement
import Mathlib.Analysis.Calculus.MeanInequalities
import Mathlib.Analysis.InnerProductSpace.Basic

/-!
# Continuum Mechanics Objects

This module provides continuum-mechanical structures: deformation gradients,
stress tensors, and the balance laws used in the dynamic lemma.
-/

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

abbrev Point := Fin 3 → ℝ
abbrev DeformationGradient := Point → Fin 3 → Fin 3 → ℝ
abbrev StressTensor := Point → Fin 3 → Fin 3 → ℝ
abbrev VelocityField := Point → Fin 3 → ℝ

def zeroDeformationGradient : DeformationGradient := fun _ _ _ => 0
def zeroStressTensor : StressTensor := fun _ _ _ => 0
def zeroVelocityField : VelocityField := fun _ _ => 0

structure ContinuumMechanicsOperators where
  deformation : VelocityField → DeformationGradient
  stress : DeformationGradient → StressTensor
  bodyForce : Point → Fin 3 → ℝ
  divergence : StressTensor → VelocityField
  divergenceIdempotent : ∀ S, divergence (stress (deformation (divergence S))) = divergence S

def primitiveContinuumMechanicsOperators : ContinuumMechanicsOperators := {
  deformation := fun _ => zeroDeformationGradient
  stress := fun _ => zeroStressTensor
  bodyForce := fun _ _ => 0
  divergence := fun _ => zeroVelocityField
  divergenceIdempotent := by
    intro S
    rfl
}

structure ContinuumField where
  velocity : VelocityField
  operators : ContinuumMechanicsOperators

def primitiveContinuumField : ContinuumField := {
  velocity := zeroVelocityField
  operators := primitiveContinuumMechanicsOperators
}

def DeformationClosed (F : ContinuumField) : Prop :=
  F.operators.deformation F.velocity = zeroDeformationGradient

def BalanceClosed (F : ContinuumField) : Prop :=
  F.operators.divergence (F.operators.stress (F.operators.deformation F.velocity)) = zeroVelocityField

def ContinuumFieldClosed (F : ContinuumField) : Prop :=
  DeformationClosed F ∧ BalanceClosed F

theorem primitive_deformation_closed_checked :
    DeformationClosed primitiveContinuumField := by
  unfold DeformationClosed
  rfl

theorem primitive_balance_closed_checked :
    BalanceClosed primitiveContinuumField := by
  unfold BalanceClosed
  rfl

theorem primitive_continuum_field_closed_checked :
    ContinuumFieldClosed primitiveContinuumField := by
  refine And.intro ?_ ?_
  · exact primitive_deformation_closed_checked
  · exact primitive_balance_closed_checked

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse