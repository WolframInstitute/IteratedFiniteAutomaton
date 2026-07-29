Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[ReducedWordQ]
PackageScope[FreeReducedWord]

(* ===================== Action on the rooted tree ===================== *)

(* each state as a permutation of the k^level vertices at depth level *)
AutomatonLevelPermutations[automaton_, level_Integer] :=
	With[{rule = ToAutomatonRule[automaton]},
		{trans = Association[rule], states = Union[rule[[All, 1, 1]]], k = Length[Union[rule[[All, 1, 2]]]]},
		Fold[
			{perms, l} |-> Association @ Table[
				st -> Flatten @ Table[With[{fo = trans[{st, x}]}, fo[[2]] k ^ (l - 1) + perms[fo[[1]]]], {x, 0, k - 1}],
				{st, states}],
			AssociationThread[states -> ConstantArray[{1}, Length[states]]],
			Range[level]]]

(* the tree automorphism of a word in the generators and their inverses; negative entries are inverses *)
AutomatonWordPermutation[perms_Association, word_List] :=
	Fold[{permutation, g} |-> permutation[[If[g > 0, perms[g], Ordering[perms[-g]]]]], Range[Length[First[perms]]], word]

AutomatonWordPermutation[automaton_, level_Integer, word_List] :=
	AutomatonWordPermutation[AutomatonLevelPermutations[automaton, level], word]

(* order of the word in Aut(T_L) for each L in levels; nondecreasing, and constant iff the word has finite order *)
AutomatonWordOrders[automaton_, word_List, levels_List] :=
	Table[PermutationOrder[AutomatonWordPermutation[AutomatonLevelPermutations[automaton, l], word]], {l, levels}]

(* ===================== Balls ===================== *)

ReducedWordQ[word_List] := NoneTrue[Partition[word, 2, 1], #[[1]] == -#[[2]] &]

(* reduced words of length 1 to radius in the free group on the automaton's states *)
AutomatonWordBall[automaton_, radius_Integer] :=
	With[{states = Union[ToAutomatonRule[automaton][[All, 1, 1]]]},
		Join @@ Table[Select[Tuples[Join[states, -states], n], ReducedWordQ], {n, radius}]]

(* one shortest word per distinct nontrivial element of the level-refLevel quotient *)
AutomatonGroupBall[automaton_, radius_Integer, refLevel_Integer] :=
	With[{perms = AutomatonLevelPermutations[automaton, refLevel]},
		{identity = Range[Length[First[perms]]]},
		DeleteDuplicatesBy[
			Select[AutomatonWordBall[automaton, radius], AutomatonWordPermutation[perms, #] =!= identity &],
			AutomatonWordPermutation[perms, #] &]]

(* size of the ball of radius wordLength in the level quotient *)
AutomatonElementCount[automaton_, wordLength_Integer, level_Integer] :=
	With[{perms = AutomatonLevelPermutations[automaton, level]},
		Length @ Union @ Table[AutomatonWordPermutation[perms, w], {w, Prepend[AutomatonWordBall[automaton, wordLength], {}]}]]

(* ===================== Group invariants ===================== *)

(* the generators commute in the level quotient *)
AutomatonAbelianQ[automaton_, level_Integer] :=
	With[{generators = Values[AutomatonLevelPermutations[automaton, level]]},
		AllTrue[Subsets[generators, {2}], #[[1]][[#[[2]]]] === #[[2]][[#[[1]]]] &]]

(* necessary condition for torsion-freeness: some word acts nontrivially at the deepest level and no
   word's order has stopped growing there.  Orders can plateau and then resume (the lamplighter does),
   so this accepts groups with torsion and must be escalated in the level tower to refute a candidate *)
AutomatonTorsionFreeCandidateQ[automaton_, wordLength_Integer, levels_List] :=
	With[{permsList = Table[AutomatonLevelPermutations[automaton, l], {l, levels}]},
		{orders = Table[Table[PermutationOrder[AutomatonWordPermutation[perms, w]], {perms, permsList}], {w, AutomatonWordBall[automaton, wordLength]}]},
		AnyTrue[orders, Last[#] > 1 &] && NoneTrue[orders, Last[#] > 1 && Last[#] === #[[-2]] &]]

(* commutativity and ball growth of the level quotient, enough to stratify the (3, 2) candidates *)
AutomatonGroupFingerprint[automaton_, level_Integer] :=
	<|
		"Code" -> First @ AutomatonCodeFromRule[ToAutomatonRule[automaton]],
		"Abelian" -> AutomatonAbelianQ[automaton, level],
		"BallGrowth" -> Table[AutomatonElementCount[automaton, n, level], {n, 4}]
	|>

(* automaton number of Bondarenko-Grigorchuk-Kravchenko-Muntyan-Nekrashevych-Savchuk-Sunic,
   arXiv:0803.3555 Section 6: state i = sigma^(ai1)(ai2, ai3) over states {0, 1, 2}.
   Defined only for 3-state binary automata, which is why the rule form dispatches on the domain *)
BGKMNSSNumber[{m_Integer, {3, 2}}] := BGKMNSSNumber[AutomatonRuleFromCode[{m, {3, 2}}]]

BGKMNSSNumber[rule : {(_ -> _) ..}] /; Union[rule[[All, 1]]] === Tuples[{Range[3], Range[0, 1]}] :=
	With[{trans = Association[rule]},
		1 + Total @ Table[9 ^ (i - 1) ((trans[{i, 0}][[1]] - 1) + 3 (trans[{i, 1}][[1]] - 1)) + 729 * 2 ^ (i - 1) trans[{i, 0}][[2]], {i, 3}]]

(* ===================== Wreath recursion and sections ===================== *)

Options[AutomatonWreathRecursion] = {Method -> Automatic};

(* wreath presentation <|state -> {outputs, sections}|>, the inverse of IteratedFiniteAutomatonFromWreath *)
AutomatonWreathRecursion[automaton_, OptionsPattern[]] :=
	With[{rule = ToAutomatonRule[automaton]},
		{trans = Association[rule], states = Union[rule[[All, 1, 1]]], k = Length[Union[rule[[All, 1, 2]]]]},
		{recursion = AssociationMap[st |-> Transpose @ Table[Reverse @ trans[{st, x}], {x, 0, k - 1}], states],
		 names = Take[CharacterRange["a", "z"], Length[states]]},
		If[ OptionValue[Method] =!= "String",
			recursion,
			KeyValueMap[
				{st, outputsSections} |-> names[[st]] <> " = " <>
					Which[
						First[outputsSections] === Range[0, k - 1], "",
						k == 2, "\[Sigma]",
						True, "\[Sigma]" <> ToString[First[outputsSections]]
					] <>
					StringRiffle[names[[Last[outputsSections]]], {"(", ", ", ")"}],
				recursion]]]

(* {g, x} -> {section of g at x, image of x}, for every generator g and its inverse -g *)
AutomatonSectionTable[automaton_] :=
	With[{rule = ToAutomatonRule[automaton]},
		{trans = Association[rule], states = Union[rule[[All, 1, 1]]], k = Length[Union[rule[[All, 1, 2]]]]},
		Association @ Flatten @ Table[
			{{st, x} -> trans[{st, x}], {-st, trans[{st, x}][[2]]} -> {-trans[{st, x}][[1]], x}},
			{st, states}, {x, 0, k - 1}]]

(* {section of word at the letter x, image of x}, from an AutomatonSectionTable *)
AutomatonWordSection[sections_Association, word_List, x_Integer] :=
	Fold[
		{sectionLetter, g} |-> With[{sec = sections[{g, Last[sectionLetter]}]}, {Prepend[First[sectionLetter], First[sec]], Last[sec]}],
		{{}, x},
		Reverse[word]]

(* section of word at the tree vertex treeWord *)
AutomatonSection[automaton_, word_List, treeWord_List] :=
	With[{sections = AutomatonSectionTable[automaton]},
		Fold[First @ AutomatonWordSection[sections, #1, #2] &, word, treeWord]]

(* sections at depth 0, ..., depth of the radius ball, distinct as automorphisms of T_refLevel;
   the list stabilizes iff the automaton is contracting, and its limit is the nucleus *)
AutomatonNucleus[automaton_, radius_Integer, depth_Integer, refLevel_Integer] :=
	With[{rule = ToAutomatonRule[automaton]},
		{sections = AutomatonSectionTable[rule], perms = AutomatonLevelPermutations[rule, refLevel],
		 ball = Prepend[AutomatonWordBall[rule, radius], {}], k = Length[Union[rule[[All, 1, 2]]]]},
		Table[
			DeleteDuplicatesBy[
				SortBy[
					Join @@ Table[Fold[First @ AutomatonWordSection[sections, #1, #2] &, w, tw], {w, ball}, {tw, Tuples[Range[0, k - 1], d]}],
					Length],
				AutomatonWordPermutation[perms, #] &],
			{d, 0, depth}]]

(* ===================== Word problem ===================== *)

FreeReducedWord[word_List] := word //. {pre___, g_, h_, post___} /; h == -g :> {pre, post}

(* Moore diagram of the word as a tree automorphism: each freely reduced word u in the section
   closure of word maps to {{u at 0: section, image}, ..., {u at k-1: section, image}}.
   Sections preserve word length, so the closure is finite; word = 1 in G iff every row fixes level 1 *)
AutomatonWordSectionClosure[automaton_, word_List] :=
	With[{rule = ToAutomatonRule[automaton]},
		{sections = AutomatonSectionTable[rule], k = Length[Union[rule[[All, 1, 2]]]]},
		Module[{closure = <||>, frontier = {FreeReducedWord[word]}},
			While[frontier =!= {},
				With[{rows = Table[
						u -> Table[MapAt[FreeReducedWord, AutomatonWordSection[sections, u, x], 1], {x, 0, k - 1}],
						{u, frontier}]},
					AssociateTo[closure, rows];
					frontier = Select[Union @@ rows[[All, 2, All, 1]], !KeyExistsQ[closure, #] &]]];
			closure]]

(* word = 1 in G, decided rather than level-truncated: every section at every tree vertex fixes level 1 *)
AutomatonWordIdentityQ[automaton_, word_List] :=
	AllTrue[Values[AutomatonWordSectionClosure[automaton, word]], row |-> row[[All, 2]] === Range[0, Length[row] - 1]]

(* wordA = wordB in G *)
AutomatonWordEqualQ[automaton_, wordA_List, wordB_List] :=
	AutomatonWordIdentityQ[automaton, Join[wordA, Reverse[-wordB]]]

(* the word as an automaton in its own right: states are the section closure words, state 1 the word itself *)
AutomatonRuleFromWord[automaton_, word_List] :=
	With[{closure = AutomatonWordSectionClosure[automaton, word]},
		{index = First /@ PositionIndex[Keys[closure]]},
		Join @@ KeyValueMap[
			{u, row} |-> Table[{index[u], x - 1} -> {index[row[[x, 1]]], row[[x, 2]]}, {x, Length[row]}],
			closure]]
