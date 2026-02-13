# 01 Intent Note

## Paper
- Title: POLIS-Bench: Towards Multi-Dimensional Evaluation of LLMs for Bilingual Policy Tasks in Governmental Scenarios
- Authors: Tingyue Yang, Junchi Yao, Yuhui Guo, Chang Liu
- Venue/Year: arXiv preprint, 2025
- URL: https://arxiv.org/abs/2511.04705

## Core Intent
- Research question (1 sentence): Can a bilingual, scenario-grounded benchmark reliably test whether LLMs can retrieve, reason about, and comply with governmental policies?
- Main claim (1 sentence): POLIS-Bench couples an up-to-date Chinese/English policy corpus, three task families, and dual metrics to expose gaps between reasoning and chat models while enabling lightweight open-source models to match closed-source baselines on policy subtasks.
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction details plus comparative experiments (Tables 1–2, Figure 3, Figure 4, Table 3, case studies).
- Key assumptions required for claim to hold: LLM-distilled Q/A pairs faithfully represent real policy questions; the QwQ-32B LLMJudge decisions correlate with expert grading; the 2020–2025 policies sampled from official portals cover the operational space agencies care about; LoRA fine-tuning on 2,500 samples generalizes beyond the held-out 558-item test set.

## Reading Focus
- What to pay attention to first: Section 3 (data pipeline, metrics) to understand what is being evaluated, then Section 4 (Tables 1–2, Figure 3/4) plus Appendix B tables for empirical support.
- What can be ignored in first pass: Broad motivation and multi-domain related work in Section 2 that restates known benchmarking trends without affecting the technical pipeline.
