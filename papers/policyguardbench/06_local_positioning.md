# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| AGRAIL (Luo et al., 2025) | Moves from adaptive safety-risk detection on OS agents to explicit policy-rule compliance in browser trajectories via a curated benchmark. | Better on policy coverage breadth (five domains, cross-subdomains); worse because it lacks AGRAIL’s continual adaptation loop. |
| SHIELDAGENT (Chen et al., 2025b) | Replaces formal probabilistic verification with data-driven binary classification to cover diverse natural-language policy types quickly. | Better scalability/efficiency (4B transformer) but worse on formal guarantees of satisfaction that SHIELDAGENT offered. |
| SafeArena (Tur et al., 2025) | Shifts focus from catastrophic safety outcomes to fine-grained compliance violations using synthesized policies and trajectory prefixes. | Better granularity and prefix task; worse environmental breadth since SafeArena spans more agent modalities. |

## Novelty Judgment
- New: POLICYGUARDBENCH’s cross-subdomain pairing and prefix-based detection task create a previously unavailable evaluation axis for agent guardrails (§3.1–3.2).
- Incremental: POLICYGUARD-4B itself is a standard instruction-tuned Qwen3-4B; novelty lies in dataset framing more than modeling (§3.3).
- Repackaged: The efficiency comparison and EA-F1 metric (Tab. 5) reinterpret latency/F1 trade-offs but reuse conventional benchmarking inputs.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: Provides a sizable dataset plus consistent improvements over frontier and safety guardrails (Tab. 2–5), yet evidence stays in offline synthetic-policy classification without demonstrating live-agent impact.
