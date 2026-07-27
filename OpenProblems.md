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
| [Burnside — infinite torsion](#BurnsideTorsion) | `Solved by an automaton group` — Grigorchuk 1980, Gupta–Sidki 1983 | `Equivalent` | Grigorchuk verified as a witness — all words of length $\leq 6$ at level 12; no space ever swept for torsion groups |
| [Burnside — smallest bounded exponent](#BurnsideExponent) | `Open` — the answer lies in $\{5, 7, 8, \ldots, 665\}$ | `None` | Nothing, and no automaton group can be a witness at any size |
| [Milnor growth](#Milnor) | `Solved by an automaton group` — Grigorchuk 1984 | `Heuristic` | $(3, 2)$ ball growth to radius 4, all 133 candidates; the "intermediate" label is false on 11 of its 32 codes |
| [Gap conjecture](#GapConjecture) | `Open` — Grigorchuk 2014 | `Sufficient` | Nothing directed at it; radius 4 against the $n = 289$ the separation needs |
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
| **Problem** | Is there an infinite finitely generated group in which every element has finite order? Burnside asked in 1902 whether a finitely generated periodic group must be finite; this is the *general* form, which puts no bound on the orders. It is separated here from the bounded form because automata settle this one and provably cannot settle the other. |
| **Status** | `Solved by an automaton group` — Grigorchuk 1980 (five states, two letters, every element of order a power of $2$) and Gupta–Sidki 1983 (over $p$ letters, a $p$-group). Not the first solution: Golod 1964 built an infinite finitely generated torsion group out of Golod–Šafarevič sixteen years earlier, with no automaton anywhere in it. What the automata added is the size of the certificate — a five-row transition table against a graded-algebra argument — which is why this is the entry the [README's problem table](README.md#-open-problems) leads with. An automaton construction of infinite periodic groups goes back further still, to Aleshin 1972; the bibliography carries only his 1983 free-group paper, so that is a gap for T8. |
| **Automaton translation** | A finite invertible Mealy automaton on $s$ states over $k$ letters whose group $G$ satisfies both halves of the problem, each of which is a statement about the level tower. $G$ is **infinite** iff $\lvert G_L \rvert \to \infty$, since the action is faithful and every $G_L$ is finite. A word $w$ in the states has **finite order** iff its order in $\mathrm{Aut}(T_L)$ — nondecreasing in $L$ — is eventually constant, and $G$ is torsion iff that holds for every $w$. Grigorchuk's witness is $a = \sigma$, $b = (a, c)$, $c = (a, d)$, $d = (1, b)$ — five states over two letters counting the identity state, carried here as the code $\{8950703898, \{5, 2\}\}$; Gupta–Sidki's is $a = (1, 1, 1)\sigma$, $t = (a, a^{-1}, t)$, four states over three letters. The mechanism that makes the torsion half *provable* rather than merely observed is contraction: the level-$1$ stabiliser embeds in $G \times G$ by sections, the sections of a word are shorter than the word, and induction on length bounds the order. That is the only route in this catalog from a finite transition table to a statement quantified over every element of an infinite group. |
| **Faithfulness** | `Equivalent` — an automaton group is a finitely generated group, and the two conditions above are literally the two halves of the problem, turned into statements about the finite quotients by residual finiteness. The limitation is computational rather than mathematical, and it cuts one way only. A finite window of levels can **refute** torsion and never confirm it: a strictly growing order at some level proves infinite order, so "not torsion" has finite certificates, while "torsion" has none — an order can plateau and later resume, as the lamplighter's does, and there are infinitely many words to check. Confirming a witness is therefore a proof obligation, the contraction induction above, and not a search. |
| **Witness shape** | A whole automaton, not an element — the first entry in this catalog where the witness is the presentation itself rather than a coefficient vector over a fixed group. Both known witnesses are small: $s = 5$, $k = 2$ (four involutions and the identity state, with $ab$, $ac$, $ad$ of orders $16$, $8$, $4$), and $s = 4$, $k = 3$. A *refutation* is far cheaper and is a genuine finite certificate: one word $w$ and one level $L$ with $\mathrm{ord}_L(w) < \mathrm{ord}_{L+1}(w)$. Whether a witness exists at $s = 3$, $k = 2$ is answerable from the BGKMNSS classification of the $194$ groups generated by three-state binary automata; this repository has not read it off, and nothing here claims either way. |
| **Test recipe** | |
| **Searched here** | Grigorchuk's automaton is **verified as a witness, never searched for**. Exhaustively over all $4^n$ words of length $n \leq 6$ in the four generators, evaluated at level $12$, the orders realised are exactly $1, 2, 4, 8, 16$ — a $2$-group across that window, with order $32$ attained by no word of length $\leq 6$, so no order these words reach is an exponent for the group. Sampling agrees: $200$ random words of length $6$ at level $9$ land only on powers of two. The level-depth trap is recorded rather than avoided — order $32$ appears at word length $32$ only from level $10$, and at length $16$ only by level $14$, so a shallow level hides orders that are really there. Both directions are controlled against the adding machine (code $62$ in $(2, 2)$), whose generator has infinite order and whose orbit on the zero tape of length $8$ runs the full $2^8$ steps where every Grigorchuk generator closes in at most two. **No systematic search for infinite torsion groups has ever run here.** All four sweeps applied `AutomatonTorsionFreeCandidateQ`, which *keeps* the automata whose word orders are still growing; the $5699$ automata it discarded in $(3, 2)$, and their counterparts in $(2, 2)$, $(2, 3)$ and $(4, 2)$, were dropped unexamined. A rejection is also much weaker than torsion — it says *one* word's order plateaued at two well-separated levels, where a Burnside witness needs *every* word to have finite order — and the filter's own calibration measures that gap: over $(2, 3)$ the adjacent levels $\{3, 4\}, \{4, 5\}$ leave $41$ of the $231$ classes while the well-separated $\{4, 6\}, \{5, 7\}$ leave $55$, so $14$ classes plateau early and resume later. |
| **References** | |

### <a id="BurnsideExponent"></a>Burnside — smallest bounded exponent

| Field | |
|---|---|
| **Problem** | For which $n$ is there an infinite finitely generated group of exponent $n$ — equivalently, for which $m, n \geq 2$ is the free Burnside group $B(m, n) = F_m / \langle\langle w^n : w \in F_m \rangle\rangle$ infinite? The smallest such $n$ is the open quantity. |
| **Status** | `Open`, and bracketed from both sides. $B(m, n)$ is finite for $n = 2, 3, 4, 6$ — exponent $2$ is elementary abelian, $n = 3$ is Burnside 1902, $n = 4$ Sanov 1940, $n = 6$ M. Hall 1958 — and infinite for odd $n \geq 665$, Adyan 1979, after Novikov–Adyan 1968's $n \geq 4381$; the even exponents were covered later, by Ivanov 1994 and Lysënok 1996. So the answer lies in $\{5, 7, 8, \ldots, 665\}$, and $n = 5$ is the smallest open case. The *restricted* Burnside problem — that for fixed $m, n$ there are only finitely many finite $m$-generator groups of exponent $n$ — is a theorem, Zelmanov 1991 and 1994, and it is what makes this entry's translation empty rather than merely unknown. Sanov, Hall, Ivanov, Lysënok and Zelmanov are all absent from the bibliography; a gap for T8. |
| **Automaton translation** | `None`, and provably so rather than for want of a construction. Automaton groups are residually finite by definition: the action on $T_k$ is faithful and every level quotient is finite, so $\bigcap_L \ker(G \to G_L) = 1$. Zelmanov's solution of the restricted Burnside problem is equivalent to the statement that **every finitely generated residually finite group of finite exponent is finite**. Composing the two: no infinite automaton group has bounded exponent, at any $s$ and any $k$. The bounded Burnside problem is thus outside the reach of the entire formalism this catalog is built on, and the unbounded exponent of the Grigorchuk and Gupta–Sidki groups is *forced* by their residual finiteness rather than being an accident of how they were assembled. |
| **Faithfulness** | `None`. |
| **Witness shape** | On the group side, an infinite finitely generated group of exponent $n$ for some $5 \leq n < 665$ — in practice a proof that $B(2, n)$ is infinite, which is a combinatorial argument about van Kampen diagrams and not a finite object at all. On the automaton side there is **no witness shape at any size**, by the paragraph above. What an automaton can exhibit is the theorem's prediction on an example: $\exp(G_L)$ is computable for each $L$, and for an infinite automaton group it must grow without bound. Zelmanov's proof is not effective, so it supplies no bound on $\lvert G \rvert$ in terms of $n$ that a computation could be checked against. |
| **Test recipe** | |
| **Searched here** | **Nothing, and by this entry's own argument nothing should be.** The only relevant measurement is the exponent data of the [torsion entry](#BurnsideTorsion): over the Grigorchuk group the greatest order among words of length $\leq 6$ is $16$ at level $12$, order $32$ first appears at word length $32$, and if $m(k)$ denotes the least length of a word of order $2^k$ then $m(1) = 1$, $m(2) = m(3) = m(4) = 2$ and $m(5) \geq 7$. The exponent grows with the ball radius instead of saturating, which is what the theorem requires and is the whole of what a computation here contributes. How $m(k)$ grows is an open question the `Burnside` notebook poses and this catalog does not answer. |
| **References** | |

### <a id="Milnor"></a>Milnor growth problem

| Field | |
|---|---|
| **Problem** | Milnor asked in 1968 whether the growth function $\gamma_{G, S}(n) = \lvert \{ g \in G : \lvert g \rvert_S \leq n \} \rvert$ of a finitely generated group is always either polynomially or exponentially bounded, and whether polynomial growth forces virtual nilpotence. The second half is Gromov's theorem, 1981. The first half — does *intermediate* growth occur? — is the part automata answered. |
| **Status** | `Solved by an automaton group` — **no**, Grigorchuk 1984 (the Russian original; the bibliography's `Grigorchuk1985` is its translation). The same five-state binary automaton as the [torsion entry](#BurnsideTorsion) generates a group with $e^{\sqrt{n}} \preceq \gamma(n) \prec e^{n}$, the first group of intermediate growth, and the uncountable family $G_\omega^{(p)}$ shows that uncountably many growth types occur. Pinning down $\gamma$ for the Grigorchuk group itself is a separate and much later story — Bartholdi's upper bound, then Erschler–Zheng, narrowing the exponent $\alpha$ in $\gamma(n) = e^{n^{\alpha + o(1)}}$ — and this catalog does not state where that stands, because neither reference is in the bibliography. A gap for T8. |
| **Automaton translation** | For a fixed automaton every individual *value* of the growth function is computable from the level tower, and from below. `AutomatonElementCount[automaton, n, L]` is $\gamma_{G_L, S}(n)$, the number of distinct elements of $\mathrm{Aut}(T_L)$ represented by words of length $\leq n$; since $G_{L+1} \twoheadrightarrow G_L$ it is nondecreasing in $L$, and since the action is faithful $\sup_L \gamma_{G_L}(n) = \gamma_G(n)$ exactly. Two words in the radius-$n$ ball that differ in $G$ are separated at some finite level, so for each fixed $n$ the sequence stabilises at the true value. The growth **type** — which is what Milnor's problem is about — is not reached this way: it is an equivalence class of asymptotics under $\gamma \preceq \delta \iff \gamma(n) \leq \delta(Cn)$, and no finite set of exact values determines it. Grigorchuk's proof does not come from counting either: both the lower bound $e^{\sqrt{n}}$ and the upper bound $e^{n^\alpha}$ come from the branch and contraction structure of the automaton. |
| **Faithfulness** | `Heuristic` for the growth type, which is the problem — even though each individual ball size is exact. Ball counts to any finite radius are consistent with both intermediate and exponential growth, so a subexponential-looking count is an analogy and not evidence; this repository has a documented instance of the analogy failing on its own data, recorded below. The part that *is* exact, and worth keeping separate rather than letting it colour the field: for a fixed automaton and a fixed $n$, the level counts converge upward to $\gamma_G(n)$ and stabilise at it. |
| **Witness shape** | Grigorchuk's five-state binary automaton is the witness, and the uncountable family $G_\omega^{(p)}$ is why growth types are uncountable — but only an eventually periodic $\omega$ gives a *finite* automaton, so the automaton-group scope is the countable subfamily. For a search, a candidate has the shape of an automaton with $\lvert G_L \rvert \to \infty$ whose ball counts $\gamma_{G_L}(n)$ look subexponential in $n$, and the whole point of the field above is that this is a filter and not a certificate. What *is* a finite certificate is the opposite verdict: two elements generating a free sub-semigroup — all $2^n$ of their positive products distinct, witnessed at a single level $L$ — proves exponential growth and removes the candidate. That is exactly how the BGKMNSS classification contradicts this repository's own ball-count label. |
| **Test recipe** | |
| **Searched here** | Two computations: one a witness verification, one a heuristic already known to be wrong. **(a)** The Grigorchuk ball sizes in the level-$9$ quotient are $5, 11, 23, 40, 68, 108$ for $n = 1, \ldots, 6$, against $9, 65, 457, 3201, 22409, 156865$ for the free group on the same four generators — subexponential across that window, and the `Burnside` notebook records it as a `Conjecture` verified for $n \leq 6$ in one quotient, not as a growth theorem. **(b)** Across $(3, 2)$, `AutomatonGroupFingerprint` computed the radius-$1$ through radius-$4$ ball sizes of all $133$ torsion-free candidates, and the sweep stratified them into $36$ abelian, $65$ free-like and $32$ *intermediate*, where "intermediate" means nothing more than *not abelian, and radius-$4$ ball under $700$*. **That label is not a growth claim, and it is false as one:** BGKMNSS proves a free monoid on two generators, hence exponential growth, for classes $849$, $929$, $2841$ and $2850$ — $11$ of the $32$ codes. A third of the stratum is misclassified by its own name, which is the sharpest available argument for the `Heuristic` verdict above. Nothing was computed in $(2, 2)$, $(2, 3)$ or $(4, 2)$ beyond what the torsion filter needed, and no group in any swept space has been shown here to have intermediate growth. |
| **References** | |

### <a id="GapConjecture"></a>Gap conjecture

| Field | |
|---|---|
| **Problem** | Grigorchuk's gap conjecture: if a finitely generated group has growth $\gamma(n) \prec e^{\sqrt{n}}$ then it is virtually nilpotent, hence of polynomial growth. Equivalently, $e^{\sqrt{n}}$ is a genuine gap — no growth type lies strictly between polynomial and $e^{\sqrt{n}}$. |
| **Status** | `Open`, Grigorchuk 2014. The bound is not arbitrary: every $G_\omega^{(p)}$ of the intermediate-growth family satisfies $\gamma \succeq e^{\sqrt{n}}$, so the conjecture asserts that those examples are optimal. The paper's contribution is a reduction rather than a proof — validity for residually finite groups implies validity in general, as does validity for simple groups, and likewise for residually polycyclic groups together with just-infinite ones; residually solvable and right-orderable groups are treated there as well. |
| **Automaton translation** | An automaton whose group $G$ is infinite, not virtually nilpotent, and has $\gamma_G(n) \prec e^{\sqrt{n}}$. This is the one entry where the automaton class is not a convenient testbed but the right one: automaton groups are residually finite by construction, and residually finite is one of the two classes the conjecture reduces to, so the family this paclet enumerates sits *inside* the reduction rather than beside it. Growth values come off the level tower exactly as in the [Milnor entry](#Milnor). |
| **Faithfulness** | `Sufficient` — a counterexample among automaton groups refutes the conjecture outright, being a counterexample among finitely generated groups. Absence proves nothing, for the usual reason that a sweep bounds only the automata it enumerated and for a sharper one: automaton groups are a *proper* subclass of the residually finite groups, so the reduction runs the other way and no amount of automaton evidence confirms the conjecture. Recognising a witness is not a finite computation either — $\gamma \prec e^{\sqrt{n}}$ is asymptotic and the level counts are lower bounds — so the search side of this entry is a candidate filter and not a decision procedure. |
| **Witness shape** | An automaton group that is infinite, not virtually nilpotent, and of growth below $e^{\sqrt{n}}$. Every known intermediate-growth automaton group sits at or above the bound, so a witness cannot be a variant of the Grigorchuk family — that is the content of the conjecture. The checkable surrogates are both negative: a free sub-semigroup on two elements removes a candidate by forcing exponential growth, and a finite nucleus (`AutomatonNucleus` stabilising in the *radius* direction) is the structural property every known intermediate-growth example has, so it is where a search would filter first. The scale of the positive side is worth stating plainly: $e^{\sqrt{n}}$ does not overtake even $n^3$ until $n = 289$, where the ball already holds $\approx 2.4 \times 10^7$ elements. Any ball count able to separate the two hypotheses lives at word lengths in the hundreds. |
| **Test recipe** | |
| **Searched here** | **Nothing directed at this conjecture.** The relevant data is the $(3, 2)$ ball-growth stratification of the [Milnor entry](#Milnor), which reaches radius $4$ — a ball of at most a few hundred elements, against the $n = 289$ and $\approx 2.4 \times 10^7$ elements a separation would need — together with the nucleus computation over the $32$ intermediate codes, which found only $2$ of the $14$ isomorphism classes contracting: the Basilica group and the Klein bottle group. That is the closest thing here to a candidate filter, and it leaves two identified groups rather than an unknown. The Klein bottle group is virtually $\mathbb{Z}^2$, so its growth is polynomial and it is not a candidate. The Basilica group is not virtually nilpotent, so it is a candidate exactly if its growth lies below $e^{\sqrt{n}}$ — nothing computed in this repository bears on that, and the question is raised nowhere else in it. |
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
