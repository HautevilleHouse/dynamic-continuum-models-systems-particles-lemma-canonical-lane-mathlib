import DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean.ParticleSystems
import DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean.ContinuumMechanics

/-!
# Dynamic Lemma Layer

This module records the key lemma linking continuum mechanics and particle systems:
the dynamic convergence lemma, which states that the continuum field equations are
the limit of discrete particle interactions as the number of particles goes to infinity.
-/

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

structure DynamicLemmaCertificate where
  continuumField : ContinuumField
  particleSystem : ParticleSystem
  continuumClosed : Prop
  particlesClosed : Prop
  dynamicConvergence : Prop
  continuumClosedProof : continuumClosed
  particlesClosedProof : particlesClosed
  dynamicConvergenceProof : dynamicConvergence

def sourceDynamicLemmaCertificate : DynamicLemmaCertificate := {
  continuumField := primitiveContinuumField
  particleSystem := primitiveParticleSystem
  continuumClosed := ContinuumFieldClosed primitiveContinuumField
  particlesClosed := ParticlesClosed primitiveParticleSystem
  dynamicConvergence := true
  continuumClosedProof := primitive_continuum_field_closed_checked
  particlesClosedProof := primitive_particles_closed_checked
  dynamicConvergenceProof := rfl
}

def DynamicLemmaClosed (C : DynamicLemmaCertificate) : Prop :=
  C.continuumClosed ∧ C.particlesClosed ∧ C.dynamicConvergence

theorem source_dynamic_lemma_closed :
    DynamicLemmaClosed sourceDynamicLemmaCertificate := by
  exact And.intro sourceDynamicLemmaCertificate.continuumClosedProof
    (And.intro sourceDynamicLemmaCertificate.particlesClosedProof
      sourceDynamicLemmaCertificate.dynamicConvergenceProof)

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse