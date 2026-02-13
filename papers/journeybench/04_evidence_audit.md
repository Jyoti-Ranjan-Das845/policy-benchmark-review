# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | Dynamic-Prompt Agent (DPA) improves policy adherence over Static-Prompt Agent (SPA) across disturbance scenarios. | Table 2: DPA boosts GPT-4o UJCS from 0.511→0.857 on failing functions and 0.309→0.530 on missing parameters, with similar lifts for other models. | strong | supported | Consistent deltas across all four LLMs and three scenario types; no variance bars but margins are large. |
| C2 | DPA maintains higher UJCS across all three customer-service domains than SPA. | Table 3: GPT-4o+DPA scores 0.730/0.776/0.646 versus 0.617/0.651/0.423 for SPA in e-commerce/loan/telecom respectively. | strong | supported | Same ordering holds for the other models, indicating domain-agnostic benefits; lacks statistical significance reporting. |
| C3 | JourneyBench offers deeper conversations/tool diversity than prior benchmarks. | Table 1: JourneyBench averages 10.91 turns, 3.34 tool calls, 41 tools versus Tau Bench’s 29.33/4.48/24 and ToolSandBox’s 13.9/3.8/34. | medium | supported | Quantitative comparison provided, but assumes cited benchmarks’ statistics are correct and comparable without independent verification. |
| C4 | Structured orchestration enables smaller GPT-4o-mini + DPA to outperform GPT-4o + SPA. | Table 3: GPT-4o-mini+DPA averages 0.649 versus GPT-4o+SPA’s 0.564; reiterated in Section 4.2 text. | medium | supported | Single cross-model comparison; no cost metrics beyond qualitative “cost-efficient,” so operational benefit is inferred. |
| C5 | DPA-based orchestration already handles 6,000+ production calls daily with policy adherence. | Section 4.2 “Real-World Deployment” paragraph; no table or logs. | weak | partial | Claim is textual without telemetry, uptime, or QA data; we must trust author assertion. |
| C6 | Synthetic conversations mirror production quality according to QA rubric. | Section 4.2 “Realism Validation”: LLM-as-judge scores 82.33% Conversational Proficiency / 87.78% Goal Attainment (84.37% overall). | medium | supported | Provides concrete percentages but rubric questions and baselines are not shown; purely automated judgment. |

## Highest-Confidence Findings
- DPA materially raises UJCS across domains and scenario types (Tables 2–3), so structured control appears far superior to static prompting for policy adherence.

## Weakly Supported Areas
- Production-readiness and real-caller impact are mostly asserted (Section 4.2) without sharing call logs, latency, or compliance audits.
