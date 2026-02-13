# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | τ-bench instantiates realistic tool-agent-user interactions in retail and airline domains with concrete databases, APIs, and policies. | Figure 2 (component overview), Table 1 (domain stats), Table 4 (API inventory). | strong | supported | Multiple artifacts show schemas, tool definitions, and policy snippets; fidelity ultimately depends on trusting manual design but documentation is rich. |
| C2 | Present-day LLM agents succeed on <50% of tasks, with proprietary models outperforming open-weight ones. | Table 2; Figure 3. | strong | supported | pass^1 shows gpt-4o 61.2% (retail) / 35.2% (airline) vs <32% for others; method ablations confirm FC > ReAct/Act. |
| C3 | Reliability drops rapidly with number of trials, motivating the pass^k metric. | Figure 4 (pass^k and pass@k). | medium | supported | Curves demonstrate <25% pass^8 even for gpt-4o; only τ-retail shown, so cross-domain generalization is assumed. |
| C4 | Failures stem mainly from wrong info/arguments, domain-rule violations, or partial handling of compound requests. | Figure 5 (failure breakdown), Figure 6 (write-count difficulty), Table 3 (policy ablation). | medium | supported | Analysis covers 36 gpt-4o τ-retail failures; limited sample yet consistent quantitative split. |
| C5 | Access to domain policies materially affects performance, especially in τ-airline. | Table 3. | medium | supported | Removing the policy drops gpt-4o from 33.2→10.8 in τ-airline but only 61.2→56.8 in τ-retail; only two models tested, so effect might not generalize. |

## Highest-Confidence Findings
- Benchmark assets and policies are concretely specified, so τ-bench is a real, reproducible testbed (Figure 2, Tables 1 & 4).
- No evaluated agent reaches dependable reliability; even top models remain far from pass^1=100% (Table 2, Figure 3).

## Weakly Supported Areas
- Assertions about user realism and coverage rely on LM simulation with no human verification (§3), so construct validity is not demonstrated.
- Failure taxonomy is derived from a single model/domain, so it may not explain τ-airline or weaker agents (§5.2).
