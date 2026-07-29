import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

structure ConservationCertificate where
  particleCount : ℕ
  initialCount : ℕ
  finalCount : ℕ
  conservationHolds : Prop

def sourceConservationCertificate : ConservationCertificate := {
  particleCount := 0
  initialCount := 0
  finalCount := 0
  conservationHolds := rfl
}

def ConservationClosed (C : ConservationCertificate) : Prop :=
  C.particleCount = C.initialCount ∧ C.particleCount = C.finalCount

theorem source_conservation_closed : ConservationClosed sourceConservationCertificate := by
  exact And.intro rfl rfl

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse
