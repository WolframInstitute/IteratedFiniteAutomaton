> ⚠️ **Actively developed, experimental research code.** It undergoes frequent cleanings and refactors, and the API may change without notice.

# IteratedFiniteAutomaton

Groups associated to iterated finite automata — translation of formalisms, open problems, and tools for ruliological analysis.
Motivation: Andrzej Żuk, [*Iterated finite automata*](https://community.wolfram.com/groups/-/m/t/3761828) (WSRI 2026), and Stephen Wolfram, [*Iterated finite automata*](https://www.stephenwolfram.com/publications/iterated-finite-automata/) (2003).

## 🎯 Goals

- 🔬 Collect tools for the ruliology of iterated finite automata
- 🌉 Bridge automata and group theory — translate automaton behavior into group properties, and back
- 🧪 Find automata whose groups serve as examples, or counterexamples, to statements in group theory
- 📋 Collect the open problems on both sides that the bridge could reach
- 🔍 Target them, by exhaustive search over the small automata
- ✅ Formalize the definitions and results in Lean

## ✨ Usage

Install from the Wolfram Cloud:

```wolfram
PacletInstall["https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton.paclet", ForceVersionInstall -> True]
Needs["WolframInstitute`IteratedFiniteAutomaton`"]
```

## 📓 Research Notebooks — "Math from code"

> ⚠️ Versions default to **LLM**: generated directly from the codebase (via [ClaudePluginComputationalResearch](https://github.com/WolframInstitute/ClaudePluginComputationalResearch)), with no warranty of correctness. Humans are welcome to publish their own version alongside.

| Notebook | Description | Versions |
|---|---|---|
| Wolfram and wreath recursion | Converting between the automaton formalisms | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Formalisms.nb) |
| Periodicity of the iteration | Periods of the evolution and orders of group elements | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Periodicity.nb) |
| Automata on the rooted tree | Space-time diagrams and tree portraits | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Visualization.nb) |
| Burnside problem | An infinite torsion group from a 5-state automaton | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Burnside.nb) |
| Kaplansky zero-divisor conjecture | Zero divisors in the group ring | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Kaplansky.nb) |
| Sweep of the 3-state binary automata | Which groups survive the zero-divisor test | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/KaplanskySweep.nb) |
| Open problems, as automaton statements | One runnable test per problem in [`OpenProblems.md`](OpenProblems.md) | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/OpenProblems.nb) |
| Constructive families of many-state automata | Building automata where the space is too large to enumerate | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/ManyStateAutomata.nb) |
| Gardam's group is an automaton group | The Promislow group on 25 states and 3 letters, and his unit verified on the tree | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/PromislowAutomaton.nb) |
| A note on its minimal degree | Why the degree is 3 and not 27, and which parts of the result are already in the literature | [LLM](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/PromislowNote.nb) |

## 🧩 Open Problems

Statements in group theory that one automaton group could settle.
Full version in [`OpenProblems.md`](OpenProblems.md).

| Problem | Formulation | Answer | Relation to automata |
|---|---|:-:|---|
| [Burnside](https://en.wikipedia.org/wiki/Burnside_problem) ([1902](References.md#Burnside1902)) | every $g \in G$ of finite order $\Rightarrow G$ finite? | ✅ No | [Grigorchuk](References.md#Grigorchuk1980), 5 states, 2 colors; [Gupta–Sidki](References.md#GuptaSidki1983), 3 colors — both simpler than [Golod–Shafarevich](References.md#Golod1964) |
| [Milnor](https://en.wikipedia.org/wiki/Growth_rate_%28group_theory%29) ([1968](References.md#Milnor1968)) | is $\gamma_G(n) = \lvert B_n \rvert$ polynomial or exponential? | ✅ No | [Grigorchuk](References.md#Grigorchuk1985), 5 states, 2 colors; growth $e^{n^\alpha}$, $0 < \alpha < 1$ |
| [Day](https://en.wikipedia.org/wiki/Elementary_amenable_group) ([1957](References.md#Day1957)) | is every amenable group elementarily amenable? | ✅ No | [Grigorchuk](References.md#Grigorchuk1985), 5 states, 2 colors; [Basilica](References.md#GrigorchukZuk2002), 3 states, [amenable](References.md#BartholdiVirag2005) but not subexponentially so |
| [Atiyah](https://en.wikipedia.org/wiki/Atiyah_conjecture) ([1976](References.md#Atiyah1976)) | $M$ closed with $\pi_1(M) = G \Rightarrow b_i^{(2)}(M) \in \mathbb{Z}$? | ✅ No | [Lamplighter](References.md#GrigorchukZuk2001), 2 states, 2 colors ([GLSŻ](References.md#GLSZ2000)) |
| [von Neumann](https://en.wikipedia.org/wiki/Von_Neumann_conjecture) ([1950s](References.md#Neumann1929)) | $G$ non-amenable $\Rightarrow G$ contains a free subgroup of rank $2$? | ✅ No | ❓ Group-side only: [Ol'shanskii](References.md#Olshanskii1980), [Adyan](References.md#Adyan1983) have finite exponent, so cannot be automaton groups ([Zel'manov](References.md#Zelmanov1991)); [Monod](References.md#Monod2013) and [Lodha–Moore](References.md#LodhaMoore2013) escape that argument |
| [Kaplansky units](https://en.wikipedia.org/wiki/Kaplansky%27s_conjectures) ([1950s](References.md#Kaplansky1970)) | $G$ torsion-free $\Rightarrow$ every $u \in K[G]^\times$ is $\lambda g$? | ✅ No | ✅ [Gardam](References.md#Gardam2021)'s unit in $\mathbb{F}_2[P]$ and [his unit](References.md#Gardam2023) in $\mathbb{C}[P]$, $P$ the [Promislow](References.md#Promislow1988) group — **an automaton group**, 25 states, 3 colors, least degree 3, so the counterexample lives in this class ([notebook](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/PromislowAutomaton.nb), [note](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/PromislowNote.nb)) |
| [Zassenhaus](https://arxiv.org/abs/1710.08780) ([1974](References.md#Zassenhaus1974)) | $G$ finite, $u \in \mathbb{Z}[G]^\times$ of finite order $\Rightarrow u$ rationally conjugate to some $\pm g$? | ✅ No | ❓ [Eisele–Margolis](References.md#EiseleMargolis2018)'s metabelian group of order $2^7 3^2 5 \cdot 7^2 19^2$; no automaton counterexample known |
| [Kaplansky zero divisors](https://en.wikipedia.org/wiki/Kaplansky%27s_conjectures) ([1950s](References.md#Kaplansky1970)) | $G$ torsion-free, $a, b \in K[G] \setminus \{0\} \Rightarrow ab \neq 0$? | ❓ | ❓ Sweep the torsion-free automata ([bounded and contracting](References.md#Nekrashevych2005)) for a vanishing product; done for 3 states, 2 colors |
| [Gap](https://en.wikipedia.org/wiki/Growth_rate_%28group_theory%29) ([Grigorchuk](References.md#Grigorchuk2014b)) | is $\gamma_G(n)$ polynomial or at least $e^{\sqrt n}$? | ❓ | ❓ Sweep for a group growing below $e^{\sqrt n}$; branch and automaton groups are the test class |

Disclaimer - undecidabity: No algorithm can decide, from an automaton alone, whether the semigroup it generates is finite ([Gillibert](References.md#Gillibert2014)), nor whether a given element has finite order ([Gillibert](References.md#Gillibert2018), [Bartholdi–Mitrofanov](References.md#BartholdiMitrofanov2020)). There is no procedure that always terminates with the right answer.
So the tests run to a chosen depth and the torsion check only filters candidates; it never certifies one.

## 📄 License

MIT — [`LICENSE`](LICENSE).
