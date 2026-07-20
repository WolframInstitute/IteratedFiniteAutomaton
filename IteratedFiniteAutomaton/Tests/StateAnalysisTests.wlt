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

VerificationTest[
	IteratedFiniteAutomatonColors[2],
	{0 -> White, 1 -> Black}
]

VerificationTest[
	Length[IteratedFiniteAutomatonColors[3]],
	3
]
