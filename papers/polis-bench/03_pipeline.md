# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Official Chinese and English policy releases from roughly the past five years plus metadata such as title, issuing body, and clauses (Section 3.2).
- Policy representation: Standardized long-form documents split into manageable fragments, each paired with three distilled tasks (question, answer, evidence span) in a question–answer–evidence schema (Figure 2).
- Agent/planner components: Prompted LLMs generate the task questions/answers, open-source policy models (backbones or POLIS-tuned) produce inferences, and QwQ-32B serves as the evaluation judge (Sections 3.2–3.3 & Appendix A).
- Tools/environment: Length-constrained segmentation, JSON validation scripts, LoRA fine-tuning setup on 2,500 training samples, unified inference hyperparameters (temperature 0.1, max tokens per model) (Section 3.2, Appendix A).
- Output/action: For each policy instance, produce scored responses for Clause Retrieval & Interpretation, Solution Generation, and Compliance Judgment tasks plus semantic similarity and judge accuracy metrics.

## Evaluation Pipeline
- Dataset/task source: 3,058 bilingual task instances distilled from 1,000 normalized policies, with 2,500 samples for training POLIS models and a 558-sample held-out test set (Section 3.2).
- Policy/constraint setup: Three scenario-grounded prompts emphasize evidence-grounded retrieval, actionable solutions tied to policy goals, and compliance boundary identification (Section 3.2).
- Baselines: Closed-source reasoning (Gemini-2.5-Pro-Preview-06-05, Claude-3.7-Sonnet-Thinking, o4-mini, o3-2025-04-16), closed-source chat (Claude-3.7-Sonnet-Latest, GPT-4.1-20250414), open-source reasoning (DeepSeek-R1, DeepSeek-R1-Distill-Llama-8B, Qwen3-8B), and open-source chat (DeepSeek-V3, Llama3.1-8B-Instruct) (Section 4.1).
- Metrics/judging: Mean cosine similarity over sentence-segment pairs plus LLMJudge accuracy where QwQ-32B issues binary Correct/Incorrect labels based on fidelity criteria (Section 3.3, Appendix A).
- Reported outcomes: Table 1/2 and Figure 3 show reasoning models outperform chat peers and compliance judgment is hardest; Figure 4 shows POLIS-Qwen3-8B and POLIS-DeepSeek-R1-Distill-Llama-8B substantially raise accuracy while Table 3 indicates GPQA-Diamond scores stay stable.

## Stage-by-Stage Analysis
1. **Data collection** – Purpose: ensure coverage of current governance practice, so they scrape recent official releases (Section 3.2). Design choice: restrict to roughly five years and 500 CN/500 EN texts to keep bilingual balance. Likely failure: newer or domain-specific policies (e.g., municipal ordinances) may be absent, limiting downstream representativeness.
2. **Quality control & normalization** – Purpose: remove malformed or duplicated entries before task distillation. Design choice: use LLM scripts plus manual sampling to validate JSON structure (Section 3.2). Likely failure: automated filters might preserve hallucinated structure while discarding edge-case clauses that matter for compliance.
3. **Task distillation & evidence annotation** – Purpose: transform raw policies into evaluable tasks tied to explicit evidence (Section 3.2). Design choice: prompt template outputs Clause Retrieval, Solution Generation, and Compliance Judgment questions sequentially with cited spans. Likely failure: the same LLMs may inject bias or fabricate unsupported “precise textual sources,” undermining construct validity.
4. **Evaluation metrics** – Purpose: capture both lexical overlap and factual correctness. Design choice: cosine similarity over segmented text plus QwQ-32B judgments with few-shot templates (Section 3.3). Likely failure: judge drift or adversarial phrasing could mislabel correct answers, and cosine similarity rewards superficial copying.
5. **Model benchmarking** – Purpose: compare closed/open, reasoning/chat families under identical inference hyperparameters (Section 4.1). Design choice: low-temperature single-pass generation and no answer sampling. Likely failure: instructions tuned for English may disadvantage Chinese outputs, confounding language comparisons in Table 2.
6. **LoRA fine-tuning & validation** – Purpose: test whether POLIS-Bench can improve lightweight open models (Section 4.3). Design choice: multi-task joint fine-tuning for Qwen3-8B and DeepSeek-R1-Distill-Llama-8B using 2,500 samples. Likely failure: overfitting to judge quirks may inflate accuracy without better real-world compliance, and evaluation lacks external human audit.
