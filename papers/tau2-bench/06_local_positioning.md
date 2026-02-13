# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| τ-bench (Yao et al., 2024) | Extends TAU interactions from single-control to dual-control and adds telecom tooling/policies via Dec-POMDP formalism (Sections 3.1–3.2). | Better: models coordination load directly; Worse: only one new domain vs two in τ-bench. |
| FlowBench (Xiao et al., 2024) | Replaces static workflow supervision with environment where user also acts, so workflows become optional guidance instead of ground truth (Figure 4 discussion). | Better: measures gap between workflow guidance and execution; Worse: FlowBench covers more task types. |
| MultiAgentBench (Zhu et al., 2025) | Focuses on asymmetric human-agent collaboration rather than symmetric agent-agent coordination; τ2-bench still evaluates a single controllable agent. | Better: isolates human-guidance aspect; Worse: lacks competitive/negotiation scenarios. |
| WebArena/Webshop (Zhou et al., 2023; Yao et al., 2022) | Moves away from open-web interaction to tool-mediated telecom troubleshooting with verifiable DB assertions (Section 3.3). | Better: deterministic scoring and controllable personas; Worse: narrower domain realism. |

## Novelty Judgment
- New: Dual-control Dec-POMDP formalization for TAU agents plus a telecom domain where user tools alter world state and allow assertion-based verification.
- Incremental: Evaluation metrics (pass^k) and agent settings mirror prior τ-bench work; broader benchmarking methodology remains similar.
- Repackaged: Personas and policy documents repurpose standard prompt-engineering practices rather than introducing new simulation techniques.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: The work adds an important testbed variation (user action space) and backs it with ablations (Figures 3–7), but scope is limited to one domain and four proprietary models, keeping it short of foundational impact.
