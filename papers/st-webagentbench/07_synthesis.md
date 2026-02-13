# 07 Synthesis Note

## What This Paper Establishes
- Adds a concrete benchmark (ST-WebAgentBench) that overlays WebArena/WorkArena tasks with six policy dimensions, reusable templates, and POLICY_CONTEXT prompts so agents can be scored on task success and policy compliance (Table 2, §3.1–§3.5).
- Defines Completion-under-Policy, Partial CuP, and Risk Ratio metrics that penalize both reckless and non-compliant completions (§3.3).
- Demonstrates that three public agents experience large CuP drops relative to CR, with user-consent and strict-execution policies accounting for most observed violations (Fig. 2, §4.2).
- Shows via ablations that removing any dimension increases CR–CuP correlation and that higher policy loads sharply reduce compliance (Table 3, Appendix C), highlighting where research should focus.

## What Remains Uncertain
- Whether the six derived dimensions generalize beyond the IBM-style workflows used for elicitation (Appendix B); other industries may prioritize additional safeguards.
- How robust CuP is under different agent implementations, hyperparameters, or repeated runs—single trials leave stochasticity unexplored (§4.1).
- The fidelity of evaluator templates when UI layouts change or when violations manifest outside DOM/text logs (e.g., visual-only cues), which could cause false negatives (§3.5).

## What to Trust
- Task/policy coverage figures and the concrete setup (apps, templates, evaluators) are carefully enumerated, so reviewers can replicate or extend the benchmark straightforwardly (Table 2, Tables 5–15).
- Observed CuP vs CR gaps and per-dimension risk profiles are backed by logged trajectories and clearly presented metrics (Fig. 2), making the qualitative insight—agents ignore consent/strict rules—credible.

## What Not to Trust Yet
- Claims that the six dimensions cover 95% of enterprise incidents rely on a small expert panel with no inter-rater statistics, so broad coverage is unproven (Appendix B).
- The implication that meeting CuP thresholds ensures real-world safety is unverified; policies are handcrafted and may not capture regulatory nuance or dynamic adversaries.

## Carry-Forward Notes for Cross-Paper Synthesis
- Treat ST-WebAgentBench as an evaluation harness for future policy-aware controllers; results should be compared on CuP/Risk rather than CR alone.
- When synthesizing across papers, map each approach’s safeguards onto the six dimensions here to identify coverage gaps (e.g., if another work handles robustness but not consent).
- Consider augmenting this benchmark with additional applications or policy templates from other sectors to stress-test construct validity before drawing general deployment conclusions.
