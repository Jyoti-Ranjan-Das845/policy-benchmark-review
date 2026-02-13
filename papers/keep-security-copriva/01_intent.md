# 01 Intent Note

## Paper
- Title: Keep Security! Benchmarking Security Policy Preservation in Large Language Model Contexts Against Indirect Attacks in Question Answering
- Authors: Hwan Chang, Yumin Kim, Yonghyun Jun, Hwanhee Lee
- Venue/Year: arXiv preprint (cs.CL), Sep 2025
- URL: https://arxiv.org/abs/2505.15805

## Core Intent
- Research question (1 sentence): Can existing LLMs respect user-defined contextual security policies embedded in meeting transcripts when facing direct and indirect QA attacks? (paper.txt:120-142,244-320)
- Main claim (1 sentence): CoPriva, a 4k-instance benchmark with explicit policies and adversarial queries, shows that current LLMs frequently leak policy-prohibited content—especially under indirect attacks—highlighting a critical safety gap (paper.txt:120-152,470-540).
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction plus empirical evaluation of 10 LLMs with quantitative leakage/faithfulness metrics (paper.txt:244-520).
- Key assumptions required for claim to hold: GPT-4.1-generated policies and LLM-as-judge evaluations faithfully capture confidential/non-confidential targets; QMSum transcripts plus policy swaps emulate real policy environments; indirect QMSum queries genuinely pressure contextual security (paper.txt:249-320,421-455).

## Reading Focus
- What to pay attention to first: Dataset pipeline (policy extraction, attack construction) and evaluation criteria (leakage vs. faithfulness scoring) because they define what “policy preservation” means (paper.txt:244-455).
- What can be ignored in first pass: Extended appendix prompts/statistics unless checking reproducibility details, since core claims rest on main-text tables/figures (paper.txt:973-980).
