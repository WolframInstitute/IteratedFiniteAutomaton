invertible22 = InvertibleAutomatonCodes[{2, 2}];

swapStates = rule |-> ({3 - #[[1, 1]], #[[1, 2]]} -> {3 - #[[2, 1]], #[[2, 2]]}) & /@ rule;

(* the code and the rule are two presentations of the same automaton *)

VerificationTest[
	AllTrue[Range[0, 255], m |-> AutomatonCodeFromRule[AutomatonRuleFromCode[{m, {2, 2}}]] === {m, {2, 2}}],
	True
]

VerificationTest[
	AllTrue[IteratedFiniteAutomatonSample[{3, 2}, 40], m |-> AutomatonCodeFromRule[AutomatonRuleFromCode[{m, {3, 2}}]] === {m, {3, 2}}],
	True
]

VerificationTest[
	AllTrue[IteratedFiniteAutomatonSample[{2, 3}, 40], m |-> AutomatonCodeFromRule[AutomatonRuleFromCode[{m, {2, 3}}]] === {m, {2, 3}}],
	True
]

(* invertible means the outputs at each state permute the symbols, so there are (k!)^s s^(s k)
   of them: 4 * 16 on 2 states and 2 symbols, 36 * 64 on 2 states and 3 symbols *)

VerificationTest[
	{Length[invertible22], Length[InvertibleAutomatonCodes[{2, 3}]]},
	{(2!) ^ 2 * 2 ^ 4, (3!) ^ 2 * 2 ^ 6}
]

VerificationTest[
	AllTrue[Range[0, 255],
		m |-> InvertibleAutomatonQ[{m, {2, 2}}] ===
			AllTrue[GroupBy[AutomatonRuleFromCode[{m, {2, 2}}], r |-> r[[1, 1]]], Sort[#[[All, 2, 2]]] === {0, 1} &]],
	True
]

(* the canonical code is the least in the orbit under relabelling states and symbols *)

VerificationTest[
	AllTrue[invertible22, m |-> CanonicalAutomatonCode[CanonicalAutomatonCode[{m, {2, 2}}]] === CanonicalAutomatonCode[{m, {2, 2}}]],
	True
]

VerificationTest[
	AllTrue[invertible22, m |-> First[CanonicalAutomatonCode[{m, {2, 2}}]] <= m],
	True
]

VerificationTest[
	AllTrue[invertible22, m |-> CanonicalAutomatonCode[swapStates @ AutomatonRuleFromCode[{m, {2, 2}}]] === CanonicalAutomatonCode[{m, {2, 2}}]],
	True
]

VerificationTest[
	Length @ Union[CanonicalAutomatonCode[{#, {2, 2}}] & /@ invertible22],
	24
]
