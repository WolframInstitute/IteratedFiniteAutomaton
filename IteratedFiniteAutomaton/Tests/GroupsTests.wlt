addingMachine = {62, {2, 2}};
grigorchuk = {8950703898, {5, 2}};
lamplighter = {156, {2, 2}};

(* the adding machine generates Z, acting on T_L as a single 2^L-cycle *)

VerificationTest[
	AutomatonWordOrders[addingMachine, {1}, Range[8]],
	2 ^ Range[8]
]

VerificationTest[
	Table[AutomatonElementCount[addingMachine, r, 6], {r, 4}],
	2 Range[4] + 1
]

VerificationTest[
	Table[Length @ AutomatonGroupBall[addingMachine, r, 6], {r, 3}],
	2 Range[3]
]

VerificationTest[
	AutomatonAbelianQ[addingMachine, 4],
	True
]

(* the word ball is the ball in the free group on s generators: 2s (2s - 1)^(n - 1) words of
   length n, independent of the automaton *)

VerificationTest[
	Table[Length @ AutomatonWordBall[addingMachine, r], {r, 3}],
	Accumulate @ Table[4 * 3 ^ (n - 1), {n, 3}]
]

VerificationTest[
	Table[Length @ AutomatonWordBall[grigorchuk, r], {r, 3}],
	Accumulate @ Table[10 * 9 ^ (n - 1), {n, 3}]
]

VerificationTest[
	AllTrue[AutomatonWordBall[grigorchuk, 3], word |-> NoneTrue[Partition[word, 2, 1], First[#] == -Last[#] &]],
	True
]

(* the Grigorchuk group: four involutions and the identity, with |ab| = 16 *)

VerificationTest[
	Table[First @ AutomatonWordOrders[grigorchuk, {s}, {6}], {s, 5}],
	{2, 2, 2, 2, 1}
]

VerificationTest[
	Last @ AutomatonWordOrders[grigorchuk, {1, 2}, Range[5, 8]],
	16
]

VerificationTest[
	AutomatonAbelianQ[grigorchuk, 4],
	False
]

(* the nucleus stabilizes exactly because the Grigorchuk automaton is contracting *)

VerificationTest[
	Length /@ AutomatonNucleus[grigorchuk, 2, 6, 5],
	{11, 5, 5, 5, 5, 5, 5}
]

(* orders are nondecreasing in the level, and the lamplighter shows they can plateau and then
   resume, which is why the torsion-free test is only a candidate filter *)

VerificationTest[
	AutomatonWordOrders[lamplighter, {1}, Range[8]],
	{2, 4, 4, 8, 8, 8, 8, 16}
]

VerificationTest[
	AllTrue[AutomatonWordBall[grigorchuk, 2], word |-> OrderedQ @ AutomatonWordOrders[grigorchuk, word, Range[6]]],
	True
]

VerificationTest[
	{AutomatonTorsionFreeCandidateQ[addingMachine, 2, {5, 7}],
	 AutomatonTorsionFreeCandidateQ[grigorchuk, 2, {5, 7}],
	 AutomatonTorsionFreeCandidateQ[lamplighter, 2, {5, 7}]},
	{True, False, False}
]

(* words act by composition, and an inverse letter by the inverse permutation *)

VerificationTest[
	AllTrue[Range[5],
		s |-> AutomatonWordPermutation[grigorchuk, 5, {s, -s}] === Range[2 ^ 5]],
	True
]

VerificationTest[
	AutomatonWordPermutation[AutomatonLevelPermutations[grigorchuk, 5], {1, 2, -1}] ===
		AutomatonWordPermutation[grigorchuk, 5, {1, 2, -1}],
	True
]

(* the wreath recursion and IteratedFiniteAutomatonFromWreath are mutually inverse; rule lists
   are compared through their code, since the two order the transitions differently *)

VerificationTest[
	AllTrue[InvertibleAutomatonCodes[{2, 2}],
		m |-> AutomatonCodeFromRule[IteratedFiniteAutomatonFromWreath[AutomatonWreathRecursion[{m, {2, 2}}], 1]["Rule"]] === {m, {2, 2}}],
	True
]

(* the printable form is the presentation as published: a = sigma, b = (a, c), c = (a, d), d = (1, b) *)

VerificationTest[
	AutomatonWreathRecursion[grigorchuk, Method -> "String"],
	{"a = \[Sigma](e, e)", "b = (a, c)", "c = (a, d)", "d = (e, b)", "e = (e, e)"}
]

(* sections: the table covers every generator and every inverse generator at every symbol *)

VerificationTest[
	Length @ AutomatonSectionTable[grigorchuk],
	2 * 5 * 2
]

VerificationTest[
	AllTrue[Tuples[{0, 1}, 3],
		treeWord |-> AutomatonSection[grigorchuk, {2}, treeWord] ===
			Fold[First @ AutomatonWordSection[AutomatonSectionTable[grigorchuk], #1, #2] &, {2}, treeWord]],
	True
]

(* the BGKMNSS number is a bijection from the 3-state binary automata onto 1, ..., 5832 *)

VerificationTest[
	Sort[BGKMNSSNumber[{#, {3, 2}}] & /@ InvertibleAutomatonCodes[{3, 2}]],
	Range[5832]
]

VerificationTest[
	AllTrue[IteratedFiniteAutomatonSample[{3, 2}, 30],
		m |-> BGKMNSSNumber[{m, {3, 2}}] === BGKMNSSNumber[AutomatonRuleFromCode[{m, {3, 2}}]]],
	True
]

(* the fingerprint stratifies by commutativity and ball growth *)

VerificationTest[
	AutomatonGroupFingerprint[addingMachine, 6],
	<|"Code" -> 62, "Abelian" -> True, "BallGrowth" -> 2 Range[4] + 1|>
]

(* the word problem is decided in G, not in a level quotient: a^4 acts trivially on T_2 yet
   generates 4 Z inside Z = <a> *)

VerificationTest[
	{AutomatonWordPermutation[addingMachine, 2, ConstantArray[1, 4]] === Range[4],
	 AutomatonWordIdentityQ[addingMachine, ConstantArray[1, 4]]},
	{True, False}
]

VerificationTest[
	{AutomatonWordIdentityQ[addingMachine, {1, -1}], AutomatonWordIdentityQ[addingMachine, {}], AutomatonWordIdentityQ[addingMachine, {1}]},
	{True, True, False}
]

(* Grigorchuk relations become theorems in G: the four involutions, bcd = 1, and |ab| = 16 exactly *)

VerificationTest[
	Table[AutomatonWordIdentityQ[grigorchuk, {s, s}], {s, 4}],
	{True, True, True, True}
]

VerificationTest[
	AutomatonWordIdentityQ[grigorchuk, {2, 3, 4}],
	True
]

VerificationTest[
	{AutomatonWordIdentityQ[grigorchuk, Flatten @ ConstantArray[{1, 2}, 8]],
	 AutomatonWordIdentityQ[grigorchuk, Flatten @ ConstantArray[{1, 2}, 16]]},
	{False, True}
]

(* equality across words of different lengths: bc = d in the Klein four-group on b, c, d *)

VerificationTest[
	{AutomatonWordEqualQ[grigorchuk, {2, 3}, {4}], AutomatonWordEqualQ[grigorchuk, {1}, {2}]},
	{True, False}
]

(* torsion certified inside an infinite group: the lamplighter's a b^-1 is an involution in G *)

VerificationTest[
	AutomatonWordIdentityQ[lamplighter, {1, -2, 1, -2}],
	True
]

(* the section closure is closed under sections, freely reduced, and no longer than the word *)

VerificationTest[
	With[{closure = AutomatonWordSectionClosure[grigorchuk, {1, 2}]},
		{AllTrue[Union @@ Values[closure][[All, All, 1]], KeyExistsQ[closure, #] &],
		 AllTrue[Keys[closure], word |-> NoneTrue[Partition[word, 2, 1], First[#] == -Last[#] &]],
		 Max[Length /@ Keys[closure]] <= 2}],
	{True, True, True}
]

(* the word as an automaton acts as the word *)

VerificationTest[
	AutomatonLevelPermutations[AutomatonRuleFromWord[grigorchuk, {1, 2}], 4][1],
	AutomatonWordPermutation[grigorchuk, 4, {1, 2}]
]

(* exact overloads: dropping the level argument answers in G, not in a quotient *)

VerificationTest[
	Table[AutomatonElementCount[addingMachine, r], {r, 4}],
	2 Range[4] + 1
]

VerificationTest[
	{AutomatonElementCount[addingMachine, 8], AutomatonElementCount[addingMachine, 8, 2]},
	{17, 4}
]

VerificationTest[
	Length @ AutomatonGroupBall[addingMachine, 3],
	6
]

VerificationTest[
	{AutomatonAbelianQ[addingMachine], AutomatonAbelianQ[grigorchuk]},
	{True, False}
]

VerificationTest[
	AutomatonGroupFingerprint[addingMachine],
	<|"Code" -> 62, "Abelian" -> True, "BallGrowth" -> 2 Range[4] + 1|>
]

(* shortest certified relators: the adding machine's second state is trivial in G, the Grigorchuk
   trivial state e, and the lamplighter involution (a b^-1)^2 in its four reduced forms *)

VerificationTest[
	FindAutomatonRelations[addingMachine, 2],
	{{-2}, {2}}
]

VerificationTest[
	FindAutomatonRelations[grigorchuk, 1],
	{{-5}, {5}}
]

VerificationTest[
	FindAutomatonRelations[lamplighter, 2],
	{{-2, 1, -2, 1}, {-1, 2, -1, 2}, {1, -2, 1, -2}, {2, -1, 2, -1}}
]

(* the Aleshin automaton, certified in G: no relator of length <= 6, and ball growth exactly
   that of F_3 where the level-6 quotient undercounts by 3% at radius 3 *)

VerificationTest[
	{FindAutomatonRelations[{5125, {3, 2}}, 3], Table[AutomatonElementCount[{5125, {3, 2}}, r], {r, 3}]},
	{{}, {7, 37, 187}}
]
