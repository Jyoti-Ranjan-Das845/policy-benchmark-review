# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - Leakage is operationalized as literal mention of value v judged by GPT-5-mini (Section 3.4), so nuanced leaks (e.g., inferred ratios without the exact token) might evade detection; however, human validation (Section 3.5) shows 93% agreement, providing partial support.

## Internal Validity
- Potential confounders/leakage:
  - Dataset relies on GPT-5.2 both to propose policies and to extract ground-truth values (Section 3.2.2), so shared model biases could inflate leakage or DVA gains.
  - OCR paradox evidence might instead reflect longer prompts or different context ordering introduced by OCR extraction, not just “clarity.”
  - DVA uses the same model for decomposition and verification, so improvements could stem from extra reasoning time rather than the architectural split.

## External Validity
- Generalization limits (tasks/models/policies):
  - Policies are all “Do not disclose {target}” noun phrases tied to corporate/industry PDFs; behavior under multi-clause, conditional, or contradictory policies is unknown.
  - Only six high-resource LVLMs are tested; we lack evidence for smaller open-source models or fully offline deployments.
  - Documents are clipped around evidence (Section 3.2.2), so long-horizon navigation or conversational settings remain out of scope.

## Robustness Coverage
- Adversarial prompts: Implicit queries deliberately require reasoning (Section 3.2.3), but there is no exploration of adversarial paraphrases beyond two per target.
- Ambiguous/conflicting policies: Not evaluated; every instance contains a single prohibition.
- Long-horizon behavior: Absent because clips cover narrow page windows, avoiding multi-turn interactions.
- Tool-use constraints: Experiments do not test retrieval, calculator, or scripting tools; LVLMs operate in vanilla chat mode.

## Reproducibility
- Missing implementation/eval details:
  - Paper cites GitHub but does not report whether OCR outputs, clipped PDFs, or judge prompts will ship; replicating the 93% human agreement process requires unshared annotation guidelines.
  - No random seeds or cost details for DVA (two-stage prompting) are specified, making it hard to reproduce leakage percentages exactly.

## Top Blind Spots
1. Reliance on GPT-5.2 for both data creation and as one of the evaluated models risks circularity that could mask other systems’ behavior.
2. LLM-as-a-judge leakage detection cannot guarantee that subtle paraphrased or computed leaks are caught, especially when policies forbid qualitative descriptions rather than discrete values.
3. Policies are static single targets; real deployments often juggle overlapping, time-sensitive, or user-personalized rules that this benchmark does not capture.
