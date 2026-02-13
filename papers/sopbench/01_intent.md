# 01 Intent Note

## Paper
- Title: SOPBench: Evaluating Language Agents at Following Standard Operating Procedures and Constraints (`paper.txt:2-27`)
- Authors: Zekun Li, Shinda Huang, Jiangtian Wang, Nathan Zhang, Antonis Antoniades, Wenyue Hua, Kaijie Zhu, Sirui Zeng, Chi Wang, William Yang Wang, Xifeng Yan (`paper.txt:2-6`)
- Venue/Year: arXiv (cs.CL), June 2025 (`paper.txt:1-3`)
- URL: https://arxiv.org/abs/2503.08669

## Core Intent
- Research question (1 sentence): Can we build an automated benchmark that measures how well tool-using language agents follow domain-specific SOPs encoded as natural-language policies and executable code? (`paper.txt:68-80`)
- Main claim (1 sentence): SOPBench delivers a scalable, multi-dimensional evaluation of SOP compliance across seven customer-service domains and shows that even top-tier models struggle to follow required verification workflows. (`paper.txt:68-80`,`paper.txt:311-351`)
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark design plus empirical evaluation of 18 LLM agents. (`paper.txt:268-351`)
- Key assumptions required for claim to hold: (a) the rule-based oracle faithfully captures each SOP and its constraints; (b) synthetic, LLM-generated cases reflect real operational variability; (c) pass rates from automated verifiers correlate with meaningful procedural compliance in deployment. (`paper.txt:231-279`,`paper.txt:773-809`)

## Reading Focus
- What to pay attention to first: SOP formalization/evaluation pipeline (Figures 1–4) and main empirical findings (Table 3, Figures 5–9) to judge whether the benchmark truly stresses SOP following. (`paper.txt:47-210`,`paper.txt:311-499`)
- What can be ignored in first pass: Appendix tables listing every tool/constraint mapping unless we need per-domain minutiae. (`paper.txt:1456-2869`)
