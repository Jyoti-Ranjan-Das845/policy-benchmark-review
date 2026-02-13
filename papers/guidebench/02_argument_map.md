# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: GUIDE BENCH is a comprehensive benchmark that exposes major deficits in LLMs’ ability to follow domain-oriented guidelines, especially when rules change or require math/logic reasoning (paper.txt:114-169, 833-867).
- Method element tied to claim: A four-stage data pipeline (collection → rule generation → guideline construction/updates → multi-response generation) plus QA/multiple-choice task formulation with human-verified references and GPT-4 parsed outputs (paper.txt:367-489, 494-610).
- Evidence artifact(s): Table 1 model accuracies across seven domains, Table 2 CoT ablation, Table 3 reasoning-strategy comparison, and Figures 4–5 analyzing precision/recall and math error categories (paper.txt:512-848, 700-820).
- Conclusion drawn by authors: Domain-specific guidelines materially improve instruction following, yet both proprietary and open-source LLMs remain brittle—particularly on math—calling for adaptive reasoning mechanisms (paper.txt:823-848).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Dataset scale/diversity, rule-synthesis process, and comparative accuracy/precision/recall numbers for 18 LLMs under controlled prompts (paper.txt:118-536, 573-848).
- Assumed but not demonstrated: Synthesized Chinese-language rules generalize to other languages/domains, and GPT-4 parsing neither alters nor biases model outputs (paper.txt:607-610, 870-878).

## Logical Gaps
- Gap 1: Realism of auto-generated rules/contexts is only justified qualitatively; no inter-annotator agreement or downstream user study validates that tasks reflect operational workflows (paper.txt:367-489).
- Gap 2: The label-based metric assumes one optimal answer per task even for summarization or chat options, yet the paper reports only single human corrections with no disagreement statistics, leaving ambiguity about multi-solution cases (paper.txt:454-505, 475-489).
