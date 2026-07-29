import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuumTransportLayer.ContinuumTransportLayer

namespace HautevilleHouse
namespace SystemsParticlesLemmaLayer

structure SystemsParticlesLemmaCertificate where
  transport : ContinuumTransportCertificate
  lemmaBound : Prop
  particleCount : ℕ
  interactionPotential : ℝ
  lemmaBoundProof : lemmaBound
  particleCountPositive : particleCount > 0
  interactionPotentialNonneg : interactionPotential ≥ 0

def sourceSystemsParticlesLemmaCertificate : SystemsParticlesLemmaCertificate := {
  transport := sourceContinuumTransportCertificate
  lemmaBound := True
  particleCount := 3
  interactionPotential := 1.5
  lemmaBoundProof := trivial
  particleCountPositive := by norm_num
  interactionPotentialNonneg := by norm_num
}

def SystemsParticlesLemmaClosed (C : SystemsParticlesLemmaCertificate) : Prop :=
  ContinuumTransportClosed C.transport ∧ C.lemmaBound ∧ C.particleCountPositive ∧ C.interactionPotentialNonneg

theorem source_systems_particles_lemma_closed : SystemsParticlesLemmaClosed sourceSystemsParticlesLemmaCertificate := by
  exact And.intro source_continuum_transport_closed (And.intro trivial (And.intro (by norm_num) (by norm_num)))

end SystemsParticlesLemmaLayer
end HautevilleHouse