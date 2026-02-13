# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: A unified bilingual benchmark plus lightweight fine-tuning pipeline can more faithfully evaluate and improve LLMs on government policy tasks than existing coarse-grained suites.
- Method element tied to claim: Section 3 describes collecting 500 CN + 500 EN policies from the last five years, distilling each into Clause Retrieval & Interpretation, Solution Generation, and Compliance Judgment samples with evidence spans, and evaluating models with cosine similarity plus an LLMJudge accuracy metric using QwQ-32B; Section 4.3 applies multi-task LoRA fine-tuning to Qwen3-8B and DeepSeek-R1-Distill-Llama-8B.
- Evidence artifact(s): Table 1 (overall results), Table 2 (cross-language), Figure 3 with Appendix Tables B.4/B.5 (task stability and compliance difficulty), Figure 4 (POLIS-tuned vs backbone performance), Table 3 (GPQA transfer), Figures 5–6 (case studies).
- Conclusion drawn by authors: Reasoning models dominate chat models across tasks/languages, compliance judgment remains hardest, and POLIS-tuned open models close the gap with closed-source systems without eroding general reasoning performance.

## Assumptions vs Demonstrations
- Explicitly demonstrated: Dual-metric evaluation pipeline is implementable and discriminative (Section 3.3 + Tables 1–2); LoRA fine-tuning on 2,500 samples boosts accuracy dramatically on all three tasks (Figure 4); GPQA-Diamond accuracy does not collapse post-fine-tuning (Table 3); qualitative outputs remove hallucinated clauses (Figures 5–6).
- Assumed but not demonstrated: LLM-generated questions accurately reflect real analyst workflows; QwQ-32B grading matches expert determinations; continual corpus updates and contamination checks actually occur; production agencies can apply the fine-tuned models safely.

## Logical Gaps
- Gap 1: Reliability of the automatic judge is taken for granted—no inter-annotator check or human audit of LLMJudge (Section 3.3, Appendix A), so claimed “accuracy” might track QwQ bias rather than compliance.
- Gap 2: Fine-tuned models are said to “match or exceed” closed-source baselines, yet evidence compares only to their own backbones (Figure 4) instead of rerunning GPT-4.1 or Claude on the same held-out test after tuning, leaving the parity claim unverified.
