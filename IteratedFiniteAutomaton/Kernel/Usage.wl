Package["WolframInstitute`IteratedFiniteAutomaton`"]

IteratedFiniteAutomaton::usage = "IteratedFiniteAutomaton[rule, init, t] generates the evolution of the iterated finite automaton with the specified rule from initial condition init for t steps.\nIteratedFiniteAutomaton[rule, s0, init, t] starts the automaton in state s0.\nIteratedFiniteAutomaton[rule, init] gives one step of evolution.\nIteratedFiniteAutomaton[rule, s0] is the operator form.\nRules are given as {s, i} -> {f, o} or as a numeric code {code, {s, k}}.";

IteratedFiniteAutomatonPeriodicStop::usage = "IteratedFiniteAutomatonPeriodicStop[rule, s0, init, t] evolves the iterated finite automaton until a row repeats, up to at most t steps.\nIteratedFiniteAutomatonPeriodicStop[rule, s0] is the operator form.";

IteratedFiniteAutomatonStateTransitions::usage = "IteratedFiniteAutomatonStateTransitions[rule, s0, init, t] evolves the iterated finite automaton recording at each cell the transition DirectedEdge[s, f, i -> o].";

IteratedFiniteAutomatonStateGraph::usage = "IteratedFiniteAutomatonStateGraph[{code, {s, k}}] gives the state transition diagram of the automaton as a Graph with edge tags i -> o.\nIteratedFiniteAutomatonStateGraph[rule] accepts an explicit rule list.";

IteratedFiniteAutomatonStateSubgraph::usage = "IteratedFiniteAutomatonStateSubgraph[rule, s0, init, t] gives the sub-digraph of the state transition diagram whose edges the initial condition init actually traverses in t steps, as a Graph on all of the automaton's states, so that an isolated vertex is a state this tape never visits.\nIteratedFiniteAutomatonStateSubgraph[rule, s0, init] uses one step.\nIteratedFiniteAutomatonStateSubgraph[rule, s0] is the operator form.";

IteratedFiniteAutomatonStateSubgraphFamily::usage = "IteratedFiniteAutomatonStateSubgraphFamily[rule, s0, n, t] gives the family of exercised sub-digraphs over all k^n initial conditions of length n, as an Association sending each traversed edge set to the tapes that traverse it. Its length counts the distinct subgraphs, and Union @@ Keys gives the edges some tape reaches.\nIteratedFiniteAutomatonStateSubgraphFamily[rule, s0, n] uses one step.";

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

(* Constructive families.  Each is a rule list, so every function taking an automaton
   takes one, and each is a function of the number of states, which is the point:
   the many-state regime is too large to enumerate and has to be built. *)

AutomatonAdderCascade::usage = "AutomatonAdderCascade[s] gives the rule of the cascade of s - 1 binary odometers in series: state i advances the symbol it reads and passes the carry to state i + 1, and the carry dies in the identity state s. State i is then finitary of depth s - i and has order 2^(s-i), and the group is the whole of Aut(T_(s-1)), of order 2^(2^(s-1)-1) - finite, so the family spends its states on torsion.\nAutomatonAdderCascade[s, k] uses k symbols, where the group is the iterated wreath product of s - 1 copies of Z/k, of order k^((k^(s-1)-1)/(k-1)), all of Aut(T_(s-1)) exactly when k = 2.";

AutomatonWindowProgram::usage = "AutomatonWindowProgram[m, active] gives the rule of the automaton on the 2^m windows of the m symbols last read, advancing the symbol it reads exactly under the windows in active, which are given as lists of m symbols. The section at a tree vertex depends only on the window, so the automaton runs a sliding-block program on the boundary.\nAutomatonWindowProgram[m, active, k] uses k symbols; AutomatonWindowProgram[m] and AutomatonWindowProgram[m, k] take active to be the single all-(k-1) window, the carry rule of the odometer, where m = 1 over two symbols is the lamplighter automaton a = (a, b), b = \[Sigma](a, b) of Grigorchuk and Zuk.";

AutomatonProduct::usage = "AutomatonProduct[a, b] gives the rule of the composition automaton on the s_a s_b pairs of states, where state {p, q}, numbered (p - 1) s_b + q, acts on the rooted tree as the automorphism of p followed by that of q. Its group is a subgroup of the group generated by a and b together.";

(* Action on the rooted tree. *)

AutomatonLevelPermutations::usage = "AutomatonLevelPermutations[automaton, level] gives an Association sending each state to its action on the k^level vertices at depth level, as a permutation list.";

AutomatonWordPermutation::usage = "AutomatonWordPermutation[perms, word] gives the permutation of the level vertices induced by a word in the generators, where perms = AutomatonLevelPermutations[automaton, level] and a negative entry of word means an inverse generator.\nAutomatonWordPermutation[automaton, level, word] builds perms first.";

AutomatonWordOrders::usage = "AutomatonWordOrders[automaton, word, levels] gives the order of word in Aut(T_L) for each L in levels. The orders are nondecreasing in L, and constant from some level on exactly when word has finite order.";

AutomatonWordOrder::usage = "AutomatonWordOrder[automaton, word, maxOrder] gives the exact order of word in the automaton group when it is at most maxOrder, and Missing[\"OrderExceeds\", maxOrder] otherwise. Both answers are certified: any level order divides the order in G, so only its multiples up to maxOrder need the word problem, and refuting them all proves the order exceeds the bound.";

AutomatonWordBall::usage = "AutomatonWordBall[automaton, radius] gives the reduced words of length 1 to radius in the free group on the automaton's states, with inverses written as negative state numbers.";

AutomatonGroupBall::usage = "AutomatonGroupBall[automaton, radius, refLevel] gives one shortest word for each distinct nontrivial element of the level-refLevel quotient represented by a word of length at most radius.\nAutomatonGroupBall[automaton, radius] gives one shortest word for each distinct nontrivial element of the automaton group itself, equality decided in G by the word problem.";

AutomatonElementCount::usage = "AutomatonElementCount[automaton, wordLength, level] gives the number of distinct elements of Aut(T_level) represented by words of length at most wordLength.\nAutomatonElementCount[automaton, wordLength] counts in the automaton group itself, so the result is exact rather than a lower bound.";

(* Group invariants. *)

AutomatonAbelianQ::usage = "AutomatonAbelianQ[automaton, level] gives True if the generators commute in the level quotient.\nAutomatonAbelianQ[automaton] decides commutativity in the automaton group itself, certifying every commutator of two generators trivial.";

AutomatonTorsionFreeCandidateQ::usage = "AutomatonTorsionFreeCandidateQ[automaton, wordLength, levels] gives True if some word of length at most wordLength acts nontrivially at the deepest of levels and no word's order has stopped growing there. The condition is necessary but not sufficient for torsion-freeness: orders can plateau and later resume, as they do for the lamplighter group.\nAutomatonTorsionFreeCandidateQ[automaton, wordLength, maxOrder] decides in the automaton group itself: True if the ball contains a nontrivial element and no torsion element of order at most maxOrder. False on found torsion is a certificate that the group has torsion; True remains a filter, since a longer torsion word or a larger order may exist.";

AutomatonGroupFingerprint::usage = "AutomatonGroupFingerprint[automaton, level] gives <|\"Code\", \"Abelian\", \"BallGrowth\"|> for the level quotient, where \"BallGrowth\" counts the elements represented by words of length 1 to 4.\nAutomatonGroupFingerprint[automaton] computes both fields in the automaton group itself.";

BGKMNSSNumber::usage = "BGKMNSSNumber[automaton] gives the number of a 3-state binary automaton in the classification of Bondarenko, Grigorchuk, Kravchenko, Muntyan, Nekrashevych, Savchuk and Sunic, arXiv:0803.3555.";

(* Wreath recursion and sections. *)

AutomatonWreathRecursion::usage = "AutomatonWreathRecursion[automaton] gives the wreath recursion as <|state -> {outputs, sections}, ...|>, the argument IteratedFiniteAutomatonFromWreath consumes.\nAutomatonWreathRecursion[automaton, Method -> \"String\"] gives the printable rendering a = \[Sigma](b, c) instead.";

AutomatonSectionTable::usage = "AutomatonSectionTable[automaton] gives an Association sending {g, x} to {section of g at x, image of x}, for every generator g and every inverse generator -g.";

AutomatonWordSection::usage = "AutomatonWordSection[sections, word, x] gives {section of word at the letter x, image of x}, where sections = AutomatonSectionTable[automaton].";

AutomatonSection::usage = "AutomatonSection[automaton, word, treeWord] gives the section of word at the tree vertex treeWord.";

AutomatonNucleus::usage = "AutomatonNucleus[automaton, radius, depth, refLevel] gives, for each d = 0, ..., depth, the sections at depth d of the words of length at most radius, kept distinct as automorphisms of T_refLevel. Contraction shows as the counts decreasing to a limit that does not grow when radius grows, and that limit is the nucleus; a list sitting at the size of the radius ball for every depth is the non-contracting case, the sections of the ball being the ball again.";

AutomatonWordSectionClosure::usage = "AutomatonWordSectionClosure[automaton, word] gives the Moore diagram of word as a tree automorphism: an Association sending each freely reduced word in the section closure of word to its list of {section at x, image of x} over the letters x. Sections preserve word length, so the closure is finite.";

AutomatonWordIdentityQ::usage = "AutomatonWordIdentityQ[automaton, word] decides whether word is the identity of the automaton group, not merely of a level quotient: word = 1 in G iff every word in its section closure fixes level 1.";

AutomatonWordEqualQ::usage = "AutomatonWordEqualQ[automaton, wordA, wordB] decides whether wordA and wordB are the same element of the automaton group, as triviality of wordA . wordB^-1.";

AutomatonRuleFromWord::usage = "AutomatonRuleFromWord[automaton, word] gives word as an automaton in its own right: the states are the section closure words of word, state 1 is word itself, and every function of the paclet consumes the result.";

FindAutomatonRelations::usage = "FindAutomatonRelations[automaton, radius] gives the shortest relators of the automaton group discoverable in the radius ball: all minimal-length nontrivial freely reduced products u . v^-1 of two words of length at most radius that are trivial in G. An empty result is a theorem, not an observation: no relator of length at most 2 radius exists, so the radius ball of the free group embeds in the automaton group.";

FindAutomatonTorsionElements::usage = "FindAutomatonTorsionElements[automaton, radius, maxOrder] gives an Association from each torsion element of the radius ball, one shortest word per element, to its exact order in the automaton group, sorted by word length. An empty result is a theorem: no word of length at most radius has order between 2 and maxOrder.";

(* The group ring. An element is a list of {coefficient, word} pairs, so {} is 0 and
   {{1, {}}} is 1; Modulus -> p computes over F_p and Modulus -> 0 over the integers. *)

MaxTerms::usage = "MaxTerms is an option for the group-ring searches specifying the largest number of nonzero terms a candidate element may have. MaxTerms -> Infinity searches the whole support.";

GroupRingLevelProduct::usage = "GroupRingLevelProduct[perms, a, b] gives the product of the group-ring elements a and b in the level quotient, as an Association from level permutation to coefficient, where perms = AutomatonLevelPermutations[automaton, level].\nGroupRingLevelProduct[automaton, level, a, b] builds perms first.\nThe product is <||> exactly when a b = 0 in the level quotient.";

GroupRingIdempotentQ::usage = "GroupRingIdempotentQ[automaton, a, level] gives True if a (a - 1) = 0 in the group ring of the level quotient, so that a is idempotent there.";

GroupRingIdempotentSearch::usage = "GroupRingIdempotentSearch[automaton, radius, coefficients, level] gives the idempotents of the group ring of the level quotient supported on words of length at most radius with coefficients drawn from coefficients, one per group-ring element and excluding 0 and 1.";

GroupRingIdempotentSurvival::usage = "GroupRingIdempotentSurvival[automaton, radius, levels] searches over F_p, p = OptionValue[Modulus], for elements supported on the radius ball that are idempotent in every level quotient in levels, and gives <|\"Code\", \"Support\", \"Counts\", \"Survivors\"|>, where \"Counts\" records how many candidates remain after each level. An idempotent other than 0 and 1 is a zero divisor, so an empty \"Survivors\" refutes one radius over one field.\nMaxTerms -> t restricts candidates to at most t nonzero terms.";

GroupRingLeftAnnihilator::usage = "GroupRingLeftAnnihilator[automaton, a, support, levels] gives a basis of the coefficient vectors b, in the basis support, with a . Sum_j b_j support_j = 0 in every level quotient in levels. The condition is linear in b, so this is a nullspace over F_p, p = OptionValue[Modulus].";

GroupRingZeroDivisorSurvival::usage = "GroupRingZeroDivisorSurvival[automaton, radius, levels] searches over F_p, p = OptionValue[Modulus], for elements A supported on the radius ball whose left annihilator is nonempty in every level quotient in levels, and gives <|\"Code\", \"Support\", \"Counts\", \"Survivors\", \"Annihilators\"|>, pairing each surviving A with a witness B satisfying A B = 0 at every tested level.\nMaxTerms -> t restricts A to at most t nonzero terms.\nMethod -> \"Tower\" (the default) filters level by level using precomputed 0/1 matrices for left multiplication; Method -> \"Annihilator\" instead takes one nullspace per candidate, stacked across all levels at once.";

(* Portraits and galleries.  The step count stays positional, as it is on
   IteratedFiniteAutomaton itself, and defaults to Automatic = the tape length. *)

AutomatonTreePortrait::usage = "AutomatonTreePortrait[automaton, s0, level] gives the prefix of the rooted tree down to depth level as a Graph, with each vertex colored by the section of the state s0 at that vertex and enlarged when that section permutes its symbols.";

AutomatonBoundaryGraph::usage = "AutomatonBoundaryGraph[automaton, s0, level] gives the permutation of the k^level vertices at depth level induced by the state s0, drawn as its functional graph. The cycle structure visible in the picture is the order of s0 in Aut(T_level).";

IteratedFiniteAutomatonSample::usage = "IteratedFiniteAutomatonSample[{s, k}, n] gives n + 1 codes spread evenly over the (s k)^(s k) automata on s states and k symbols.";

IteratedFiniteAutomatonInitialConditionSample::usage = "IteratedFiniteAutomatonInitialConditionSample[k, length, n] gives n + 1 initial conditions of the given length, spread evenly over the k^length tapes on k symbols.";

IteratedFiniteAutomatonsByRule::usage = "IteratedFiniteAutomatonsByRule[{s, k}, rules, init] gives one ArrayPlot of the evolution from init for each code in rules.\nIteratedFiniteAutomatonsByRule[{s, k}, rules, init, t] runs t steps instead of Length[init].";

IteratedFiniteAutomatonsByInitialCondition::usage = "IteratedFiniteAutomatonsByInitialCondition[automaton, inits] gives one ArrayPlot of the evolution of the automaton for each initial condition in inits.\nIteratedFiniteAutomatonsByInitialCondition[automaton, inits, t] runs t steps instead of Length[init].";

IteratedFiniteAutomatonsMatrix::usage = "IteratedFiniteAutomatonsMatrix[{s, k}, rules, inits] gives the matrix of ArrayPlots with one row per code in rules and one column per initial condition in inits.\nIteratedFiniteAutomatonsMatrix[{s, k}, rules, inits, t] runs t steps instead of Length[init].";
