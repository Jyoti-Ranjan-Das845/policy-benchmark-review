# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | CoPriva comprises 219 meetings, 2,763 policies, and 2,092 direct/indirect query pairs to test contextual security. | Table 4 and §2.5 dataset statistics (paper.txt:429-468). | Strong | Supported | Direct counts supplied; only limitation is lack of manual inspection depth, but numbers are unambiguous. |
| C2 | Modern LLMs show near-zero direct leakage yet 31–64% indirect leakage across 10 evaluated models. | Table 5 (paper.txt:470-520). | Strong | Supported | Leakage percentages are explicit; although no CIs are reported, gaps between direct and indirect rates are >30 points. |
| C3 | Higher faithfulness scores align with higher leakage because models prioritize informativeness over policy constraints. | Figure 3 and §3.2 narrative (paper.txt:520-550). | Medium | Supported | Visual correlation is evident but lacks quantitative coefficient or significance testing. |
| C4 | Prompting-based mitigations offer limited relief, with revision prompting reducing GPT-4o-mini leakage from 49.49% to 44.18%. | Table 6 (paper.txt:698-721). | Medium | Partial | Only a single model and no variance estimates; improvement may not hold across systems or queries.

## Highest-Confidence Findings
- Dataset scale/composition and the direct-vs-indirect leakage gaps jointly make a compelling case that contextual security remains unresolved for current LLMs (paper.txt:429-520).

## Weakly Supported Areas
- Claims about correlation drivers and mitigation efficacy rest on descriptive plots or single-model ablations without statistical backing, so generality is unclear (paper.txt:520-721).
