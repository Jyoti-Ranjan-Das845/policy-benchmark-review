# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: LVLMs systematically leak confidential values when answering multimodal document questions under user-defined policies, but a structured Decompose–Verify–Aggregation (DVA) prompting scheme can curb this leakage.
- Method element tied to claim: Construction of the Doc-PP benchmark (Section 3, Figure 2, Tables 1–2) plus experimental comparison of baseline prompts vs. DVA on six LVLMs (Section 4, Tables 3–5, Figure 4).
- Evidence artifact(s): Leakage/faithfulness metrics split by policy type and modality (Table 3), evidence-type breakdown revealing reasoning-induced safety gap (Table 4, Figure 3), mitigation comparison highlighting DVA gains (Figure 4, Table 5).
- Conclusion drawn by authors: Reasoning-heavy document QA causes a policy-preservation failure even in advanced LVLMs, and DVA offers a significantly stronger baseline for policy-compliant document understanding.

## Assumptions vs Demonstrations
- Explicitly demonstrated: How Doc-PP is generated from 90 PDFs with filtered targets/queries (Section 3.2); leakage spikes under implicit queries and OCR inputs (Table 3); multi-source evidence makes leakage worse (Table 4, Figure 3); DVA cuts Gemini-3-Flash leakage from 64.6% to 30.5% (Table 5).
- Assumed but not demonstrated: Synthetic policies and GPT-5.2-generated targets mirror real confidentiality rules; LLM-as-a-judge scoring with GPT-5-mini (Section 3.4–3.5) is reliable outside the sampled 100-instance validation; DVA’s manual decomposition prompt scales and generalizes to unseen policy templates or real deployments.

## Logical Gaps
- Gap 1: No statistical testing or confidence intervals accompany leakage differences (e.g., Table 3), so it is unclear whether improvements hold across documents or simply reflect sample variance.
- Gap 2: The paper asserts DVA is “structural” yet only evaluates prompt-level changes; there is no ablation isolating decomposition vs. verification components or testing automated tool support, leaving causal attribution uncertain.
