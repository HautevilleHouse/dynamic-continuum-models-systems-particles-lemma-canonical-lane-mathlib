import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

structure FluxCertificate where
  inflowRate : ℝ
  outflowRate : ℝ
  netFlux : ℝ
  fluxClosed : Prop

def sourceFluxCertificate : FluxCertificate := {
  inflowRate := 1.0
  outflowRate := 1.0
  netFlux := 0.0
  fluxClosed := rfl
}

def FluxClosed (C : FluxCertificate) : Prop :=
  C.netFlux = C.inflowRate - C.outflowRate

theorem source_flux_closed : FluxClosed sourceFluxCertificate := by
  unfold FluxClosed sourceFluxCertificate
  simp

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse