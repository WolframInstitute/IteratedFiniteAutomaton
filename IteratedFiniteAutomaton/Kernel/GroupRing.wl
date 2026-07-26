Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[ProjectiveVectors]
PackageScope[ZeroDivisorLevelBasis]
PackageScope[GroupRingTowerSurvivors]
PackageScope[GroupRingAnnihilatorSurvivors]

(* ===================== Elements of the group ring ===================== *)

(* an element is a list of {coefficient, word} pairs: {} is 0 and {{1, {}}} is 1 *)

Options[GroupRingLevelProduct] = {Modulus -> 0};

(* product in the group ring of the level quotient: words multiply by concatenation, and two
   words are the same group element exactly when they induce the same level permutation *)
GroupRingLevelProduct[perms_Association, elementA_List, elementB_List, OptionsPattern[]] :=
	With[{modulus = OptionValue[Modulus]},
		DeleteCases[
			If[modulus == 0, #, Mod[#, modulus]] & @ Merge[
				Join @@ Table[
					AutomatonWordPermutation[perms, Join[Last[termA], Last[termB]]] -> First[termA] First[termB],
					{termA, elementA}, {termB, elementB}],
				Total],
			0]]

GroupRingLevelProduct[automaton_, level_Integer, elementA_List, elementB_List, opts : OptionsPattern[]] :=
	GroupRingLevelProduct[AutomatonLevelPermutations[automaton, level], elementA, elementB, opts]

(* coefficient vectors over F_modulus of weight 1 to maxTerms, first nonzero entry normalized to 1:
   one vector per line, which is all a zero-divisor search needs since AB = 0 is scale invariant *)
ProjectiveVectors[modulus_Integer, n_Integer, maxTerms_Integer] :=
	Join @@ Table[
		Join @@ Outer[
			{positions, rest} |-> Normal @ SparseArray[Thread[positions -> Prepend[rest, 1]], n],
			Subsets[Range[n], {t}], Tuples[Range[modulus - 1], t - 1], 1],
		{t, maxTerms}]

(* ===================== Idempotents ===================== *)

Options[GroupRingIdempotentQ] = {Modulus -> 0};

(* A (A - 1) = 0 in the level quotient: A is idempotent there *)
GroupRingIdempotentQ[automaton_, element_List, level_Integer, OptionsPattern[]] :=
	GroupRingLevelProduct[automaton, level, element, Append[element, {-1, {}}], Modulus -> OptionValue[Modulus]] === <||>

Options[GroupRingIdempotentSearch] = {Modulus -> 0};

(* every idempotent of the level group ring supported on the radius ball with the given
   coefficients, one per element and excluding 0 and 1 *)
GroupRingIdempotentSearch[automaton_, radius_Integer, coefficients_List, level_Integer, OptionsPattern[]] :=
	With[{modulus = OptionValue[Modulus], perms = AutomatonLevelPermutations[automaton, level]},
		{support = Prepend[AutomatonWordBall[automaton, radius], {}], identity = Range[Length[First[perms]]]},
		{supportPerms = AutomatonWordPermutation[perms, #] & /@ support},
		{canonicalOf = coeffs |-> DeleteCases[If[modulus == 0, #, Mod[#, modulus]] & @ Merge[Thread[supportPerms -> coeffs], Total], 0]},
		{representatives = Values @ GroupBy[Tuples[coefficients, Length[support]], canonicalOf, First]},
		{nontrivial = Select[representatives, coeffs |-> Nor[canonicalOf[coeffs] === <||>, canonicalOf[coeffs] === <|identity -> 1|>]]},
		Select[
			DeleteCases[Transpose[{#, support}], {0, _}] & /@ nontrivial,
			GroupRingLevelProduct[perms, #, Append[#, {-1, {}}], Modulus -> modulus] === <||> &]]

Options[GroupRingIdempotentSurvival] = {Modulus -> 2, MaxTerms -> Infinity};

(* the A supported on the radius ball over F_p with A (A - 1) = 0 in every level quotient.
   An idempotent other than 0 and 1 is a zero divisor, so a survivor is a candidate
   counterexample and an empty survivor set refutes one radius over one field *)
GroupRingIdempotentSurvival[automaton_, radius_Integer, levels_List, OptionsPattern[]] :=
	Module[{rule = ToAutomatonRule[automaton], modulus = OptionValue[Modulus], maxTerms = OptionValue[MaxTerms], support, survivors, counts},
		support = Prepend[AutomatonGroupBall[rule, radius, Max[levels]], {}];
		survivors = If[ maxTerms === Infinity,
			DeleteCases[Transpose[{#, support}], {0, _}] & /@
				Select[Rest @ Tuples[Range[0, modulus - 1], Length[support]], AnyTrue[Rest[#], Positive] &],
			Join @@ Table[
				Join @@ Outer[{words, coeffs} |-> Transpose[{coeffs, words}], Subsets[support, {t}], Tuples[Range[modulus - 1], t], 1],
				{t, 2, Min[maxTerms, Length[support]]}]];
		counts = Reap[Do[
			survivors = Select[survivors, GroupRingLevelProduct[rule, l, #, Append[#, {-1, {}}], Modulus -> modulus] === <||> &];
			Sow[{l, Length[survivors]}];
			If[survivors === {}, Break[]],
			{l, levels}]][[2]];
		<|
			"Code" -> First @ AutomatonCodeFromRule[rule],
			"Support" -> support,
			"Counts" -> First[counts, {}],
			"Survivors" -> survivors
		|>]

(* ===================== Zero divisors ===================== *)

Options[GroupRingLeftAnnihilator] = {Modulus -> 0};

(* coefficient vectors b, in the basis support, with element . Sum_j b_j support_j = 0 in every
   level quotient: column j of the matrix is the product element . support_j *)
GroupRingLeftAnnihilator[automaton_, element_List, support_List, levels_List, OptionsPattern[]] :=
	With[{rule = ToAutomatonRule[automaton]},
		{matrix = Join @@ Table[
			With[{perms = AutomatonLevelPermutations[rule, l]},
				{columns = Table[
					Merge[Table[AutomatonWordPermutation[perms, Join[Last[term], word]] -> First[term], {term, element}], Total],
					{word, support}]},
				{groupElements = Union @@ (Keys /@ columns)},
				Transpose @ Table[Lookup[column, groupElements, 0], {column, columns}]],
			{l, levels}]},
		NullSpace[matrix, Modulus -> OptionValue[Modulus]]]

(* left multiplication by the support at one level, as 0/1 matrices B_i with
   [A .] = Sum_i c_i B_i in the basis {s_1, ..., s_n} of the support *)
ZeroDivisorLevelBasis[automaton_, support_List, level_Integer] :=
	With[{n = Length[support], perms = AutomatonLevelPermutations[automaton, level]},
		{products = Table[AutomatonWordPermutation[perms, Join[support[[i]], support[[j]]]], {i, n}, {j, n}]},
		{groupElements = Union @@ products},
		{rows = Map[AssociationThread[groupElements -> Range[Length[groupElements]]], products, {2}]},
		Table[SparseArray[Table[{rows[[i, j]], j} -> 1, {j, n}], {Length[groupElements], n}], {i, n}]]

(* level quotients are nested, so annihilators only shrink with L: filtering level by level
   decides the same candidates as one matrix stacked over all levels, but prunes at the cheap
   shallow ones.  A level whose products span fewer than n group elements forces rank < n and
   prunes nothing, so it is skipped *)
GroupRingTowerSurvivors[rule_, support_List, candidates_List, levels_List, modulus_Integer] :=
	Module[{n = Length[support], survivors = candidates, counts},
		counts = Reap[Do[
			With[{basis = ZeroDivisorLevelBasis[rule, support, l]},
				If[ Length[First[basis]] >= n,
					survivors = Select[survivors, MatrixRank[# . basis, Modulus -> modulus] < n &];
					Sow[{l, Length[survivors]}]]];
			If[survivors === {}, Break[]],
			{l, levels}]][[2]];
		<|"Counts" -> First[counts, {}], "Survivors" -> survivors|>]

(* the same predicate without the nesting argument: one annihilator per candidate, stacked
   across all levels at once *)
GroupRingAnnihilatorSurvivors[rule_, support_List, candidates_List, levels_List, modulus_Integer] :=
	With[{hits = Select[
			candidates,
			GroupRingLeftAnnihilator[rule, DeleteCases[Transpose[{#, support}], {0, _}], support, levels, Modulus -> modulus] =!= {} &]},
		<|"Counts" -> {{Max[levels], Length[hits]}}, "Survivors" -> hits|>]

Options[GroupRingZeroDivisorSurvival] = {Modulus -> 2, MaxTerms -> Infinity, Method -> Automatic};

(* the A supported on the radius ball over F_p whose left annihilator is nonempty in every
   level quotient, each with a witness B: a survivor is a candidate pair AB = 0 *)
GroupRingZeroDivisorSurvival[automaton_, radius_Integer, levels_List, OptionsPattern[]] :=
	With[{rule = ToAutomatonRule[automaton], modulus = OptionValue[Modulus]},
		{support = Prepend[AutomatonGroupBall[rule, radius, Max[levels]], {}]},
		{toElement = coeffs |-> DeleteCases[Transpose[{coeffs, support}], {0, _}],
		 candidates = ProjectiveVectors[modulus, Length[support], Min[OptionValue[MaxTerms], Length[support]]]},
		{tested = If[ OptionValue[Method] === "Annihilator",
			GroupRingAnnihilatorSurvivors[rule, support, candidates, levels, modulus],
			GroupRingTowerSurvivors[rule, support, candidates, levels, modulus]]},
		{survivors = toElement /@ tested["Survivors"]},
		<|
			"Code" -> First @ AutomatonCodeFromRule[rule],
			"Support" -> support,
			"Counts" -> tested["Counts"],
			"Survivors" -> survivors,
			"Annihilators" -> Map[
				toElement,
				First[GroupRingLeftAnnihilator[rule, #, support, levels, Modulus -> modulus], {}] & /@ survivors]
		|>]
