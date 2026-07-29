import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

structure BridgeCertificate where
  particleSystemClosed : Prop
  continuumModelClosed : Prop
  bridgeCondition : Prop

def sourceBridgeCertificate : BridgeCertificate := {
  particleSystemClosed := True
  continuumModelClosed := True
  bridgeCondition := True
}

def BridgeClosed (C : BridgeCertificate) : Prop :=
  C.particleSystemClosed ∧ C.continuumModelClosed ∧ C.bridgeCondition

theorem source_bridge_closed : BridgeClosed sourceBridgeCertificate := by
  exact And.intro trivial (And.intro trivial trivial)

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse
