# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - F1 on PASS/FAIL over DynaBench and safety suites (Table 3) captures whether the guardian detected a violation, but it collapses severity, recovery guidance, and latency into a single binary outcome.
  - Figure 3 shows accuracy degrading as rule/turn counts rise, suggesting the benchmark probes some compositional skills, yet it still relies on text-only transcripts with explicit rules—no hidden-state or tool constraints.

## Internal Validity
- Potential confounders/leakage:
  - Synthetic data generation and labeling both use proprietary LLMs (GPT-4.x, Gemini-2.0-Flash; Section 3.2), so stylistic fingerprints could leak into training and evaluation unless carefully scrubbed.
  - The same rule banks seed both training and evaluation personas even though individual rules are disjoint (Section 3.1), leaving open the possibility of attribute leakage that inflates F1.
  - Ablations (Table 4–5) run only on Qwen3-4B, so improvements could partly stem from extra compute or tuning rather than the claimed reasoning recipe.

## External Validity
- Generalization limits (tasks/models/policies):
  - Policies are English, textual, and at most 91 rules/13 turns in the test set (Table 2), so extrapolating to long-horizon agents, multimodal content, or regulatory documents is speculative.
  - Failure analysis (Figure 3; Table 10–11) indicates weaknesses on factual-knowledge, counting, and multi-clause policies—exactly the kinds of enterprise rules that demand precision.
  - Integration evidence covers only a single downstream setting (IFEval + Ministral-8B; Table 6), so benefits for human moderators or other agents are unknown.

## Robustness Coverage
- Adversarial prompts: Dataset includes jailbreak attempts and “multiple mode challenges” (Figure 3), but real red-team data or adaptive attackers are absent.
- Ambiguous/conflicting policies: Manual audit notes ambiguity scoring (Section 3.3), yet evaluation simply uses binary labels without measuring confidence or escalation behavior.
- Long-horizon behavior: Longest evaluated dialogue is 13 turns (Table 2) and DynaGuard accuracy drops once policies exceed ~40 rules (Figure 3), so sustained monitoring remains untested.
- Tool-use constraints: Internal tool-call snippets appear in data generation instructions (Appendix A.7) but there is no dedicated benchmark covering API/tool misuse or chain-of-action constraints.

## Reproducibility
- Missing implementation/eval details:
  - Appendices list prompts and hyperparameters (Tables 15–16), but compute budget, training duration, and checkpoint release timing are unspecified.
  - Evaluation seeds and decoding parameters are partially described (Section A.10), yet scripts and seed-wise outputs are not shared, limiting verification.
  - Downstream IFEval experiment lacks prompt templates, number of iterations, or stopping criteria for regeneration.

## Top Blind Spots
1. Real-world human evaluation of explanations or escalation workflows is missing, so usability remains speculative.
2. Potential overlap between synthetic training personas and downstream deployments (finance, healthcare) is not stress-tested for data leakage or memorization.
3. Latency, throughput, and cost measurements are omitted even though “fast inference” is central to the pitch, making operational feasibility unclear.
