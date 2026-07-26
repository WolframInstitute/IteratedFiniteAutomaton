addingMachine = {62, {2, 2}};
grigorchuk = {8950703898, {5, 2}};

vertexRules = {graph, option} |-> KeySort @ Association @ Cases[AnnotationValue[graph, option], _Rule];

(* the portrait is the prefix of the k-ary rooted tree down to the given depth *)

VerificationTest[
	Table[VertexCount @ AutomatonTreePortrait[grigorchuk, 1, l], {l, 4}],
	Table[Total[2 ^ Range[0, l]], {l, 4}]
]

VerificationTest[
	Table[EdgeCount @ AutomatonTreePortrait[grigorchuk, 1, l], {l, 4}],
	Table[Total[2 ^ Range[0, l]] - 1, {l, 4}]
]

VerificationTest[
	AllTrue[Range[2, 4], l |-> TreeGraphQ @ UndirectedGraph @ AutomatonTreePortrait[grigorchuk, 1, l]],
	True
]

(* each vertex is colored by the section of s0 there, so two vertices share a color exactly
   when they share a section *)

VerificationTest[
	With[{colors = vertexRules[AutomatonTreePortrait[grigorchuk, 2, 3], VertexStyle]},
		AllTrue[Subsets[Join @@ Table[Tuples[{0, 1}, d], {d, 0, 3}], {2}],
			pair |-> (colors[First[pair]] === colors[Last[pair]]) ===
				(AutomatonSection[grigorchuk, {2}, First[pair]] === AutomatonSection[grigorchuk, {2}, Last[pair]])]],
	True
]

(* state 5 of the Grigorchuk automaton is the identity, so no section of it permutes anything
   and every vertex takes the small size *)

VerificationTest[
	Union @ Values @ vertexRules[AutomatonTreePortrait[grigorchuk, 5, 3], VertexSize],
	{0.4}
]

VerificationTest[
	vertexRules[AutomatonTreePortrait[grigorchuk, 1, 3], VertexSize][{}],
	0.9
]

(* the boundary graph is the functional graph of the level permutation, so it is a disjoint
   union of cycles whose lengths have lcm the order of the state in Aut(T_level) *)

VerificationTest[
	Table[{VertexCount[#], EdgeCount[#]} & @ AutomatonBoundaryGraph[grigorchuk, 1, l], {l, {2, 3, 5}}],
	Table[{2 ^ l, 2 ^ l}, {l, {2, 3, 5}}]
]

VerificationTest[
	AllTrue[Range[2, 5],
		l |-> Apply[LCM, Length /@ ConnectedComponents @ AutomatonBoundaryGraph[addingMachine, 1, l]] ===
			First @ AutomatonWordOrders[addingMachine, {1}, {l}]],
	True
]

VerificationTest[
	Table[Length @ ConnectedComponents @ AutomatonBoundaryGraph[addingMachine, 1, l], {l, 2, 5}],
	{1, 1, 1, 1}
]

VerificationTest[
	EdgeList @ AutomatonBoundaryGraph[grigorchuk, 5, 4],
	Table[DirectedEdge[i, i], {i, 16}]
]

VerificationTest[
	AutomatonBoundaryGraph[AutomatonRuleFromCode[addingMachine], 1, 4] === AutomatonBoundaryGraph[addingMachine, 1, 4],
	True
]

(* the samplers spread n + 1 points evenly over the whole space they sample *)

VerificationTest[
	{First[#], Last[#], Length[#]} & @ IteratedFiniteAutomatonSample[{2, 2}, 5],
	{0, 4 ^ 4 - 1, 6}
]

VerificationTest[
	OrderedQ @ IteratedFiniteAutomatonSample[{3, 2}, 20],
	True
]

VerificationTest[
	{First[#], Last[#], Length[#]} & @ IteratedFiniteAutomatonInitialConditionSample[2, 8, 5],
	{ConstantArray[0, 8], ConstantArray[1, 8], 6}
]

VerificationTest[
	AllTrue[IteratedFiniteAutomatonInitialConditionSample[3, 5, 7],
		tape |-> Length[tape] === 5 && AllTrue[tape, 0 <= # < 3 &]],
	True
]

(* the galleries agree with each other where they overlap *)

VerificationTest[
	Length @ IteratedFiniteAutomatonsByRule[{2, 2}, IteratedFiniteAutomatonSample[{2, 2}, 4], ConstantArray[0, 8]],
	5
]

VerificationTest[
	With[{rules = IteratedFiniteAutomatonSample[{2, 2}, 4], inits = IteratedFiniteAutomatonInitialConditionSample[2, 8, 3]},
		Dimensions[IteratedFiniteAutomatonsMatrix[{2, 2}, rules, inits], 2] === {5, 4}],
	True
]

VerificationTest[
	With[{rules = IteratedFiniteAutomatonSample[{2, 2}, 4], inits = IteratedFiniteAutomatonInitialConditionSample[2, 8, 3]},
		Transpose[IteratedFiniteAutomatonsMatrix[{2, 2}, rules, inits]][[1]] ===
			IteratedFiniteAutomatonsByRule[{2, 2}, rules, First[inits]]],
	True
]

VerificationTest[
	With[{rules = IteratedFiniteAutomatonSample[{2, 2}, 4], inits = IteratedFiniteAutomatonInitialConditionSample[2, 8, 3]},
		First[IteratedFiniteAutomatonsMatrix[{2, 2}, rules, inits]] ===
			IteratedFiniteAutomatonsByInitialCondition[{First[rules], {2, 2}}, inits]],
	True
]

(* Automatic means as many steps as the tape is long *)

VerificationTest[
	With[{rules = IteratedFiniteAutomatonSample[{2, 2}, 4], init = ConstantArray[0, 8]},
		IteratedFiniteAutomatonsByRule[{2, 2}, rules, init] === IteratedFiniteAutomatonsByRule[{2, 2}, rules, init, Length[init]]],
	True
]

VerificationTest[
	IteratedFiniteAutomatonsByInitialCondition[AutomatonRuleFromCode[addingMachine], {ConstantArray[0, 6]}] ===
		IteratedFiniteAutomatonsByInitialCondition[addingMachine, {ConstantArray[0, 6]}],
	True
]
