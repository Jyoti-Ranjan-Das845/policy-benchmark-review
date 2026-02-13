# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | POLIS-Bench is a systematic bilingual benchmark with 3 task families built from 1,000 recent policies and annotated evidence spans. | Section 3.1–3.2 narrative + Figure 2; dataset split description (3,058 instances, 2,500/558 split). | Medium | Supported | Construction steps are described clearly, but no quantitative quality audit of the LLM-generated QA pairs is provided. |
| C2 | Reasoning models outperform chat models across languages, and compliance judgment is the hardest task. | Table 1 (overall), Table 2 (CN vs EN), Figure 3 with Appendix Tables B.4/B.5. | Strong | Supported | Multiple quantitative views agree: e.g., DeepSeek-R1 accuracy 0.77 vs DeepSeek-V3 0.53, and compliance columns consistently lag clause retrieval. |
| C3 | POLIS fine-tuning enables Qwen3-8B and DeepSeek-R1-Distill-Llama-8B to approach or surpass strong closed-source systems on benchmark tasks. | Figure 4 (task-oriented bar plots). | Medium | Partial | There are large gains over the respective backbones (e.g., Qwen accuracy 0.55→0.96), but no side-by-side comparison with GPT-4.1 or Claude under the same test split is shown. |
| C4 | Task-aligned fine-tuning does not harm general reasoning ability. | Table 3 (GPQA-Diamond accuracy). | Weak | Partial | DeepSeek improves slightly (0.28→0.30) and Qwen is unchanged, but no statistical significance or broader suite is provided, so degradation cannot be ruled out. |
| C5 | Fine-tuned models reduce hallucinations and redundant explanations in compliance and solution tasks. | Case studies in Figures 5–6. | Weak | Partial | Qualitative snippets illustrate cleaner outputs, yet the examples are cherry-picked and lack quantitative hallucination/error rates. |

## Highest-Confidence Findings
- The quantitative comparison between reasoning and chat models plus the cross-language breakdown are well-supported by Tables 1–2 and Appendix B, so the benchmark clearly differentiates system families.

## Weakly Supported Areas
- Claims about parity with closed-source systems, retained general abilities, and hallucination mitigation rely on limited evidence (one auxiliary benchmark and two qualitative cases) and should be treated cautiously.
