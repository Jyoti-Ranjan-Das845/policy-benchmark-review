# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - Leakage relies on GPT-4.1 comparing answers to confidential discussion summaries; if summaries omit paraphrases or the judge hallucinates matches, compliance can be mis-scored (paper.txt:421-445).
  - Faithfulness asks the same judge to rate coverage of non-confidential summaries, so "policy compliance" is conflated with an informativeness rubric rather than a precise check of Pc avoidance (paper.txt:421-445).

## Internal Validity
- Potential confounders/leakage:
  - Policies are generated via GPT-4.1 from QMSum QA pairs; mistakes in mapping transcripts to Pc/Pn could either make leakage impossible or unavoidable (paper.txt:260-285).
  - Indirect queries are inherited from QMSum and may already contain explicit references to confidential material, causing some "violations" to be inevitable regardless of model policy reasoning (paper.txt:294-320).
  - The same model family (GPT-4.1) is used both to craft policies and to judge outputs, which could bias evaluations toward GPT-style reasoning patterns (paper.txt:260-455).

## External Validity
- Generalization limits (tasks/models/policies):
  - Contexts are all meeting transcripts from QMSum; no evidence that policies grounded in chat logs, codebases, or documents behave similarly (paper.txt:249-268,429-468).
  - Policies always contain succinct target summaries; real-world confidentiality rules can be longer, conflicting, or multi-tier, which the benchmark does not simulate (paper.txt:260-293).
  - Tested models are limited to 10 popular LLMs as of 2025; nothing shows whether smaller fine-tuned enterprise models or multimodal systems exhibit the same leakage profile (paper.txt:470-520).

## Robustness Coverage
- Adversarial prompts: Only two attack types are considered—rule-based direct asks and high-level QMSum queries—so jailbreak-style, multi-turn, or tool-augmented attacks are absent (paper.txt:294-320).
- Ambiguous/conflicting policies: Filtering removes conflicting targets, thus the benchmark sidesteps the realistic challenge of interpreting overlapping policies (paper.txt:260-320).
- Long-horizon behavior: Each instance is single-turn QA; there is no evaluation of whether models maintain compliance across multi-step tool plans or extended conversations (paper.txt:237-320).
- Tool-use constraints: Tasks do not require calling external tools or reasoning chains beyond plain answering, so tool-selection or retrieval safety is untested (paper.txt:237-320).

## Reproducibility
- Missing implementation/eval details:
  - While prompts are summarized, the paper does not disclose exact policy-generation or judge prompt templates in the main text (pointer only to Appendix Tables 7–13), nor does it specify seeds or API versions for each model query (paper.txt:244-455,973-980).
  - Leakage/faithfulness evaluation lacks inter-rater reliability estimates beyond stating that a subset of human annotations agreed perfectly, leaving unclear how large that subset was (paper.txt:446-455).

## Top Blind Spots
1. Dependence on GPT-4.1 for both policy authoring and judging could systematically skew difficulty and scoring, yet no ablation replaces it with humans or alternative auditors (paper.txt:260-455).
2. All evidence assumes meeting-style language; the benchmark does not test structured data, code, or multimodal contexts where policy cues differ (paper.txt:249-268,429-468).
3. Reported mitigation results stem from a single model and prompt setting, so conclusions about effective defenses lack breadth (paper.txt:698-721).
