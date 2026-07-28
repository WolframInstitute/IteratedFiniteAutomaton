# Reproducing

Everything below was executed from a clean checkout of this repository before
being written down, and each command is followed by what it actually printed.

## Environment

- Wolfram Language **15.0.0** for macOS ARM (64-bit), 19 May 2026.
  `PacletInfo.wl` declares `WolframVersion -> "14.3+"`; 14.3 has not been
  re-tested since the group-ring modules were added, so 15.0 is the version the
  numbers below come from.
- `wolframscript` on the path.
- No other dependencies. Nothing here needs network access except installing
  the paclet from the cloud, which the source load below avoids.

## Install the released paclet

```wolfram
PacletInstall["https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton.paclet"]
Needs["WolframInstitute`IteratedFiniteAutomaton`"]
```

The paclet is **not** in the Wolfram Paclet Repository, so that public cloud
object is the only install route. The URL is stable across releases — each one
overwrites it — so pinning a version means checking
`PacletObject["WolframInstitute/IteratedFiniteAutomaton"]["Version"]` after
installing, currently `0.2.0`.

## Load from source instead

From the repository root:

```wolfram
PacletDirectoryLoad["IteratedFiniteAutomaton"]
Needs["WolframInstitute`IteratedFiniteAutomaton`"]
```

`Length[Names["WolframInstitute`IteratedFiniteAutomaton`*"]]` is **42**, the
full export list.

## Run the test suite

```bash
wolframscript -f run_tests.wls
```

Prints one line per test file and then `All tests passed`:

```
AutomataTests: 9/9
ConvertersTests: 5/5
EvolutionTests: 7/7
GroupRingTests: 32/32
GroupsTests: 23/23
StateAnalysisTests: 5/5
VisualizationTests: 21/21
```

**102 tests, all passing, in about 8 seconds** of wall clock on an M-series Mac.
The tests assert mathematics rather than internals, so a failure here is a false
mathematical statement and not a changed return shape.

## Reproduce the catalog's test recipes

Every `Test recipe` field in [`OpenProblems.md`](OpenProblems.md) is a runnable
call, and each was run against a live kernel before it was written down. The
quoted outputs are reproducible directly. For example, the zero-divisor search
on the Aleshin automaton:

```wolfram
GroupRingZeroDivisorSurvival[{5125, {3, 2}}, 1, {3, 5, 7}, Modulus -> 2]
```

returns a 7-word support with `"Counts"` `{{3, 5}, {5, 0}}` — five candidates
survive level 3, none survives level 5 — and an empty `"Survivors"`, which is
the refutation. The positive control `{4210, {3, 2}}`, the lamplighter padded
with a trivial third state and therefore not torsion-free, keeps 2 survivors
through level 7 with their annihilators.

The complete set of recipes, evaluated with outputs embedded, is the research
notebook [**Open problems, as automaton
statements**](https://www.wolframcloud.com/obj/hajek_pavel/IteratedFiniteAutomaton/Research/OpenProblems.nb).
It builds to **zero messages**; if any recipe stopped reproducing, that build
would emit one.

## Read or re-run the research notebooks

The seven notebooks in the README's table are deployed as public cloud objects
under `/obj/hajek_pavel/IteratedFiniteAutomaton/Research/`. Each is fully
evaluated with its outputs embedded, so it reads in a browser with nothing
installed, and every input cell re-evaluates against the installed paclet.

## What this repository does not let you re-run

Stated explicitly rather than left to be discovered:

- **The four exhaustive sweeps.** The numbers in every `Searched here` field —
  6018 torsion-free candidates across the $(2, 2)$, $(3, 2)$, $(2, 3)$ and
  $(4, 2)$ spaces, all refuted — were produced by driver scripts and cached
  `.wxf` data that live in a **separate private development repository**, not
  here. The parameters are all documented in the catalog (space, radius, field,
  weight bound, level ceiling and refutation depth for every pass), so the
  sweeps are reproducible *in principle* from the exports this paclet ships;
  they are not reproducible by running a script from this checkout.
- **The notebook builds.** The `.md` sources and the build-and-deploy scripts
  are in the same private repository. What is public is the evaluated `.nb`
  itself, which is the artifact a reader consumes.

Both gaps are the same decision — which side of the public boundary the
research pipeline belongs on — and closing them means moving the sweep drivers
and the notebook sources into this repository.

## Rebuild the documentation search index

The Documentation Center pages ship built. If they are regenerated, the search
index has to be rebuilt in a **fresh kernel** — a kernel that has already
loaded the paclet's documentation will silently produce an empty index.
