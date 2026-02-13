# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| MSGABench [12] | Moves from macro-level government reliability/security checks to a fine-grained bilingual dataset with clause retrieval, solution generation, and compliance tasks plus dual metrics. | Better: larger sample count (3,058 instances) and explicit compliance focus; Worse: heavier dependence on LLM-generated prompts rather than human-authored probes. |
| LexEval / LawBench [28,29] | Broadens legal cognition benchmarks into general policy analysis with bilingual coverage and scenario-grounded questions tied to evidence spans. | Better: multi-domain policy scope beyond case law; Worse: lacks the expert-verified annotations and jurisprudence grounding those suites provide. |
| MMLU / SuperGLUE [22,23] | Trades domain-agnostic QA tasks for policy-specific retrieval and compliance evaluation, integrating an automatic judge instead of pure accuracy scoring. | Better: constructs tasks agencies actually request; Worse: forfeits the breadth and long-lived leaderboards that make universal benchmarks widely comparable. |

## Novelty Judgment
- New: Combination of bilingual, up-to-date policy corpus, scenario-distilled tri-task design, and dual semantic/judge metrics aimed squarely at governmental deployments.
- Incremental: LoRA adaptation of 8B-class open models mirrors standard fine-tuning recipes; comparison to closed-source baselines follows existing benchmark practice.
- Repackaged: Motivation heavily reuses arguments from domain-specific benchmarking literature (legal/finance/health) without radically new methodological primitives.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: Addresses an obvious policy benchmarking need with concrete data and experiments, but reliance on LLM-distilled tasks and unvalidated automatic judging keeps it from being foundational.
