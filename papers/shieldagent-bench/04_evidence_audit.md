# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | SHIELDAGENT reaches the best guardrail accuracy across both agent- and environment-based attacks on SHIELDAGENT-BENCH. | Table 2 (§5.2). | strong | supported | Consistent +9–12 ACC point gains with lowest FPR (4.0–5.6%) and ARR ≥87% vs baselines; covers 7 risk categories. |
| C2 | SHIELDAGENT cuts GPT-4o API calls and inference time by ~65%/58% compared to baselines. | Table 2 cost columns. | medium | supported | Report contrasts vs Rule Traverse/GuardAgent but lacks error bars; assumes same hardware/tooling. |
| C3 | Benchmark contribution expands scope over prior datasets (more samples, risk categories, perturbations). | Table 1, Fig. 2, Table 9. | strong | supported | Provides explicit counts (3110 unsafe pairs, 7 risks, both attack types) plus curation pipeline schematic. |
| C4 | SHIELDAGENT generalizes to existing datasets (ST-WebAgentBench, VWA-Adv, AgentHarm) with higher ACC/lower FPR. | Table 3 + Fig. 3. | strong | supported | Shows +7–10 ACC gains and FPR drop relative to Direct/GuardAgent; still limited to web-style domains. |
| C5 | Online integration improves policy compliance for AWM agent across six environments. | Table 4 (§5.2). | medium | supported | Compliance gains of 7–28 points over GuardAgent; no latency variance but time costs reported qualitatively. |
| C6 | ASPM optimization reduces predicate/rule vagueness substantially. | Table 8, Fig. 4–6 (Appendix C). | medium | partial | Reduction in counts/vagueness documented, yet no ablation linking to final ACC; surrogate metric judged via GPT-4o. |

## Highest-Confidence Findings
- Performance superiority across datasets (Tables 2–3) is well evidenced with sizable margins and consistent FPR/ARR advantages.
- Benchmark scale/coverage improvements (Table 1, Table 9) are quantitatively justified with clear counts and attack diversity.

## Weakly Supported Areas
- ASPM refinement benefits (Table 8, Fig. 4–6) lack downstream ablations, so causal link to final guardrail accuracy remains uncertain.
- Claims of efficiency advantages generalizing to other tool stacks or base models rely on single hardware/configuration snapshot (Table 2) without sensitivity analysis.
