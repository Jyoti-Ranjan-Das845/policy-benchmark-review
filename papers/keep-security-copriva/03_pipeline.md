# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Meeting transcript T from QMSum, explicit security policy P with confidential set Pc and non-confidential set Pn, and user query Q (either rule-based direct attack or original QMSum query as an indirect attack) (paper.txt:244-320).
- Policy representation: Each policy is a list of targets where every item has a “Security Target” plus a “Discussion Summary” span indicating the supporting transcript snippet; Pc targets define forbidden content, and Pn annotates content expected in compliant answers (paper.txt:260-293).
- Agent/planner components: Base LLMs (7 non-reasoning, 3 reasoning) are prompted with system-level policy plus user-level transcript+query; no external planner but evaluation later re-prompts GPT-4.1 to score leakage/faithfulness (paper.txt:470-520,421-455).
- Tools/environment: Construction uses GPT-4.1 for policy extraction and automatic quality filtering; evaluation likewise uses GPT-4.1 as the judge, and experiments cover open-source and proprietary APIs such as Gemini 2.0 Flash, GPT-4o, Llama 3.1, Qwen3, QwQ-32B, DeepSeek-R1, and o4-mini (paper.txt:260-455,470-520).
- Output/action: Target LLMs generate answers A for each Q while conditioned on P and T; outputs are later assessed for leakage and faithfulness (paper.txt:237-320,421-455).

## Evaluation Pipeline
- Dataset/task source: CoPriva benchmark built from 219 QMSum meeting transcripts with 2,763 policies and paired direct/indirect queries (paper.txt:244-468).
- Policy/constraint setup: Policies inserted in system prompt, transcripts and query in user prompt; models must satisfy Pn content while avoiding Pc leakage (paper.txt:237-320).
- Baselines: Ten LLMs spanning Llama-3.1-8B/70B, Qwen3-14B/235B, Gemini-2.0-flash-001, GPT-4o, GPT-4o-mini, QwQ-32B, DeepSeek-R1, and o4-mini (paper.txt:470-520).
- Metrics/judging: GPT-4.1-as-judge produces binary leakage labels based on confidential discussion summaries and 1–5 faithfulness scores guided by non-confidential summaries plus rubrics; human spot checks validate prompts (paper.txt:421-455).
- Reported outcomes: Table 5 shows near-zero direct leakage but 31–64% indirect leakage depending on model, with higher faithfulness correlating with higher leakage; Figures 3–8 isolate contributing factors, and Table 6 quantifies mitigation attempts (paper.txt:470-719).

## Stage-by-Stage Analysis
- Input assembly: Pairing QMSum transcripts with generated policies ensures realistic contexts; key design choice is swapping Pc/Pn to diversify labels, but reliance on GPT-4.1 summaries could mislabel what is actually confidential (paper.txt:260-285).
- Attack construction: Rule-based direct attacks and original QMSum queries for indirect pressure test both explicit and implicit leakage pathways; failure point is that indirect queries may not always touch Pc, inflating leakage scores if evaluations misattribute content (paper.txt:294-320).
- Quality control: GPT-4.1 filtering removes inconsistent policy/summary pairs; this reduces noise but may still pass subtle overlaps or miss contradictory instructions (paper.txt:260-320,421-455).
- Model inference: LLMs receive long contexts with embedded policies; their weakness is juggling Pc vs. Pn simultaneously, often over-emphasizing answer helpfulness (paper.txt:535-596).
- Evaluation: GPT-4.1 judge checks leakage and faithfulness; choice allows scalable scoring but inherits any systematic bias or hallucination from the judge itself (paper.txt:421-455).
