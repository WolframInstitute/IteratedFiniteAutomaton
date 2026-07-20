Package["WolframInstitute`IteratedFiniteAutomaton`"]

IteratedFiniteAutomaton::usage = "IteratedFiniteAutomaton[rule, init, t] generates the evolution of the iterated finite automaton with the specified rule from initial condition init for t steps.\nIteratedFiniteAutomaton[rule, s0, init, t] starts the automaton in state s0.\nIteratedFiniteAutomaton[rule, init] gives one step of evolution.\nIteratedFiniteAutomaton[rule, s0] is the operator form.\nRules are given as {s, i} -> {f, o} or as a numeric code {code, {s, k}}.";

IteratedFiniteAutomatonPeriodicStop::usage = "IteratedFiniteAutomatonPeriodicStop[rule, s0, init, t] evolves the iterated finite automaton until a row repeats, up to at most t steps.\nIteratedFiniteAutomatonPeriodicStop[rule, s0] is the operator form.";

IteratedFiniteAutomatonStateTransitions::usage = "IteratedFiniteAutomatonStateTransitions[rule, s0, init, t] evolves the iterated finite automaton recording at each cell the transition DirectedEdge[s, f, i -> o].";

IteratedFiniteAutomatonStateGraph::usage = "IteratedFiniteAutomatonStateGraph[{code, {s, k}}] gives the state transition diagram of the automaton as a Graph with edge tags i -> o.\nIteratedFiniteAutomatonStateGraph[rule] accepts an explicit rule list.";

IteratedFiniteAutomatonColors::usage = "IteratedFiniteAutomatonColors[k] gives ColorRules for k symbols: white for 0, black for 1 when k == 2, ColorData[97] otherwise.";

IteratedFiniteAutomatonFromStates::usage = "IteratedFiniteAutomatonFromStates[<|state -> {input -> {output, nextState}, ...}, ...|>, s0] converts a Mealy transducer with named states and initial state s0 into <|\"Rule\", \"InitialState\", \"StateIndex\"|> suitable for IteratedFiniteAutomaton.";

IteratedFiniteAutomatonFromWreath::usage = "IteratedFiniteAutomatonFromWreath[<|state -> {outputs, sections}, ...|>, s0] converts a wreath recursion g = (outputs; sections) on symbols 0, ..., k-1 into <|\"Rule\", \"InitialState\", \"StateIndex\"|> suitable for IteratedFiniteAutomaton.";

IteratedFiniteAutomatonEvolve::usage = "IteratedFiniteAutomatonEvolve[conv, init, t] evolves the converted automaton conv = IteratedFiniteAutomatonFromStates[...] or IteratedFiniteAutomatonFromWreath[...] from initial condition init for t steps.";
