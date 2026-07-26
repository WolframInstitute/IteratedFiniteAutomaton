> ⚠️ **Actively developed, experimental research code.** It undergoes frequent cleanings and refactors, and the API may change without notice.

# IteratedFiniteAutomaton

An iterated finite automaton can be assigned a group.
Such groups were used in the past to construct counterexamples in group theory, as described in Andrzej Żuk's essay **[Iterated finite automata](https://community.wolfram.com/groups/-/m/t/3761828)**.
This repository collects the tools and the open problems, so that researchers can attack them systematically — and by systematic exploration of the landscape of small automata.

## ✨ Usage

Install the paclet:

```wolfram
PacletInstall["WolframInstitute/IteratedFiniteAutomaton"]
Needs["WolframInstitute`IteratedFiniteAutomaton`"]
```

## 📓 Research Notebooks

| Notebook | Description | Link |
|---|---|---|
| Wolfram and wreath recursion | Converting between the automaton formalisms | Wolfram Cloud |
| Periodicity of the iteration | Periods of the evolution and orders of group elements | Wolfram Cloud |
| Automata on the rooted tree | Space-time diagrams and tree portraits | Wolfram Cloud |
| Burnside problem | An infinite torsion group from a 5-state automaton | Wolfram Cloud |
| Kaplansky zero-divisor conjecture | Zero divisors in the group ring | Wolfram Cloud |
| Sweep of the 3-state binary automata | Which groups survive the zero-divisor test | Wolfram Cloud |

## 🧩 Open Problems

Each of these asks whether a property holds for *every* group, so a single automaton can settle it.

Throughout, $G$ is a finitely generated group and $K$ a field.

| Problem | Formulation | Automata connection | | Solution |
|---|---|---|:-:|---|
| [Burnside](https://en.wikipedia.org/wiki/Burnside_problem) (1902) | every $g \in G$ of finite order $\Rightarrow G$ finite? | Grigorchuk group — 5 states over $\{0, 1\}$ | ❌ | Infinite, yet every element has order a power of $2$ |
| [Milnor](https://en.wikipedia.org/wiki/Growth_rate_%28group_theory%29) (1968) | is $\gamma_G(n) = \lvert B_n \rvert$ polynomial or exponential? | Grigorchuk group | ❌ | Growth $e^{n^\alpha}$ with $0 < \alpha < 1$ — intermediate |
| [Day](https://en.wikipedia.org/wiki/Amenable_group) (1957) | is every amenable group elementarily amenable? | Grigorchuk group; Basilica group — 3 states over $\{0, 1\}$ | ❌ | Amenable but not elementarily amenable; Basilica not even subexponentially so |
| [Atiyah](https://en.wikipedia.org/wiki/Atiyah_conjecture) (1976) | $M$ closed with $\pi_1(M) = G \Rightarrow b_i^{(2)}(M) \in \mathbb{Z}$? | Lamplighter group — 2 states over $\{0, 1\}$ | ❌ | Grigorchuk–Linnell–Schick–Żuk: a lamplighter-type group gives $b_i^{(2)} \notin \mathbb{Z}$ |
| [Kaplansky zero divisors](https://en.wikipedia.org/wiki/Kaplansky%27s_conjectures) (1950s) | $G$ torsion-free, $a, b \in K[G] \setminus \{0\} \Rightarrow ab \neq 0$? | Bounded and contracting automata generate torsion-free groups | ❓ | Open — the sweep here tests the $(3, 2)$ groups |
| [Kaplansky units](https://en.wikipedia.org/wiki/Kaplansky%27s_conjectures) (1950s) | $G$ torsion-free, $u \in K[G]^\times \Rightarrow u = \lambda g$? | None yet | ❌ | Gardam's counterexample is crystallographic, not an automaton group |

❌ false, settled by a counterexample &nbsp;•&nbsp; ✅ true &nbsp;•&nbsp; ❓ open

## 🌳 Reference

Andrzej Żuk, *Iterated finite automata*, WSRI 2026 — <https://community.wolfram.com/groups/-/m/t/3761828>
