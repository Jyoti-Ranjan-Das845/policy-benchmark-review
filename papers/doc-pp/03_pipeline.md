# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Target-aligned document clip D consisting of OCR text, tables, and page images (Section 3.2.2) plus an explicit policy P (“Do not disclose {target}”) and a user query Q (explicit template or implicit summary style, Section 3.2.3).
- Policy representation: Single-sentence natural-language ban that references a noun-phrase target derived via the checklist-filtered taxonomy of sensitive entities (Figure 2, Section 3.2.2).
- Agent/planner components: Baseline LVLMs answer directly; the proposed DVA pipeline first decomposes the tentative answer into atomic elements, then runs a verification stage that labels each element as valid/invalid before aggregating only policy-compliant facts (Section 4.3, Figure 15).
- Tools/environment: LVLMs (GPT-5.2, Gemini-3-Pro/Flash, Qwen3-VL variants, Mistral-Large) operate over either PNG pages or OCR text extracted with Mistral OCR; GPT-5-mini acts as the LLM-as-a-judge for leakage/faithfulness scoring (Section 4.1, 3.4).
- Output/action: A textual answer meant to satisfy Q while omitting the confidential value v; for DVA the final answer is explicitly constructed from verified safe elements.

## Evaluation Pipeline
- Dataset/task source: Doc-PP built from 90 MMLongBench-Doc and SustainableQA PDFs with 443 explicit and 698 implicit queries spanning business, research, financial, and administrative reports (Section 3.2–3.3, Table 1).
- Policy/constraint setup: Each instance binds a document clip D with a single policy P tied to a confidential target/value pair (t, v); implicit queries include content-coverage checklists that avoid referencing v (Section 3.2.3).
- Baselines: Direct prompting of six LVLMs, Chain-of-Thought prompting, post-hoc revision, and the proposed DVA two-stage prompt (Section 4.1–4.3, Table 5).
- Metrics/judging: Leakage measured by whether the output contains v; Faithfulness scored via checklist satisfaction proportions judged by GPT-5-mini; LLM-as-a-judge validated on 100 samples with 93% agreement to humans (Section 3.4–3.5).
- Reported outcomes: Table 3 shows leakage up to 93.5% on implicit policy queries, OCR inputs increase leakage (“OCR Paradox”), multi-source evidence causes higher leakage (Table 4, Figure 3), and DVA lowers Gemini-3-Flash leakage from 64.6% to 30.5% (Table 5, Figure 4).

## Stage-by-Stage Analysis
For each stage: why it exists, key design choice, likely failure point.
- Stage 1 – Policy construction: Needed to enumerate realistic confidential targets; authors use GPT-5.2 plus a five-item checklist to keep noun-phrase policies grounded (Section 3.2.2, Figure 2). Failure point: automated extraction may miss subtle sensitivities or hallucinate unsupported targets despite human spot-checks.
- Stage 2 – Query & checklist generation: Provides both explicit red-team prompts and implicit summary prompts with filtered coverage checklists so leakage and utility can be measured (Section 3.2.3). Failure point: implicit questions still risk referencing the banned value, and checklist filtering could drop essential criteria, affecting faithfulness scores.
- Stage 3 – Evaluation (LLM-as-a-judge): Automates leakage/faithfulness decisions to scale benchmarking (Section 3.4). Failure point: judge errors or bias toward certain phrasings may under/over-estimate leakage, and agreement is only measured on 100 samples.
- Runtime mitigation (DVA): Specifically inserted to decouple reasoning from verification by handling atomic facts (Section 4.3). Failure point: relies on the same LVLM to self-censor; decomposition quality determines whether sensitive facts can be identified, and adversarial prompts could hide leakage inside aggregated prose.
