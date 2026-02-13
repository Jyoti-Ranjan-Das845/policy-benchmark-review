# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | Even frontier LLMs fail many RULE ARENA problems despite perfect rule-selection precision. | Table 3 (Section 4.2.1) lists P(t)=1.0 for airline/tax across all models while Acc(t) ranges from 0–0.63, including o1-preview only reaching 0.63 even on Level 1 airline tasks. | Strong | Supported | Direct quantitative evidence across domains; accuracy computed against ground-truth scripts. |
| C2 | Low problem-wise recall, not precision, is the primary bottleneck for final accuracy. | Section 4.3.1 correlates Acc(t) with R(t) (stated “almost linear”) while precision correlation is “non-linear or unclear”; Table 3 shows P(t) high but R(t) decreases with difficulty and Acc(t). | Medium | Supported | Correlation is described qualitatively without numerical coefficient; relies on authors’ observation. |
| C3 | Non-essential, scenario-dependent rules receive the lowest recall. | Table 5 (Section 4.2.2) lists top-5 lowest-recall rules per domain, noting they are “non-essential,” e.g., oversize fee or Arenas provision. | Medium | Supported | Evidence is descriptive; low recall values not printed but relative ranking plus textual explanation indicate trend. |
| C4 | Compositional rules have the lowest application correctness. | Table 6 (Section 4.2.2) highlights rules like “overall fee aggregation” and “taxes with qualified dividends,” described as requiring aggregation of intermediate results and exhibiting low AC(r). | Medium | Supported | No raw AC(r) numbers, but qualitative justification tied to Table 6. |
| C5 | NBA rules with similar alternatives trigger low precision due to confusion among substitutable clauses. | Table 7 (Section 4.2.2) enumerates specific NBA rules with “substitutable” counterparts and low P(r), plus textual explanation on similarity-induced confusion. | Medium | Supported | Evidence limited to ranking list without numeric deltas; assumes annotator label of “substitutable.” |

## Highest-Confidence Findings
- C1: Accuracy collapse despite perfect precision (Table 3) clearly demonstrates benchmark difficulty and the need for better rule aggregation.

## Weakly Supported Areas
- C2–C5 rely on qualitative reasoning about correlations and rule categories without numerical breakdowns or statistical tests, so conclusions about bottlenecks (recall vs precision) and rule taxonomy effects deserve replication with explicit measurements.
