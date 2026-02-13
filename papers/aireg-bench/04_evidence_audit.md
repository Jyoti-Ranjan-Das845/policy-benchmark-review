# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | AIReg-Bench contains 120 high-risk AI excerpts with diverse compliance statuses and plausibility validated by legal experts. | Table 1 (compliance label spread), Table 8 (plausibility Likert distribution), Krippendorff’s α discussion (`paper.txt:320-366`, `paper.txt:387-395`, `paper.txt:1684-1690`). | Medium | Supported | Quantitative distributions confirm coverage, but construct validity still rests on expert judgment with only moderate inter-rater agreement. |
| C2 | Frontier LLMs can approximate expert compliance scores with moderate agreement (κw up to 0.863, MAE <0.5). | Table 2, Figure 3 diagonal concentration (`paper.txt:404-481`, `paper.txt:1515-1527`). | Strong | Supported | Multiple metrics cohere and cover 10 models; evaluation scope is clear, though task simplified to single-turn scoring. |
| C3 | Prompt tone and access to the EU AI Act text materially affect scoring accuracy. | Table 4 ablations (`paper.txt:1531-1554`). | Medium | Supported | Removing article text drops κw from 0.775 to 0.654; tone change trades bias for accuracy—convincing but only demonstrated on GPT-4o. |
| C4 | Smaller open-source Saul legal models lag frontier models on this benchmark. | Table 5 results (`paper.txt:1555-1563`). | Medium | Supported | Quantitative comparison shows κw=0.596/0.183 vs. ≥0.624 for proprietary models, though only two models tested and formatting issues complicate conclusions. |

## Highest-Confidence Findings
- Frontier proprietary LLMs (Gemini 2.5 Pro, GPT-5, Grok 4) reach κw≥0.83 and F1≥0.86 on compliance vs. non-compliance labels, signaling meaningful alignment with legal experts on AIReg-Bench (Table 2; Table 3).
- Providing article text and calibrated tone prompts is essential—ablations show sizable drops once these guardrails are removed (Table 4). 

## Weakly Supported Areas
- Claims that synthetic documentation fully mirrors real conformity reports rely only on plausibility Likert scores without external validation (`paper.txt:248-271`, Table 8).
- Generalization to broader AIR regimes or multi-turn audits is aspirational, as no experiments extend beyond single-article, single-turn settings (`paper.txt:679-736`).
