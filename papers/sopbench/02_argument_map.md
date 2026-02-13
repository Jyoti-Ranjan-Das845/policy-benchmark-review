# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: Language agents need dedicated evaluation of SOP compliance, and SOPBench provides such a benchmark showing current models fail to reliably follow required procedures. (`paper.txt:68-80`,`paper.txt:311-351`)
- Method element tied to claim: Encode each SOP as a directed action graph plus executable oracle, generate diverse test cases via constraint permutation, and score trajectories on permissibility, database outcome, and procedural completeness. (`paper.txt:200-279`)
- Evidence artifact(s): Table 2 (coverage statistics across 7 domains), Table 3 (pass rates of 18 models), Figures 5–9 (tool-set ablation, jailbreak stress test, tool-calling method comparison, error causes, constraint-count analysis). (`paper.txt:268-499`)
- Conclusion drawn by authors: Even frontier reasoning models have sub-80% pass rates and degrade sharply under distractions, so improving agents’ procedural adherence is an open challenge. (`paper.txt:311-383`)

## Assumptions vs Demonstrations
- Explicitly demonstrated: Benchmark construction process, automated verification, and comparative evaluation runs for 18 models with detailed metrics. (`paper.txt:231-499`)
- Assumed but not demonstrated: That synthetic SOPs and databases faithfully mirror real enterprise SOP complexity and that oracle verifiers perfectly detect every violation without false positives/negatives. (`paper.txt:773-809`)

## Logical Gaps
- Gap 1: No empirical validation that performance on SOPBench correlates with real deployment incidents or human evaluations, so the benchmark’s external validity remains speculative. (`paper.txt:535-545`)
- Gap 2: Jailbreak and tool-set ablation studies consider only a few domains (healthcare, university) and models, leaving unclear whether safety conclusions generalize across the full suite. (`paper.txt:368-414`)
