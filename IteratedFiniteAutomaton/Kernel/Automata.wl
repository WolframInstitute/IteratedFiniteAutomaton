Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[ToAutomatonRule]

(* ===================== Presentations ===================== *)

(* Mealy rule {state, input} -> {nextState, output} of the automaton numbered m over s states and k symbols *)
AutomatonRuleFromCode[{m_Integer, {s_Integer, k_Integer}}] :=
	Flatten @ MapIndexed[
		{digit, position} |-> ({position[[1]], k - position[[2]]} -> Mod[Quotient[digit, {k, 1}], {s, k}] + {1, 0}),
		Partition[IntegerDigits[m, s k, s k], k], {2}]

(* inverse of AutomatonRuleFromCode: the code {m, {s, k}} of an explicit rule *)
AutomatonCodeFromRule[rule_List] :=
	With[{trans = Association[rule], states = Union[rule[[All, 1, 1]]], k = Length[Union[rule[[All, 1, 2]]]]},
		{FromDigits[Flatten @ Table[(trans[{st, i}][[1]] - 1) k + trans[{st, i}][[2]], {st, states}, {i, k - 1, 0, -1}], Length[states] k], {Length[states], k}}]

ToAutomatonRule[{m_Integer, {s_Integer, k_Integer}}] := AutomatonRuleFromCode[{m, {s, k}}]

ToAutomatonRule[rule : {(_ -> _) ..}] := rule

(* ===================== Invariants of a presentation ===================== *)

(* least code in the orbit of the automaton under relabelling states and symbols *)
CanonicalAutomatonCode[automaton_] :=
	With[{rule = ToAutomatonRule[automaton]},
		{states = Union[rule[[All, 1, 1]]], symbols = Union[rule[[All, 1, 2]]]},
		{relabel = Flatten @ Table[
			First @ AutomatonCodeFromRule[
				(r |-> ({sigma[[r[[1, 1]]]], tau[[r[[1, 2]] + 1]]} -> {sigma[[r[[2, 1]]]], tau[[r[[2, 2]] + 1]]})) /@ rule],
			{sigma, Permutations[states]}, {tau, Permutations[symbols]}]},
		{Min[relabel], {Length[states], Length[symbols]}}]

(* invertible: at each state the outputs permute the symbols, so the automaton acts by a tree automorphism *)
InvertibleAutomatonQ[automaton_] :=
	With[{rule = ToAutomatonRule[automaton]},
		AllTrue[GroupBy[rule, r |-> r[[1, 1]], outputs |-> Sort[outputs[[All, 2, 2]]]], # === Range[0, Length[#] - 1] &]]

(* codes of all invertible automata over s states and k symbols *)
InvertibleAutomatonCodes[{s_Integer, k_Integer}] :=
	Select[Range[0, (s k) ^ (s k) - 1], m |-> InvertibleAutomatonQ[{m, {s, k}}]]
