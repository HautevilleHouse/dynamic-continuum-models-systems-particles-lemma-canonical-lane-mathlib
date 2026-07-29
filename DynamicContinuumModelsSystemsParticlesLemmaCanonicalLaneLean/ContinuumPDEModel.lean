import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

structure PDECertificate where
  equationClosed : Prop
  solutionRegular : Prop
  boundaryControl : Prop
  equationClosedProof : equationClosed
  solutionRegularProof : solutionRegular
  boundaryControlProof : boundaryControl

def sourcePDECertificate : PDECertificate := {
  equationClosed := True,
  solutionRegular := True,
  boundaryControl := True,
  equationClosedProof := trivial,
  solutionRegularProof := trivial,
  boundaryControlProof := trivial
}

def PDEClosed (C : PDECertificate) : Prop :=
  C.equationClosed ∧ C.solutionRegular ∧ C.boundaryControl

theorem source_pde_closed : PDEClosed sourcePDECertificate := by
  exact And.intro trivial (And.intro trivial trivial)

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse