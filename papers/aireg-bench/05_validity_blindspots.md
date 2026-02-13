# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - Benchmark approximates EU AI Act compliance by asking annotators to judge single-article excerpts, but synthetic documents may omit cross-article dependencies and have only plausibility Likert scores (median 4) plus α=0.651 to back realism (`paper.txt:248-271`, `paper.txt:320-366`, `paper.txt:1684-1690`). 
  - Compliance is reduced to a 1–5 probability scale; regulators typically need binary pass/fail determinations and corrective actions, so metrics may overstate readiness for audits (`paper.txt:367-384`). 

## Internal Validity
- Potential confounders/leakage:
  - Annotator bias is substantial (extreme annotators at -0.917/+0.600) and disagreements high on Articles 10/15, so median labels may encode systematic skew not attributable to model performance (`paper.txt:352-366`). 
  - LLMs cannot browse external materials unlike humans, meaning differences in agreement may partially reflect information access rather than intrinsic compliance reasoning ability (`paper.txt:367-384`). 
  - Synthetic generation uses the same base model family as some evaluated systems, risking stylistic leakage that advantages OpenAI models unless carefully filtered. 

## External Validity
- Generalization limits (tasks/models/policies):
  - Only five AIA articles and eight use cases appear; requirements like Article 11 or general-purpose AI duties are absent, limiting portability to other regulatory controls (`paper.txt:197-215`, `paper.txt:387-395`). 
  - Benchmark is single-turn and text-only, while real conformity assessments involve multi-turn discussions, evidence gathering, and tooling; authors note this simplification themselves (`paper.txt:723-736`). 
  - Dataset is EU-specific and assumes 2025 AIA snapshot; evolving standards or other AIRs may alter obligations (`paper.txt:569-584`, `paper.txt:679-686`). 

## Robustness Coverage
- Adversarial prompts: None—documentation deliberately “show, don’t tell” but no stress-test of models with deceptive or contradictory statements. 
- Ambiguous/conflicting policies: Limited; each excerpt targets a single article, so there are no overlapping obligations to test conflict resolution (`paper.txt:197-215`). 
- Long-horizon behavior: Not exercised; models make one-shot Likert predictions without lifecycle monitoring tasks that Articles 9/15 would demand. 
- Tool-use constraints: Benchmark forbids tool use and retrieval; robustness to citing statutes or external evidence is untested (`paper.txt:367-384`). 

## Reproducibility
- Missing implementation/eval details:
  - Authors release prompts (Appendix D) and instructions (Appendix F), but do not publish the exact random seeds, API parameters, or generated text for all stages within the paper (presumably on GitHub) leaving replication reliant on repository access. 
  - Evaluation uses proprietary APIs whose availability/pricing may change; Table 4 ablations limited to GPT-4o only, so reproducing across models requires significant credits. 

## Top Blind Spots
1. Reliance on synthetic technical documentation with no validation against real provider artifacts. 
2. Treating median Likert scores from a small, biased annotator pool as ground truth despite α=0.651. 
3. Assuming single-turn, text-only scoring reflects end-to-end compliance assessments that typically involve audits, interviews, and external evidence gathering.
