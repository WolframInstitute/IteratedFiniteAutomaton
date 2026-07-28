# References

The literature this repository stands on, grouped by the role each work plays here.
Every annotation says why the work matters to *this* repository, not what its abstract says.

The machine-readable form is [`references.bib`](references.bib) — biblatex, 89 entries, generated from Crossref content negotiation and the arXiv API rather than typed by hand.
The keys below are its keys, so a citation anywhere in the repository resolves both ways: `References.md#Kaplansky1970` for a reader, `\cite{Kaplansky1970}` for a document.

**Keys.** Full surnames for one or two authors, initials for three or more, a letter suffix for same-author/same-year collisions.
So `Higman1940`, `GrigorchukZuk2001`, `BurnsHale1972`, but `GNS2000`, `BKN2010`, `BGKMNSS2007a`.

**Links.** A DOI or an arXiv abstract page wherever one exists, and no publisher landing pages — 74 of the 89 entries resolve that way.
The other fourteen, each marked below: three carry a permanent Numdam or Math-Net.Ru locator instead ([Zuk2008](#Zuk2008), [Atiyah1976](#Atiyah1976), [GNS2000](#GNS2000)); three are online sources whose URL *is* the work ([Zuk2026](#Zuk2026), [Wolfram2003](#Wolfram2003), [MathlibMonoidAlgebra](#MathlibMonoidAlgebra)); two books carry an ISBN only ([Zuk2012](#Zuk2012), [Passman1977](#Passman1977)); the three [Software](#software) entries are GAP projects whose own recommended citation is a versioned URL; and four works have no machine identifier in existence ([Burnside1902](#Burnside1902), [Sanov1940](#Sanov1940), [Zassenhaus1974](#Zassenhaus1974), [Aleshin1983](#Aleshin1983)).
Żuk's advanced-course pages, cited in earlier drafts of this repository, are the policy's own argument: `webusers.imj-prg.fr/~andrzej.zuk/` no longer resolves, so the entry is gone.

## Source

- <a id="Zuk2026"></a>**Zuk2026** — Andrzej Żuk, *Iterated Finite Automata*, Wolfram Community, WSRI 2026. [community.wolfram.com/groups/-/m/t/3761828](https://community.wolfram.com/groups/-/m/t/3761828)
  The essay this repository implements: its automaton encoding, its worked Grigorchuk example, and its list of group-theoretic targets are what the paclet computes and what the research notebooks reproduce.
- <a id="Wolfram2003"></a>**Wolfram2003** — Stephen Wolfram, *Iterated finite automata*, NKS Forum, 17 November 2003. [stephenwolfram.com/publications/iterated-finite-automata](https://www.stephenwolfram.com/publications/iterated-finite-automata/)
  Where the iterated-finite-automaton formulation and its numeric coding originate, in a conversation with Grigorchuk; the paclet's rule numbering follows it, which is why automata here are named by an integer rather than a transition table.

## Foundations

- <a id="Nekrashevych2005"></a>**Nekrashevych2005** — Volodymyr Nekrashevych, *Self-Similar Groups*, Mathematical Surveys and Monographs 117, AMS, 2005. [10.1090/surv/117](https://doi.org/10.1090/surv/117)
  The standard reference for the vocabulary every notebook uses — sections, self-similarity, the nucleus, contraction — and the source of the convention that a state acts as an element of $\mathrm{Aut}(T_k)$.
- <a id="GNS2000"></a>**GNS2000** — Rostislav Grigorchuk, Volodymyr Nekrashevych, Vitaly Sushchanskii, *Automata, dynamical systems, and groups*, Proc. Steklov Inst. Math. **231** (2000), 128–203. [mathnet.ru/eng/tm515](https://www.mathnet.ru/eng/tm515)
  The survey the automaton–group dictionary follows line by line: which automaton property translates into which group property, and in which direction the translation is effective.
  No DOI; Math-Net.Ru is the stable locator.
- <a id="BGN2003"></a>**BGN2003** — Laurent Bartholdi, Rostislav Grigorchuk, Volodymyr Nekrashevych, *From fractal groups to fractal sets*, in *Fractals in Graz 2001*, Birkhäuser, 2003, 25–118. [10.1007/978-3-0348-8014-5_2](https://doi.org/10.1007/978-3-0348-8014-5_2) · [arXiv:math/0202001](https://arxiv.org/abs/math/0202001)
  Where the branch and weakly branch conditions are set up in the form the classification uses, so the "weakly regular branch over $G'$" labels in the sweep are readable.
- <a id="Sidki2000"></a>**Sidki2000** — Said Sidki, *Automorphisms of one-rooted trees: growth, circuit structure, and acyclicity*, J. Math. Sci. **100** (2000), 1925–1943. [10.1007/BF02677504](https://doi.org/10.1007/BF02677504)
  Defines the activity-growth hierarchy — bounded, polynomial, exponential activity — which is the cheapest automaton-side predictor of amenability and the one the dictionary quotes.
- <a id="Zuk2008"></a>**Zuk2008** — Andrzej Żuk, *Groupes engendrés par les automates*, Séminaire Bourbaki Exp. 971, Astérisque **317** (2008), 141–174. [numdam.org/book-part/AST_2008__317__141_0](https://www.numdam.org/book-part/AST_2008__317__141_0/)
  The survey of what automata groups have settled; the shape of this repository's open-problem table comes from it.
  Volume **317**, not 311 — both numbers circulated here before the Numdam record settled it.
- <a id="Zuk2012"></a>**Zuk2012** — Andrzej Żuk, *Automata groups*, in *Topics in Noncommutative Geometry*, Clay Mathematics Proceedings 16, AMS, 2012, 165–196. ISBN 978-0-8218-6864-5
  Lecture-notes treatment of the same material, longer than the Bourbaki talk and easier to read first. No DOI exists.
- <a id="Zuk2020"></a>**Zuk2020** — Andrzej Żuk, *From partial differential equations to groups*, in *Analysis and Geometry on Graphs and Manifolds*, LMS Lecture Note Ser. 461, CUP, 2020, 368–381. [10.1017/9781108615259.015](https://doi.org/10.1017/9781108615259.015)
  Puts the spectral side of automaton groups — the lamplighter spectrum in particular — in a wider analytic frame.

- <a id="Luck1994"></a>**Luck1994** — Wolfgang Lück, *Approximating $L^2$-invariants by their finite-dimensional analogues*, Geom. Funct. Anal. **4** (1994), 455–481. [10.1007/BF01896404](https://doi.org/10.1007/BF01896404)
  The theorem that makes the [Atiyah entry](OpenProblems.md#Atiyah) computable here: for a residually finite group with a nested tower of finite-index normal subgroups intersecting trivially, the $L^2$-Betti number is the limit of $\lvert G_L \rvert^{-1} \dim \ker \rho_L$ — and the level stabilisers of a rooted-tree action are exactly such a tower, so every term is a rank in a finite group ring the paclet already computes in.
- <a id="Chou1980"></a>**Chou1980** — Ching Chou, *Elementary amenable groups*, Illinois J. Math. **24** (1980), 396–407. [10.1215/ijm/1256047608](https://doi.org/10.1215/ijm/1256047608)
  The structure theory of the elementary amenable class — closure under subgroups, quotients, extensions and directed unions, and the growth restrictions that follow. It is why [Day's problem](OpenProblems.md#DayElementary) has no computational recipe here: the class is defined by closure operations, and nothing in the paclet ranges over subgroups.
- <a id="BN2007"></a>**BN2007** — Ievgen Bondarenko, Volodymyr Nekrashevych, *Post-critically finite self-similar groups*, 2007. [arXiv:math/0701824](https://arxiv.org/abs/math/0701824)
  Bounded activity implies contracting. That converse direction is what turns `AutomatonNucleus` into a *negative* test for boundedness, and it is how 28 of the 32 torsion-free $(3, 2)$ codes were shown to lie outside the reach of [BKN2010](#BKN2010) without computing any activity degree.
- <a id="Nekrashevych2008"></a>**Nekrashevych2008** — Volodymyr Nekrashevych, *Free subgroups in groups acting on rooted trees*, 2008. [arXiv:0802.2554](https://arxiv.org/abs/0802.2554)
  No free subgroups in groups generated by bounded automata (reproving Sidki) or in iterated monodromy groups of expanding coverings. Together with [BKN2010](#BKN2010) this is what cancels both halves of a [von Neumann witness](OpenProblems.md#VonNeumannDay) inside the bounded class.
- <a id="Abert2005"></a>**Abert2005** — Miklós Abért, *Group laws and free subgroups in topological groups*, Bull. London Math. Soc. **37** (2005), 525–534. [10.1112/S002460930500425X](https://doi.org/10.1112/S002460930500425X) · [arXiv:math/0306364](https://arxiv.org/abs/math/0306364)
  Weakly branch groups satisfy no group law, and in the closure almost all finite subsets generate free subgroups — the opposite of the "weakly branch groups have no free subgroups" that one might expect, and the correction that stopped the four free-monoid classes being written up as von Neumann candidates.

## Landmark groups

Each of these is a group the repository either reproduces from an automaton or meets as a class in the 3-state sweep.

- <a id="Grigorchuk1980"></a>**Grigorchuk1980** — Rostislav Grigorchuk, *On Burnside's problem on periodic groups*, Funct. Anal. Appl. **14** (1980), 41–43. [10.1007/BF01078416](https://doi.org/10.1007/BF01078416)
  The 5-state 2-color automaton whose group is infinite with every element of order a power of $2$ — the example the `Burnside` notebook evolves, and the repository's benchmark for every state-analysis function.
- <a id="Grigorchuk1985"></a>**Grigorchuk1985** — Rostislav Grigorchuk, *Degrees of growth of finitely generated groups, and the theory of invariant means*, Math. USSR-Izv. **25** (1985), 259–300. [10.1070/IM1985v025n02ABEH001281](https://doi.org/10.1070/IM1985v025n02ABEH001281)
  The same group has intermediate growth, answering [Milnor1968](#Milnor1968); the ball-growth measurements in the sweep are the computational shadow of this.
- <a id="GuptaSidki1983"></a>**GuptaSidki1983** — Narain Gupta, Said Sidki, *On the Burnside problem for periodic groups*, Math. Z. **182** (1983), 385–388. [10.1007/BF01179757](https://doi.org/10.1007/BF01179757)
  The 3-color Burnside counterexample — the second automaton group in the repository's problem table, and the reason the alphabet size is a parameter rather than fixed at $2$.
- <a id="GrigorchukZuk2001"></a>**GrigorchukZuk2001** — Rostislav Grigorchuk, Andrzej Żuk, *The lamplighter group as a group generated by a 2-state automaton, and its spectrum*, Geom. Dedicata **87** (2001), 209–244. [10.1023/A:1012061801279](https://doi.org/10.1023/A:1012061801279)
  The smallest interesting automaton here: two states and two colors, and the spectral computation that later powers the Atiyah counterexample.
- <a id="GrigorchukZuk2002"></a>**GrigorchukZuk2002** — Rostislav Grigorchuk, Andrzej Żuk, *On a torsion-free weakly branch group defined by a three state automaton*, Int. J. Algebra Comput. **12** (2002), 223–246. [10.1142/S0218196702001000](https://doi.org/10.1142/S0218196702001000)
  The Basilica group: torsion-free, weakly branch, three states, and **not** subexponentially amenable — which is exactly why it is the sharpest unsettled case in the zero-divisor sweep.
- <a id="BartholdiVirag2005"></a>**BartholdiVirag2005** — Laurent Bartholdi, Bálint Virág, *Amenability via random walks*, Duke Math. J. **130** (2005), 39–56. [10.1215/S0012-7094-05-13012-5](https://doi.org/10.1215/S0012-7094-05-13012-5) · [arXiv:math/0305262](https://arxiv.org/abs/math/0305262)
  Basilica is amenable but not elementary amenable, so [KLM1988](#KLM1988) does not settle Kaplansky for it and no orderability argument known to us applies.
- <a id="BKN2010"></a>**BKN2010** — Laurent Bartholdi, Vadim Kaimanovich, Volodymyr Nekrashevych, *On amenability of automata groups*, Duke Math. J. **154** (2010), 575–598. [10.1215/00127094-2010-046](https://doi.org/10.1215/00127094-2010-046) · [arXiv:0802.2837](https://arxiv.org/abs/0802.2837)
  Bounded activity implies amenability — the theorem that turns [Sidki2000](#Sidki2000)'s hierarchy into a decision the paclet can compute from the automaton alone.
- <a id="BSV1999"></a>**BSV1999** — Andrew Brunner, Said Sidki, Ana Cristina Vieira, *A just-nonsolvable torsion-free group defined on the binary tree*, J. Algebra **211** (1999), 99–114. [10.1006/jabr.1998.7579](https://doi.org/10.1006/jabr.1998.7579)
  The Brunner–Sidki–Vieira group, contained in class $777$ of the sweep (codes 4126, 4136).
- <a id="Dahmani2005"></a>**Dahmani2005** — François Dahmani, *An example of non-contracting weakly branch automaton group*, in *Geometric Methods in Group Theory*, Contemp. Math. **372**, AMS, 2005, 219–224. [10.1090/conm/372/06887](https://doi.org/10.1090/conm/372/06887)
  The Dahmani group, class $2398$ (codes 4685, 4890): weakly regular branch and non-contracting, so it is one of the classes where the nucleus computation cannot replace a level-tower search.
- <a id="Aleshin1983"></a>**Aleshin1983** — Stanislav Aleshin, *A free group of finite automata*, Vestnik Moskov. Univ. Ser. I **1983**, no. 4, 12–14.
  The first free automaton group, and the origin of the freeness question in the automaton–group dictionary.
  In Russian, no translation, **no DOI or stable article URL** (MR713968).
- <a id="VorobetsVorobets2006"></a>**VorobetsVorobets2006** — Mariya Vorobets, Yaroslav Vorobets, *On a free group of transformations defined by an automaton*, Geom. Dedicata **124** (2006), 237–249. [10.1007/s10711-006-9060-5](https://doi.org/10.1007/s10711-006-9060-5) · [arXiv:math/0601231](https://arxiv.org/abs/math/0601231)
  Proves the Aleshin automaton generates $F_3$ — the identification the 3-state tables record for class $2240$.
- <a id="VorobetsVorobets2010"></a>**VorobetsVorobets2010** — Mariya Vorobets, Yaroslav Vorobets, *On a series of finite automata defining free transformation groups*, Groups Geom. Dyn. **4** (2010), 377–405. [10.4171/GGD/87](https://doi.org/10.4171/GGD/87)
  The Aleshin and Bellaterra *series*, which is what makes free-group behavior a phenomenon of the automaton space rather than of one code.
- <a id="BGKMNSS2007a"></a>**BGKMNSS2007a** — Bondarenko, Grigorchuk, Kravchenko, Muntyan, Nekrashevych, Savchuk, Šunić, *Groups generated by 3-state automata over a 2-letter alphabet, I*, São Paulo J. Math. Sci. **1** (2007), 1–39. [10.11606/issn.2316-9028.v1i1p1-39](https://doi.org/10.11606/issn.2316-9028.v1i1p1-39) · [arXiv:math/0612178](https://arxiv.org/abs/math/0612178)
  Part I of the classification.
- <a id="BGKMNSS2009"></a>**BGKMNSS2009** — Same authors, *…, II*, J. Math. Sci. **156** (2009), 187–208. [10.1007/s10958-008-9262-5](https://doi.org/10.1007/s10958-008-9262-5) · [arXiv:0704.3876](https://arxiv.org/abs/0704.3876)
  Part II.
- <a id="BGKMNSS2008"></a>**BGKMNSS2008** — Same authors, *Classification of groups generated by 3-state automata over a 2-letter alphabet*, 2008. [arXiv:0803.3555](https://arxiv.org/abs/0803.3555)
  The complete classification of the 194 groups arising from 3-state binary automata, and the reference the paclet's own code numbering is checked against.
  Cite this one, not the two parts: it supersedes both, several classes (Bellaterra among them) are named only here, and it was **never journal-published** — the arXiv version is the version of record.
- <a id="GLSZ2000"></a>**GLSZ2000** — Rostislav Grigorchuk, Peter Linnell, Thomas Schick, Andrzej Żuk, *On a question of Atiyah*, C. R. Acad. Sci. Paris **331** (2000), 663–668. [10.1016/S0764-4442(00)01702-X](https://doi.org/10.1016/S0764-4442%2800%2901702-X)
  Counterexamples to the strong Atiyah conjecture built from lamplighter-type automaton groups — the one problem in the table settled by an automaton whose group was already understood spectrally.
  No preprint exists.
- <a id="Atiyah1976"></a>**Atiyah1976** — Michael Atiyah, *Elliptic operators, discrete groups and von Neumann algebras*, Astérisque **32–33** (1976), 43–72. [numdam.org/item/AST_1976__32-33__43_0](https://www.numdam.org/item/AST_1976__32-33__43_0/)
  Where the $L^2$-Betti integrality question is raised.

- <a id="Aleshin1972"></a>**Aleshin1972** — S. V. Aleshin, *Finite automata and Burnside's problem for periodic groups*, Math. Notes **11** (1972), 199–203. [10.1007/BF01098526](https://doi.org/10.1007/BF01098526)
  The first automaton solution of the general Burnside problem, eight years before [Grigorchuk1980](#Grigorchuk1980) — the reason the automaton approach to torsion groups predates the group everyone quotes for it. Aleshin's *other* automaton, the free one, is [Aleshin1983](#Aleshin1983).
- <a id="BartholdiErschler2010"></a>**BartholdiErschler2010** — Laurent Bartholdi, Anna G. Erschler, *Growth of permutational extensions*, 2010. [arXiv:1011.5266](https://arxiv.org/abs/1011.5266)
  The first groups of intermediate growth whose growth function is known asymptotically rather than merely bounded on both sides — the calibration for how far a finite ball count is from a growth type.
- <a id="ErschlerZheng2018"></a>**ErschlerZheng2018** — Anna Erschler, Tianyi Zheng, *Growth of periodic Grigorchuk groups*, 2018. [arXiv:1802.09077](https://arxiv.org/abs/1802.09077)
  Pins the growth exponent of the first Grigorchuk group: $\log \log v(n) / \log n \to \alpha_0 \approx 0.7674$. The number to compare a measured `"BallGrowth"` against, and the measure of how hopeless radius 4 is for the purpose.

## Open problems

One primary reference per row of the repository's open-problem table, plus the theorems that decide individual classes.

- <a id="Kaplansky1970"></a>**Kaplansky1970** — Irving Kaplansky, *"Problems in the theory of rings" revisited*, Amer. Math. Monthly **77** (1970), 445–454. [10.1080/00029890.1970.11992519](https://doi.org/10.1080/00029890.1970.11992519)
  Where the zero-divisor and unit conjectures are stated — the target of the sweep over 3-state binary automata.
- <a id="Higman1940"></a>**Higman1940** — Graham Higman, *The units of group-rings*, Proc. LMS **s2-46** (1940), 231–248. [10.1112/plms/s2-46.1.231](https://doi.org/10.1112/plms/s2-46.1.231)
  Left-orderable implies $K[G]$ is a domain, so orderability settles Kaplansky outright; this is how three of the fourteen sweep classes become theorems rather than computations.
- <a id="BurnsHale1972"></a>**BurnsHale1972** — Robert Burns, V. W. D. Hale, *A note on group rings of certain torsion-free groups*, Canad. Math. Bull. **15** (1972), 441–445. [10.4153/CMB-1972-080-3](https://doi.org/10.4153/CMB-1972-080-3)
  Local indicability implies left-orderability — the actual argument used for $BS(1, 3)$, $BS(1, -3)$, and the Klein bottle group in the sweep.
- <a id="KLM1988"></a>**KLM1988** — Peter Kropholler, Peter Linnell, John Moody, *Applications of a new $K$-theoretic theorem to soluble group rings*, Proc. AMS **104** (1988), 675–684. [10.1090/S0002-9939-1988-0964842-0](https://doi.org/10.1090/S0002-9939-1988-0964842-0)
  Kaplansky holds for torsion-free elementary amenable groups, which covers the solvable sweep classes and pointedly fails for Basilica.
- <a id="Promislow1988"></a>**Promislow1988** — S. David Promislow, *A simple example of a torsion-free, non unique product group*, Bull. LMS **20** (1988), 302–304. [10.1112/blms/20.4.302](https://doi.org/10.1112/blms/20.4.302)
  The Promislow (Hantzsche–Wendt) group, in whose group ring Gardam found his unit; whether it is an automaton group is one of the repository's open questions.
- <a id="Gardam2021"></a>**Gardam2021** — Giles Gardam, *A counterexample to the unit conjecture for group rings*, Ann. of Math. **194** (2021), 967–979. [10.4007/annals.2021.194.3.9](https://doi.org/10.4007/annals.2021.194.3.9) · [arXiv:2102.11818](https://arxiv.org/abs/2102.11818)
  The unit conjecture is false, found by SAT search over $\mathbb{F}_2[P]$ — the methodological precedent for sweeping a finite space of candidates, which is what this repository does over automata.
- <a id="Passman1977"></a>**Passman1977** — Donald Passman, *The Algebraic Structure of Group Rings*, Wiley-Interscience, 1977. ISBN 0-471-02272-1
  The group-ring background the zero-divisor computations assume. No DOI exists.
- <a id="Burnside1902"></a>**Burnside1902** — William Burnside, *On an unsettled question in the theory of discontinuous groups*, Quart. J. Pure Appl. Math. **33** (1902), 230–238.
  The original question. Pre-DOI, and **no stable per-article URL** was found.
- <a id="Golod1964"></a>**Golod1964** — Evgenii Golod, *On nil-algebras and finitely approximable $p$-groups*, Izv. Akad. Nauk SSSR Ser. Mat. **28** (1964), 273–276. [10.1090/trans2/048/06](https://doi.org/10.1090/trans2/048/06)
  The first infinite finitely generated torsion group, via Golod–Shafarevich; the comparison that makes [Grigorchuk1980](#Grigorchuk1980)'s five states remarkable.
  The DOI is the AMS translation.
- <a id="NovikovAdyan1968a"></a><a id="NovikovAdyan1968b"></a><a id="NovikovAdyan1968c"></a>**NovikovAdyan1968a**, **b**, **c** — Pyotr Novikov, Sergei Adyan, *Infinite periodic groups I, II, III*, Math. USSR-Izv. **2** (1968). [I](https://doi.org/10.1070/IM1968v002n01ABEH000637) · [II](https://doi.org/10.1070/IM1968v002n02ABEH000640) · [III](https://doi.org/10.1070/IM1968v002n03ABEH000653)
  The bounded-exponent Burnside problem: free Burnside groups are infinite for odd exponent $\ge 4381$.
  Three separate DOIs, so three entries.
- <a id="Adyan1970"></a>**Adyan1970** — Sergei Adyan, *Infinite irreducible systems of group identities*, Math. USSR-Izv. **4** (1970), 721–739. [10.1070/IM1970v004n04ABEH000928](https://doi.org/10.1070/IM1970v004n04ABEH000928)
  The identity-system side of the same machinery, cited by the `Burnside` notebook alongside the periodicity results.
- <a id="Adyan1979"></a>**Adyan1979** — Sergei Adyan, *The Burnside Problem and Identities in Groups*, Ergebnisse der Mathematik 95, Springer, 1979. [10.1007/978-3-642-66932-3](https://doi.org/10.1007/978-3-642-66932-3)
  Brings the bound down to odd exponent $\ge 665$, which is the number the `Burnside` notebook quotes; Russian original Nauka, 1975.
- <a id="Adyan1983"></a>**Adyan1983** — Sergei Adyan, *Random walks on free periodic groups*, Math. USSR-Izv. **21** (1983), 425–434. [10.1070/IM1983v021n03ABEH001799](https://doi.org/10.1070/IM1983v021n03ABEH001799)
  Free Burnside groups are non-amenable, giving one of the two group-side von Neumann counterexamples; no automaton realization is known.
- <a id="Olshanskii1980"></a>**Olshanskii1980** — Alexander Ol'shanskii, *On the problem of the existence of an invariant mean on a group*, Russian Math. Surveys **35** (1980), 180–181. [10.1070/RM1980v035n04ABEH001876](https://doi.org/10.1070/RM1980v035n04ABEH001876)
  Tarski monsters: non-amenable with no free subgroup — the other group-side von Neumann counterexample, likewise with no known automaton realization.
- <a id="Neumann1929"></a>**Neumann1929** — John von Neumann, *Zur allgemeinen Theorie des Masses*, Fund. Math. **13** (1929), 73–116. [10.4064/fm-13-1-73-116](https://doi.org/10.4064/fm-13-1-73-116)
  Amenability is defined here, so the von Neumann problem's terms are.
- <a id="Day1957"></a>**Day1957** — Mahlon Day, *Amenable semigroups*, Illinois J. Math. **1** (1957), 509–544. [10.1215/ijm/1255380675](https://doi.org/10.1215/ijm/1255380675)
  Elementary amenability, hence the Day problem — the row that the Grigorchuk group settles and Basilica settles more sharply.
- <a id="Milnor1968"></a>**Milnor1968** — John Milnor, *Problem 5603*, Amer. Math. Monthly **75** (1968), 685–686. [10.2307/2313822](https://doi.org/10.2307/2313822)
  The growth question, as a two-paragraph problem entry.
- <a id="Grigorchuk2014a"></a>**Grigorchuk2014a** — Rostislav Grigorchuk, *Milnor's problem on the growth of groups and its consequences*, in *Frontiers in Complex Dynamics*, Princeton Math. Ser. 51, 2014, 705–773. [10.23943/princeton/9780691159294.003.0025](https://doi.org/10.23943/princeton/9780691159294.003.0025) · [arXiv:1111.0512](https://arxiv.org/abs/1111.0512)
  The survey to read before believing anything about growth of automaton groups.
- <a id="Grigorchuk2014b"></a>**Grigorchuk2014b** — Rostislav Grigorchuk, *On the Gap Conjecture concerning group growth*, Bull. Math. Sci. **4** (2014), 113–128. [10.1007/s13373-012-0029-4](https://doi.org/10.1007/s13373-012-0029-4) · [arXiv:1202.6044](https://arxiv.org/abs/1202.6044)
  The gap conjecture — polynomial or at least $e^{\sqrt n}$ — which is the last row of the problem table and the one where branch and automaton groups are the test class.
- <a id="Zassenhaus1974"></a>**Zassenhaus1974** — Hans Zassenhaus, *On the torsion units of finite group rings*, in *Studies in Mathematics, in Honour of A. Almeida Costa*, Instituto de Alta Cultura, Lisbon, 1974, 119–126.
  Where the torsion-unit conjecture is stated. Pre-DOI, and **no stable per-article URL** exists.
- <a id="EiseleMargolis2018"></a>**EiseleMargolis2018** — Florian Eisele, Leo Margolis, *A counterexample to the first Zassenhaus conjecture*, Adv. Math. **339** (2018), 599–641. [10.1016/j.aim.2018.10.004](https://doi.org/10.1016/j.aim.2018.10.004) · [arXiv:1710.08780](https://arxiv.org/abs/1710.08780)
  A metabelian group of order $2^7 3^2 5 \cdot 7^2 19^2$ refutes it; as with von Neumann, the counterexample is hand-built and no automaton realization is known.
- <a id="Gillibert2014"></a>**Gillibert2014** — Pierre Gillibert, *The finiteness problem for automaton semigroups is undecidable*, Int. J. Algebra Comput. **24** (2014), 1–9. [10.1142/S0218196714500015](https://doi.org/10.1142/S0218196714500015) · [arXiv:1304.2295](https://arxiv.org/abs/1304.2295)
  The boundary on everything this repository computes: finiteness is undecidable for automaton semigroups, so the paclet's finiteness and order tests are necessarily searches with bounds, not decision procedures.

- <a id="Sanov1940"></a>**Sanov1940** — I. N. Sanov, *Solution of Burnside's problem for exponent 4*, Uchen. Zap. Leningrad. Gos. Univ. Ser. Mat. **10** (1940), 166–170.
  $B(m, 4)$ is finite. One of the four settled exponents that bound the [smallest-bounded-exponent](OpenProblems.md#BurnsideExponent) question from below. No machine identifier exists.
- <a id="Hall1958"></a>**Hall1958** — Marshall Hall Jr., *Solution of the Burnside problem for exponent six*, Illinois J. Math. **2** (1958), 764–786. [10.1215/ijm/1255448339](https://doi.org/10.1215/ijm/1255448339)
  $B(m, 6)$ is finite, completing the settled list $n = 2, 3, 4, 6$ and leaving $n = 5$ as the smallest open case.
- <a id="Ivanov1994"></a>**Ivanov1994** — Sergei V. Ivanov, *The free Burnside groups of sufficiently large exponents*, Int. J. Algebra Comput. **4** (1994), 1–308. [10.1142/S0218196794000026](https://doi.org/10.1142/S0218196794000026)
  $B(m, n)$ is infinite for $n \geq 2^{48}$ with $n$ odd or divisible by $2^9$, so the negative answer covers almost all exponents; with [Lysenok1996](#Lysenok1996) it pushes the open window down from the odd $n \geq 665$ of [Adyan1979](#Adyan1979).
- <a id="Lysenok1996"></a>**Lysenok1996** — I. G. Lysënok, *Infinite Burnside groups of even exponent*, Izv. Math. **60** (1996), 453–654. [10.1070/IM1996v060n03ABEH000077](https://doi.org/10.1070/IM1996v060n03ABEH000077)
  The even case, $n \geq 8000$ — the other half of the bound that makes $\{5, 7, 8, \ldots\}$ the finite open window rather than an infinite one.
- <a id="Zelmanov1991"></a>**Zelmanov1991** — E. I. Zel'manov, *Solution of the restricted Burnside problem for groups of odd exponent*, Math. USSR-Izv. **36** (1991), 41–60. [10.1070/IM1991v036n01ABEH001946](https://doi.org/10.1070/IM1991v036n01ABEH001946)
  With [Zelmanov1992](#Zelmanov1992), the theorem that puts the whole [bounded-exponent entry](OpenProblems.md#BurnsideExponent) out of this formalism's reach: the restricted problem is equivalent to "every finitely generated residually finite group of finite exponent is finite", and automaton groups are residually finite by construction.
- <a id="Zelmanov1992"></a>**Zelmanov1992** — E. I. Zel'manov, *A solution of the restricted Burnside problem for 2-groups*, Math. USSR-Sb. **72** (1992), 543–565. [10.1070/SM1992v072n02ABEH001272](https://doi.org/10.1070/SM1992v072n02ABEH001272)
  The 2-group half, which is the half that matters here — the binary alphabet is the paclet's default and the Grigorchuk group is a 2-group.
- <a id="Gromov1981"></a>**Gromov1981** — Mikhael Gromov, *Groups of polynomial growth and expanding maps* (with an appendix by Jacques Tits), Publ. Math. IHÉS **53** (1981), 53–78. [10.1007/BF02698687](https://doi.org/10.1007/BF02698687)
  Polynomial growth iff virtually nilpotent — the theorem that makes the lower end of the [gap conjecture](OpenProblems.md#GapConjecture) a sharp dichotomy and lets `AutomatonAbelianQ` plus a ball count discharge the virtually nilpotent candidates.
- <a id="AAV2013"></a>**AAV2013** — Gideon Amir, Omer Angel, Bálint Virág, *Amenability of linear-activity automaton groups*, 2009. [arXiv:0905.2007](https://arxiv.org/abs/0905.2007)
  Activity degree 1 implies amenable, extending [BKN2010](#BKN2010) one step up [Sidki2000](#Sidki2000)'s hierarchy. Degree $\geq 2$ is open, which is where the [activity entry](OpenProblems.md#AmenabilityActivity) stops.
- <a id="JNS2016"></a>**JNS2016** — Kate Juschenko, Volodymyr Nekrashevych, Mikael de la Salle, *Extensions of amenable groups by recurrent groupoids*, 2013. [arXiv:1305.2637](https://arxiv.org/abs/1305.2637)
  One proof covering Grigorchuk, Basilica, bounded automorphisms and linear activity at once — the unified statement the amenability entries cite rather than four separate ones.
- <a id="Monod2013"></a>**Monod2013** — Nicolas Monod, *Groups of piecewise projective homeomorphisms*, 2012. [arXiv:1209.5229](https://arxiv.org/abs/1209.5229)
  Non-amenable and free-subgroup-free by a construction simple enough to check by hand — and torsion-free, unlike [Olshanskii1980](#Olshanskii1980) and [Adyan1983](#Adyan1983), which is what makes it the first [von Neumann](OpenProblems.md#VonNeumannDay) counterexample not immediately excluded from being an automaton group by finite exponent.
- <a id="LodhaMoore2013"></a>**LodhaMoore2013** — Yash Lodha, Justin Tatch Moore, *A finitely presented group of piecewise projective homeomorphisms*, 2013. [arXiv:1308.4250](https://arxiv.org/abs/1308.4250)
  The finitely presented, torsion-free refinement of Monod's example.
- <a id="Austin2009"></a>**Austin2009** — Tim Austin, *Rational group ring elements with kernels having irrational dimension*, 2009. [arXiv:0909.2360](https://arxiv.org/abs/0909.2360)
  Irrational $L^2$-Betti numbers over $\mathbb{Q}[G]$, so the [Atiyah](OpenProblems.md#Atiyah) question fails far beyond the non-integrality [GLSZ2000](#GLSZ2000) exhibits.
- <a id="Grabowski2010"></a>**Grabowski2010** — Łukasz Grabowski, *On Turing dynamical systems and the Atiyah problem*, 2010. [arXiv:1004.2030](https://arxiv.org/abs/1004.2030)
  Every non-negative real is an $L^2$-Betti number, by embedding Turing machines into integral group rings — and the transcendental example uses a triple product of lamplighter groups, so the automaton behind [GLSZ2000](#GLSZ2000) is still the engine.
- <a id="PSZ2010"></a>**PSZ2010** — Mikaël Pichot, Thomas Schick, Andrzej Żuk, *Closed manifolds with transcendental $L^2$-Betti numbers*, 2010. [arXiv:1005.1147](https://arxiv.org/abs/1005.1147)
  Austin's method refined to explicit computations, closing the manifold version of the question.
- <a id="Gillibert2018"></a>**Gillibert2018** — Pierre Gillibert, *An automaton group with undecidable order and Engel problems*, 2017. [arXiv:1710.09733](https://arxiv.org/abs/1710.09733)
  For every Turing machine and initial configuration, an explicit group element of finite order **iff** the machine halts. This is the theorem that makes the [order problem](OpenProblems.md#Order) undecidable and — since finite order *has* a certificate — makes infinite order the side with no finite certificate at all, which is precisely the side every sweep in this repository searches.
- <a id="BartholdiMitrofanov2020"></a>**BartholdiMitrofanov2020** — Laurent Bartholdi, Ivan Mitrofanov, *The word and order problems for self-similar and automata groups*, 2017. [arXiv:1710.10109](https://arxiv.org/abs/1710.10109)
  The order problem is undecidable even for *contracting* automata, and the word problem is undecidable once finite-stateness is dropped (functionally recursive groups) — the two results that fix where the decidability boundary runs in the [triviality entry](OpenProblems.md#Triviality).
- <a id="SunicVentura2012"></a>**SunicVentura2012** — Zoran Šunić, Enric Ventura, *The conjugacy problem in automaton groups is not solvable*, 2010. [arXiv:1010.1993](https://arxiv.org/abs/1010.1993)
  Undecidability of [conjugacy](OpenProblems.md#Conjugacy), which is why the level cycle-type comparison is offered as a `Necessary` filter and nothing stronger.
- <a id="BBSZ2013"></a>**BBSZ2013** — Ievgen V. Bondarenko, Natalia V. Bondarenko, Said N. Sidki, Flavia R. Zapata, *On the conjugacy problem for finite-state automorphisms of regular rooted trees*, 2010. [arXiv:1011.2227](https://arxiv.org/abs/1011.2227)
  Conjugacy *is* decidable for bounded automata — the positive counterpart, and an algorithm the paclet does not implement, so even the decidable codes get only the filter.
- <a id="Klimann2013"></a>**Klimann2013** — Ines Klimann, *The finiteness of a group generated by a 2-letter invertible-reversible Mealy automaton is decidable*, 2012. [arXiv:1208.6324](https://arxiv.org/abs/1208.6324)
  A semigroup generated by a reversible two-state automaton is finite or free of rank 2 — a dichotomy that decides [finiteness](OpenProblems.md#Finiteness) and semigroup [freeness](OpenProblems.md#Freeness) on the smallest classes.
- <a id="KPS2014"></a>**KPS2014** — Ines Klimann, Matthieu Picantin, Dmytro Savchuk, *A connected 3-state reversible Mealy automaton cannot generate an infinite Burnside group*, 2014. [arXiv:1409.6142](https://arxiv.org/abs/1409.6142)
  No infinite Burnside group from a connected reversible automaton on 3 states — a negative result about exactly the $(3, 2)$ space this repository sweeps.
- <a id="GodinKlimann2016"></a>**GodinKlimann2016** — Thibault Godin, Ines Klimann, *Connected reversible Mealy automata of prime size cannot generate infinite Burnside groups*, 2016. [arXiv:1604.03270](https://arxiv.org/abs/1604.03270)
  The same conclusion for any prime number of states, generalizing [KPS2014](#KPS2014).
- <a id="DAngeliRodaro2014"></a>**DAngeliRodaro2014** — Daniele D'Angeli, Emanuele Rodaro, *Freeness of automata groups vs boundary dynamics*, 2014. [arXiv:1410.6097](https://arxiv.org/abs/1410.6097)
  Freeness characterized by the boundary dynamics of the enriched dual transducer, and for bireversible automata non-freeness reduced to a finite Schreier orbit in the dual — the replacement for the word quantifier that no ball search can discharge.
- <a id="DFRW2020"></a>**DFRW2020** — Daniele D'Angeli, Dominik Francoeur, Emanuele Rodaro, Jan Philipp Wächter, *On the orbits of automaton semigroups and groups*, 2020. [arXiv:2007.10273](https://arxiv.org/abs/2007.10273)
  A more general form of the [finiteness problem](OpenProblems.md#Finiteness) is undecidable — finiteness of left principal ideals in semigroups generated by complete reversible automata.
- <a id="DRW2024"></a>**DRW2024** — Daniele D'Angeli, Emanuele Rodaro, Jan Philipp Wächter, *The finiteness problem for automaton semigroups of extended bounded activity*, 2024. [arXiv:2406.20056](https://arxiv.org/abs/2406.20056)
  Decidability of finiteness for complete automaton semigroups of bounded extended activity — the current positive frontier, and a second place where a *decidable* result is gated on an activity notion the paclet cannot compute.

## Formalization

- <a id="GadgilTadipatri2024"></a>**GadgilTadipatri2024** — Siddhartha Gadgil, Anand Rao Tadipatri, *Formalizing Giles Gardam's disproof of Kaplansky's unit conjecture*, CPP '24, 177–189. [10.1145/3636501.3636947](https://doi.org/10.1145/3636501.3636947)
  The model for `Lean/GroupRing/`: it shows how much of a group-ring counterexample has to be constructive to typecheck.
  **No arXiv preprint exists.** The identifier `arXiv:2206.02720`, which circulated in this repository, is a paper on the Ablowitz–Ladik system.
- <a id="MathlibCommunity2020"></a>**MathlibCommunity2020** — The mathlib Community, *The Lean mathematical library*, CPP 2020, 367–381. [10.1145/3372885.3373824](https://doi.org/10.1145/3372885.3373824) · [arXiv:1910.09336](https://arxiv.org/abs/1910.09336)
  The library the formalization builds on. Crossref files this under series *POPL '20*; the conference is CPP 2020, co-located with POPL.
- <a id="MouraUllrich2021"></a>**MouraUllrich2021** — Leonardo de Moura, Sebastian Ullrich, *The Lean 4 Theorem Prover and Programming Language*, CADE 28, 625–635. [10.1007/978-3-030-79876-5_37](https://doi.org/10.1007/978-3-030-79876-5_37)
  The prover itself.
- <a id="MathlibMonoidAlgebra"></a>**MathlibMonoidAlgebra** — The mathlib Community, `Mathlib.Algebra.MonoidAlgebra`. [mathlib4_docs](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/MonoidAlgebra/Defs.html)
  The group-ring API the Lean development actually imports — `MonoidAlgebra`, not a group-theory module — pinned at Lean v4.32.0 with Mathlib `81a5d257c8e4`.

## Software

**No Wolfram Language software for automata groups exists.**
`transducer` and `Mealy` match zero documented symbols; the only automaton symbols are `CellularAutomaton`, `TuringMachine`, and `SubstitutionSystem`; the Function Repository's automaton entries are cellular or mobile automata and its group entries are finite-permutation-group utilities; the Paclet Repository has nothing on automata, self-similar, or branch groups.
That absence is this paclet's reason to exist, and it is why the prior art below is all GAP.

None of the three carries a DOI of any kind — each project's own recommended citation is a versioned URL, and these entries reproduce it verbatim.
Since nothing upstream pins them, the version and release date are part of the citation and will need re-checking as GAP releases.

- <a id="AutomGrp"></a>**AutomGrp** — Yevgen Muntyan, Dmytro Savchuk, *AutomGrp: Automata groups*, GAP package, version 1.3.3 (2025-01-08). [gap-packages.github.io/automgrp](https://gap-packages.github.io/automgrp)
  The closest prior art: it computes with a group given *either* by a Mealy automaton *or* by wreath recursion, which is exactly the conversion this paclet performs, and [BGKMNSS2008](#BGKMNSS2008) is its classification companion.
- <a id="FR"></a>**FR** — Laurent Bartholdi, *FR: Computations with functionally recursive groups*, GAP package, version 2.4.13 (2024-01-11). [gap-packages.github.io/fr](https://gap-packages.github.io/fr)
  The other GAP implementation, stronger on branch structure and on the algorithms behind contraction.
- <a id="GAP4"></a>**GAP4** — The GAP Group, *GAP — Groups, Algorithms, and Programming*, version 4.16.0 (2026-06-02). [gap-system.org](https://www.gap-system.org)
  Neither package is citable without the host system.
