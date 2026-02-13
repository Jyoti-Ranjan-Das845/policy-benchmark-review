# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | GUIDE BENCH contains 1,272 tasks across seven operational domains. | Section 3.1 + Figure 3 statistics (paper.txt:118-166, 349-366). | Strong | Supported | Authors provide explicit totals and per-domain counts with no contradictory data. |
| C2 | Removing explicit guidelines causes notable accuracy drops for GPT-4o. | Table 1 comparison between GPT-4o and GPT-4o* (paper.txt:512-536). | Medium | Supported | Price matching, math, agent chat, and summarization accuracies fall by 5–21 points, though only one model is ablated. |
| C3 | Math guideline following remains unsolved; only Deepseek-R1 surpasses 60% accuracy. | Table 1 math column + introductory summary (paper.txt:512-520, 136-142). | Strong | Supported | All other models remain under 48% in math, matching the textual claim. |
| C4 | Chain-of-thought reasoning boosts math but barely affects summarization. | Table 2 CoT ablation (paper.txt:700-739). | Medium | Supported | Math accuracy jumps from 42.31% to 65.38% with CoT, while summarization stays at 89.66%; sample limited to one model. |
| C5 | Manually converting rules into equivalent math expressions outperforms PoT and other strategies. | Table 3 reasoning strategies (paper.txt:792-813). | Medium | Supported | “Equivalent Math” accuracy rises to 86.54%, whereas PoT drops to 30.27%, but only Deepseek-R1 is tested. |

## Highest-Confidence Findings
- Dataset composition and scale are clearly specified, supporting benchmark coverage claims (paper.txt:118-366).
- Benchmark results consistently highlight math as the weakest domain, reinforcing the need for improved numerical guideline reasoning (paper.txt:512-536, 136-142).

## Weakly Supported Areas
- Assertions that closed-source models are “not suitable for operational tasks” rest on qualitative access concerns rather than deployment trials (paper.txt:833-839).
- Claims that guideline edits perfectly mirror real-world updates lack empirical validation from practitioners (paper.txt:428-453).
