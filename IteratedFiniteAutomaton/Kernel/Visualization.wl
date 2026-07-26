Package["WolframInstitute`IteratedFiniteAutomaton`"]

(* ===================== Portraits ===================== *)

(* the level-deep prefix of the rooted tree, each vertex colored by the section of s0 there
   and enlarged when that section permutes its symbols *)
AutomatonTreePortrait[automaton_, s0_Integer, level_Integer] :=
	With[{rule = ToAutomatonRule[automaton]},
		{trans = Association[rule], states = Union[rule[[All, 1, 1]]], k = Length[Union[rule[[All, 1, 2]]]]},
		{words = Join @@ Table[Tuples[Range[0, k - 1], d], {d, 0, level}],
		 stateColor = AssociationThread[states -> ColorData[97] /@ Range[Length[states]]],
		 swaps = AssociationMap[st |-> AnyTrue[Range[0, k - 1], Last[trans[{st, #}]] != # &], states],
		 step = {st, x} |-> First @ trans[{st, x}]},
		{sectionOf = AssociationMap[w |-> Fold[step, s0, w], words]},
		Graph[
			words,
			Join @@ Table[DirectedEdge[w, Append[w, x]], {w, Select[words, Length[#] < level &]}, {x, 0, k - 1}],
			VertexStyle -> Map[w |-> w -> stateColor[sectionOf[w]], words],
			VertexSize -> Map[w |-> w -> If[swaps[sectionOf[w]], 0.9, 0.4], words],
			GraphLayout -> "LayeredDigraphEmbedding",
			PlotLabel -> "section state (color), swap enlarged"]]

(* the permutation of the k^level boundary vertices induced by s0, drawn as its functional graph:
   the cycle structure read off the picture is the order of s0 in Aut(T_level) *)
AutomatonBoundaryGraph[automaton_, s0_Integer, level_Integer] :=
	With[{perm = AutomatonLevelPermutations[automaton, level][s0]},
		Graph[
			Range[Length[perm]],
			Table[DirectedEdge[i, perm[[i]]], {i, Length[perm]}],
			GraphLayout -> "CircularEmbedding", VertexSize -> 0.4, VertexStyle -> Black, EdgeStyle -> Opacity[0.5]]]

(* ===================== Galleries ===================== *)

(* n + 1 codes spread evenly over the (s k)^(s k) automata on s states and k symbols *)
IteratedFiniteAutomatonSample[{s_Integer, k_Integer}, n_Integer] :=
	Round @ Subdivide[(s k) ^ (s k) - 1, n]

(* n + 1 tapes of the given length, spread evenly over the k^length initial conditions *)
IteratedFiniteAutomatonInitialConditionSample[k_Integer, length_Integer, n_Integer] :=
	PadLeft[IntegerDigits[#, k], length] & /@ Round @ Subdivide[k ^ length - 1, n]

(* one space-time plot per rule, all from the same initial condition *)
IteratedFiniteAutomatonsByRule[{s_Integer, k_Integer}, rules_List, init_List, steps_ : Automatic] :=
	Table[
		ArrayPlot[
			IteratedFiniteAutomaton[{rule, {s, k}}, init, Replace[steps, Automatic :> Length[init]]],
			ColorRules -> IteratedFiniteAutomatonColors[k]],
		{rule, rules}]

(* one space-time plot per initial condition, all from the same automaton *)
IteratedFiniteAutomatonsByInitialCondition[automaton_, inits_List, steps_ : Automatic] :=
	With[{rule = ToAutomatonRule[automaton]},
		{k = Length[Union[rule[[All, 1, 2]]]]},
		Table[
			ArrayPlot[
				IteratedFiniteAutomaton[rule, init, Replace[steps, Automatic :> Length[init]]],
				ColorRules -> IteratedFiniteAutomatonColors[k]],
			{init, inits}]]

(* the rules-by-initial-conditions grid of space-time plots *)
IteratedFiniteAutomatonsMatrix[{s_Integer, k_Integer}, rules_List, inits_List, steps_ : Automatic] :=
	Table[
		ArrayPlot[
			IteratedFiniteAutomaton[{rule, {s, k}}, init, Replace[steps, Automatic :> Length[init]]],
			ColorRules -> IteratedFiniteAutomatonColors[k]],
		{rule, rules}, {init, inits}]
