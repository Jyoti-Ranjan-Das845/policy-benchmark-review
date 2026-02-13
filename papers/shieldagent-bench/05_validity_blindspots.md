# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - ACC/FPR treat any disagreement with benchmark labels as failure, assuming annotations perfectly reflect policy ground truth (Table 2–4). Rule recall (ARR) captures whether cited policies appear in explanations but does not verify if citations are semantically correct—LLM could parrot rule IDs. No human rating of explanation adequacy, so “policy following” is proxied by dataset labels rather than live compliance (§5.1–5.2).

## Internal Validity
- Potential confounders/leakage:
  - The same GPT-4o model family powers policy extraction, rule refinement, and baselines (Direct/Rule Traverse), so improvements could stem from better prompting rather than novel architecture (§3.2.2, §5.1).
  - Safety labels for augmented existing datasets are produced by the authors; if SHIELDAGENT informed those annotations or shares tooling, leakage may advantage the method.
  - AgentPoison/AdvWeb attacks target specific policies and may unintentionally encode patterns SHIELDAGENT saw during ASPM training, biasing evaluation.

## External Validity
- Generalization limits (tasks/models/policies):
  - Experiments cover only six web environments built atop WebArena-like pages (§4), so embodied, GUI, or API-only agents remain untested.
  - Policies come from EU AI Act and GitLab handbooks; corporate policies with different structure or languages might break the extraction pipeline.
  - Guardrail relies on tool library with moderation APIs and Stormpy; domains lacking similar tools may not benefit.

## Robustness Coverage
- Adversarial prompts: Only two strong attack families (AgentPoison, AdvWeb) are considered (§4); jailbreak-style natural language prompt attacks or user-initiated manipulations are not explicitly evaluated.
- Ambiguous/conflicting policies: VR/RP aims to make rules atomic (Appendix C), but there is no stress test involving contradictory policies or uncertain scopes—evaluation data has clear labels.
- Long-horizon behavior: Guardrail observes full trajectories yet metrics reduce to per-action safety labels; no explicit analysis of delayed effects beyond “long-term risks” category counts.
- Tool-use constraints: Tool availability is assumed; there is no ablation demonstrating performance when moderation APIs are missing or fail.

## Reproducibility
- Missing implementation/eval details:
  - Training details for ASPM (dataset size, number of epochs, learning rates for probabilistic circuits) are summarized in Algorithm 3 but numerical hyperparameters and released weights are not specified.
  - Many steps rely on GPT-4o (policy extraction, refinement, planning). Prompts are in Appendix H, yet cost, temperature, and sampling parameters are omitted.
  - Hardware/software for cost measurements (seconds/query) only qualitatively described; replicating timing claims may be difficult.

## Top Blind Spots
1. Dependence on GPT-4o quality—no evidence method works with weaker or open models, so reproducibility and access constraints remain.
2. Faithfulness of extracted policies is unverified; an incorrect LTL translation could both inflate accuracy and mask violations.
3. Limited evaluation beyond web agents leaves uncertainty about applicability to embodied, multimodal, or tool-rich workflows where observations differ substantially.
