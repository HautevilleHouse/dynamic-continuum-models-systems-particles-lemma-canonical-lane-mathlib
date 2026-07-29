import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean

structure ParticleSystem where
  mass : ℝ
  position : ℝ
  velocity : ℝ

def continuumParticleFlow (systems : List ParticleSystem) : ℝ := 
  List.sum (systems.map (fun s => s.mass * s.velocity))

structure ContinuumModel where
  density : ℝ → ℝ
  velocityField : ℝ → ℝ
  continuityHolds : Prop

structure ParticleContinuumBridge where
  particleSystem : List ParticleSystem
  continuumModel : ContinuumModel
  bridgeClosed : Prop


def particleContinuumAdmissible (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

end DynamicContinuumModelsSystemsParticlesLemmaCanonicalLaneLean
end HautevilleHouse
