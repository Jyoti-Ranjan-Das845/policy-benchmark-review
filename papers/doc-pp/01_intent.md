# 01 Intent Note

## Paper
- Title: Doc-PP: Document Policy Preservation Benchmark for Large Vision-Language Models
- Authors: Haeun Jang, Hwan Chang, Hwanhee Lee
- Venue/Year: arXiv preprint, 2026 (arXiv:2601.03926v1)
- URL: https://arxiv.org/abs/2601.03926

## Core Intent
- Research question (1 sentence): Can LVLMs obey dynamic, user-defined non-disclosure policies when answering multimodal document QA queries, and how can we benchmark and mitigate policy violations?
- Main claim (1 sentence): The Doc-PP benchmark exposes a reasoning-induced safety gap and OCR paradox in LVLMs, and the proposed Decompose–Verify–Aggregation (DVA) prompting framework substantially reduces policy leakage relative to common defenses.
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction details plus empirical evaluation across six LVLMs with quantitative leakage/faithfulness metrics (Tables 1–5, Figures 1–4).
- Key assumptions required for claim to hold: Automatically generated targets/queries faithfully reflect confidential policies; GPT-5.2/Mistral OCR outputs used in data construction are accurate; checklist-based LLM-as-a-judge scoring (Section 3.4–3.5) aligns with human policy-compliance judgments; synthetic policies approximate real enterprise constraints.

## Reading Focus
- What to pay attention to first: Section 3 dataset pipeline and statistics, Section 4 experiments (Tables 3–5, Figure 4) detailing leakage rates and DVA improvements, plus identified failure modes (Reasoning-Induced Safety Gap, OCR Paradox).
- What can be ignored in first pass: Appendix prompt templates (Figures 5–15) and exhaustive references unless implementing the benchmark or prompts verbatim.
