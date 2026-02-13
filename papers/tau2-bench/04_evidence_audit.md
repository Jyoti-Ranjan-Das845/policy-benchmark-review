# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | Dual-control (Default) materially lowers success compared with No-User and Oracle Plan modes. | Figure 4 (Default pass^1 of 0.34/0.42 vs No-User 0.52/0.67 and Oracle 0.73/0.96 for gpt-4.1/o4-mini). | Strong | Supported | Same tasks/models used across modes, isolating control schema; however, limited to telecom domain. |
| C2 | Telecom domain is harder than previously verified retail/airline domains. | Figure 3 (telecom pass^1 ranges 0.34–0.49 vs 0.50–0.79 for other domains) + Table 1 (dual-control tooling difference). | Medium | Supported | Uses identical evaluation settings but only four models; no statistical testing though trends are large. |
| C3 | Workflow-style policy improves Default/No-User performance but degrades Oracle Plan. | Figure 4 right panel (gpt-4.1 Default 0.52 vs 0.34 original; Oracle drops to 0.57; o4-mini Default 0.59 vs 0.42; Oracle 0.88 vs 0.96). | Medium | Partial | Only two models analyzed; explanation that workflows “confuse” Oracle case is hypothesized, not probed. |
| C4 | Tasks requiring more actions or subtasks have lower success rates. | Figure 5 (pass^1 trending toward zero beyond 7 actions; monotonic decline across subtask bins). | Strong | Supported | Visualization shows consistent drop for both models and both control modes; bins include task count bars clarifying coverage. |
| C5 | New telecom user simulator is more reliable than prior domain simulators. | Table 2 (telecom 16% total errors, 6% critical vs 40–47%/12–13% in retail/airline). | Medium | Supported | Manual annotations on 50 dialogs per domain show large deltas, but lacks agreement metrics and stress testing. |
| C6 | Harder issue types (mobile data, MMS) dominate failure cases relative to service_issue. | Figure 6 (e.g., gpt-4.1 pass^1: service 0.66 vs mobile 0.30 vs MMS 0.18). | Medium | Supported | Clear separation per model; still correlational because issue type also correlates with action length. |

## Highest-Confidence Findings
- C1/C4 jointly demonstrate that coordination plus long horizons drive failure: both the control-mode ablation and action-count stratification show consistent, large-magnitude effects using the same telecom tasks.

## Weakly Supported Areas
- C3 and C5 rely on narrow experiments (two models, 50 dialogs) without statistical rigor; they hint at useful design levers but would benefit from sensitivity analyses or inter-rater agreement reporting.
