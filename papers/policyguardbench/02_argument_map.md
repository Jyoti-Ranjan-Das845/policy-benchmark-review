# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: A lightweight, policy-specific guardrail (POLICYGUARD-4B) trained on the new POLICYGUARDBENCH dataset can accurately and efficiently detect policy violations across domains, prefixes, and deployment settings.
- Method element tied to claim: Construct ~60k balanced trajectory–policy pairs across five domains with within-/cross-subdomain pairings (§3.1–3.2), then instruction-tune Qwen3-4B using a templated input format for binary violation classification (§3.3).
- Evidence artifact(s): Benchmark performance (Tab. 2), prefix truncation study (Tab. 3), leave-one-domain-out study (Tab. 4), and efficiency/EA-F1 comparison (Tab. 5).
- Conclusion drawn by authors: Purpose-built guardrails can outperform larger foundation and safety models in both accuracy and latency, proving scalable, generalizable policy-compliance detection is feasible (§4).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Dataset size/splits and domain coverage (Tab. 1); higher accuracy/F1 vs. baselines (Tab. 2); robustness under prefix truncation (Tab. 3); moderate ID→OOD degradation (Tab. 4); lower latency and better EA-F1 relative to larger models (Tab. 5).
- Assumed but not demonstrated: Synthetic policies reflect real-world compliance constraints beyond WebArena; gpt-oss-120B annotations are as reliable as human experts (§3.1); models’ behavior on static classification tasks carries over to live agent interventions; efficiency metrics on H100s translate to production hardware.

## Logical Gaps
- Gap 1: No end-to-end evaluation of web agents guarded by POLICYGUARD-4B, so it is unclear whether better offline detection materially reduces actual policy breaches.
- Gap 2: Quality of synthesized policies and automatic annotations is asserted but not validated with inter-annotator agreement or human audit statistics, leaving label noise and rule faithfulness uncertain.
