# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Text block containing the numbered policy plus the multi-turn user–agent transcript to audit (Section 3.4); optional control tokens `<think>` or `<answer>` to toggle reasoning depth (Section 3.6).
- Policy representation: Plain-language lists of 1–91 rules authored from curated rule banks and personas (Figure 2, Table 2), concatenated ahead of the dialogue so the guardian can ground its judgment.
- Agent/planner components: Qwen3 instruction backbones fine-tuned into DynaGuard with dual-mode decoding—chain-of-thought reasoning traces for a subset of samples, otherwise direct label plus a short explanation string (Section 3.5); downstream, the guardian feeds explanations back to a task model such as Ministral-8B (Table 6).
- Tools/environment: Synthetic data generated and labeled by GPT-4o/Gemini-2.0-Flash teachers (Section 3.2), supervised fine-tuning and GRPO implemented in VERL (Appendix A.9), and evaluation prompts mirroring published guardian model instructions (Section 3.6).
- Output/action: PASS/FAIL classification wrapped in `<answer>` tags accompanied by concise natural-language rationales that cite specific rules so another agent can revise its response (Section 4 case study).

## Evaluation Pipeline
- Dataset/task source: DynaBench test set of 543 human-authored policy/dialogue pairs (Section 3.1–3.3) plus established safety benchmarks—Aegis 2.0, BeaverTails, HarmBench, Safe-RLHF, WildGuard, XSTest (Table 3); additional analyses on IFEval prompts (Table 6) and failure subsets (Figure 3, Tables 10–11).
- Policy/constraint setup: During evaluation the guardian receives unseen policies (including bespoke ones derived from IFEval instructions) formatted exactly like the training inputs; baselines like LlamaGuard are adapted by defining custom “policy violation” categories when needed (Section 3.6).
- Baselines: GPT-4o-mini, base Qwen3-8B, open-weights guardians (WildGuard, LlamaGuard3, NemoGuard, ShieldGemma, GuardReasoner) plus DynaGuard variants with/without CoT (Table 3); ablation baselines swap reasoning or dataset mixtures (Table 4–5).
- Metrics/judging: Macro F1 on PASS/FAIL for each dataset with multiple random seeds (Table 3, Appendix A.10); qualitative review of explanations and downstream accuracy gain when pairing with Ministral-8B on IFEval (Table 6, Section A.8).
- Reported outcomes: DynaGuard-8B reaches 81.1% safety-average F1 and 73.1% F1 on DynaBench—best among open models—and boosts IFEval accuracy from 57.3% to 63.8% when used to criticize/regenerate answers (Table 3, Table 6).

## Stage-by-Stage Analysis
For each stage: why it exists, key design choice, likely failure point.
- Stage 1 – Synthetic policy/dialogue generation: Needed to cover tens of thousands of diverse, domain-specific guardrails; diversity injected via large persona/rule banks and instruction-tuned generators (Figure 2, Section 3.1–3.2). Likely failure: LLM writers may miss subtle policy semantics, leading to noisy supervision despite later validation.
- Stage 2 – Labeling and validation: Automated labeling with stronger LLMs plus manual audit of 743 challenging samples to reach 0.85 Cohen’s κ and 92.6% agreement (Section 3.3, Table 8). Likely failure: validation subset is skewed to harder, longer policies, so noise in easier cases might remain unmeasured.
- Stage 3 – Model training (SFT + GRPO): Converts Qwen3 backbones into dual-mode guardians using mixture data and explicit control tokens (Section 3.4–3.5). Likely failure: CoT supervision covers only one-third of data, so reasoning quality may degrade on edge cases like counting/multi-hop (Table 10).
- Stage 4 – Benchmarking & deployment tests: Evaluate against safety suites, perform failure analysis (Figure 3, Table 11), and plug explanations into another agent (Table 6). Likely failure: metrics are offline F1; real-time latency, human trust, or multi-turn recovery effectiveness remain mostly untested.
