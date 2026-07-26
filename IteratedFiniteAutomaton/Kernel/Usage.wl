Package["WolframInstitute`IteratedFiniteAutomaton`"]

IteratedFiniteAutomaton::usage = "IteratedFiniteAutomaton[rule, init, t] generates the evolution of the iterated finite automaton with the specified rule from initial condition init for t steps.\nIteratedFiniteAutomaton[rule, s0, init, t] starts the automaton in state s0.\nIteratedFiniteAutomaton[rule, init] gives one step of evolution.\nIteratedFiniteAutomaton[rule, s0] is the operator form.\nRules are given as {s, i} -> {f, o} or as a numeric code {code, {s, k}}.";

IteratedFiniteAutomatonPeriodicStop::usage = "IteratedFiniteAutomatonPeriodicStop[rule, s0, init, t] evolves the iterated finite automaton until a row repeats, up to at most t steps.\nIteratedFiniteAutomatonPeriodicStop[rule, s0] is the operator form.";

IteratedFiniteAutomatonStateTransitions::usage = "IteratedFiniteAutomatonStateTransitions[rule, s0, init, t] evolves the iterated finite automaton recording at each cell the transition DirectedEdge[s, f, i -> o].";

IteratedFiniteAutomatonStateGraph::usage = "IteratedFiniteAutomatonStateGraph[{code, {s, k}}] gives the state transition diagram of the automaton as a Graph with edge tags i -> o.\nIteratedFiniteAutomatonStateGraph[rule] accepts an explicit rule list.";

IteratedFiniteAutomatonColors::usage = "IteratedFiniteAutomatonColors[k] gives ColorRules for k symbols: white for 0, black for 1 when k == 2, ColorData[97] otherwise.";

IteratedFiniteAutomatonFromStates::usage = "IteratedFiniteAutomatonFromStates[<|state -> {input -> {output, nextState}, ...}, ...|>, s0] converts a Mealy transducer with named states and initial state s0 into <|\"Rule\", \"InitialState\", \"StateIndex\"|> suitable for IteratedFiniteAutomaton.";

IteratedFiniteAutomatonFromWreath::usage = "IteratedFiniteAutomatonFromWreath[<|state -> {outputs, sections}, ...|>, s0] converts a wreath recursion g = (outputs; sections) on symbols 0, ..., k-1 into <|\"Rule\", \"InitialState\", \"StateIndex\"|> suitable for IteratedFiniteAutomaton.";

IteratedFiniteAutomatonEvolve::usage = "IteratedFiniteAutomatonEvolve[conv, init, t] evolves the converted automaton conv = IteratedFiniteAutomatonFromStates[...] or IteratedFiniteAutomatonFromWreath[...] from initial condition init for t steps.";

(* Presentations. Wherever an argument is called automaton it may be an explicit
   rule list {s, i} -> {f, o} or a numeric code {code, {s, k}}. *)

AutomatonRuleFromCode::usage = "AutomatonRuleFromCode[{code, {s, k}}] gives the Mealy rule {state, input} -> {nextState, output} of the automaton numbered code over s states and k symbols.";

AutomatonCodeFromRule::usage = "AutomatonCodeFromRule[rule] gives the numeric code {code, {s, k}} of an explicit Mealy rule, inverting AutomatonRuleFromCode.";

CanonicalAutomatonCode::usage = "CanonicalAutomatonCode[automaton] gives the least code {code, {s, k}} in the orbit of the automaton under relabelling its states and symbols, so that two automata differing only by relabelling get the same code.";

InvertibleAutomatonQ::usage = "InvertibleAutomatonQ[automaton] gives True if the outputs at each state permute the symbols, so the automaton acts on the rooted tree by an automorphism.";

InvertibleAutomatonCodes::usage = "InvertibleAutomatonCodes[{s, k}] gives the codes of all invertible automata over s states and k symbols.";

(* Action on the rooted tree. *)

AutomatonLevelPermutations::usage = "AutomatonLevelPermutations[automaton, level] gives an Association sending each state to its action on the k^level vertices at depth level, as a permutation list.";

AutomatonWordPermutation::usage = "AutomatonWordPermutation[perms, word] gives the permutation of the level vertices induced by a word in the generators, where perms = AutomatonLevelPermutations[automaton, level] and a negative entry of word means an inverse generator.\nAutomatonWordPermutation[automaton, level, word] builds perms first.";

AutomatonWordOrders::usage = "AutomatonWordOrders[automaton, word, levels] gives the order of word in Aut(T_L) for each L in levels. The orders are nondecreasing in L, and constant from some level on exactly when word has finite order.";

AutomatonWordBall::usage = "AutomatonWordBall[automaton, radius] gives the reduced words of length 1 to radius in the free group on the automaton's states, with inverses written as negative state numbers.";

AutomatonGroupBall::usage = "AutomatonGroupBall[automaton, radius, refLevel] gives one shortest word for each distinct nontrivial element of the level-refLevel quotient represented by a word of length at most radius.";

AutomatonElementCount::usage = "AutomatonElementCount[automaton, wordLength, level] gives the number of distinct elements of Aut(T_level) represented by words of length at most wordLength.";

(* Group invariants. *)

AutomatonAbelianQ::usage = "AutomatonAbelianQ[automaton, level] gives True if the generators commute in the level quotient.";

AutomatonTorsionFreeCandidateQ::usage = "AutomatonTorsionFreeCandidateQ[automaton, wordLength, levels] gives True if some word of length at most wordLength acts nontrivially at the deepest of levels and no word's order has stopped growing there. The condition is necessary but not sufficient for torsion-freeness: orders can plateau and later resume, as they do for the lamplighter group.";

AutomatonGroupFingerprint::usage = "AutomatonGroupFingerprint[automaton, level] gives <|\"Code\", \"Abelian\", \"BallGrowth\"|> for the level quotient, where \"BallGrowth\" counts the elements represented by words of length 1 to 4.";

BGKMNSSNumber::usage = "BGKMNSSNumber[automaton] gives the number of a 3-state binary automaton in the classification of Bondarenko, Grigorchuk, Kravchenko, Muntyan, Nekrashevych, Savchuk and Sunic, arXiv:0803.3555.";

(* Wreath recursion and sections. *)

AutomatonWreathRecursion::usage = "AutomatonWreathRecursion[automaton] gives the wreath recursion as <|state -> {outputs, sections}, ...|>, the argument IteratedFiniteAutomatonFromWreath consumes.\nAutomatonWreathRecursion[automaton, Method -> \"String\"] gives the printable rendering a = \[Sigma](b, c) instead.";

AutomatonSectionTable::usage = "AutomatonSectionTable[automaton] gives an Association sending {g, x} to {section of g at x, image of x}, for every generator g and every inverse generator -g.";

AutomatonWordSection::usage = "AutomatonWordSection[sections, word, x] gives {section of word at the letter x, image of x}, where sections = AutomatonSectionTable[automaton].";

AutomatonSection::usage = "AutomatonSection[automaton, word, treeWord] gives the section of word at the tree vertex treeWord.";

AutomatonNucleus::usage = "AutomatonNucleus[automaton, radius, depth, refLevel] gives, for each d = 0, ..., depth, the sections at depth d of the words of length at most radius, kept distinct as automorphisms of T_refLevel. The list stabilizes exactly when the automaton is contracting, and its limit is the nucleus.";

(* The group ring. An element is a list of {coefficient, word} pairs, so {} is 0 and
   {{1, {}}} is 1; Modulus -> p computes over F_p and Modulus -> 0 over the integers. *)

MaxTerms::usage = "MaxTerms is an option for the group-ring searches specifying the largest number of nonzero terms a candidate element may have. MaxTerms -> Infinity searches the whole support.";

GroupRingLevelProduct::usage = "GroupRingLevelProduct[perms, a, b] gives the product of the group-ring elements a and b in the level quotient, as an Association from level permutation to coefficient, where perms = AutomatonLevelPermutations[automaton, level].\nGroupRingLevelProduct[automaton, level, a, b] builds perms first.\nThe product is <||> exactly when a b = 0 in the level quotient.";

GroupRingIdempotentQ::usage = "GroupRingIdempotentQ[automaton, a, level] gives True if a (a - 1) = 0 in the group ring of the level quotient, so that a is idempotent there.";

GroupRingIdempotentSearch::usage = "GroupRingIdempotentSearch[automaton, radius, coefficients, level] gives the idempotents of the group ring of the level quotient supported on words of length at most radius with coefficients drawn from coefficients, one per group-ring element and excluding 0 and 1.";

GroupRingIdempotentSurvival::usage = "GroupRingIdempotentSurvival[automaton, radius, levels] searches over F_p, p = OptionValue[Modulus], for elements supported on the radius ball that are idempotent in every level quotient in levels, and gives <|\"Code\", \"Support\", \"Counts\", \"Survivors\"|>, where \"Counts\" records how many candidates remain after each level. An idempotent other than 0 and 1 is a zero divisor, so an empty \"Survivors\" refutes one radius over one field.\nMaxTerms -> t restricts candidates to at most t nonzero terms.";

GroupRingLeftAnnihilator::usage = "GroupRingLeftAnnihilator[automaton, a, support, levels] gives a basis of the coefficient vectors b, in the basis support, with a . Sum_j b_j support_j = 0 in every level quotient in levels. The condition is linear in b, so this is a nullspace over F_p, p = OptionValue[Modulus].";

GroupRingZeroDivisorSurvival::usage = "GroupRingZeroDivisorSurvival[automaton, radius, levels] searches over F_p, p = OptionValue[Modulus], for elements A supported on the radius ball whose left annihilator is nonempty in every level quotient in levels, and gives <|\"Code\", \"Support\", \"Counts\", \"Survivors\", \"Annihilators\"|>, pairing each surviving A with a witness B satisfying A B = 0 at every tested level.\nMaxTerms -> t restricts A to at most t nonzero terms.\nMethod -> \"Tower\" (the default) filters level by level using precomputed 0/1 matrices for left multiplication; Method -> \"Annihilator\" instead takes one nullspace per candidate, stacked across all levels at once.";
