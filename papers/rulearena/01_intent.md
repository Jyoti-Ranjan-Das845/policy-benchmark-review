# 01 Intent Note

## Paper
- Title: RULE ARENA: A Benchmark for Rule-Guided Reasoning with LLMs in Real-World Scenarios
- Authors: Ruiwen Zhou, Wenyue Hua, Liangming Pan, Sitao Cheng, Xiaobao Wu, En Yu, William Yang Wang
- Venue/Year: ACL 2025 (Volume 1, Long Papers)
- URL: Not provided in manuscript (claims GitHub release only)

## Core Intent
- Research question (1 sentence): Can current long-context LLMs faithfully follow complex, naturally expressed rules from real airline, NBA, and tax policies, and how can we measure their rule selection and execution?
- Main claim (1 sentence): The authors introduce RULE ARENA, a 95-rule benchmark over three domains that exposes persistent LLM failures in recalling, selecting, and executing real-world rules even with CoT prompting.
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction plus empirical evaluation (dataset stats, automatic scoring, error analyses).
- Key assumptions required for claim to hold: (1) Scripted ground truths and annotator-derived NBA answers accurately instantiate the underlying policies (Sec. 3.2, App. B); (2) GPT-4o parsing of model responses into rule-usage matrices is sufficiently reliable for metrics (Sec. 3.4, App. C); (3) Selected domains/rules are representative of real-world rule-guided reasoning; (4) CoT prompting and oracle math/logic tools are reasonable testbeds for state-of-the-art LLMs.

## Reading Focus
- What to pay attention to first: Benchmark design choices (Sec. 3), evaluation metrics (Sec. 3.4), and main quantitative results in Table 3 plus rule-wise breakdowns (Fig. 2, Table 4–7).
- What can be ignored in first pass: Extended reference list and appendix implementation details beyond the structured parsing description unless replicating dataset generation.
