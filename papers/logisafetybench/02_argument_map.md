# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: Logic-guided synthesis can automatically build a benchmark where hidden regulatory oracles expose LLM agents that prioritize goal completion over safety.
- Method element tied to claim: LOGISAFETYGEN’s three-stage pipeline—policy-to-LTL translation (Section 3.2), safety-constrained fuzzing (Section 3.3), and masking-based instruction synthesis (Section 3.4)—used to instantiate the 240-task LOGISAFETYBENCH (Section 4).
- Evidence artifact(s): Table 2 (coverage comparison between the fuzzer and GPT-5-Mini generator), Figure 2 (Pass@1 + risk breakdown across domains/instruction types), Figure 3 (failure categorizations for goal-oriented prompts).
- Conclusion drawn by authors: Because the fuzzer covers all safety-critical APIs and more diverse transitions, and SOTA models still incur unsafe successes/violations under those tasks, the benchmark successfully diagnoses implicit regulatory compliance gaps (Sections 5.2–5.3).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Higher safety coverage and transition diversity than the GPT-5-Mini baseline (Table 2); differential Pass@1 and risk distributions for 13 LLMs across financial, tele-health, and smart home domains (Figure 2); qualitative failure taxonomies showing instruction-adherence and operational-order violations (Figure 3).
- Assumed but not demonstrated: That two LTL templates suffice to encode the variety of regulatory norms; that tool schemas adapted from ToolEmu faithfully represent the referenced regulations; that the masking step does not leak safety cues or introduce bias across Goal vs Workflow prompts.

## Logical Gaps
- Gap 1: No ablation isolating each stage (oracle translation vs fuzzer vs masking) to show which component most affects unsafe success rates—authors infer necessity qualitatively via the “gap” narrative.
- Gap 2: The evaluation infers regulatory reasoning ability solely from hidden-oracle pass rates without validating whether models read or grounded the provided policy texts, so improved safety could just come from memorizing typical scaffolding rather than true implicit compliance reasoning.
