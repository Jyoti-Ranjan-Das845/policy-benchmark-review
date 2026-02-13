# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: Dual-control benchmarks like τ2-bench better capture real-world support scenarios and expose coordination deficits in state-of-the-art agents.
- Method element tied to claim: Formalize a Dec-POMDP where the simulated user wields its own tools, construct telecom troubleshooting tasks via compositional subtasks/personas, and run LLM agents under Default, No-User, and Oracle-Plan conditions (Sections 3–4).
- Evidence artifact(s): Table 1 (domain/tool breadth), Figure 3 (pass^k across domains), Figure 4 (Default vs No-User vs Oracle ablations + workflow policy), Figure 5 (performance vs action/subtask counts), Figures 6–7 (issue-type/persona breakdowns), Table 2 (user-simulator reliability).
- Conclusion drawn by authors: Because success drops by 18–25 points when shifting from No-User to Default (Figure 4) and telecom pass^1 is ≤50% for every model (Figure 3), dual control is a key bottleneck, and τ2-bench offers a controlled way to stress-test reasoning+guidance abilities.

## Assumptions vs Demonstrations
- Explicitly demonstrated: Programmatic task generator spans intents and subtasks (Section 3.2, Table 3–4); multi-model evaluations quantify impact of control mode, policy documents, user personas, and issue types (Figures 3–7); user simulator error rate is empirically measured and low in telecom (Table 2).
- Assumed but not demonstrated: That telecom workflows generalize to broader dual-control settings (no other domains built with user tools yet); that asserting DB state fully corresponds to user satisfaction; that user simulator behavior extrapolates to real humans without human-in-the-loop validation.

## Logical Gaps
- Gap 1: The pass^k drops are attributed to communication/coordination, yet no qualitative error taxonomy on agent mistakes is provided to confirm the root causes (Section 4.2 simply infers from aggregate deltas).
- Gap 2: Claims about improved user-simulator reliability hinge on 50 manually reviewed dialogs (Table 2) without inter-rater agreement statistics or stress tests showing how errors affect agent metrics, leaving uncertainty about benchmark stability under broader conditions.
