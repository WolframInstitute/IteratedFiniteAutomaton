Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[FAStepStateTransitions]
PackageScope[FAExercisedEdges]

IteratedFiniteAutomatonStateTransitions[rule_List, s0_Integer : 1, init_List, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = ToAutomatonRule[rule]},
	If[t === Automatic, FAStepStateTransitions[rt, s0, init], NestList[FAStepStateTransitions[rt, s0, #[[All, 3, 2]]]&, DirectedEdge[s0, s0, 0 -> #]& /@ init, t]]]

IteratedFiniteAutomatonStateTransitions[rule_List, s0_Integer : 1][init_List] := IteratedFiniteAutomatonStateTransitions[rule, s0, init]

IteratedFiniteAutomatonStateGraph[{m_Integer, {s_Integer, k_Integer}}] := Graph[
	Range[s],
	(r |-> DirectedEdge[r[[1, 1]], r[[2, 1]], r[[1, 2]] -> r[[2, 2]]]) /@ AutomatonRuleFromCode[{m, {s, k}}],
	EdgeLabels -> "EdgeTag", VertexLabels -> Automatic]

IteratedFiniteAutomatonStateGraph[rule : {(_ -> _) ..}] := Graph[
	Union[rule[[All, 1, 1]], rule[[All, 2, 1]]],
	(r |-> DirectedEdge[r[[1, 1]], r[[2, 1]], r[[1, 2]] -> r[[2, 2]]]) /@ rule,
	EdgeLabels -> "EdgeTag", VertexLabels -> Automatic]

IteratedFiniteAutomatonColors[k_Integer /; k >= 2] := If[k == 2, {0 -> White, 1 -> Black}, Thread[Range[0, k - 1] -> Prepend[ColorData[97] /@ Range[k - 1], White]]]

(* ===================== Exercised sub-digraphs ===================== *)

(* the sub-digraph of the Moore diagram whose edges the tape init traverses in t steps;
   every state stays a vertex, so an isolated vertex is a state this tape never visits *)
IteratedFiniteAutomatonStateSubgraph[rule_List, s0_Integer : 1, init_List, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = ToAutomatonRule[rule]},
	Graph[
		Union[rt[[All, 1, 1]], rt[[All, 2, 1]]],
		FAExercisedEdges[rt, s0, init, t],
		EdgeLabels -> "EdgeTag", VertexLabels -> Automatic]]

IteratedFiniteAutomatonStateSubgraph[rule_List, s0_Integer : 1][init_List] := IteratedFiniteAutomatonStateSubgraph[rule, s0, init]

(* the family of exercised sub-digraphs over all k^n tapes of length n: traversed edge set -> the tapes traversing it *)
IteratedFiniteAutomatonStateSubgraphFamily[rule_List, s0_Integer : 1, n_Integer, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = ToAutomatonRule[rule]},
	GroupBy[Tuples[Range[0, Length[Union[rt[[All, 1, 2]]]] - 1], n], FAExercisedEdges[rt, s0, #, t]&]]

FAExercisedEdges[rule_, s0_, init_, t_] := Union @ Flatten @ If[t === Automatic,
	FAStepStateTransitions[rule, s0, init],
	Rest @ NestList[FAStepStateTransitions[rule, s0, #[[All, 3, 2]]]&, DirectedEdge[s0, s0, 0 -> #]& /@ init, t]]

FAStepStateTransitions[rule_, s0_, list_] := Map[Last, Rest[FoldList[
	{inputState, inputValue} |-> With[
		{output = {First @ inputState, inputValue} /. rule},
		{output[[1]], DirectedEdge[First @ inputState, output[[1]], inputValue -> output[[2]]]}],
	{s0},
	list]]]
