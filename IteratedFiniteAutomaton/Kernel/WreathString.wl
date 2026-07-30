Package["WolframInstitute`IteratedFiniteAutomaton`"]

PackageScope[TopLevelSplit]
PackageScope[WreathStringColors]
PackageScope[WreathStringStates]

(* ===================== The published wreath-recursion notation ===================== *)

(* bracket depth after each character of str *)
bracketDepth[str_String] :=
	Rest @ FoldList[
		{d, c} |-> d + Boole[StringMatchQ[c, "(" | "<" | "{" | "["]] - Boole[StringMatchQ[c, ")" | ">" | "}" | "]"]],
		0, Characters[str]]

(* split at the separators outside every bracket, so a section list keeps its own commas *)
TopLevelSplit[str_String, seps_List] :=
	DeleteCases[
		StringTrim /@ StringSplit[
			StringJoin @ MapThread[
				{c, d} |-> If[d == 0 && MemberQ[seps, c], "\[FormalA]", c],
				{Characters[str], bracketDepth[str]}],
			"\[FormalA]"],
		""]

(* {name, the bracketed groups} of one entry "a = (b, a)(1,2)" *)
wreathGroups[entry_String] :=
	With[{halves = TopLevelSplit[entry, {"="}]},
		{First[halves],
		 StringCases[Last[halves],
			"\[Sigma]" | ("(" ~~ Shortest[___] ~~ ")") | ("<" ~~ Shortest[___] ~~ ">") |
			("{" ~~ Shortest[___] ~~ "}") | ("[" ~~ Shortest[___] ~~ "]")]}]

groupItems[group_String] := StringTrim /@ StringSplit[StringTake[group, {2, -2}], ",", All]

(* a parenthesised group is a permutation cycle exactly when its entries are distinct
   letters of the alphabet: (1, 1, 1) repeats and so is a section list, (1, 2, 3) is a cycle *)
cycleQ[group_String] :=
	StringMatchQ[group, "(" ~~ __ ~~ ")"] &&
	With[{items = groupItems[group]},
		Length[items] >= 2 && DuplicateFreeQ[items] && AllTrue[items, StringMatchQ[#, DigitCharacter ..] &]]

sectionsQ[group_String] := StringMatchQ[group, ("(" ~~ ___ ~~ ")") | ("<" ~~ ___ ~~ ">")] && ! cycleQ[group]

imageListQ[group_String] := StringMatchQ[group, ("{" ~~ ___ ~~ "}") | ("[" ~~ ___ ~~ "]")]

wreathDegree[{_, groups_}] :=
	Max[
		Length /@ groupItems /@ Select[groups, sectionsQ],
		ToExpression /@ Flatten[groupItems /@ Select[groups, cycleQ]],
		Length /@ groupItems /@ Select[groups, imageListQ],
		1]

(* images of the letters 0, ..., k - 1: a cycle or an image list, "\[Sigma]" alone for the
   binary transposition, "\[Sigma]" before a list for the paclet's own 0-based form *)
wreathOutputs[{_, groups_}, k_Integer] :=
	With[{cycles = Select[groups, cycleQ], images = Select[groups, imageListQ]},
		{sigma = MemberQ[groups, "\[Sigma]"]},
		Which[
			images =!= {}, ToExpression /@ groupItems[First[images]] - Boole[! sigma],
			cycles =!= {}, PermutationList[Cycles[ToExpression /@ groupItems /@ cycles], k] - 1,
			sigma && k == 2, {1, 0},
			True, Range[0, k - 1]]]

wreathSections[{_, groups_}, k_Integer] :=
	With[{sections = Select[groups, sectionsQ]},
		If[sections === {}, ConstantArray["1", k], Replace[groupItems[First[sections]], "" -> "1", {1}]]]

(* the alphabet size and the state count a recursion string describes, whether or not its
   sections name states -- so a flagged recursion still reports what shape it would have *)
WreathStringColors[str_String] := Max[wreathDegree /@ wreathGroups /@ TopLevelSplit[str, {",", ";", "\n"}]]

WreathStringStates[str_String] :=
	With[{entries = wreathGroups /@ TopLevelSplit[str, {",", ";", "\n"}]},
		{names = entries[[All, 1]]},
		Length[names] + Boole[! MemberQ[names, "1"] && MemberQ[Flatten[wreathSections[#, WreathStringColors[str]] & /@ entries], "1"]]]

(* the published notation as a Mealy rule list: the section list is indexed by the letter
   read and the permutation gives its image, so "a = (b, a)(1,2)" sends 0 to 1 with section b.
   An omitted permutation is the identity, an omitted or "1" section is the trivial state, and
   a section that is not a single state -- an inverse, a product, a power -- has no state to be,
   which is what Missing["NonStateSections", ...] reports *)
AutomatonFromWreathString[recursion_List] := AutomatonFromWreathString[StringRiffle[recursion, ", "]]

AutomatonFromWreathString[str_String] :=
	With[{entries = wreathGroups /@ TopLevelSplit[str, {",", ";", "\n"}]},
		{k = Max[wreathDegree /@ entries]},
		{names = entries[[All, 1]], sections = wreathSections[#, k] & /@ entries},
		{index = AssociationThread[names -> Range[Length[names]]],
		 unknown = Complement[Flatten[sections], names, {"1"}]},
		{identity = Lookup[index, "1", Length[names] + 1]},
		{trivialState = identity > Length[names] && MemberQ[Flatten[sections], "1"]},
		If[ unknown =!= {},
			Missing["NonStateSections", unknown],
			Join[
				Join @@ MapThread[
					{name, outputs, secs} |-> Table[
						{index[name], x} -> {Lookup[index, secs[[x + 1]], identity], outputs[[x + 1]]},
						{x, 0, k - 1}],
					{names, wreathOutputs[#, k] & /@ entries, sections}],
				If[ trivialState,
					Table[{identity, x} -> {identity, x}, {x, 0, k - 1}],
					{}]]]]
