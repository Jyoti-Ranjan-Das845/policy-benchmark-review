# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | LOGISAFETYBENCH uniquely integrates implicit safety masking, formal LTL oracles, and executable traces compared to earlier agent benchmarks. | Table 1 (Section 4) | medium | supported | Comparative table enumerates features but lacks an ablation proving each component is necessary. |
| C2 | Logic-guided fuzzing attains broader safety API coverage and more diverse adjacent transitions than an LLM generator, ensuring richer compliance tests. | Table 2 (Section 5.2) | strong | supported | Shows 100% coverage and higher ATC in all three domains relative to GPT-5-Mini baseline. |
| C3 | Frontier LLMs still incur unsafe successes when safety rules are implicit, especially under goal-oriented prompts with dense safety APIs. | Figure 2 (Section 5.3) | strong | supported | Pass@1 drops sharply (e.g., GPT-5 from 75% workflow to 28% goal in Smart Home) while unsafe-success slices grow. |
| C4 | Compliance failures manifest across heterogeneous error modes (semantic grounding, instruction adherence, operational restriction), so no single fix suffices. | Figure 3 (Section 5.3) | medium | supported | Heatmap highlights different dominant categories per domain/model, though no statistical tests quantify variance. |
| C5 | Human verification yields a reliable reference set, evidenced by 73.9% oracle acceptance and 70.6% trace acceptance across domains. | Section 4.2 narrative | weak | partial | Acceptance percentages are reported but reviewer agreement and sampling procedures are not quantified.

## Highest-Confidence Findings
- C2 and C3 provide quantitative evidence (clear coverage metrics plus Pass@1/risk breakdowns) that the synthesized tests are structurally diverse and that even strong LLMs fail hidden safety oracles, directly supporting the paper’s central motivation (Table 2; Figure 2).

## Weakly Supported Areas
- Claims about benchmark verification rigor (C5) rest only on acceptance percentages without inter-rater agreement, random-spot audits, or replication data, leaving uncertainty about oracle fidelity and masking correctness (Section 4.2).
