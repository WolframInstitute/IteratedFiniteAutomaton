Package["WolframInstitute`IteratedFiniteAutomaton`"]

(* ===================== Access to the named library ===================== *)

$properties = {"WreathRecursion", "States", "Colors", "GeneratorNames", "Aliases", "Reference", "Notes", "KnownFacts"};

(* the canonical key of a name, which may be canonical already or one of the GAP aliases *)
canonicalName[name_String] :=
	SelectFirst[
		Keys[$NamedAutomata],
		key |-> key === name || MemberQ[$NamedAutomata[key, "Aliases"], name],
		Missing["UnknownName", name, Nearest[Join[Keys[$NamedAutomata], Join @@ Values[$NamedAutomata[[All, "Aliases"]]]], name, {3, 4}]]]

(* the named automata of the literature: AutomatonData[] indexes them, AutomatonData[name] gives
   the rule list every other export consumes, AutomatonData[name, property] the metadata *)
AutomatonData[] := Sort @ Keys[$NamedAutomata]

AutomatonData[name_String] :=
	With[{key = canonicalName[name]},
		If[MissingQ[key], key, AutomatonFromWreathString[$NamedAutomata[key, "WreathRecursion"]]]]

AutomatonData[name_String, "Properties"] :=
	With[{key = canonicalName[name]}, If[MissingQ[key], key, $properties]]

AutomatonData[name_String, property_String] :=
	With[{key = canonicalName[name]},
		If[ MissingQ[key],
			key,
			Switch[property,
				"States", WreathStringStates[$NamedAutomata[key, "WreathRecursion"]],
				"Colors", WreathStringColors[$NamedAutomata[key, "WreathRecursion"]],
				_, Lookup[$NamedAutomata[key], property, Missing["UnknownProperty", property]]]]]
