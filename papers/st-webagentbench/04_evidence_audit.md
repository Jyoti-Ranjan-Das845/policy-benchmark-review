# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | Existing web-agent benchmarks omit policy-adherence metrics. | Table 1 | strong | supported | The comparison table lists “Policy Adherence” and “Human-in-the-loop” as ✗ for MiniWoB++, Mind2Web, WebVoyager, WebArena, etc., highlighting the unmeasured axis. |
| C2 | ST-WebAgentBench provides 222 tasks with 646 instantiated policies across six dimensions. | Table 2, §3.4 | strong | supported | Task and policy counts per application/dimension are enumerated, showing tangible coverage (e.g., SuiteCRM 167 tasks, 148 consent policies). |
| C3 | Modern open agents’ CuP is far lower than their CR, with violations dominated by consent and strict execution. | Figure 2, §4.2 | strong | supported | Bars show AWM CR 33.8% vs CuP 20%, WorkArena 26% vs 15%, WebVoyager 12.8% vs 10.3%, and the accompanying risk plot spikes in the consent/strict bars. |
| C4 | Each safety dimension suppresses CR–CuP alignment, so all are necessary. | Table 3 | medium | partial | Removing any dimension increases the CR/CuP correlation (Δρd between +0.02 and +0.15), but only correlations—not absolute CuP or per-dimension violation counts—are ablated. |
| C5 | Compliance degrades sharply as policy count per task rises (CuP 18.2% → 7.1%; risk ratio slope ≈0.11 per added template). | Appendix C / Figure 3 | medium | supported | Policy-count bins show CuP decreasing monotonically and mean risk ratio increasing roughly linearly, although the single-run analysis omits error bars. |
| C6 | The six derived dimensions cover 95% of enterprise incident causes gathered from experts. | Appendix B | weak | partial | Based on coding 36 incidents with 10 stakeholders; no inter-rater statistics or cross-industry replication, so representativeness is uncertain. |

## Highest-Confidence Findings
- CuP consistently trails CR for all three agents, demonstrating that policy-aware metrics expose risk beyond completion (C3, Fig. 2).
- Benchmark scope is concrete and measurable, thanks to the detailed per-app/per-dimension counts (C2, Table 2).

## Weakly Supported Areas
- The “95% coverage” statistic for the six dimensions rests on a single small expert panel (C6), so generality is unclear.
- Necessity of each dimension is argued only through correlation shifts; without reporting CuP deltas or violation histograms post-removal, indispensability is speculative (C4).
