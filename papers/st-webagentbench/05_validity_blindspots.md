# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - CuP/pCuP only credit completions with zero recorded violations (§3.3), so in principle they capture “policy-respecting success.” Yet violations are detected through bespoke evaluators (Tables 5–15) that rely on regexes, selectors, and action counts. Any mismatch between evaluator heuristics and the actual policy (e.g., failing to notice off-screen clicks or hallucinated text not captured in DOM logs) would mis-measure compliance. Consent policies are abundant (Table 2), so misclassification there could dominate the metric. Additionally, partial compliance is binary (either zero or some violations), so the metric may label near-miss but safe behavior as failure, conflating cautious deferrals with true policy breaches.

## Internal Validity
- Potential confounders/leakage:
  - Agents are only run once each (§4.1), so stochastic LLM sampling or transient network hiccups could change outcomes; no seeds or temperature settings are reported.
  - POLICY_CONTEXT strings appended to every observation alter the prompt distribution; without a baseline run minus policies we cannot tell whether lower CR stems from prompt overload or actual constraint following (§4.2).
  - Hosting differs (GitLab/ShoppingAdmin on AWS AMI, SuiteCRM locally), so latency or rendering differences might favor some environments; the paper does not report whether the same browser cache/state is used across agents.

## External Validity
- Generalization limits (tasks/models/policies):
  - Only three enterprise-style apps (GitLab, ShoppingAdmin, SuiteCRM) are covered (Table 2); industries such as finance, healthcare, and government workflows remain untested.
  - Policies are handcrafted templates derived from a single organization’s experts (Appendix B), so jurisdiction-specific constraints or alternative hierarchies may be missing.
  - All evaluated agents are open baselines; no frontier-model or policy-aware controller is tested, so results might not extrapolate to the systems enterprises hope to deploy.

## Robustness Coverage
- Adversarial prompts: Only a handful of jailbreaking templates inject adversarial strings into form fields (Table 13) with deterministic wording; there is no systematic exploration of obfuscated, multi-step prompt injection.
- Ambiguous/conflicting policies: Hierarchy adherence is tested via targeted contradictions (Table 11), yet conflicts always resolve through simple precedence; nuanced trade-offs or multi-party negotiations are absent.
- Long-horizon behavior: Tasks come from WebArena/WorkArena styles, but the evaluation terminates after fixed horizons; there is no explicit reporting on sequence lengths or how policies interact with 20+ step workflows.
- Tool-use constraints: BrowserGym actions dominate; external APIs or file systems are not involved, so policy compliance under tool-rich agents (e.g., calendar/email plugins) is unmeasured.

## Reproducibility
- Missing implementation/eval details:
  - Although the authors promise to release code/Docker recipes (§4.1, §F.3), the paper omits agent configuration parameters (temperature, max tokens, retry policies) and whether login states are reset between tasks.
  - Figures report only aggregate metrics; raw variance, per-task success, and evaluator logs are said to be available but not summarized, making it hard to sanity-check from the paper alone.
  - Human-in-the-loop confirmations are simulated (Table 19) yet the exact prompt template and timing are not described, leaving ambiguity around user-consent compliance checks.

## Top Blind Spots
1. Limited agent diversity—only three agents, each run once, so conclusions about “state of the art” safety generalize poorly (§4.1–4.2).
2. Policy templates mirror one organization’s risk model; sectors with different privacy/security constraints might need new dimensions, yet none are evaluated (Appendix B, Table 2).
3. Evaluator coverage is assumption-heavy; if the DOM-based checks miss hallucinated speech or visual-only cues, CuP may either over-penalize or under-report certain violation types (§3.5).
