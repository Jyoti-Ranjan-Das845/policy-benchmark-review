# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  The benchmark reduces guideline obedience to choosing the reference answer for QA/MC tasks after producing an analysis trace, so misalignment between “correct” labels and the set of guideline-consistent solutions could misstate capability, especially for generative chat/summarization tasks with multiple acceptable outputs (paper.txt:494-572).

## Internal Validity
- Potential confounders/leakage:
  - Contexts, options, and even “optimal answers” are initially produced by LLMs before expert correction, so stylistic artifacts or hidden cues could advantage models similar to the generators (paper.txt:454-489).
  - GPT-4 parsing normalizes every model’s response prior to scoring; parser mistakes or biases might systematically favor GPT-style phrasing, yet the paper does not report parser accuracy (paper.txt:607-610).
  - Deduplication and rule editing also rely on GPT-4o, which could leak implicit priors about how rules should be phrased, narrowing variability (paper.txt:392-427).

## External Validity
- Generalization limits (tasks/models/policies):
  Benchmark content is primarily Chinese instructions synthesized from selected operational categories, so transfer to other languages, domains, or real-time interactions remains unclear (paper.txt:118-166, 870-878). Only textual, single-turn settings are evaluated, omitting tool-rich or multimodal environments common in deployed agents (paper.txt:494-505).

## Robustness Coverage
- Adversarial prompts: Not intentionally explored—the dataset stems from templated scenarios and LLM-generated contexts, so robustness to malicious or noisy inputs is untested (paper.txt:367-465).
- Ambiguous/conflicting policies: Rule edits simulate updates but there is no stress test for conflicting requirements or missing information, leaving policy disambiguation unexplored (paper.txt:428-453).
- Long-horizon behavior: Tasks are single QA or short multi-option items; there are no multi-step conversations beyond the provided context, so temporal credit assignment is absent (paper.txt:494-505).
- Tool-use constraints: Evaluations do not involve external tools or APIs; only pure language reasoning is measured, so compliance when tool outputs disagree with guidelines is unknown (paper.txt:494-505).

## Reproducibility
- Missing implementation/eval details:
  - Data generation and evaluation depend on GPT-4o for rule filtering, response parsing, and some reasoning baselines, but the paper does not quantify parser reliability or provide alternative open-source scripts (paper.txt:419-427, 607-610).
  - Although prompts are said to be in Appendix B, reproducing exact instructions requires access to those appendices plus API models that may change over time (paper.txt:384-489).

## Top Blind Spots
1. Lack of evidence that human-corrected “optimal options” capture the diversity of acceptable answers for open-ended tasks (paper.txt:454-489).
2. No evaluation of how guideline-following interacts with multilingual or cross-cultural policies despite recognizing the limitation (paper.txt:870-878).
3. Dependence on GPT-4 parsing without verification introduces an unmeasured failure mode that could invert win/loss counts (paper.txt:607-610).
