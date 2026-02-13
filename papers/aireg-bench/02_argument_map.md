# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: AIReg-Bench enables rigorous benchmarking of LLMs’ ability to judge EU AI Act compliance for high-risk AI systems, showing current models already align moderately with expert assessments. 
- Method element tied to claim: Multi-stage gpt-4.1-mini pipeline generates 120 single-article technical documentation excerpts across eight use cases and five AIA articles, followed by triple legal-expert annotation with Likert compliance and plausibility scores (Figure 2; Tables 1 & 8). 
- Evidence artifact(s): Compliance/plausibility label distributions and Krippendorff’s alpha (Table 1; Table 8; `paper.txt:320-366`), LLM vs. human agreement metrics and ablations (Tables 2–5; Figure 3–4; `paper.txt:367-481`, `paper.txt:1515-1560`). 
- Conclusion drawn by authors: Gemini 2.5 Pro and GPT-5 reach κw ≥0.84 with median experts and within-one-point errors on 98% of excerpts, while smaller or misprompted models lag, highlighting both viability and remaining gaps for automated AIR compliance assessments (`paper.txt:404-481`, `paper.txt:1515-1554`). 

## Assumptions vs Demonstrations
- Explicitly demonstrated: Pipeline controllability over use cases/articles (Figure 2), balanced compliance label spread (Table 1), plausibility median score=4 (Table 8), moderate inter-rater reliability (α=0.651), quantitative agreement metrics for 10 frontier LLMs plus Saul baselines and prompt ablations (Tables 2–5, 7). 
- Assumed but not demonstrated: Synthetic documentation plus Likert scores faithfully capture regulatory judgments regulators would issue; restricting context to one article mirrors real conformity assessments; Gemini/GPT performance would translate to real documents or multi-turn audits; expert annotations, despite bias, are sufficient gold standards. 

## Logical Gaps
- Gap 1: No validation against real-world AIA conformity reports, so construct validity of synthetic excerpts is argued via plausibility labels but not benchmarked against authentic filings. 
- Gap 2: Evaluation only checks single-turn scoring without deployment constraints (tool use, external research), yet the authors generalize findings to broader AIR compliance tooling without evidence on those workflows.
