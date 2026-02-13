# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: Current LLM agents need a benchmark that tests real-time tool use, policy following, and user interaction, and τ-bench exposes their unreliability even with advanced models (§1 sets up the motivation; §5 provides empirical validation).
- Method element tied to claim: τ-bench formulates each episode as an LM-user/agent interaction over deterministic APIs, with domain policies injected as system prompts, a rule-based reward checking database diffs plus response substrings, and the new pass^k metric to quantify consistency across stochastic user variants (§3, Figure 2, Equation in §3).
- Evidence artifact(s): Table 1 and Table 4 establish the concrete domains/tools; Table 2 plus Figure 3 benchmark 12 models and FC/ReAct/Act prompting; Figure 4 reports pass^k degradation; Table 3 and Figures 5–6 support the reliability/interpretability narrative via policy ablations and failure taxonomies.
- Conclusion drawn by authors: τ-bench is challenging—best pass^1 reaches only 61.2% (retail) / 35.2% (airline) and pass^8 < 25%—so new approaches must improve policy adherence and consistency before deployment (§5.1–§5.2, §6).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Benchmark components are instantiated in two domains with 165 tasks, 14 APIs, and public assets (Table 1, Table 4, Figure 2); all 12 models are evaluated under the same temperatures, action limits, and FC/ReAct scaffolds with multi-trial averaging (§5.1–§5.2).
- Assumed but not demonstrated: LM-based user simulation faithfully covers real user diversity or adversarial intent (§3); rule-based reward fully captures policy compliance even though it ignores whether the agent asked for confirmations (reward discussion below Figure 2); transfer of pass^k trends to other domains is argued qualitatively in §6 but not tested.

## Logical Gaps
- Gap 1: No human evaluation verifies that LM-simulated users or the routput string checks align with real customer satisfaction, so the claim “agents are unreliable” rests on proxy metrics (Section 3 acknowledges the reward is necessary but not sufficient).
- Gap 2: Failure taxonomy (Figure 5) inspects only 36 gpt-4o τ-retail failures, so extrapolating to τ-airline or weaker agents lacks empirical backing (§5.2).
- Gap 3: Cost and reproducibility claims rely on OpenAI/GPT-4 pricing and API availability (§5.1); if pricing or models shift, the comparative statements might change, but no sensitivity analysis is provided.
