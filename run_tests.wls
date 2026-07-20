#!/usr/bin/env wolframscript

$pacletDir = DirectoryName[ $InputFileName ];
PacletDirectoryLoad[ $pacletDir <> "/IteratedFiniteAutomaton" ];
Needs[ "WolframInstitute`IteratedFiniteAutomaton`" ];

$testFiles = FileNames[ "*.wlt", FileNameJoin[ { $pacletDir, "IteratedFiniteAutomaton", "Tests" } ] ];

$allPassed = True;
Do[
    report = TestReport[ file ];
    Print[ FileBaseName[ file ], ": ",
        report[ "TestsSucceededCount" ], "/",
        report[ "TestsSucceededCount" ] + report[ "TestsFailedCount" ] ];
    If[ report[ "AllTestsSucceeded" ] =!= True, $allPassed = False ],
    { file, $testFiles }
];

If[ $allPassed,
    Print[ "\nAll tests passed." ]; Exit[ 0 ],
    Print[ "\nSome tests failed." ]; Exit[ 1 ]
]
