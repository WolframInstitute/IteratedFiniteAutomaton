addingMachine = {62, {2, 2}};
grigorchuk = {8950703898, {5, 2}};

(* an element is a list of {coefficient, word} pairs *)
one = {{1, {}}};
a = {{1, {1}}};
onePlusA = {{1, {}}, {1, {1}}};
oneMinusA = {{1, {}}, {-1, {1}}};

grigorchukPerms = AutomatonLevelPermutations[grigorchuk, 5];

(* the group-ring product *)

VerificationTest[
	{GroupRingLevelProduct[grigorchukPerms, {}, a], GroupRingLevelProduct[grigorchukPerms, a, {}]},
	{<||>, <||>}
]

VerificationTest[
	GroupRingLevelProduct[grigorchukPerms, one, {{3, {1}}}],
	<|grigorchukPerms[1] -> 3|>
]

VerificationTest[
	GroupRingLevelProduct[grigorchukPerms, a, {{1, {-1}}}],
	<|Range[2 ^ 5] -> 1|>
]

VerificationTest[
	GroupRingLevelProduct[grigorchukPerms, {{2, {1}}}, {{3, {2}}}],
	3 * GroupRingLevelProduct[grigorchukPerms, {{2, {1}}}, {{1, {2}}}]
]

VerificationTest[
	GroupRingLevelProduct[grigorchukPerms, a, {{5, {2}}}, Modulus -> 5],
	<||>
]

VerificationTest[
	GroupRingLevelProduct[grigorchuk, 5, a, {{1, {2}}}] === GroupRingLevelProduct[grigorchukPerms, a, {{1, {2}}}],
	True
]

(* the generator a of the Grigorchuk automaton is an involution, so (1 - a)(1 + a) = 1 - a^2 = 0.
   The adding machine generates Z, where 1 - a^2 is not zero *)

VerificationTest[
	AllTrue[Range[2, 8], l |-> GroupRingLevelProduct[grigorchuk, l, oneMinusA, onePlusA] === <||>],
	True
]

VerificationTest[
	AllTrue[Range[2, 8], l |-> Sort @ Values @ GroupRingLevelProduct[addingMachine, l, oneMinusA, onePlusA] === {-1, 1}],
	True
]

(* idempotents: 0 and 1 always, and 2(1 + a) over F_3, where 2 inverts 2 and a^2 = 1 *)

VerificationTest[
	{GroupRingIdempotentQ[grigorchuk, {}, 5], GroupRingIdempotentQ[grigorchuk, one, 5]},
	{True, True}
]

VerificationTest[
	AllTrue[Range[2, 8], l |-> GroupRingIdempotentQ[grigorchuk, {{2, {}}, {2, {1}}}, l, Modulus -> 3]],
	True
]

VerificationTest[
	AnyTrue[Range[2, 8], l |-> GroupRingIdempotentQ[grigorchuk, onePlusA, l, Modulus -> 2]],
	False
]

VerificationTest[
	AnyTrue[Range[2, 8], l |-> GroupRingIdempotentQ[addingMachine, {{2, {}}, {2, {1}}}, l, Modulus -> 3]],
	False
]

(* the search returns idempotents, one per group-ring element, and Z has none but 0 and 1 *)

VerificationTest[
	AllTrue[GroupRingIdempotentSearch[grigorchuk, 1, {0, 1, 2}, 4, Modulus -> 3],
		element |-> GroupRingIdempotentQ[grigorchuk, element, 4, Modulus -> 3]],
	True
]

VerificationTest[
	MemberQ[
		KeySort @ GroupRingLevelProduct[grigorchuk, 4, #, one, Modulus -> 3] & /@ GroupRingIdempotentSearch[grigorchuk, 1, {0, 1, 2}, 4, Modulus -> 3],
		KeySort @ GroupRingLevelProduct[grigorchuk, 4, {{2, {}}, {2, {1}}}, one, Modulus -> 3]],
	True
]

VerificationTest[
	{GroupRingIdempotentSearch[addingMachine, 1, {0, 1, 2}, 5, Modulus -> 3],
	 GroupRingIdempotentSearch[addingMachine, 1, {-1, 0, 1}, 5]},
	{{}, {}}
]

(* survival along a level tower.  Grigorchuk is torsion, so idempotents survive; Z is
   torsion free and its survivor set is empty, which is the Kaplansky test in miniature *)

VerificationTest[
	GroupRingIdempotentSurvival[grigorchuk, 1, Range[3, 7], Modulus -> 3]["Survivors"] =!= {},
	True
]

VerificationTest[
	AllTrue[GroupRingIdempotentSurvival[grigorchuk, 1, Range[3, 7], Modulus -> 3]["Survivors"],
		element |-> GroupRingIdempotentQ[grigorchuk, element, 7, Modulus -> 3]],
	True
]

VerificationTest[
	{GroupRingIdempotentSurvival[addingMachine, 1, Range[3, 7]]["Survivors"],
	 GroupRingIdempotentSurvival[addingMachine, 1, Range[3, 7], Modulus -> 3]["Survivors"]},
	{{}, {}}
]

VerificationTest[
	With[{counts = Last /@ GroupRingIdempotentSurvival[grigorchuk, 1, Range[3, 7], Modulus -> 3]["Counts"]},
		counts === ReverseSort[counts]],
	True
]

VerificationTest[
	AllTrue[GroupRingIdempotentSurvival[grigorchuk, 2, Range[3, 6], MaxTerms -> 3]["Survivors"], Length[#] <= 3 &],
	True
]

(* the left annihilator is a nullspace, since A B = 0 is linear in B *)

VerificationTest[
	GroupRingLeftAnnihilator[grigorchuk, one, Prepend[AutomatonGroupBall[grigorchuk, 1, 6], {}], {3}, Modulus -> 2],
	{}
]

VerificationTest[
	AllTrue[{2, 3, 5},
		p |-> GroupRingLeftAnnihilator[grigorchuk, onePlusA, Prepend[AutomatonGroupBall[grigorchuk, 1, 6], {}], Range[3, 6], Modulus -> p] =!= {}],
	True
]

VerificationTest[
	AllTrue[{2, 3, 5},
		p |-> GroupRingLeftAnnihilator[addingMachine, onePlusA, Prepend[AutomatonGroupBall[addingMachine, 1, 6], {}], Range[3, 6], Modulus -> p] === {}],
	True
]

VerificationTest[
	With[{support = Prepend[AutomatonGroupBall[grigorchuk, 1, 6], {}]},
		AllTrue[GroupRingLeftAnnihilator[grigorchuk, onePlusA, support, Range[3, 6], Modulus -> 2],
			b |-> GroupRingLevelProduct[grigorchuk, 6, onePlusA, DeleteCases[Transpose[{b, support}], {0, _}], Modulus -> 2] === <||>]],
	True
]

(* the zero-divisor search: every survivor comes with a witness B satisfying A B = 0 *)

VerificationTest[
	GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 8]]["Survivors"] =!= {},
	True
]

VerificationTest[
	With[{found = GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 8]]},
		AllTrue[Transpose[{found["Survivors"], found["Annihilators"]}],
			pair |-> Last[pair] =!= {} && GroupRingLevelProduct[grigorchuk, 8, First[pair], Last[pair], Modulus -> 2] === <||>]],
	True
]

VerificationTest[
	{GroupRingZeroDivisorSurvival[addingMachine, 1, Range[3, 8]]["Survivors"],
	 GroupRingZeroDivisorSurvival[addingMachine, 1, Range[3, 8], Modulus -> 5]["Survivors"]},
	{{}, {}}
]

(* the tower method and the stacked-nullspace method decide the same candidates *)

VerificationTest[
	Sort @ GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 8]]["Survivors"] ===
		Sort @ GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 8], Method -> "Annihilator"]["Survivors"],
	True
]

VerificationTest[
	GroupRingZeroDivisorSurvival[addingMachine, 1, Range[3, 8], Method -> "Annihilator"]["Survivors"],
	{}
]

VerificationTest[
	AllTrue[GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 8], MaxTerms -> 2]["Survivors"], Length[#] <= 2 &],
	True
]

VerificationTest[
	With[{support = Prepend[AutomatonGroupBall[grigorchuk, 1, 8], {}]},
		GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 8], MaxTerms -> Length[support]]["Survivors"] ===
			GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 8]]["Survivors"]],
	True
]

VerificationTest[
	With[{counts = Last /@ GroupRingZeroDivisorSurvival[grigorchuk, 1, Range[3, 10]]["Counts"]},
		counts === ReverseSort[counts]],
	True
]
