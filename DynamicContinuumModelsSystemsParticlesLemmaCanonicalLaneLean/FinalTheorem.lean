import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BridgeLemmas.BridgeLemmas
import HautevilleHouse.GateLemmas.GateLemmas

namespace HautevilleHouse
namespace FinalTheorem

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_theorem_closure (A : AdmissibleClass) : ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FinalTheorem
end HautevilleHouse