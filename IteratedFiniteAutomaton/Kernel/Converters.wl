Package["WolframInstitute`IteratedFiniteAutomaton`"]

IteratedFiniteAutomatonFromStates[spec_, s0_] := Module[{assoc, states, index, rules},
	assoc = Association[spec];
	states = DeleteDuplicates @ Prepend[Keys[assoc], s0];
	index = AssociationThread[states -> Range[Length[states]]];
	rules = Flatten @ KeyValueMap[
		{st, trs} |-> Map[
			r |-> ({index[st], First[r]} -> {index[r[[2, 2]]], r[[2, 1]]}),
			Normal[Association[trs]]],
		assoc];
	<|"Rule" -> rules, "InitialState" -> index[s0], "StateIndex" -> index|>]

IteratedFiniteAutomatonFromWreath[spec_, s0_] := IteratedFiniteAutomatonFromStates[
	KeyValueMap[
		{st, ow} |-> st -> MapThread[
			{i, o, sec} |-> (i -> {o, sec}),
			{Range[0, Length[First[ow]] - 1], First[ow], Last[ow]}],
		Association[spec]],
	s0]

IteratedFiniteAutomatonEvolve[conv_Association, init_, t_] := IteratedFiniteAutomaton[conv["Rule"], conv["InitialState"], init, t]
