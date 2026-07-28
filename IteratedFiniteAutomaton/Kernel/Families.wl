Package["WolframInstitute`IteratedFiniteAutomaton`"]

(* ===================== Constructive families ===================== *)

(* s states: s - 1 odometers in series whose carry dies in the identity state s,
   so state i is the odometer truncated at depth s - i *)
AutomatonAdderCascade[s_Integer, k_Integer : 2] :=
	Flatten @ Table[
		{state, x} -> Which[
			state === s, {s, x},
			x < k - 1, {s, x + 1},
			True, {state + 1, 0}],
		{state, s}, {x, 0, k - 1}]

(* k^m states, one per window of the m symbols last read: the automaton advances the
   symbol it reads exactly under the windows in active, a sliding-block program on the boundary *)
AutomatonWindowProgram[m_Integer, active : {___List}, k_Integer : 2] :=
	Flatten @ Table[
		{FromDigits[w, k] + 1, x} -> {
			FromDigits[Append[Rest[w], x], k] + 1,
			If[MemberQ[active, w], Mod[x + 1, k], x]},
		{w, Tuples[Range[0, k - 1], m]}, {x, 0, k - 1}]

AutomatonWindowProgram[m_Integer, k_Integer : 2] := AutomatonWindowProgram[m, {ConstantArray[k - 1, m]}, k]

(* the composition automaton on the s_a s_b pairs: state {p, q} acts on the tree as the
   automorphism of p followed by that of q, and {p, q} is numbered (p - 1) s_b + q *)
AutomatonProduct[a_, b_] :=
	With[{ruleA = ToAutomatonRule[a], ruleB = ToAutomatonRule[b]},
		{transA = Association[ruleA], transB = Association[ruleB],
		 statesA = Union[ruleA[[All, 1, 1]]], statesB = Union[ruleB[[All, 1, 1]]],
		 k = Length[Union[ruleA[[All, 1, 2]]]]},
		Flatten @ Table[
			With[{stepA = transA[{p, x}]}, {stepB = transB[{q, stepA[[2]]}]},
				{(p - 1) Length[statesB] + q, x} ->
					{(stepA[[1]] - 1) Length[statesB] + stepB[[1]], stepB[[2]]}],
			{p, statesA}, {q, statesB}, {x, 0, k - 1}]]
