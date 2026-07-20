addingMachine = {{1, 0} -> {2, 1}, {1, 1} -> {1, 0}, {2, 0} -> {2, 0}, {2, 1} -> {2, 1}};

VerificationTest[
	IteratedFiniteAutomaton[addingMachine, ConstantArray[0, 5], 4],
	{{0, 0, 0, 0, 0}, {1, 0, 0, 0, 0}, {0, 1, 0, 0, 0}, {1, 1, 0, 0, 0}, {0, 0, 1, 0, 0}}
]

VerificationTest[
	IteratedFiniteAutomaton[{28126, {3, 2}}, CenterArray[{1, 0, 0, 1}, 20], 2],
	IteratedFiniteAutomaton[{{1, 1} -> {2, 1}, {1, 0} -> {2, 1}, {2, 1} -> {3, 0}, {2, 0} -> {1, 1}, {3, 1} -> {1, 1}, {3, 0} -> {3, 0}}, CenterArray[{1, 0, 0, 1}, 20], 2]
]

VerificationTest[
	IteratedFiniteAutomaton[addingMachine, 1][{0, 0, 0}],
	IteratedFiniteAutomaton[addingMachine, {0, 0, 0}]
]

VerificationTest[
	Length[IteratedFiniteAutomatonPeriodicStop[addingMachine, ConstantArray[0, 3]]],
	9
]

VerificationTest[
	With[{ev = IteratedFiniteAutomatonPeriodicStop[addingMachine, ConstantArray[0, 3]]},
		First[ev] === Last[ev]],
	True
]

VerificationTest[
	Length[IteratedFiniteAutomatonPeriodicStop[{{1, 0} -> {1, 0}, {1, 1} -> {1, 1}}, {0, 1, 0}]],
	2
]

VerificationTest[
	Length[IteratedFiniteAutomatonPeriodicStop[addingMachine, ConstantArray[0, 5], 3]],
	4
]
