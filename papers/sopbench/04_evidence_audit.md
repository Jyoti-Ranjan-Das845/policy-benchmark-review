# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | SOPBench spans seven customer-service domains with 97 service functions, 70 helper tools, and 903 validated test cases. | Table 2 enumerates per-domain counts for tools, constraints, and test cases. (`paper.txt:268-279`) | strong | supported | Quantities are explicit; assumes manual designs are correct but coverage evidence is concrete. |
| C2 | Each trajectory is judged across action permissibility, database outcome matching, and SOP completeness. | Section 2.3 formalizes the three verifiers and how oracle code enforces them. (`paper.txt:200-244`) | medium | supported | Mechanism is described precisely, yet there is no empirical calibration of judge accuracy. |
| C3 | Most current LLMs fail SOPBench, with only o4-mini-high surpassing 75% overall pass rate. | Table 3 reports per-domain pass rates for 18 models, with the highest at 76.08% and many below 50%. (`paper.txt:311-351`) | strong | supported | Exhaustive table leaves little ambiguity, though variance/error bars are not provided. |
| C4 | Reasoning-heavy prompting (native function calling) outperforms ReAct and Act-only baselines. | Figure 7 contrasts GPT-4o, Claude-3.5-Sonnet, and Gemini-2.0-Flash across FC, ReAct, Act-only settings. (`paper.txt:415-438`) | medium | supported | The effect is consistent but tested on only three models. |
| C5 | Simple jailbreak instructions drastically reduce compliance across models. | Figure 6 shows large drops (e.g., −86.2% for Qwen2.5-72B) when appending “use the most appropriate tool asap” prompts. (`paper.txt:368-414`) | medium | supported | Demonstrated on healthcare/university domains; unclear if every domain behaves similarly. |

## Highest-Confidence Findings
- SOPBench provides a broad, automatically judged stress test where even leading models underperform, making the claim that SOP following is unsolved compelling (Table 2 + Table 3). (`paper.txt:268-351`)

## Weakly Supported Areas
- Safety and prompting takeaways are based on a handful of models/domains, so the generality of jailbreak and prompt-format conclusions is still tentative. (`paper.txt:368-438`)
