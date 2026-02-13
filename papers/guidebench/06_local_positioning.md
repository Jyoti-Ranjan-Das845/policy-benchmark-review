# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| ComplexBench (Wen et al., 2024) | Shifts from general multi-constraint prompts to domain-specific guideline bundles covering seven operational areas and simulated rule updates (paper.txt:82-94, 118-169, 428-453). | Better: adds rule-update stress tests; Worse: tasks remain synthetic, Chinese-focused QA/MC cases (paper.txt:870-878, 494-505). |
| RuleBench (Sun et al., 2024) | Extends inferential-rule evaluation with richer domains (audit, price matching, math, etc.) and mixes QA with multi-option outputs (paper.txt:82-94, 494-505). | Better: broader domain coverage; Worse: depends on GPT-4 during rule synthesis and parsing, creating accessibility hurdles (paper.txt:392-427, 607-610). |
| FollowBench (Jiang et al., 2024) | Adds guideline-modification robustness and curated answer options beyond fine-grained constraint following (paper.txt:82-90, 428-453). | Better: evaluates 18 LLMs under updated policies; Worse: still lacks interactive/tool-using agents (paper.txt:512-536, 494-505). |

## Novelty Judgment
- New: Modeling guideline updates plus human-reviewed multi-response sets aimed at domain policies (paper.txt:428-489).
- Incremental: Uses standard QA/MC formulations and Zero-Shot-CoT prompting already common in instruction benchmarks (paper.txt:494-505, 589-595).
- Repackaged: Model comparisons largely restate known leaderboard ordering across GPT, Deepseek, Qwen, etc. (paper.txt:512-536).

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: Offers a sizable dataset and ablations revealing persistent math weaknesses, yet evidence is limited to synthetic, single-turn tasks without deployment validation (paper.txt:118-169, 512-848, 700-813).
