# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - Semantic similarity rewards lexical overlap with references (Section 3.3), so a model can copy clauses without demonstrating situational judgment.
  - Accuracy hinges on QwQ-32B’s binary verdict (Appendix A), but no correlation with human compliance experts is reported, so “Correct” may reflect judge biases rather than policy fidelity.

## Internal Validity
- Potential confounders/leakage:
  - The same LLM family that will later be evaluated could have influenced question wording during distillation, biasing the test toward those models’ style (Section 3.2).
  - Only manual “sampling inspection” is described for quality control, so mislabeled evidence spans or hallucinated clauses could inflate accuracy of models that mimic the distillation model.
  - LoRA fine-tuning results are compared only to backbone baselines, so improvements might stem from exposure to judge-specific artifacts rather than genuine policy reasoning ability.

## External Validity
- Generalization limits (tasks/models/policies):
  - Corpus covers roughly five years of national-level policies in Chinese/English; municipal rules, multi-party negotiations, or multilingual (e.g., Spanish, French) settings are untested (Section 3.2).
  - Tasks are single-turn text generations; no interactive deliberation, citizen feedback incorporation, or multimodal policy artifacts are considered.
  - Only LoRA-tunable 8B-class open-source models are adapted; impacts on larger or smaller deployments remain unknown.

## Robustness Coverage
- Adversarial prompts: Not evaluated—inputs are curated, policy-aligned questions rather than stress tests.
- Ambiguous/conflicting policies: No scenarios with contradictory clauses or trade-offs beyond compliance boundary recognition are included.
- Long-horizon behavior: Benchmark is single-shot; it does not assess multi-step planning or monitoring of policy outcomes.
- Tool-use constraints: Tasks assume pure text modeling with no retrieval plugins or database grounding, leaving tool-integrated workflows untested.

## Reproducibility
- Missing implementation/eval details:
  - Distillation prompts and judge few-shot exemplars are only summarized, not released, making reproduction of the exact dataset and scoring pipeline difficult (Sections 3.2–3.3).
  - Training hyperparameters for LoRA (learning rate, rank, epochs) are omitted, so reproducing POLIS-Qwen or POLIS-DeepSeek requires guesswork.

## Top Blind Spots
1. Dependence on a single automatic judge without human calibration could mischaracterize compliance accuracy.
2. LLM-generated data and limited manual review risk enshrining hallucinated or overly templated questions that do not reflect real policy workflows.
3. Claims about closed-source parity and general capability retention lack rigorous comparative baselines, so deployment decisions based solely on these numbers may be premature.
