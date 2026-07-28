addingMachine = {{1, 0} -> {2, 1}, {1, 1} -> {1, 0}, {2, 0} -> {2, 0}, {2, 1} -> {2, 1}};

VerificationTest[
	{VertexCount[#], EdgeCount[#]}& @ IteratedFiniteAutomatonStateGraph[{28126, {3, 2}}],
	{3, 6}
]

VerificationTest[
	Sort[EdgeList[IteratedFiniteAutomatonStateGraph[addingMachine]]],
	Sort[{DirectedEdge[1, 2, 0 -> 1], DirectedEdge[1, 1, 1 -> 0], DirectedEdge[2, 2, 0 -> 0], DirectedEdge[2, 2, 1 -> 1]}]
]

VerificationTest[
	IteratedFiniteAutomatonStateTransitions[addingMachine, ConstantArray[0, 4], 3][[All, All, 3, 2]],
	IteratedFiniteAutomaton[addingMachine, ConstantArray[0, 4], 3]
]

(* the exercised sub-digraph sits inside the Moore diagram, for every tape and every step count *)
VerificationTest[
	AllTrue[
		Tuples[{0, 1}, 4],
		tape |-> AllTrue[Range[0, 4], t |-> SubsetQ[
			EdgeList[IteratedFiniteAutomatonStateGraph[addingMachine]],
			EdgeList[IteratedFiniteAutomatonStateSubgraph[addingMachine, 1, tape, t]]]]],
	True
]

(* the all-ones tape keeps the adding machine in state 1, so it traverses one loop and never reaches state 2 *)
VerificationTest[
	{VertexList[#], EdgeList[#]}& @ IteratedFiniteAutomatonStateSubgraph[addingMachine, ConstantArray[1, 4]],
	{{1, 2}, {DirectedEdge[1, 1, 1 -> 0]}}
]

(* no steps, no edges traversed *)
VerificationTest[
	EdgeCount[IteratedFiniteAutomatonStateSubgraph[addingMachine, 1, ConstantArray[0, 4], 0]],
	0
]

(* running longer only ever adds edges: the t-step set contains the (t-1)-step set *)
VerificationTest[
	AllTrue[
		Tuples[{0, 1}, 4],
		tape |-> AllTrue[Range[1, 4], t |-> SubsetQ[
			EdgeList[IteratedFiniteAutomatonStateSubgraph[{28126, {3, 2}}, 1, tape, t]],
			EdgeList[IteratedFiniteAutomatonStateSubgraph[{28126, {3, 2}}, 1, tape, t - 1]]]]],
	True
]

(* the family partitions the k^n tapes, and each key is the subgraph its tapes exercise *)
VerificationTest[
	With[{family = IteratedFiniteAutomatonStateSubgraphFamily[addingMachine, 3]},
		{Union[Join @@ Values[family]] === Tuples[{0, 1}, 3],
		 AllTrue[Normal[family], entry |-> AllTrue[Last[entry],
			tape |-> First[entry] === EdgeList[IteratedFiniteAutomatonStateSubgraph[addingMachine, 1, tape]]]]}],
	{True, True}
]

(* the adding machine separates almost every length-3 tape: 7 distinct one-step subgraphs out of 8 tapes *)
VerificationTest[
	Length[IteratedFiniteAutomatonStateSubgraphFamily[addingMachine, 3]],
	7
]

(* a numeric code and its explicit rule are the same automaton *)
VerificationTest[
	IteratedFiniteAutomatonStateSubgraphFamily[{28126, {3, 2}}, 1, 4, 4] ===
		IteratedFiniteAutomatonStateSubgraphFamily[AutomatonRuleFromCode[{28126, {3, 2}}], 1, 4, 4],
	True
]

VerificationTest[
	IteratedFiniteAutomatonColors[2],
	{0 -> White, 1 -> Black}
]

VerificationTest[
	Length[IteratedFiniteAutomatonColors[3]],
	3
]
