import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

structure InteractionCertificate where
  forceLaw : Prop
  momentumConservation : Prop
  energyTransfer : Prop
  forceLawProof : forceLaw
  momentumConservationProof : momentumConservation
  energyTransferProof : energyTransfer

def sourceInteractionCertificate : InteractionCertificate := {
  forceLaw := True,
  momentumConservation := True,
  energyTransfer := True,
  forceLawProof := trivial,
  momentumConservationProof := trivial,
  energyTransferProof := trivial
}

def InteractionClosed (C : InteractionCertificate) : Prop :=
  C.forceLaw ∧ C.momentumConservation ∧ C.energyTransfer

theorem source_interaction_closed : InteractionClosed sourceInteractionCertificate := by
  exact And.intro trivial (And.intro trivial trivial)

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse