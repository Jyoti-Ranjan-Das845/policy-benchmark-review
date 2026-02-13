# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - The benchmark equates “policy following” with binary agreement between a textual rule and a scripted trajectory, so metrics capture consistency with synthesized rules rather than with the actual user or institutional policies (§3.1–3.2). There is no check that the rule set is exhaustive or that violations map to safety consequences, so high accuracy might still miss nuanced compliance failures.

## Internal Validity
- Potential confounders/leakage:
  - Policies are generated from the same trajectories that models later evaluate, so stylistic artifacts from the ScribeAgent logs could leak into both inputs and targets.
  - Labels are produced by gpt-oss-120B imitating human annotators with selective review (§3.1); without agreement statistics, systematic biases (e.g., over-flagging certain verbs) could drive the reported accuracy differences.

## External Validity
- Generalization limits (tasks/models/policies):
  - All trajectories come from WebArena domains (Reddit, Map, GitLab, Shopping, Shopping-Admin), so there is no evidence of transfer to other verticals (finance, healthcare), real browsers, or multimodal agent settings.
  - Policies are English-only, short textual statements; multilingual or formal policy specifications remain untested.
  - Only classification is evaluated; deployment in an interactive guardrail loop (interrupting or suggesting fixes) is not measured.

## Robustness Coverage
- Adversarial prompts: Not covered—inputs are fixed logs rather than adversarially crafted policy challenges.
- Ambiguous/conflicting policies: The synthesis process enforces atomic rules (§3.1), so overlapping or contradictory policies are largely absent, leaving gaps for real compliance regimes that include trade-offs.
- Long-horizon behavior: Trajectories average 9.3 steps (§3.2); the benchmark does not stress very long sequences where state tracking becomes harder.
- Tool-use constraints: The dataset sticks to browser actions; no tests of API/tool usage restrictions or system-level commands common in other agent settings.

## Reproducibility
- Missing implementation/eval details:
  - Policy-synthesis prompts, LLM scoring heuristics, and annotation instructions are summarized but not released, making it hard to reproduce the exact dataset (§3.1).
  - Efficiency measurements rely on unspecified batching and hardware configuration beyond “H100 80GB” (§4.1), which could shift absolute latency.

## Top Blind Spots
1. Faithfulness of GPT-generated policies to real organizational rules is unverified, so downstream deployment risk is unknown.
2. Automated annotation quality lacks quantitative auditing, leaving potential label noise unmeasured.
3. Guardrail behavior in live agent loops (false positives/negatives during task execution) is not studied; only offline classification metrics are reported.
