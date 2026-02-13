# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Instructions, guidelines, and contexts (plus LLM-generated answer options for multi-choice tasks) are provided to the tested LLMs (paper.txt:320-348, 494-505).
- Policy representation: Guidelines consist of 537 synthesized rules with explicit condition/action blocks, later bundled via random, diversity-aware, or semantic selection strategies and further edited to simulate updates (paper.txt:392-453, 426-453).
- Agent/planner components: Models are prompted with Zero-Shot-CoT—first producing an analysis trace from the task tuple, then generating the final answer conditioned on that reasoning (paper.txt:541-565, 589-595).
- Tools/environment: Interactions are purely text-based; GPT-4 is additionally used offline to normalize outputs into the required schema before scoring (paper.txt:607-610).
- Output/action: The system emits an explicit answer (either a choice label or free-form response) intended to satisfy all guideline rules (paper.txt:541-569).

## Evaluation Pipeline
- Dataset/task source: 1,272 tasks spanning seven domains (audit algorithm, price matching, text relevance, math, agent chatting, summarization, hallucination detection) are built via the data pipeline and summarized in Figure 3 (paper.txt:118-166, 349-366, 367-489).
- Policy/constraint setup: Every task packs domain-specific guideline bundles, sometimes with rule-edited variants to stress robustness, and formats outputs either as QA answers or multiple-choice selections (paper.txt:428-505).
- Baselines: Eighteen API and open-source LLMs—from GPT-4o/o1 and Deepseek-R1/V3 to Qwen, Gemini, Yi, Vicuna, and Llama variants—are evaluated under identical prompts (paper.txt:512-530, 573-588).
- Metrics/judging: Accuracy is the primary score, with precision/recall reported for multi-option categories; label scoring compares each candidate answer against human-verified optimal labels (paper.txt:549-610, 512-536, 597-606).
- Reported outcomes: Deepseek-R1 attains the best overall accuracy (87.26%) and is the only model above 60% on math, GPT-4o excels except in math, and removing guidelines (GPT-4o*) reduces performance notably in several domains (paper.txt:512-536, 823-840).

## Stage-by-Stage Analysis
- Data collection (3.2.1): Needed to anchor the benchmark in under-explored operational domains; designers manually seed instructions before LLM expansion, but realism hinges on those seeds and may omit edge cases (paper.txt:367-391).
- Guideline rule generation (3.2.2): Ensures coverage of compositional rules by extracting key elements and prompting LLMs, then deduplicating via GPT-4o; failure point is hallucinated or logically inconsistent rules slipping past the initial filter (paper.txt:392-427).
- Guideline construction & updates (3.2.3): Three selection strategies plus LLM-driven rule edits simulate diverse, evolving policies; inconsistent edits or semantic drift could misalign tasks with intended operational constraints (paper.txt:428-453).
- Multi-response generation (3.2.4): LLMs craft contexts and answer options to scale dataset creation; dependence on generative models risks stylistic artifacts or biased distractors (paper.txt:454-465).
- Quality control (3.2.5): Automated label generation followed by expert correction tries to guarantee fidelity, yet there is no reported inter-annotator agreement so residual errors could remain (paper.txt:466-489).
- Inference/evaluation (Sections 4–5): The two-step analyze→answer prompt paired with GPT-4 parsing is meant to elicit reasoning and standardized outputs, but parser mistakes or hallucinated analyses could still corrupt final scoring (paper.txt:541-610, 589-610).
