# 01 Intent Note

## Paper
- Title: Beyond IVR: Benchmarking Customer Support LLM Agents for Business-Adherence
- Authors: Sumanth Balaji, Piyush Mishra, Aashraya Sachdeva, Suraj Agrawal
- Venue/Year: arXiv preprint, 2026 (v1 posted Jan 2, 2026)
- URL: https://arxiv.org/abs/2601.00596

## Core Intent
- Research question (1 sentence): How can we systematically evaluate whether customer-support LLM agents follow business Standard Operating Procedures (SOPs) rather than merely achieving end goals?
- Main claim (1 sentence): The JourneyBench benchmark plus a Dynamic-Prompt Agent (DPA) orchestrator yields significantly higher policy adherence than static-prompt baselines across models and disturbance scenarios.
- Evidence type expected (experiments/theory/benchmark/etc.): Synthetic benchmark construction details plus comparative experiments (Tables 1–3) using User Journey Coverage Score (Section 3).
- Key assumptions required for claim to hold: SOP DAGs faithfully encode required business policies; GPT‑4o user simulations and pre-generated tool responses approximate real conversations (Section 2.2); UJCS (Eq. 1–2) captures adherence quality; structured prompting is the primary differentiator among agents evaluated.

## Reading Focus
- What to pay attention to first: Benchmark construction pipeline (Figure 3, Section 2), UJCS definition (Section 3), DPA vs SPA setup (Section 4.1), and comparative results (Tables 2–3).
- What can be ignored in first pass: Extended appendices with prompt templates, example seeds, and exhaustive reviewer lists unless needing reproduction specifics.
