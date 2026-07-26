Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[FAStep]

IteratedFiniteAutomaton[rule_List, s0_Integer : 1, init_List, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = ToAutomatonRule[rule]},
	If[t === Automatic, FAStep[rt, s0, init], NestList[FAStep[rt, s0, #]&, init, t]]]

IteratedFiniteAutomaton[rule_List, s0_Integer : 1][init_List] := IteratedFiniteAutomaton[rule, s0, init]

IteratedFiniteAutomatonPeriodicStop[rule_List, s0_Integer : 1, init_List, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = ToAutomatonRule[rule]},
	NestWhileList[FAStep[rt, s0, #]&, init, !MemberQ[Most[{##}], Last[{##}]]&, All, If[t === Automatic, Infinity, t]]]

IteratedFiniteAutomatonPeriodicStop[rule_List, s0_Integer : 1][init_List] := IteratedFiniteAutomatonPeriodicStop[rule, s0, init]

FAStep[rule_, s0_, list_] := Map[Last, Rest[FoldList[{First[#1], #2} /. rule&, {s0}, list]]]
