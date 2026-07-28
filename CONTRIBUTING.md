# Contributing

## Layout

```
IteratedFiniteAutomaton/          the paclet
├── PacletInfo.wl                 metadata; the version lives here
├── Kernel/
│   ├── IteratedFiniteAutomaton.wl   main loader
│   ├── Usage.wl                     every ::usage message
│   ├── Automata.wl                  codes, invertibility, canonical forms
│   ├── Converters.wl                Mealy rule ↔ wreath recursion ↔ code
│   ├── Evolution.wl                 iteration on a tape
│   ├── Groups.wl                    the action on the rooted tree
│   ├── StateAnalysis.wl             sections, nucleus, contraction
│   ├── GroupRing.wl                 products, annihilators, the tower searches
│   └── Visualization.wl             portraits, boundary graphs, galleries
├── Documentation/                Documentation Center pages, one per export
└── Tests/                        *.wlt, one file per Kernel module
```

The package system is `Package[]` / `PackageExport` / `PackageScope`, not
`BeginPackage` / `EndPackage`. A new exported symbol needs three things: the
`PackageExport` in its module, a `::usage` in `Usage.wl`, and a Documentation
page — the guide page groups exports the way `Kernel/*.wl` does, so a symbol
added to a module belongs in that module's guide section.

## Loading from source

```wolfram
PacletDirectoryLoad["IteratedFiniteAutomaton"]
Needs["WolframInstitute`IteratedFiniteAutomaton`"]
```

## Tests

```bash
wolframscript -f run_tests.wls
```

Tests assert mathematics, not internals. A test belongs here if it would fail
only when a mathematical statement becomes false — level orders that must be
nondecreasing, a product that must vanish, ball counts that must match a free
group. A test that only pins down the shape of a return value does not.

## Code style

Exploratory research code: mathematical clarity over robustness. No defensive
programming, no input validation, no `$Failed` on a shape check — only the
outermost user-facing signature pattern-matches for dispatch, and helpers below
it trust their inputs. Functional style by default (`Map`, `Fold`, `Nest`,
`Select`); loops only for a mutable accumulator, early termination, or a
measured performance need. One `Module` per function at most, `With` wherever
the bindings are not mutated. Comments carry *why*, not *what*: one line of
mathematics per exported symbol is usually the whole comment budget.

## Commits

Conventional Commits — `type(scope): subject`, imperative, at most 72
characters, no trailing period. A `.githooks/commit-msg` hook enforces it; if a
commit is rejected, rewrite the subject rather than passing `--no-verify`.

```bash
git config core.hooksPath .githooks
```

## Claims

Nothing in this repository claims more than it computed. A finite search that
found nothing has refuted one radius, one field and one weight bound at the
levels it tested, and `OpenProblems.md` states every such bound in the entry it
belongs to. If you add a search, add its bound with it.
