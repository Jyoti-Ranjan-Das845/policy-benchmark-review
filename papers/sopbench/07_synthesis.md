# 07 Synthesis Note

## What This Paper Establishes
- An automated, executable benchmark (SOPBench) can check tool-using agents for SOP adherence across seven customer-service domains using shared helper/service functions and rule-based verifiers. (`paper.txt:68-279`)
- Across 903 cases, even top proprietary models top out near 76% pass rate while many strong models sit in the 30–50% range, showing SOP compliance is still difficult. (`paper.txt:311-351`)
- Tool availability, prompting style, jailbreak prompts, and constraint counts materially change pass rates, revealing sensitivity to context size, reasoning depth, and adversarial pressure (Figures 5–9). (`paper.txt:368-499`)

## What Remains Uncertain
- Whether SOPBench pass rates predict in-the-wild compliance for real enterprise SOPs or multi-turn interactions, since tasks are synthetic and mostly single-shot. (`paper.txt:535-545`)
- How accurate the rule-based judges are under edge cases or partial compliance, because no human calibration or error analysis is reported. (`paper.txt:200-244`)
- Statistical stability of the reported numbers: rerun variance, seed sensitivity, or confidence intervals are absent. (`paper.txt:311-351`)

## What to Trust
- Quantitative coverage (Table 2) and the broad pattern that reasoning-focused or FC-enabled models outperform smaller baselines appear reliable given clear descriptions and consistent gaps. (`paper.txt:268-351`,`paper.txt:415-438`)

## What Not to Trust Yet
- Broad safety conclusions (e.g., jailbreak susceptibility for all domains) or claims about real-world deployment readiness, because only a narrow adversarial prompt and limited tool constraints were explored. (`paper.txt:368-414`)

## Carry-Forward Notes for Cross-Paper Synthesis
- Treat SOPBench as a stress test for multi-step procedural reasoning when comparing agent papers; improvements should be measured not just by task success but by satisfying helper checks before actions. (`paper.txt:200-244`)
- Look for future works that tie benchmark performance to live deployments or introduce training methods (e.g., RL with verified rewards) building on these oracle trajectories. (`paper.txt:555-560`)
