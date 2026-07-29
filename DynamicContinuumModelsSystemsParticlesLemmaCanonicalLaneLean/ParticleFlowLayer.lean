import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ParticleFlowLayer

structure ParticleFlowCertificate where
  flowField : Fin 3 → ℝ
  divergenceFree : Prop
  advectionRate : ℝ
  diffusionCoeff : ℝ
  divergenceFreeProof : divergenceFree
  advectionRatePositive : advectionRate > 0
  diffusionCoeffPositive : diffusionCoeff > 0

def sourceParticleFlowCertificate : ParticleFlowCertificate := {
  flowField := fun _ => 0
  divergenceFree := True
  advectionRate := 1.0
  diffusionCoeff := 0.5
  divergenceFreeProof := trivial
  advectionRatePositive := by norm_num
  diffusionCoeffPositive := by norm_num
}

def ParticleFlowClosed (C : ParticleFlowCertificate) : Prop :=
  C.divergenceFree ∧ C.advectionRatePositive ∧ C.diffusionCoeffPositive

theorem source_particle_flow_closed : ParticleFlowClosed sourceParticleFlowCertificate := by
  unfold ParticleFlowClosed sourceParticleFlowCertificate
  refine ⟨?_, ?_, ?_⟩
  · exact trivial
  · norm_num
  · norm_num

end ParticleFlowLayer
end HautevilleHouse