# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| PersonalReddit (Staab et al., 2023) | Prior work probes memorization of real personal info; CoPriva instead conditions on meeting transcripts plus inline security policies to test contextual obedience (paper.txt:98-115). | Better on user-defined policy enforcement but lacks diversity of personal-identifying details. |
| GOLDCOIN (Fan et al., 2024) | GOLDCOIN grounds LLMs in privacy law text; CoPriva swaps in user-authored policies tied to dialogue spans and adversarial QA (paper.txt:98-120,244-320). | Better realism for enterprise meetings; worse coverage of formal legal reasoning. |
| CONFAIDE (Mireshghallah et al., 2024) | Earlier benchmark targets contextual privacy but at smaller scale; CoPriva scales to 4,184 instances and explicitly differentiates direct vs. indirect attacks (paper.txt:98-128,470-540). | Better size/diversity; shares limitation of synthetic policy generation. |
| PrivacyLens (Shao et al., 2024) | PrivacyLens studies privacy norms in action; CoPriva adds structured Pc/Pn targets plus GPT-4.1 judge linking leakage to transcript spans (paper.txt:98-115,421-455). | Better mapping between summaries and judgements but more reliant on automated evaluation. |
| AgentDAM (Zharmagambetov et al., 2025) | AgentDAM focuses on autonomous web agents; CoPriva narrows to QA yet introduces indirect attacks reflecting policy circumvention attempts (paper.txt:98-115,294-320). | Better coverage of conversational transcripts; worse on agent/tool interaction settings. |

## Novelty Judgment
- New: Large-scale benchmark where each item couples explicit user-defined policies with long meeting transcripts and contrasts direct vs. indirect leakage outcomes.
- Incremental: Analytical sections on faithfulness correlations, context-length sensitivity, and domain leakage largely extend standard error analyses without new methodology (paper.txt:520-719).
- Repackaged: Dependence on QMSum data and GPT-4.1-generated policies repurposes existing corpora/prompts rather than gathering new human labels (paper.txt:249-320).

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: The work surfaces an under-measured failure mode (contextual policy leakage) with new data/metrics, but heavy use of automated generators/judges and single-task scope limit how foundational the benchmark can be (paper.txt:244-455,470-721).
