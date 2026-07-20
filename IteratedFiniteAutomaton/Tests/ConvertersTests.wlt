mealy = <|"eps" -> {0 -> {1, "lam"}, 1 -> {0, "eps"}}, "lam" -> {0 -> {0, "lam"}, 1 -> {1, "lam"}}|>;
wreath = <|"a" -> {{1, 0}, {"id", "a"}}, "id" -> {{0, 1}, {"id", "id"}}|>;

VerificationTest[
	Sort[IteratedFiniteAutomatonFromStates[mealy, "eps"]["Rule"]],
	Sort[{{1, 0} -> {2, 1}, {1, 1} -> {1, 0}, {2, 0} -> {2, 0}, {2, 1} -> {2, 1}}]
]

VerificationTest[
	IteratedFiniteAutomatonFromStates[mealy, "eps"]["InitialState"],
	1
]

VerificationTest[
	Sort[IteratedFiniteAutomatonFromWreath[wreath, "a"]["Rule"]],
	Sort[IteratedFiniteAutomatonFromStates[mealy, "eps"]["Rule"]]
]

VerificationTest[
	IteratedFiniteAutomatonEvolve[IteratedFiniteAutomatonFromWreath[wreath, "a"], ConstantArray[0, 7], 3],
	{{0, 0, 0, 0, 0, 0, 0}, {1, 0, 0, 0, 0, 0, 0}, {0, 1, 0, 0, 0, 0, 0}, {1, 1, 0, 0, 0, 0, 0}}
]

VerificationTest[
	IteratedFiniteAutomatonEvolve[IteratedFiniteAutomatonFromStates[mealy, "eps"], ConstantArray[0, 6], 5],
	IteratedFiniteAutomatonEvolve[IteratedFiniteAutomatonFromWreath[wreath, "a"], ConstantArray[0, 6], 5]
]
