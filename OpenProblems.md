# Open Problems

Problems in group theory, each paired with the statement about a finite automaton that would settle it.

The [README table](README.md#-open-problems) is the short version: which conjectures an automaton group has already decided.
This is the long version, and it is written to be *used* — every entry says what a witness would look like, which paclet call searches for one, and how far this repository has already searched.

Throughout $G$ is a finitely generated group, $K$ is a field, $T_k$ is the rooted $k$-ary tree, and an *automaton* is a finite invertible Mealy automaton over a $k$-letter alphabet whose states generate a subgroup of $\mathrm{Aut}(T_k)$.
Citations link into [`References.md`](References.md), one anchor per key.

## How to read an entry

Every entry carries the same eight fields, so the catalog is a table and not an essay.
Two of them take values from a fixed list, which is the point: a translation that is only an analogy has to say so in a field, where it cannot be buried in prose.

**Status** is one of `Open`, `Solved by an automaton group`, `Solved by other means`, `Partially solved`, `Undecidable` — followed by the year and who.

**Faithfulness** is one of:

| Value | Meaning |
|---|---|
| `Equivalent` | the automaton statement holds if and only if the group statement does |
| `Sufficient` | a witness on the automaton side settles the group problem; **absence of one proves nothing** |
| `Necessary` | implied by the group statement, so it is usable as a search filter and nothing more |
| `Heuristic` | an analogy — no theorem connects the two sides |
| `None` | no translation into automaton terms is known; the entry is here so the gap is visible |

The remaining six are free text: **Problem** (the group-theoretic statement), **Automaton translation**, **Witness shape** (states, alphabet size, support radius, level depth), **Test recipe** (the paclet call), **Searched here** (what this repository has ruled out, with its bound), and **References**.

`Searched here` is a claim about *this repository's* computations only, always with the bound that makes it falsifiable.
An empty search is recorded as an empty search, never as evidence.

## Index

| Problem | Status | Faithfulness | Searched here |
|---|---|---|---|
| [Kaplansky zero-divisor](#KaplanskyZeroDivisor) | | | |
| [Kaplansky idempotent](#KaplanskyIdempotent) | | | |
| [Kaplansky unit](#KaplanskyUnit) | | | |
| [Zassenhaus](#Zassenhaus) | | | |
| [Burnside — infinite torsion](#BurnsideTorsion) | | | |
| [Burnside — smallest bounded exponent](#BurnsideExponent) | | | |
| [Milnor growth](#Milnor) | | | |
| [Gap conjecture](#GapConjecture) | | | |
| [von Neumann–Day](#VonNeumannDay) | | | |
| [Day — elementary amenability](#DayElementary) | | | |
| [Amenability by activity growth](#AmenabilityActivity) | | | |
| [Amenability of a given automaton](#AmenabilityGiven) | | | |
| [Atiyah](#Atiyah) | | | |
| [Finiteness](#Finiteness) | | | |
| [Order](#Order) | | | |
| [Conjugacy](#Conjugacy) | | | |
| [Freeness](#Freeness) | | | |
| [Triviality](#Triviality) | | | |
| [Periodicity and the initial condition](#Periodicity) | | | |

## Group rings

### <a id="KaplanskyZeroDivisor"></a>Kaplansky zero-divisor conjecture

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="KaplanskyIdempotent"></a>Kaplansky idempotent conjecture

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="KaplanskyUnit"></a>Kaplansky unit conjecture

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Zassenhaus"></a>Zassenhaus conjecture

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

## Torsion and growth

### <a id="BurnsideTorsion"></a>Burnside — infinite finitely generated torsion groups

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="BurnsideExponent"></a>Burnside — smallest bounded exponent

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Milnor"></a>Milnor growth problem

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="GapConjecture"></a>Gap conjecture

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

## Amenability and $L^2$-invariants

### <a id="VonNeumannDay"></a>von Neumann–Day problem

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="DayElementary"></a>Day — is every amenable group elementarily amenable?

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="AmenabilityActivity"></a>Amenability by activity growth

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="AmenabilityGiven"></a>Amenability of a given Mealy automaton

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Atiyah"></a>Atiyah conjecture

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

## Decision problems

### <a id="Finiteness"></a>Finiteness problem

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Order"></a>Order problem

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Conjugacy"></a>Conjugacy problem

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Freeness"></a>Freeness problem

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Triviality"></a>Triviality problem

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

### <a id="Periodicity"></a>Periodicity and its dependence on the initial condition

| Field | |
|---|---|
| **Problem** | |
| **Status** | |
| **Automaton translation** | |
| **Faithfulness** | |
| **Witness shape** | |
| **Test recipe** | |
| **Searched here** | |
| **References** | |

<!--
Fill order, one section per session:
  T2 — Group rings
  T3 — Torsion and growth
  T4 — Amenability and L^2-invariants
  T5 — Decision problems
  T6 — Test recipe field, every entry, verified against the exported symbols
  T7 — the research notebook built from this table
  T8 — References field, every entry, resolved through References.md; then the PR
-->
