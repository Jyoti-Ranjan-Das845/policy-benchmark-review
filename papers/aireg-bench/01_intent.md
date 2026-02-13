# 01 Intent Note

## Paper
- Title: AIReg-Bench: Benchmarking Language Models That Assess AI Regulation Compliance
- Authors: Bill Marino, Rosco Hunter, Christoph Schnabl, Zubair Jamali Marinos, Emmanouil Kalpakos, Mudra Kashyap, Isaiah Hinton, Alexa Hanson, Maahum Nazir, Felix Steffek, Hongkai Wen, Nicholas D. Lane
- Venue/Year: Preprint (arXiv), February 2026
- URL: https://arxiv.org/abs/2510.01474

## Core Intent
- Research question (1 sentence): Can a purpose-built benchmark reveal how well current LLMs assess compliance of high-risk AI systems with the core articles of the EU AI Act?
- Main claim (1 sentence): The authors provide AIReg-Bench, an LLM-generated and expert-annotated dataset plus evaluation suite that exposes both the promise and current limits of frontier LLMs at AIA compliance judgments, with several models achieving moderate agreement with legal experts. 
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark and empirical evaluation (dataset construction details, plausibility checks, LLM-vs-human agreement metrics). 
- Key assumptions required for claim to hold: Synthetic technical documentation produced via the gpt-4.1-mini pipeline is representative of real compliance artifacts; Likert scores from three legal experts per excerpt approximate ground-truth judgments despite moderate Krippendorff’s alpha; median expert labels are an appropriate target for LLM agreement comparisons; restricting context to a single article per document captures the compliance task regulators would care about. 

## Reading Focus
- What to pay attention to first: Section 2–3 describing the pipeline and annotation process (Figure 2, Tables 1 & 8), then Section 4/Tables 2–5 for model evaluation results and ablations; Appendix F instructions help interpret prompt sensitivity. 
- What can be ignored in first pass: Long literature review in Section 5 and detailed prompt text in Appendix D unless replicating the generation pipeline.
