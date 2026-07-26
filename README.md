# IteratedFiniteAutomaton

> ⚠️ **Actively developed, experimental research code.** It undergoes frequent cleanings and refactors, and the API may change without notice.

Iterated finite automata and their groups — evolution, periodicity, state analysis, and conversion between the Mealy, wreath recursion, and rule-list formalisms.

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
| Mealy machines and wreath recursion | Converting between the automaton formalisms | Wolfram Cloud |
| Periodicity of the iteration | Periods of the evolution and orders of group elements | Wolfram Cloud |
| Automata on the rooted tree | Space-time diagrams and tree portraits | Wolfram Cloud |
| Burnside problem | An infinite torsion group from a 5-state automaton | Wolfram Cloud |
| Kaplansky zero-divisor conjecture | Zero divisors in the group ring | Wolfram Cloud |
| Sweep of the 3-state binary automata | Which groups survive the zero-divisor test | Wolfram Cloud |

## 🧩 Open Problems

| Problem | Status | Automata connection |
|---|---|---|
| Burnside — is there an infinite finitely generated torsion group? | Solved | The Grigorchuk group, from a 5-state automaton over $\{0, 1\}$ |
| Kaplansky zero divisors — is $\mathbb{Z}[G]$ a domain for $G$ torsion-free? | Open | Search torsion-free automaton groups for a zero divisor |
| Order problem — does an automaton element have finite order? | Undecidable in general | Decidable for small state and alphabet sizes; computed by the tools here |

## 🌳 Reference

Andrzej Żuk, *Iterated finite automata*, WSRI 2026 — <https://community.wolfram.com/groups/-/m/t/3761828>
