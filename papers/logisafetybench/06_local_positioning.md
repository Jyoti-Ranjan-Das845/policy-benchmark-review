# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| ToolEmu (Ruan et al., 2024) | Provides the underlying sandbox APIs; LOGISAFETYGEN adds LTL safety oracles and masking so the same tools test implicit regulatory steps rather than raw correctness (Sections 3–4). | Better: introduces formal oracles; Worse: still limited to ToolEmu’s simplified services. |
| Agent-SafetyBench (Zhang et al., 2024b) | Moves from LLM-judge safety assessment to executable traces verified by runtime LTL monitors (Table 1). | Better: deterministic evaluation; Worse: smaller activity diversity. |
| RuleArena (Zhou et al., 2025) | Extends rule-grounded reasoning by requiring code/tool traces satisfying temporal rules instead of QA outputs (Section 2). | Better: combines rule reasoning with program synthesis; Worse: only covers three regulation families. |
| ShieldAgent (Chen et al., 2025b) | Repurposes probabilistic rule circuits into an offline benchmark generator rather than a runtime defense (Section 2). | Better: reusable stress tests; Worse: offers no safety enforcement at deployment time. |
| EU-Agent-Bench (Lichkovski et al., 2025) | Focuses on tool-using compliance instead of text-only EU law scenarios, leveraging similar legal context but different modalities. | Better: executable verification; Worse: omits many EU-specific rule types. |

## Novelty Judgment
- New: Integration of LTL-template extraction, logic-guided fuzzing, and instruction masking into a single automated pipeline that outputs executable compliance tasks (Figure 1; Section 3).
- Incremental: Reliance on preexisting tool schemas, GPT-5-Mini prompts, and standard Pass@1/coverage metrics extends—but does not reinvent—prior benchmarks (Sections 3–5).
- Repackaged: Comparative framing versus other benchmarks (Table 1) largely repackages known desiderata (implicit safety, formal oracles, executability).

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: Provides actionable test suites and quantitative analyses (Table 2; Figures 2–3) for a poorly measured property, yet limited domain breadth and lack of stage-wise ablations keep it from being foundational.
