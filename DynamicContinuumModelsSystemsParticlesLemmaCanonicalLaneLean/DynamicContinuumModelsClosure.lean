import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.SystemsParticlesLemmaLayer.SystemsParticlesLemmaLayer

namespace HautevilleHouse
namespace DynamicContinuumModelsClosure

def dynamicContinuumAdmissibleClass : AdmissibleClass where
  object := { sourceKey := "dynamicContinuum", theoremObject := "SystemsParticlesLemma", claimBoundary := "carried" }
  endpointSatisfied := True
  remainderRecorded := True
  gateWitness := Or.inl trivial

def DynamicContinuumModelsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem dynamic_continuum_models_closure (A : AdmissibleClass) : DynamicContinuumModelsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem source_systems_particles_lemma_closed_under_admissible :
    bridgeClosed dynamicContinuumAdmissibleClass ∧ gateClosed dynamicContinuumAdmissibleClass := by
  refine And.intro ?_ ?_
  · exact bridge_from_admissible_class dynamicContinuumAdmissibleClass
  · exact gate_from_admissible_class dynamicContinuumAdmissibleClass

end DynamicContinuumModelsClosure
end HautevilleHouse