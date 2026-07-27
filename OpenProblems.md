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
| [Kaplansky zero-divisor](#KaplanskyZeroDivisor) | `Open` | `Equivalent` | Four automaton spaces, 6018 torsion-free groups, every one refuted; radius 2 exhaustive only in $(2, 3)$ |
| [Kaplansky idempotent](#KaplanskyIdempotent) | `Open` | `Equivalent` | $(3, 2)$ only — all 133 groups, radius $\leq 2$ over $\mathbb{F}_2$ and $\mathbb{F}_3$, none found |
| [Kaplansky unit](#KaplanskyUnit) | `Solved by other means` — Gardam 2021 | `Sufficient` | Nothing; no unit search exists in this repository |
| [Zassenhaus](#Zassenhaus) | `Solved by other means` — Eisele–Margolis 2018 | `None` | Nothing, and nothing here could |
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
| **Problem** | For $G$ torsion-free, $K[G]$ is a domain: if $A, B \in K[G]$ are nonzero then $AB \neq 0$. Stated in Kaplansky's 1970 problem list, which is where the name comes from; the conjectures go back to Higman's 1940 thesis. Torsion-freeness is necessary, not incidental — if $g^n = 1$ then $(1 - g)(1 + g + \cdots + g^{n-1}) = 0$. |
| **Status** | `Open` (since the 1950s). Known for left-orderable $G$ — Higman 1940, reached in practice through local indicability, Burns–Hale 1972 — and for torsion-free elementary amenable $G$, Kropholler–Linnell–Moody 1988. The implications run unit $\Rightarrow$ zero-divisor $\Rightarrow$ idempotent, so Gardam's 2021 refutation of the unit conjecture leaves this one untouched. |
| **Automaton translation** | Fix an invertible Mealy automaton on $s$ states over $k$ letters whose group $G$ is torsion-free, and a radius $r$; write $S_r$ for the radius-$r$ ball in $G$ and $G_L$ for the image of $G$ in its action on the $k^L$ vertices of level $L$. Each $G_L$ is finite, $G_{L+1} \twoheadrightarrow G_L$, and the actions are faithful in the limit, so a product of two elements supported on $S_r$ vanishes in $K[G]$ **iff** it vanishes in $K[G_L]$ for every $L$. A zero divisor supported on $S_r$ is therefore exactly a pair of nonzero coefficient vectors $c, d \in \mathbb{F}_p^{S_r}$ surviving the whole level tower. Two products $s_i s_j$ equal at level $L+1$ are equal at level $L$, so each row of the multiplication matrix $M_L(c)$ is a sum of rows of $M_{L+1}(c)$ and the kernels nest, $\ker M_{L+1}(c) \subseteq \ker M_L(c)$: one empty level is a proof for that radius, field and weight bound. |
| **Faithfulness** | `Equivalent` — for a fixed $G$ and a fixed support ball, by the residual finiteness above, and taking the union over all radii gives the conjecture for $G$ exactly. Two scope limits, neither of them elidable. A search that stops at a finite level has only ever *refuted*: the survivor sets are nested subspaces of a fixed $\mathbb{F}_p^n$ so the chain must stabilise, but finitely many equal terms never show that it has, and a chain can plateau and then drop. And automaton groups are a proper subclass of the torsion-free groups, so exhausting a space of automata bounds nothing about the conjecture itself. |
| **Witness shape** | An invertible Mealy automaton, $s$ states over $k$ letters, generating a torsion-free group; two nonzero coefficient vectors over the radius-$r$ ball. Radius-1 supports run to 5 elements in $(2, 3)$, 7 in $(3, 2)$ and 9 in $(4, 2)$; radius 2 reaches 17, 37 and 65 respectively. The smallest instance a reader can check by hand is a 3-element support at level 3: quotient of order 8, nine products on five values, seven nonzero $\mathbb{F}_2$-vectors, a $5 \times 3$ matrix each. A *negative* certificate has the same shape — one left inverse of $M_L(c)$ per nonzero $c$, which is a $\forall$ over a finite type with a decidable body and so discharged by `decide` in Lean. |
| **Test recipe** | |
| **Searched here** | Every torsion-free candidate in four spaces is refuted — 6018 groups in total — but always with both factors confined to the ball, which is the bound that makes the claim falsifiable. $(2, 2)$: of 64 invertible rules, 16 generate the trivial group and 8 are torsion-free candidates (2 classes, both $\cong \mathbb{Z}$); all 24 refuted at radius 1 over $\mathbb{F}_2$ through level 8, while the remaining 40 — which have torsion — produce a surviving pair, as they must. $(3, 2)$: 5832 invertible automata funnel to 133 distinct torsion-free candidates, all refuted; radius 1 exhaustive over $\mathbb{F}_2, \mathbb{F}_3, \mathbb{F}_5, \mathbb{F}_7$ (supports never exceed 7) and weight $\leq 4$ over $\mathbb{F}_{11}, \mathbb{F}_{13}$, deepest refutation level 7 against a ceiling of 12; radius 2 weight $\leq 2$ over $\mathbb{F}_5, \mathbb{F}_7$ plus weight $\leq 3$ over $\mathbb{F}_5$ on the 32 intermediate groups, zero by level 9 against a ceiling of 10. $(2, 3)$: all 55 candidates refuted, radius 1 exhaustive over six primes (level 3 for 49 of them, level 4 for 6), and radius 2 exhaustive over $\mathbb{F}_2$ — support 17, so all $2^{17} - 1$ coefficient vectors — which is the only exhaustive radius-2 pass in the project. $(4, 2)$: all 5822 candidates refuted, radius 1 exhaustive over $\mathbb{F}_2$ and weight-bounded elsewhere, deepest level 9 against a ceiling of 10, so one level of margin where $(3, 2)$ had two to five. **The standing gap is radius 2 in $(3, 2)$ and $(4, 2)$, which is weight-bounded and therefore not exhaustive.** What an empty pass proves, stated exactly: there are no nonzero $A, B \in \mathbb{F}_p[G]$ with supports in the radius-$r$ ball and $AB = 0$ — a theorem about the ball, not about $\mathbb{F}_p[G]$. Of the 32 informative $(3, 2)$ codes, 10 fall in three classes ($BS(1, 3)$, $BS(1, -3)$, the Klein bottle group) that are left-orderable and solvable, so for those the empty search is a consistency check rather than evidence. The sharpest genuinely open case swept is the **Basilica group**, torsion-free and amenable but not even subexponentially amenable, hence outside both known theorems. |
| **References** | |

### <a id="KaplanskyIdempotent"></a>Kaplansky idempotent conjecture

| Field | |
|---|---|
| **Problem** | For $G$ torsion-free, $K[G]$ has no idempotents besides $0$ and $1$. |
| **Status** | `Open` (since the 1950s). The weakest of the three: a nontrivial idempotent $e$ gives the zero divisor $e(1 - e) = 0$, so the zero-divisor conjecture implies this one, and the unit conjecture implies that. Known for the same classes — left-orderable, and torsion-free elementary amenable. |
| **Automaton translation** | The zero-divisor translation with the second factor forced: a nonzero $A$ supported on the radius-$r$ ball with $A(A - 1) = 0$, tested against the same level tower and refuted by the same nesting. |
| **Faithfulness** | `Equivalent` — same residual-finiteness argument, same two scope limits as the zero-divisor entry. Strictly weaker as a *search*, though: an idempotent is a special zero divisor, so an empty idempotent pass over a given ball and field is already implied by an empty zero-divisor pass over the same ball and field, and adds nothing to it. |
| **Witness shape** | One nonzero coefficient vector rather than two, over the same balls as above. Characteristic 2 is *not* a general shortcut here — the identity $\left(\sum_i g_i\right)^2 = \sum_i g_i^2$ requires the support to commute, and fails as soon as it does not, e.g. $(1 + x + y)^2 = 1 + x^2 + y^2 + xy + yx$ in $\mathbb{F}_2[F_2]$. It does settle the abelian case outright: if $\langle \operatorname{supp} A \rangle$ is abelian and torsion-free then $A^2 = A$ forces squaring to permute the support, so $g^{2^n} = g$ for some $n$ and every $g$ in it is trivial. So over $\mathbb{F}_2$ the test is vacuous exactly on the abelian stratum and is a genuine test off it. What a positive witness looks like, from the torsion control: for an involution $g$, the element $c(1 + g)$ is idempotent precisely when $2c^2 = c$, i.e. $c = (p+1)/2$ — one solution for every odd $p$, none in characteristic 2. |
| **Test recipe** | |
| **Searched here** | $(3, 2)$ only, all 133 torsion-free candidates: radius 1 in full over $\mathbb{F}_2$ and $\mathbb{F}_3$, radius 2 weight-bounded over $\mathbb{F}_2$ and $\mathbb{F}_3$, all through level 9 — **no nontrivial idempotent in any group**. On the 36 abelian groups the $\mathbb{F}_2$ half of that is forced by the argument above and carries no information; the content is the 97 non-abelian groups over $\mathbb{F}_2$ and all 133 over $\mathbb{F}_3$. Validated in both directions: empty on $\mathbb{Z}$ (the adding machine, code 62), and on the torsion Grigorchuk group it returns nothing over $\mathbb{F}_2$ but 16 idempotents over $\mathbb{F}_3$, the smallest being the $c(1 + g)$ above. Nothing searched in $(2, 2)$, $(2, 3)$ or $(4, 2)$, where only the zero-divisor sweep ran — though those sweeps subsume the corresponding idempotent question at the radii and fields they covered. |
| **References** | |

### <a id="KaplanskyUnit"></a>Kaplansky unit conjecture

| Field | |
|---|---|
| **Problem** | For $G$ torsion-free and $K$ a field, every unit of $K[G]$ is trivial, i.e. of the form $\lambda g$ with $\lambda \in K^\times$ and $g \in G$. |
| **Status** | `Solved by other means` — **false**, Gardam 2021, by an explicit unit in $\mathbb{F}_2[P]$ with $P$ the Promislow (Hantzsche–Wendt) group, found by SAT search and formalized against Mathlib by Gadgil–Tadipatri 2024. It is the strongest of the three, so its failure says nothing about the zero-divisor or idempotent conjectures. The counterexample is over $\mathbb{F}_2$ and does not settle the conjecture over $\mathbb{Z}$ or over a field of characteristic zero. |
| **Automaton translation** | Two, of different strength. *(i) Realize the known counterexample.* $P = \langle a, b \mid b^{-1} a^2 b = a^{-2},\ a^{-1} b^2 a = b^{-2} \rangle$ is torsion-free and virtually $\mathbb{Z}^3$; if it is generated by a finite Mealy automaton then Gardam's unit is an automaton witness as it stands. Whether it is, is not known to us. *(ii) Search directly.* For a torsion-free automaton group $G$, look for $u, v$ supported on the radius-$r$ ball with $uv = 1$ and $u$ not of the form $\lambda g$. Refutation by the level tower still works, since a relation in $G$ pushes forward to every $G_L$ and the level maps are surjections; but the solution set is no longer a linear subspace, so the sweep's inner test changes — for fixed $u$ it becomes the inhomogeneous solve $M_L(c)\, d = e_1$, decided by a rank comparison rather than by a kernel. |
| **Faithfulness** | `Sufficient`. The conjecture is already answered, so an automaton witness would not decide it; what it would supply is a counterexample inside a self-similar group, which no construction currently gives. Absence proves nothing in either direction — neither about the conjecture, which is settled, nor about whether automaton groups can realize a counterexample, since a finite sweep bounds only the ball. |
| **Witness shape** | Gardam's is the template. With $x = a^2$, $y = b^2$, $z = (ab)^2$ generating a $\mathbb{Z}^3$ of index 4 in $P$, the unit is $p + qa + rb + sab$ where $p = (1 + x)(1 + y)(1 + z^{-1})$, $q = x^{-1} y^{-1} + x + y^{-1} z + z$, $r = 1 + x + y^{-1} z + xyz$, $s = 1 + (x + x^{-1} + y + y^{-1}) z^{-1}$ — 21 group elements in the support once expanded. That sets the scale for the automaton side: radius 1 in every space swept here holds at most 9 elements and is far too small, and radius 2 (17 to 65 elements) is the first plausible range. |
| **Test recipe** | |
| **Searched here** | **Nothing.** The paclet's group-ring code tests $AB = 0$ and $A(A - 1) = 0$; it has no $AB = 1$ search, so there is no bound to report, not even a vacuous one. Both routes are blocked at the moment: whether $P$ is an automaton group is open, and a direct search needs radius 2, where every pass in this repository outside $(2, 3)$ has had to accept a weight bound. |
| **References** | |

### <a id="Zassenhaus"></a>Zassenhaus conjecture

| Field | |
|---|---|
| **Problem** | (ZC1) For $G$ **finite**, every unit of finite order in $\mathbb{Z}[G]$ with augmentation 1 is conjugate in $\mathbb{Q}[G]$ to an element of $G$ — equivalently, dropping the normalisation, every torsion unit is rationally conjugate to some $\pm g$. |
| **Status** | `Solved by other means` — **false**, Eisele–Margolis 2018, by a metabelian group of order $2^7 \cdot 3^2 \cdot 5 \cdot 7^2 \cdot 19^2$. |
| **Automaton translation** | `None`, and the reason is structural rather than a gap in the literature. Zassenhaus is about $\mathbb{Z}[G]$ for *finite* $G$, whereas every construction in this catalog — the torsion-free filter, the level tower, supports in a ball of an infinite group — is aimed at infinite groups acting on a rooted tree. Realizing a finite $G$ as an automaton group is possible but empty: embed $G \hookrightarrow S_k$ and let it act on the first level with all sections trivial. The automaton is then a re-encoding of the multiplication table and exposes nothing about $\mathbb{Z}[G]$ that $G$ did not already expose. |
| **Faithfulness** | `None`. |
| **Witness shape** | A finite group $G$ together with a normalized torsion unit of $\mathbb{Z}[G]$ that is not rationally conjugate to any element of $G$. Eisele–Margolis's group has order $2^7 \cdot 3^2 \cdot 5 \cdot 7^2 \cdot 19^2$ and was built representation-theoretically, not found by search — both facts put it out of reach of any Mealy-automaton enumeration. |
| **Test recipe** | |
| **Searched here** | **Nothing, and nothing here could.** The paclet works over $\mathbb{F}_p$ and over finite level quotients of infinite groups; there is no integral group ring, no torsion-unit machinery and no rational conjugacy test. The entry is carried because the [README's problem table](README.md#-open-problems) lists Zassenhaus, and a catalog that silently dropped it would read as narrower than the table linking into it. |
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
