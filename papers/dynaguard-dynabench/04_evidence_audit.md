# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | DynaGuard-8B (with or without CoT) outperforms prior guardian models and GPT-4o-mini across safety suites and DynaBench. | Table 3 | Strong | Supported | Uses consistent prompts, multiple seeds (Appendix A.10), and covers seven datasets; latency claims remain unquantified. |
| C2 | The DynaBench training/test labels are reliable despite synthetic generation. | Section 3.3, Table 8, Table 9 | Medium | Supported | Manual audit of 743 challenging samples yields 0.85 Cohen’s κ and 92.6% agreement, but easier samples remain unchecked. |
| C3 | Adding reasoning supervision (CoT + GRPO) improves guardian accuracy. | Table 4 | Medium | Supported | Shows +7.1 F1 (64.6→71.7) and 57% relative error-rate reduction on Qwen3-4B; only reported for one backbone. |
| C4 | Mixing safety ontologies with bespoke policies broadens generalization. | Table 5 | Medium | Supported | Safety-only excels on WildGuard while DynaBench-only excels on DynaBench; the 50/50 mix gives the best combined F1 (72.0–73.2). |
| C5 | Pairing DynaGuard with another LLM and using its explanations improves downstream compliance. | Table 6, Section 4 case study | Weak | Partial | IFEval accuracy rises from 57.3% to 63.8% when DynaGuard critiques Ministral-8B, but no error bars or alternative tasks are shown. |
| C6 | Training recipe transfers to other model families beyond Qwen3. | Table 7 | Weak | Partial | Reports average F1 deltas for Qwen2.5 and Llama3.2 but omits absolute scores or validation splits, so causal attribution is uncertain. |

## Highest-Confidence Findings
- The benchmark comparison in Table 3 solidly supports the headline claim that DynaGuard is the most accurate open-weight dynamic guardian among tested models.
- Manual validation statistics (Section 3.3, Table 8–9) provide concrete, quantitative evidence that the synthetic pipeline yields usable labels.

## Weakly Supported Areas
- Downstream agent improvements (Table 6) currently rest on a single task/model pairing with no statistical analysis.
- Cross-family transfer evidence (Table 7) lacks methodological detail, so the magnitude of gains or their dependence on extra compute remains unclear.
