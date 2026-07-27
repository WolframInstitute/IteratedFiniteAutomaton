> ⚠️ **Actively developed, experimental research code.** It undergoes frequent cleanings and refactors, and the API may change without notice.

# IteratedFiniteAutomaton

An iterated finite automaton can be assigned a group.
Such groups were used in the past to construct counterexamples in group theory, as described in Andrzej Żuk's essay **[Iterated finite automata](https://community.wolfram.com/groups/-/m/t/3761828)**.
This repository collects the tools and the open problems, so that researchers can attack them systematically — and by systematic exploration of the landscape of small automata.

## 🎯 Goals

- Collect tools for the ruliology of iterated finite automata
- Bridge automata and group theory — translate automaton behavior into group properties, and back
- Find automata whose groups serve as examples, or counterexamples, to statements in group theory
- Collect the open problems on both sides that the bridge could reach
- Target them, by exhaustive search over the small automata
- Formalize the definitions and results in Lean

## ✨ Usage

Install the paclet:

```wolfram
PacletInstall["https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton.paclet"]
Needs["WolframInstitute`IteratedFiniteAutomaton`"]
```

The paclet is not in the Wolfram Paclet Repository, so it installs from a public cloud object.
The URL is stable across releases — each one overwrites it.

## 📓 Research Notebooks

| Notebook | Description | Link |
|---|---|---|
| Wolfram and wreath recursion | Converting between the automaton formalisms | [Wolfram Cloud](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Formalisms.nb) |
| Periodicity of the iteration | Periods of the evolution and orders of group elements | [Wolfram Cloud](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Periodicity.nb) |
| Automata on the rooted tree | Space-time diagrams and tree portraits | [Wolfram Cloud](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Visualization.nb) |
| Burnside problem | An infinite torsion group from a 5-state automaton | [Wolfram Cloud](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Burnside.nb) |
| Kaplansky zero-divisor conjecture | Zero divisors in the group ring | [Wolfram Cloud](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/Kaplansky.nb) |
| Sweep of the 3-state binary automata | Which groups survive the zero-divisor test | [Wolfram Cloud](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/KaplanskySweep.nb) |

## 🧩 Open Problems

Statements in group theory that one group can settle, so that one automaton can.
Some already fell to an automaton group; others fell to a hand-built group, and an automaton realization would be a simpler counterexample; the rest are open.
Throughout $G$ is finitely generated and $K$ is a field.

| Problem | Formulation | Answer | Relation to automata |
|---|---|:-:|---|
| [Burnside](https://en.wikipedia.org/wiki/Burnside_problem) (1902) | every $g \in G$ of finite order $\Rightarrow G$ finite? | ✅ No | Grigorchuk counterexample with 5 states and 2 colors, infinite with every element of order a power of $2$; Gupta–Sidki with 3 colors. Both far simpler than the first counterexample, of Golod–Shafarevich |
| [Milnor](https://en.wikipedia.org/wiki/Growth_rate_%28group_theory%29) (1968) | is $\gamma_G(n) = \lvert B_n \rvert$ polynomial or exponential? | ✅ No | Grigorchuk counterexample with 5 states and 2 colors, growing like $e^{n^\alpha}$ for some $0 < \alpha < 1$ |
| [Day](https://en.wikipedia.org/wiki/Elementary_amenable_group) (1957) | is every amenable group elementarily amenable? | ✅ No | Grigorchuk counterexample with 5 states and 2 colors. The Basilica counterexample, 3 states and 2 colors, is not even subexponentially amenable |
| [Atiyah](https://en.wikipedia.org/wiki/Atiyah_conjecture) (1976) | $M$ closed with $\pi_1(M) = G \Rightarrow b_i^{(2)}(M) \in \mathbb{Z}$? | ✅ No | Lamplighter counterexample with 2 states and 2 colors, by Grigorchuk–Linnell–Schick–Żuk |
| [von Neumann](https://en.wikipedia.org/wiki/Von_Neumann_conjecture) (1950s) | $G$ non-amenable $\Rightarrow G$ contains a free subgroup of rank $2$? | ✅ No | ❓ On the group side, Ol'shanskii's Tarski monsters and Adyan's free Burnside groups. No automaton counterexample known |
| [Kaplansky units](https://en.wikipedia.org/wiki/Kaplansky%27s_conjectures) (1950s) | $G$ torsion-free $\Rightarrow$ every $u \in K[G]^\times$ is $\lambda g$? | ✅ No | ❓ On the group side, [Gardam](https://arxiv.org/abs/2102.11818)'s unit in $\mathbb{F}_2[P]$, $P$ the Promislow group, found by SAT search. Whether $P$ is an automaton group is open |
| [Zassenhaus](https://arxiv.org/abs/1710.08780) (1974) | $G$ finite, $u \in \mathbb{Z}[G]^\times$ of finite order $\Rightarrow u$ rationally conjugate to some $\pm g$? | ✅ No | ❓ On the group side, Eisele–Margolis's metabelian group of order $2^7 3^2 5 \cdot 7^2 19^2$. No automaton counterexample known |
| [Kaplansky zero divisors](https://en.wikipedia.org/wiki/Kaplansky%27s_conjectures) (1950s) | $G$ torsion-free, $a, b \in K[G] \setminus \{0\} \Rightarrow ab \neq 0$? | ❓ | ❓ Sweeping the automata whose groups are torsion-free — bounded and contracting ones are — for a vanishing product. Done here for 3 states and 2 colors |
| [Gap](https://en.wikipedia.org/wiki/Growth_rate_%28group_theory%29) (Grigorchuk) | is $\gamma_G(n)$ polynomial or at least $e^{\sqrt n}$? | ❓ | ❓ Sweeping automata for a group growing below $e^{\sqrt n}$; the branch and automaton groups are the test class |

## 🌳 Reference

Andrzej Żuk, *Iterated finite automata*, WSRI 2026 — <https://community.wolfram.com/groups/-/m/t/3761828>
