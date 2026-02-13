# 01 Intent Note

## Paper
- Title: GUIDE BENCH: Benchmarking Domain-Oriented Guideline Following for LLM Agents (paper.txt:3-74)
- Authors: Lingxiao Diao, Xinyue Xu, Wanxuan Sun, Cheng Yang, Zhuosheng Zhang (paper.txt:5-10)
- Venue/Year: ACL 2025 Long Papers (paper.txt:1-2)
- URL: https://github.com/Dlxxx/GuideBench (paper.txt:33-43)

## Core Intent
- Research question (1 sentence): How can we systematically evaluate whether LLM agents obey domain-oriented guidelines that may conflict with commonsense knowledge? (paper.txt:21-144)
- Main claim (1 sentence): GUIDE BENCH—covering 1,272 tasks across seven domains and three evaluation axes—reveals that current LLMs, including frontier proprietary systems, still struggle to follow complex, frequently updated domain rules, especially in math-heavy scenarios (paper.txt:118-169, 512-536, 833-867).
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction plus empirical evaluation of 18 LLMs with ablations on guidelines and reasoning strategies (paper.txt:127-169, 573-848).
- Key assumptions required for claim to hold: (i) Automatically synthesized yet expert-reviewed guidelines and contexts faithfully capture operational requirements in each domain (paper.txt:367-489); (ii) Accuracy against human-annotated references for QA or multiple-choice tasks faithfully reflects guideline adherence (paper.txt:494-572); (iii) GPT-4-based response parsing preserves each model’s intended answer (paper.txt:607-610).

## Reading Focus
- What to pay attention to first: Section 3’s data-generation/quality-control pipeline to judge coverage, then Section 5’s results, ablations, and analyses (paper.txt:367-848).
- What can be ignored in first pass: Detailed prompt templates and appendix-only case studies referenced throughout (e.g., Appendix B/E) unless implementation replication is the goal (paper.txt:384-489, 731-747).
