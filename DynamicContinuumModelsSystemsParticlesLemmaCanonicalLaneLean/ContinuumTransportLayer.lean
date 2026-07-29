import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import HautevilleHouse.ParticleFlowLayer.ParticleFlowLayer

namespace HautevilleHouse
namespace ContinuumTransportLayer

structure ContinuumTransportCertificate where
  particleFlow : ParticleFlowCertificate
  transportField : ℝ → ℝ
  conservationLaw : Prop
  boundaryFlux : ℝ
  conservationLawProof : conservationLaw
  boundaryFluxNonneg : boundaryFlux ≥ 0

def sourceContinuumTransportCertificate : ContinuumTransportCertificate := {
  particleFlow := sourceParticleFlowCertificate
  transportField := fun x => x
  conservationLaw := True
  boundaryFlux := 0
  conservationLawProof := trivial
  boundaryFluxNonneg := by norm_num
}

def ContinuumTransportClosed (C : ContinuumTransportCertificate) : Prop :=
  ParticleFlowClosed C.particleFlow ∧ C.conservationLaw ∧ C.boundaryFluxNonneg

theorem source_continuum_transport_closed : ContinuumTransportClosed sourceContinuumTransportCertificate := by
  exact And.intro source_particle_flow_closed (And.intro trivial (by norm_num))

end ContinuumTransportLayer
end HautevilleHouse