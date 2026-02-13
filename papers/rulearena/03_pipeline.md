# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Task instruction, full set of reference rules for the selected domain, and a user instance (Figure 1).
- Policy representation: Natural-language excerpts (some tables) from American Airlines baggage fees, 2023 NBA CBA/Constitution, and IRS forms (Sec. 3.1; App. B.1), totaling 95 rules that can span ~20k tokens.
- Agent/planner components: Off-the-shelf long-context LLMs (Llama-3.1 70B/405B, Qwen-2.5 72B, Claude-3.5 Sonnet, GPT-4o, o1-preview) prompted with zero-shot or 1-shot Chain-of-Thought reasoning (Sec. 4.1).
- Tools/environment: No external tools during inference except oracle variants noted qualitatively; post-hoc GPT-4o structured parser converts model text into rule-usage records and structured answers for scoring (Sec. 3.4, App. C).
- Output/action: A natural-language rationale plus numeric or categorical prediction (total cost, legality label, tax owed) for each user instance, later parsed to compute totals and rule usage.

## Evaluation Pipeline
- Dataset/task source: Automatically generated airline/tax scenarios via scripts aligned to collected policies plus 300 human-annotated NBA trade scenarios (Sec. 3.2; App. B.2).
- Policy/constraint setup: Ten airline, 54 NBA, and 31 tax rules with difficulty strata based on bags, trade complexity, and tax forms (Sec. 3.1–3.3; Tables 1–2).
- Baselines: The six LLMs above, each evaluated with 0-shot and 1-shot CoT prompts across all domains and difficulty levels (Sec. 4.1).
- Metrics/judging: Problem-level precision/recall/application correctness/accuracy and rule-level precision/recall/application correctness computed from GPT-4o-parsed outputs and ground-truth scripts or labels (Sec. 3.4; Eqs. 1–7).
- Reported outcomes: Table 3 (problem-wise metrics per domain/difficulty/model), Figure 2 and Table 4–7 (rule-wise recall/precision/correctness, highlighting neglected compositional and non-essential rules), and Section 4.3 analyses on correlations, prompting formats, and distractor rules.

## Stage-by-Stage Analysis
- Rule collection & formatting: Needed to ensure policies reflect authentic airline/NBA/IRS language; they preserve tables where present (App. B.1). Failure risk—policies may change or include omitted edge cases, limiting realism.
- Problem generation/annotation: Scripts and expert annotators translate rules into solvable tasks with known answers (Sec. 3.2, App. B.2). Key choice—NBA tasks rely on manual curation; risk—annotator errors or simplified salary constructs introduce bias.
- Prompting & inference: Testing representative long-context LLMs with CoT and optional exemplars reveals current capability boundaries (Sec. 4.1). Failure point—prompt quality may confound results, and lack of tool use underestimates systems that rely on calculators or retrieval.
- Parsing & scoring: GPT-4o structured extraction plus rule-usage matrix enable fine-grained metrics (Sec. 3.4, App. C). Failure point—parser mistakes or ambiguous rationales could mislabel rule recall/correctness, affecting reported weaknesses.
