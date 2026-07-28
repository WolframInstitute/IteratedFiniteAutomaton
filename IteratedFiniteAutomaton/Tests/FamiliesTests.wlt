(* the three constructive families of the many-state regime, each asserted against its design claim *)

levelGroupOrder[rule_, level_] := With[{perms = Values @ AutomatonLevelPermutations[rule, level]},
	GroupOrder @ PermutationGroup[PermutationCycles /@ DeleteCases[perms, Range[Length @ First @ perms]]]]

(* ===================== The adder cascade ===================== *)

VerificationTest[
	AllTrue[Tuples[{Range[2, 5], {2, 3}}], parameters |-> InvertibleAutomatonQ[AutomatonAdderCascade @@ parameters]],
	True
]

(* state i is the odometer truncated at depth s - i, so its order is k^(s-i) *)
VerificationTest[
	Table[Last @ AutomatonWordOrders[AutomatonAdderCascade[5], {i}, {5}], {i, 5}],
	Table[2 ^ (5 - i), {i, 5}]
]

VerificationTest[
	Table[Last @ AutomatonWordOrders[AutomatonAdderCascade[4, 3], {i}, {4}], {i, 4}],
	Table[3 ^ (4 - i), {i, 4}]
]

(* finitary of depth s - 1: the level-s permutation moves whole blocks of k vertices *)
VerificationTest[
	With[{rule = AutomatonAdderCascade[4]},
		{shallow = AutomatonLevelPermutations[rule, 3], deep = AutomatonLevelPermutations[rule, 4]},
		AllTrue[Range[4], state |-> deep[state] === Flatten @ Table[2 (shallow[state][[j]] - 1) + {1, 2}, {j, 8}]]],
	True
]

(* the group is finite, and finitary means the level-(s-1) quotient is already all of it *)
VerificationTest[
	Table[levelGroupOrder[AutomatonAdderCascade[s], level], {s, 2, 5}, {level, {s - 1, s + 1}}],
	Table[{#, #}& @ 2 ^ (2 ^ (s - 1) - 1), {s, 2, 5}]
]

(* over k symbols the group is the iterated wreath product of s - 1 copies of Z/k *)
VerificationTest[
	Table[levelGroupOrder[AutomatonAdderCascade[s, 3], s - 1], {s, 2, 4}],
	Table[3 ^ ((3 ^ (s - 1) - 1) / 2), {s, 2, 4}]
]

(* ===================== The window program ===================== *)

VerificationTest[
	AllTrue[Tuples[{Range[3], {2, 3}}], parameters |-> InvertibleAutomatonQ[AutomatonWindowProgram @@ parameters]],
	True
]

(* the section at a tree vertex is the window of the m symbols last read, and nothing else *)
VerificationTest[
	With[{rule = AutomatonWindowProgram[2]},
		AllTrue[
			Tuples[{Tuples[{0, 1}, 2], Join @@ Table[Tuples[{0, 1}, d], {d, 0, 3}]}],
			pair |-> AutomatonSection[rule, {FromDigits[pair[[1]], 2] + 1}, pair[[2]]] ===
				{FromDigits[Take[Join[pair[[1]], pair[[2]]], -2], 2] + 1}]],
	True
]

(* one step advances the symbol read exactly under the windows in active: the sliding-block program *)
VerificationTest[
	With[{active = {{1, 1}}, rule = AutomatonWindowProgram[2, {{1, 1}}]},
		AllTrue[
			Tuples[{Tuples[{0, 1}, 2], Tuples[{0, 1}, 5]}],
			pair |-> Last @ IteratedFiniteAutomaton[rule, FromDigits[pair[[1]], 2] + 1, pair[[2]], 1] ===
				MapThread[
					{window, x} |-> If[MemberQ[active, window], Mod[x + 1, 2], x],
					{Take[Partition[Join[pair[[1]], pair[[2]]], 2, 1], Length[pair[[2]]]], pair[[2]]}]]],
	True
]

(* the window of length one over two symbols is the lamplighter automaton a = (a, b), b = sigma(a, b) *)
VerificationTest[
	CanonicalAutomatonCode[AutomatonWindowProgram[1]],
	CanonicalAutomatonCode[
		IteratedFiniteAutomatonFromWreath[<|"a" -> {{0, 1}, {"a", "b"}}, "b" -> {{1, 0}, {"a", "b"}}|>, "a"]["Rule"]]
]

(* the level quotients keep growing, where the cascade's stabilize at level s - 1: the states
   are not finitary, so the window program is where the many-state regime can be infinite *)
VerificationTest[
	With[{orders = Table[levelGroupOrder[AutomatonWindowProgram[2], level], {level, 5}]},
		orders === Sort[orders] && DuplicateFreeQ[orders]],
	True
]

(* ===================== The product ===================== *)

(* state {p, q} acts on the tree as the automorphism of p followed by that of q *)
VerificationTest[
	With[{a = AutomatonAdderCascade[3], b = AutomatonWindowProgram[2]},
		AllTrue[Range[4], level |-> With[
			{permsA = AutomatonLevelPermutations[a, level], permsB = AutomatonLevelPermutations[b, level],
			 permsProduct = AutomatonLevelPermutations[AutomatonProduct[a, b], level]},
			AllTrue[
				Tuples[{Range[3], Range[4]}],
				pair |-> permsProduct[4 (pair[[1]] - 1) + pair[[2]]] === permsB[pair[[2]]][[permsA[pair[[1]]]]]]]]],
	True
]

VerificationTest[
	Length @ Union[AutomatonProduct[AutomatonAdderCascade[3], AutomatonWindowProgram[2]][[All, 1, 1]]],
	12
]

(* the outputs of the product compose the two output permutations, so invertibility is inherited exactly *)
VerificationTest[
	Table[
		InvertibleAutomatonQ[AutomatonProduct[AutomatonRuleFromCode[{code, {2, 2}}], AutomatonAdderCascade[3]]] ===
			InvertibleAutomatonQ[{code, {2, 2}}],
		{code, 0, 255}],
	ConstantArray[True, 256]
]
