Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[$NamedAutomata]

(* ===================== The named automata of the literature =====================

   The union of GAP automgrp's AG_Groups and GAP fr's concrete example machines,
   deduplicated, keyed by mathematical name where one exists and by author otherwise.
   Recursions are literal and in the published notation, so an entry can be checked by eye
   against its source: sections are indexed by the letter read, "1" is the trivial state, and
   the trailing permutation is the letter's image.  Where a section is not a single state --
   an inverse, a product -- the recursion is kept as published and AutomatonData reports
   Missing["NonStateSections", ...] rather than silently adding states to absorb it.
   Reference keys are those of References.md.                                              *)

$NamedAutomata = <|

	(* ---------- binary ---------- *)

	"AddingMachine" -> <|
		"WreathRecursion" -> "t = (1, t)(1,2)",
		"GeneratorNames" -> {"t"},
		"Aliases" -> {"AddingMachine", "BinaryAddingMachine", "BinaryAddingGroup", "Odometer"},
		"Reference" -> "GNS2000",
		"Notes" -> "Addition of 1 on binary strings read least significant first; the group is infinite cyclic.",
		"KnownFacts" -> {"t has infinite order", "the group is Z", "level transitive", "contracting with trivial nucleus"}
	|>,

	"Grigorchuk" -> <|
		"WreathRecursion" -> "a = (1,2), b = (a, c), c = (a, d), d = (1, b)",
		"GeneratorNames" -> {"a", "b", "c", "d"},
		"Aliases" -> {"GrigorchukGroup", "GrigorchukMachine"},
		"Reference" -> "Grigorchuk1980",
		"Notes" -> "The first group of intermediate growth. Five states: the four generators and the trivial one.",
		"KnownFacts" -> {"every generator has order 2", "infinite torsion 2-group", "intermediate growth", "just infinite", "branch", "amenable but not elementary amenable"}
	|>,

	"GrigorchukTwistedTwin" -> <|
		"WreathRecursion" -> "a = (1,2), x = (y, a), y = (a, z), z = (1, x)",
		"GeneratorNames" -> {"a", "x", "y", "z"},
		"Aliases" -> {"GrigorchukTwistedTwin"},
		"Reference" -> "FR",
		"Notes" -> "The twisted twin of the Grigorchuk group: the same Moore diagram shape with the sections of b and c exchanged. Not isomorphic to Grigorchuk.",
		"KnownFacts" -> {"torsion", "branch"}
	|>,

	"GrigorchukErschler" -> <|
		"WreathRecursion" -> "a = (1,2), b = (a, b), c = (a, d), d = (1, c)",
		"GeneratorNames" -> {"a", "b", "c", "d"},
		"Aliases" -> {"GrigorchukErschlerGroup"},
		"Reference" -> "BartholdiErschler2010",
		"Notes" -> "A permutational extension in the Grigorchuk family: the Grigorchuk recursion with b's second section pointing at b rather than at c.",
		"KnownFacts" -> {"every generator has order 2", "b c has order 2", "intermediate growth"}
	|>,

	"UniversalGrigorchuk" -> <|
		"WreathRecursion" -> "a = (1,4)(2,5)(3,6), b = (a, a, 1, b, b, b), c = (a, 1, a, c, c, c), d = (1, a, a, d, d, d)",
		"GeneratorNames" -> {"a", "b", "c", "d"},
		"Aliases" -> {"UniversalGrigorchukGroup"},
		"Reference" -> "AutomGrp",
		"Notes" -> "Six colours: the three Grigorchuk relations b c d = 1 are carried by one automaton acting on the 6-ary tree.",
		"KnownFacts" -> {"every generator has order 2"}
	|>,

	"Lamplighter" -> <|
		"WreathRecursion" -> "a = (a, b)(1,2), b = (a, b)",
		"GeneratorNames" -> {"a", "b"},
		"Aliases" -> {"Lamplighter", "LamplighterGroup"},
		"Reference" -> "GrigorchukZuk2001",
		"Notes" -> "Two states, no trivial state. The lamplighter Z/2 wr Z, whose spectrum is the discrete Laplacian computed in the source.",
		"KnownFacts" -> {"a and b have infinite order", "a b^-1 has order 2", "the group is Z/2 wr Z", "not contracting", "level orders plateau and then resume, so a level tower cannot certify infinite order here"}
	|>,

	"InfiniteDihedral" -> <|
		"WreathRecursion" -> "a = (a, a)(1,2), b = (b, a)",
		"GeneratorNames" -> {"a", "b"},
		"Aliases" -> {"InfiniteDihedral", "UniversalDihedral"},
		"Reference" -> "AutomGrp",
		"Notes" -> "The infinite dihedral group as a 2-state binary automaton group.",
		"KnownFacts" -> {"the group is D-infinity", "a b has infinite order"}
	|>,

	"Basilica" -> <|
		"WreathRecursion" -> "u = (v, 1)(1,2), v = (u, 1)",
		"GeneratorNames" -> {"u", "v"},
		"Aliases" -> {"Basilica", "BasilicaGroup"},
		"Reference" -> "GrigorchukZuk2002",
		"Notes" -> "The iterated monodromy group of z^2 - 1. Three states with the trivial one.",
		"KnownFacts" -> {"torsion free", "weakly branch", "amenable but not subexponentially amenable", "not elementary amenable"}
	|>,

	"Aleshin" -> <|
		"WreathRecursion" -> "a = (b, c)(1,2), b = (c, b)(1,2), c = (a, a)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"AleshinGroup", "AleshinMachine"},
		"Reference" -> "Aleshin1983",
		"Notes" -> "Three states, no trivial state, automaton 2240 of the classification. Free of rank 3, proved by Vorobets and Vorobets.",
		"KnownFacts" -> {"free of rank 3", "torsion free", "not contracting", "relator free to length 12 as certified in this repository"}
	|>,

	"BabyAleshin" -> <|
		"WreathRecursion" -> "a = (b, c), b = (c, b), c = (a, a)(1,2)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"BabyAleshinMachine", "BabyAleshinGroup"},
		"Reference" -> "BGKMNSS2008",
		"Notes" -> "The Aleshin Moore diagram with the activity moved to the third state, automaton 2969 of the classification.",
		"KnownFacts" -> {"every generator has order 2", "not free, unlike Aleshin itself"}
	|>,

	"Bellaterra" -> <|
		"WreathRecursion" -> "a = (c, c)(1,2), b = (a, b), c = (b, a)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"Bellaterra", "BellaterraGroup"},
		"Reference" -> "BGKMNSS2008",
		"Notes" -> "Named only in the classification of 3-state binary automata, where it is automaton 846.",
		"KnownFacts" -> {"every generator has order 2", "bireversible", "the group is the free product of three copies of Z/2"}
	|>,

	"BrunnerSidkiVieira" -> <|
		"WreathRecursion" -> "t = (1, t)(1,2), m = (1, m1)(1,2), m1 = (m, 1)(1,2)",
		"GeneratorNames" -> {"t", "m", "m1"},
		"Aliases" -> {"BrunnerSidkiVieiraMachine", "BrunnerSidkiVieiraGroup"},
		"Reference" -> "BSV1999",
		"Notes" -> "t is the adding machine and m1 is the inverse of m, carried as its own state so the recursion stays Mealy: the group is generated by t and m alone.",
		"KnownFacts" -> {"free of rank 2", "torsion free"}
	|>,

	"Dahmani" -> <|
		"WreathRecursion" -> "a = (c, a)(1,2), b = (b, a)(1,2), c = (b, c)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"DahmaniGroup"},
		"Reference" -> "Dahmani2005",
		"Notes" -> "Three states, no trivial state; the example whose finitely generated subgroup structure is the point of the source.",
		"KnownFacts" -> {}
	|>,

	"Rabbit" -> <|
		"WreathRecursion" -> "a = (b, 1)(1,2), b = (1, c), c = (a, 1)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"Rabbit", "RabbitGroup"},
		"Reference" -> "Nekrashevych2005",
		"Notes" -> "Iterated monodromy group of the rabbit polynomial, one of the three post-critically finite quadratics with a period 3 cycle.",
		"KnownFacts" -> {"contracting", "weakly branch"}
	|>,

	"Airplane" -> <|
		"WreathRecursion" -> "a = (1, b)(1,2), b = (1, c), c = (a, 1)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"Airplane", "AirplaneGroup"},
		"Reference" -> "Nekrashevych2005",
		"Notes" -> "Iterated monodromy group of the airplane polynomial; the rabbit's twin, differing only in which section of a is nontrivial.",
		"KnownFacts" -> {"contracting", "weakly branch"}
	|>,

	"IMGz2PlusI" -> <|
		"WreathRecursion" -> "a = (1,2), b = (a, c), c = (b, 1)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"IMG_z2plusI"},
		"Reference" -> "Nekrashevych2005",
		"Notes" -> "Iterated monodromy group of z^2 + i, the standard example of a group with unsolvable-looking growth in the IMG family.",
		"KnownFacts" -> {"contracting"}
	|>,

	"Mamaghani" -> <|
		"WreathRecursion" -> "a = (1, b)(1,2), b = (a, c), c = (a, a^-1)(1,2)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"MamaghaniGroup"},
		"Reference" -> "FR",
		"Notes" -> "Published with an inverse section, so the recursion is not a Mealy machine over these three states as written.",
		"KnownFacts" -> {}
	|>,

	"SidkiFree" -> <|
		"WreathRecursion" -> "a = (a^2, a^t), t = (1, t)(1,2)",
		"GeneratorNames" -> {"a", "t"},
		"Aliases" -> {"SidkiFreeGroup"},
		"Reference" -> "Sidki2000",
		"Notes" -> "A self-similar rather than finite-state presentation: the sections are a square and a conjugate, so no Mealy machine over {a, t} realises it.",
		"KnownFacts" -> {"free of rank 2"}
	|>,

	(* ---------- ternary ---------- *)

	"GuptaSidki3" -> <|
		"WreathRecursion" -> "a = (1, 1, 1)(1,2,3), a2 = (1, 1, 1)(1,3,2), b = (a, a2, b)",
		"GeneratorNames" -> {"a", "a2", "b"},
		"Aliases" -> {"GuptaSidki3Group", "GuptaSidkiMachine", "GuptaSidkiGroup"},
		"Reference" -> "GuptaSidki1983",
		"Notes" -> "Published as b = (a, a^-1, b); a2 is a^-1 = a^2 carried as its own state, so the recursion stays Mealy. The group is generated by a and b alone.",
		"KnownFacts" -> {"a and b have order 3", "infinite torsion 3-group", "just infinite", "branch"}
	|>,

	"FabrykowskiGupta" -> <|
		"WreathRecursion" -> "a = (1, 1, 1)(1,2,3), b = (a, 1, b)",
		"GeneratorNames" -> {"a", "b"},
		"Aliases" -> {"GuptaFabrikowskiGroup", "FabrykowskiGuptaGroup"},
		"Reference" -> "BGN2003",
		"Notes" -> "The spinal group with trivial second section: Gupta-Sidki with a^-1 replaced by the trivial state.",
		"KnownFacts" -> {"a and b have order 3", "intermediate growth", "branch"}
	|>,

	"BartholdiGrigorchuk" -> <|
		"WreathRecursion" -> "a = (1, 1, 1)(1,2,3), b = (a, a, b)",
		"GeneratorNames" -> {"a", "b"},
		"Aliases" -> {"BartholdiGrigorchukGroup"},
		"Reference" -> "AutomGrp",
		"Notes" -> "The Fabrykowski-Gupta recursion with the trivial section replaced by a; a different group of intermediate growth on the same tree.",
		"KnownFacts" -> {"a has order 3", "intermediate growth"}
	|>,

	"Hanoi3" -> <|
		"WreathRecursion" -> "a23 = (a23, 1, 1)(2,3), a13 = (1, a13, 1)(1,3), a12 = (1, 1, a12)(1,2)",
		"GeneratorNames" -> {"a23", "a13", "a12"},
		"Aliases" -> {"Hanoi3", "HanoiGroup3", "HanoiTowersGroup"},
		"Reference" -> "AutomGrp",
		"Notes" -> "The Hanoi towers group on 3 pegs: generator aij transposes the pegs i and j at the root and recurses on the peg it fixes.",
		"KnownFacts" -> {"every generator has order 2", "the Schreier graphs are the Hanoi puzzle graphs", "branch"}
	|>,

	"Sushchansky" -> <|
		"WreathRecursion" -> "A = (1, 1, 1)(1,2,3), A2 = (1, 1, 1)(1,3,2), B = (r1, q1, A),
			r1 = (r2, A, 1), r2 = (r3, 1, 1), r3 = (r4, 1, 1), r4 = (r5, A, 1), r5 = (r6, A2, 1),
			r6 = (r7, A, 1), r7 = (r8, A, 1), r8 = (r9, A, 1), r9 = (r1, A2, 1),
			q1 = (q2, 1, 1), q2 = (q3, A, 1), q3 = (q1, A, 1)",
		"GeneratorNames" -> {"A", "A2", "B", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "q1", "q2", "q3"},
		"Aliases" -> {"SushchanskyGroup"},
		"Reference" -> "AutomGrp",
		"Notes" -> "A Burnside p-group of intermediate growth. automgrp writes the states r_i and q_i with underscores; the underscores are dropped here so the names are plain identifiers. A2 is A^-1.",
		"KnownFacts" -> {"infinite torsion 3-group", "intermediate growth"}
	|>,

	(* ---------- four or more colours ---------- *)

	"UniversalInfiniteDihedral" -> <|
		"WreathRecursion" -> "a = (1,2)(3,4), b = (a, c, a, c), c = (b, 1, 1, b)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"UniversalD_omega"},
		"Reference" -> "AutomGrp",
		"Notes" -> "Four colours; the universal cover of the infinite dihedral relations in the same sense as UniversalGrigorchuk.",
		"KnownFacts" -> {"a has order 2"}
	|>,

	"Hanoi4" -> <|
		"WreathRecursion" -> "a12 = (1, 1, a12, a12)(1,2), a13 = (1, a13, 1, a13)(1,3), a14 = (1, a14, a14, 1)(1,4),
			a23 = (a23, 1, 1, a23)(2,3), a24 = (a24, 1, a24, 1)(2,4), a34 = (a34, a34, 1, 1)(3,4)",
		"GeneratorNames" -> {"a12", "a13", "a14", "a23", "a24", "a34"},
		"Aliases" -> {"Hanoi4", "HanoiGroup4"},
		"Reference" -> "AutomGrp",
		"Notes" -> "The Hanoi towers group on 4 pegs: aij transposes pegs i and j at the root and recurses on each peg it fixes.",
		"KnownFacts" -> {"every generator has order 2"}
	|>,

	"Weierstrass" -> <|
		"WreathRecursion" -> "a = (1, 1, 1, 1)(1,2)(3,4), b = (1, 1, 1, 1)(1,3)(2,4), c = (1, 1, 1, 1)(1,4)(2,3), t = (t, a, b, c)",
		"GeneratorNames" -> {"a", "b", "c", "t"},
		"Aliases" -> {"WeierstrassGroup"},
		"Reference" -> "FR",
		"Notes" -> "Four colours; the three rooted involutions are the Klein four-group at the root and t threads them down the tree.",
		"KnownFacts" -> {"all four generators have order 2"}
	|>,

	"Strichartz" -> <|
		"WreathRecursion" -> "a = (b, b, c, c, a, a), b = (1,2)(3,4)(5,6), c = (1,6)(2,3)(4,5)",
		"GeneratorNames" -> {"a", "b", "c"},
		"Aliases" -> {"StrichartzGroup"},
		"Reference" -> "FR",
		"Notes" -> "Six colours; b and c are rooted involutions and a is the only state with nontrivial sections.",
		"KnownFacts" -> {"a, b and c have order 2"}
	|>,

	"BartholdiNonuniformExponent" -> <|
		"WreathRecursion" -> "x = (1, 1, 1, 1, 1, 1, 1)(1,5)(3,7), y = (1, 1, 1, 1, 1, 1, 1)(2,3)(6,7),
			z = (1, 1, 1, 1, 1, 1, 1)(4,6)(5,7), x1 = (x1, x, 1, 1, 1, 1, 1), y1 = (y1, y, 1, 1, 1, 1, 1),
			z1 = (z1, z, 1, 1, 1, 1, 1)",
		"GeneratorNames" -> {"x", "y", "z", "x1", "y1", "z1"},
		"Aliases" -> {"BartholdiNonunifExponGroup"},
		"Reference" -> "AutomGrp",
		"Notes" -> "Seven colours; a Wilson-type group of non-uniformly exponential growth. The rooted permutations are the Fano plane involutions.",
		"KnownFacts" -> {"x, y, z have order 2", "exponential but not uniformly exponential growth"}
	|>,

	"FornaessSibony" -> <|
		"WreathRecursion" -> "alpha = (1,2)(3,4), beta = (alpha, gamma, alpha, gamma), gamma = (beta, 1, 1, beta),
			a = (1,3)(2,4), b = (alpha*a, alpha*a, c, c), c = (beta*b, beta*b, b, b)",
		"GeneratorNames" -> {"alpha", "beta", "gamma", "a", "b", "c"},
		"Aliases" -> {"FornaessSibonyGroup"},
		"Reference" -> "FR",
		"Notes" -> "Published with product sections, so the recursion is not a Mealy machine over these six states as written.",
		"KnownFacts" -> {}
	|>

|>
