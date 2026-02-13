# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: Web agents must be evaluated for safety/trustworthiness, and ST-WebAgentBench is the first benchmark that jointly measures task completion and multi-dimensional policy adherence, revealing large safety gaps in current agents.
- Method element tied to claim: Extend WebArena via BrowserGym with POLICY_CONTEXT prompts, author 222 tasks each paired with templated policies spanning six dimensions, define CuP/pCuP/Risk Ratio metrics, and run three public agents (AWM, WorkArena-Legacy, WebVoyager) once across the suite (§3–§4).
- Evidence artifact(s): Table 1 (lack of policy adherence in prior benchmarks), Table 2 (task/policy coverage), Figure 2 (CR vs CuP vs Risk ratios), Table 3 (dimension ablations), Appendix C Figure 3 (performance vs number of policies).
- Conclusion drawn by authors: Enterprise deployment needs policy-aware agents; current systems’ CuP is ≤ two-thirds of CR, so researchers should use ST-WebAgentBench to diagnose and improve safety dimensions.

## Assumptions vs Demonstrations
- Explicitly demonstrated: Construction of six policy dimensions and templates, metric definitions, and comparative results showing consent/strict-execution dominate observed violations (Table 2, Fig. 2); correlation analysis that removing any dimension increases CR–CuP alignment (Table 3); CuP degradation as more policies apply (Appendix C).
- Assumed but not demonstrated: That the selected apps/tasks/policies faithfully represent broader enterprise workflows; that single-run results for three agents generalize; that CuP accurately balances “reckless vs overcautious” behavior beyond the benchmark; that policy injection via prompts does not change agent reasoning modes.

## Logical Gaps
- Gap 1: No human or policy-hardened agent baseline is provided, so we cannot tell whether poor CuP stems from benchmark difficulty or inherent agent limitations (Sec. 4 only runs stock agents once).
- Gap 2: The claim that the six derived dimensions cover 95% of enterprise incidents (Appendix B) relies on a small panel of ten experts, yet there is no sensitivity analysis on alternative dimensions or cross-industry validation.
