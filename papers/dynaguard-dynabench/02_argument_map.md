# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: Open-weight DynaGuard guardians enforce arbitrary textual policies more accurately than prior static or API-based guard models.
- Method element tied to claim: Train Qwen3 instruction models with supervised fine-tuning plus GRPO on a 50/50 mixture of the new DynaBench dataset and existing safety corpora, with optional chain-of-thought control tokens to elicit reasoning or fast answers (Section 3.4–3.6).
- Evidence artifact(s): Benchmark comparison across six safety suites plus DynaBench (Table 3), failure-mode breakdown (Figure 3), and manual case study showing policy-conditioned feedback (Section 4, Table 6).
- Conclusion drawn by authors: DynaGuard-8B (and even its non-CoT variant) delivers state-of-the-art F1 on average, while providing actionable explanations and runtime control over reasoning depth.

## Assumptions vs Demonstrations
- Explicitly demonstrated: Synthetic policy/dialogue generation pipeline with diversity banks (Figure 2) and summary statistics (Table 2); label agreement with human annotators (Section 3.3, Table 8); improved F1 after including reasoning traces and DynaBench data via ablations (Table 4–5); downstream benefit when coupled with another model on IFEval (Table 6).
- Assumed but not demonstrated: That synthetic policies span the diversity of real enterprise guardrails; that textual rules + F1 capture safety utility for high-stakes deployments; that explanations actually integrate smoothly into human workflows beyond the brief case study; that latency/cost claims hold on production hardware.

## Logical Gaps
- Gap 1: No live-user study or human-in-the-loop evaluation showing that explanations reliably trigger policy-compliant revisions outside synthetic IFEval prompts.
- Gap 2: External generalization from English, text-only, short (<13 turn) dialogues to multi-modal or extremely long-horizon agent behaviors is only argued qualitatively, with limited quantitative stress testing beyond the DynaBench curves in Figure 3.
