# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| ComplexBench (Wen et al., 2024) | Moves from compositional synthetic instructions to authentic regulations with scripted ground truths (Sec. 3.1–3.2). | Better realism and long-context requirement; worse breadth of domains (3 vs. 8+) and lacks controllable composition knobs. |
| FOLIO (Han et al., 2022) | Extends beyond first-order logic templates to messy natural-language policies and execution metrics (Sec. 2). | Better coverage of higher-order, multi-rule aggregation; worse formal interpretability since rules remain unformalized. |
| Beyond Instruction Following (Sun et al., 2024) | Focuses on applied scenarios (airline/NBA/tax) instead of synthetic logic statements, adding rule-wise metrics (Sec. 2, 3.4). | Better linkage to real-world stakes and per-rule diagnostics; worse scalability because annotation requires domain experts. |

## Novelty Judgment
- New: Rule-wise precision/recall/correctness metrics derived from GPT-4o parsing (Sec. 3.4) and the particular tri-domain benchmark look new relative to cited datasets.
- Incremental: Procedural generation of airline/tax cases and CoT evaluations follow established benchmarking protocols.
- Repackaged: Highlighting low LLM accuracy on long-rule contexts echoes prior observations in reasoning benchmarks, though here grounded in different source material.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: The paper contributes a clearly defined benchmark with published statistics (Tables 1–3) and actionable error analyses (Tables 4–7), but relies on unvalidated auto-judging and three domains, so it expands the empirical landscape without fundamentally rethinking rule-following methodology.
