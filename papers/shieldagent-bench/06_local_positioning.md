# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| GuardAgent (Xiang et al., 2024) | Moves from text-only guard requests to action-aware verification with ASPM circuits, hybrid memory, and formal tools (Fig. 1, §3). | Better accuracy/recall and lower FPR on all benchmarks (Tables 2–3); higher system complexity and dependency on custom tooling. |
| r2-Guard (Kang & Li, 2024) | Extends knowledge-enhanced logical guardrails from static LLM I/O to interactive agent trajectories with action-specific circuits. | Adds policy extraction + benchmarking; however, lacks theoretical guarantees emphasized in r2-Guard. |
| ST-WebAgentBench / Guard benchmark papers (Levy et al., 2024; Wu et al., 2025) | Introduces SHIELDAGENT-BENCH with more risk categories, perturbation types, and paired safe/unsafe trajectories (§4, Table 1). | Better coverage (3110 unsafe samples vs ≤440); relies on custom attacks and annotations that may be harder to reproduce. |
| LlamaGuard / SafeWatch-style guardrails (Inan et al., 2023; Chen et al., 2024a) | Moves beyond single-turn content filtering to sequential action verification with formal reasoning. | Superior for agent trajectories; heavier setup (policy modeling, tool execution) makes deployment harder. |

## Novelty Judgment
- New: Benchmark (SHIELDAGENT-BENCH) with policy-targeted attacks and rule annotations; action-based probabilistic rule circuits for guardrailing.
- Incremental: Leveraging GPT-4o for policy extraction/refinement and standard tool libraries; probabilistic inference builds on prior logical guardrails.
- Repackaged: Application of known attacks (AgentPoison, AdvWeb) and MCP tooling to a guardrail context.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: Demonstrates a concrete improvement over existing guardrails with a sizable benchmark contribution and clearer enforcement pipeline, yet relies on proprietary models and lacks rigorous validation of policy extraction, keeping it short of foundational status.
