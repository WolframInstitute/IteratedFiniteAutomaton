Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[FAStepStateTransitions]

IteratedFiniteAutomatonStateTransitions[rule_List, s0_Integer : 1, init_List, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = If[MatchQ[rule, {_Integer, {_Integer, _Integer}}], ToFARule[rule], rule]},
	If[t === Automatic, FAStepStateTransitions[rt, s0, init], NestList[FAStepStateTransitions[rt, s0, #[[All, 3, 2]]]&, DirectedEdge[s0, s0, 0 -> #]& /@ init, t]]]

IteratedFiniteAutomatonStateTransitions[rule_List, s0_Integer : 1][init_List] := IteratedFiniteAutomatonStateTransitions[rule, s0, init]

IteratedFiniteAutomatonStateGraph[{m_Integer, {s_Integer, k_Integer}}] := Graph[
	Range[s],
	(r |-> DirectedEdge[r[[1, 1]], r[[2, 1]], r[[1, 2]] -> r[[2, 2]]]) /@ ToFARule[{m, {s, k}}],
	EdgeLabels -> "EdgeTag", VertexLabels -> Automatic]

IteratedFiniteAutomatonStateGraph[rule : {(_ -> _) ..}] := Graph[
	Union[rule[[All, 1, 1]], rule[[All, 2, 1]]],
	(r |-> DirectedEdge[r[[1, 1]], r[[2, 1]], r[[1, 2]] -> r[[2, 2]]]) /@ rule,
	EdgeLabels -> "EdgeTag", VertexLabels -> Automatic]

IteratedFiniteAutomatonColors[k_Integer /; k >= 2] := If[k == 2, {0 -> White, 1 -> Black}, Thread[Range[0, k - 1] -> Prepend[ColorData[97] /@ Range[k - 1], White]]]

FAStepStateTransitions[rule_, s0_, list_] := Map[Last, Rest[FoldList[
	{inputState, inputValue} |-> With[
		{output = {First @ inputState, inputValue} /. rule},
		{output[[1]], DirectedEdge[First @ inputState, output[[1]], inputValue -> output[[2]]]}],
	{s0},
	list]]]
