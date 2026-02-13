# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| τ-Bench / Tau2-Bench (Yao et al., 2024; Barres et al., 2025) | Moves from generic tool-use evaluation to SOP-constrained journeys with deterministic branching and UJCS metric. | Better: directly measures policy adherence; Worse: covers fewer domains/models and omits dual-control setups Tau2 explores. |
| ToolSandBox (Lu et al., 2025) | Treats tools as black boxes with fixed traces instead of implementing environment state, focusing on workflow order rather than state tracking. | Better: easier to scale SOP variants; Worse: less emphasis on rich stateful APIs and longer contexts. |
| AppWorld (Trivedi et al., 2024) | Focuses on customer-support procedural compliance instead of interactive coding apps; introduces manual+LLM SOP generation. | Better: domain-relevant policies; Worse: lacks multi-agent people/app interactions AppWorld enables. |
| BFCLV3 (Yan et al., 2024) | Evaluates live agent conversations rather than static transcripts, adding perturbation scenarios; introduces DPA vs SPA comparison. | Better: dynamic tool-calling agents and robustness tests; Worse: smaller tool catalog and no public leaderboard like BFCL. |

## Novelty Judgment
- New: User Journey Coverage Score tightly coupled with SOP DAGs plus empirical evidence that prompt orchestration (DPA) changes compliance outcomes (Sections 3–4).
- Incremental: Another synthetic benchmark built via LLM generation and manual vetting, similar to Tau2 and ToolSandBox pipelines (Section 2.2).
- Repackaged: Production-deployment anecdotes reuse existing contact-center orchestration narratives without releasing assets.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: Provides a clear benchmarking recipe with quantitative gains for structured orchestration (Tables 2–3) but relies on synthetic data, limited baselines, and textual production claims, so it refines rather than revolutionizes policy-adherent agent evaluation.
