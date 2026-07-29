import DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean.DynamicLemmaLayer
import DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean.BridgeLemmas
import DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean.GateLemmas
import DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean.FinalTheorem

/-!
# Lemma Certificate

This module packages the dynamic lemma certificate into the admissible-class bridge.
It defines the admissible object and the final closure.
-/

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

def lemmaAdmittedObject : AdmittedTheoremObject := {
  object := theoremSpecificObject
  localWitness := "Dynamic continuum lemma with particle system convergence."
  bridgeEvidence := "source-derived Lean certificate fields"
  sourceKeyChecked := rfl
  theoremObjectChecked := rfl
}

def lemmaAdmissibleClass : AdmissibleClass := {
  object := lemmaAdmittedObject
  endpointSatisfied := ContinuumFieldClosed primitiveContinuumField
  remainderRecorded := formalizationCertificate.theoremBoundaryOpen = true
  gateWitness := Or.inl primitive_continuum_field_closed_checked
}

def DynamicContinuumLemmaClosure : Prop :=
  DynamicLemmaClosed sourceDynamicLemmaCertificate ∧
  ConstrainedTheoremClosure lemmaAdmissibleClass

theorem dynamic_continuum_lemma_closure_checked :
    DynamicContinuumLemmaClosure := by
  exact And.intro source_dynamic_lemma_closed
    (constrained_theorem_closure lemmaAdmissibleClass)

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse