Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[FAStep]
PackageScope[ToFARule]

IteratedFiniteAutomaton[rule_List, s0_Integer : 1, init_List, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = If[MatchQ[rule, {_Integer, {_Integer, _Integer}}], ToFARule[rule], rule]},
	If[t === Automatic, FAStep[rt, s0, init], NestList[FAStep[rt, s0, #]&, init, t]]]

IteratedFiniteAutomaton[rule_List, s0_Integer : 1][init_List] := IteratedFiniteAutomaton[rule, s0, init]

IteratedFiniteAutomatonPeriodicStop[rule_List, s0_Integer : 1, init_List, t : ((_Integer ? NonNegative) | Automatic) : Automatic] := With[{rt = If[MatchQ[rule, {_Integer, {_Integer, _Integer}}], ToFARule[rule], rule]},
	NestWhileList[FAStep[rt, s0, #]&, init, !MemberQ[Most[{##}], Last[{##}]]&, All, If[t === Automatic, Infinity, t]]]

IteratedFiniteAutomatonPeriodicStop[rule_List, s0_Integer : 1][init_List] := IteratedFiniteAutomatonPeriodicStop[rule, s0, init]

FAStep[rule_, s0_, list_] := Map[Last, Rest[FoldList[{First[#1], #2} /. rule&, {s0}, list]]]

ToFARule[{m_Integer, {s_Integer, k_Integer}}] := Flatten[MapIndexed[{#2[[1]], k - #2[[2]]} -> Mod[Quotient[#1, {k, 1}], {s, k}] + {1, 0}&, Partition[IntegerDigits[m, s k, s k], k], {2}]]
