# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | POLICYGUARDBENCH offers ~60k balanced trajectory–policy pairs with substantial cross-subdomain coverage across five domains. | Tab. 1 (§3.2) | Strong | Supported | Table lists 59,997 curated pairs with 42.4% violations and 41.6% cross-subdomain target pairs, matching the textual description. |
| C2 | POLICYGUARD-4B attains >90% accuracy and 87.6% F1 with the lowest latency among strong baselines. | Tab. 2 (§4.2) | Strong | Supported | Table shows 0.9014 accuracy / 0.8759 F1 at 22.5 ms, outperforming foundation/guardrail models while being orders faster than frontier APIs. |
| C3 | Prefix-based detection accuracy remains competitive (avg. 85.3%) for POLICYGUARD-4B despite partial trajectories. | Tab. 3 (§4.3) | Medium | Supported | Authors report accuracy per prefix length; no variance/confidence intervals are provided, but numbers directly support the mean. |
| C4 | POLICYGUARD-4B generalizes to unseen domains with only ~2–3% absolute performance drop. | Tab. 4 (§4.4) | Medium | Supported | Leave-one-domain-out results show avg. 93.3% ID vs. 90.8% OOD F1. Lack of statistical testing prevents “strong” rating. |
| C5 | POLICYGUARD-4B delivers the best efficiency-adjusted F1 (EA-F1) and low FLOPs relative to accuracy-matched models. | Tab. 5 (§4.5) | Medium | Supported | EA-F1 definition plus table values (38.9 vs. ≤17.1 elsewhere) substantiate the claim, though FLOPs for frontier APIs are “–”, limiting completeness. |

## Highest-Confidence Findings
- Purpose-built guardrails can surpass much larger LLMs on policy-violation classification while running in tens of milliseconds (Tab. 2).
- Dataset construction achieves balanced labels and domain coverage, enabling systematic benchmarking rather than skewed domain distributions (Tab. 1).

## Weakly Supported Areas
- Real-world policy fidelity and annotation quality are asserted but lack quantitative audits, so downstream compliance impact remains uncertain (§3.1).
