# 04 Claim-by-Claim Evidence Audit

## Audit Table
| Claim ID | Claim Statement | Evidence (Table/Figure/Ablation) | Strength (strong/medium/weak/none) | Verdict (supported/partial/not supported) | Notes |
|---|---|---|---|---|---|
| C1 | LVLMs that obey explicit requests still leak on reasoning-heavy implicit queries, revealing a reasoning-induced safety gap. | Table 3 (implicit vs. explicit leakage) and Table 4 (multi-source evidence leakage up to 100%). | Strong | Supported | Consistent spikes in leakage whenever synthesis is required; however, no statistical error bars are given. |
| C2 | OCR-based inputs often exacerbate leakage by increasing textual accessibility (“OCR Paradox”). | Section 4.2 discussion plus Table 3 comparing GPT-5.2 (implicit leakage 25.7% → 25.8%) and Qwen3-VL (40.4% → 40.9%) when switching to OCR. | Medium | Supported | Reported trend is consistent but magnitude is modest in visible table; authors narrate broader qualitative effect without per-document stats. |
| C3 | DVA prompt decoupling reduces leakage substantially compared to Chain-of-Thought or post-hoc revision. | Table 5 (Gemini-3-Flash leakage 64.6%→30.5%, Qwen3-VL 93.5%→24.5%, Mistral-Large 76.8%→41.6%) and Figure 4 qualitative example. | Strong | Supported | Large relative drops across three models plus detailed case study; missing BLEU-style faithfulness reporting but leakage impact is clear. |
| C4 | Doc-PP captures rich multi-modal confidential targets with diverse evidence types. | Section 3.3 stats and Table 2 (61.5% text, 20.9% table, 7.8% chart, 5.3% cross-modal). | Medium | Supported | Quantitative breakdown shows coverage, though there’s no external validation beyond internal checks. |

## Highest-Confidence Findings
- DVA’s decomposition and verification stages materially cut leakage across disparate LVLMs (Table 5), suggesting structural prompts can act as a practical defense baseline.

## Weakly Supported Areas
- Magnitude and per-document prevalence of the OCR paradox lack rigorous statistical backing; Table 3 shows marginal deltas, so the general claim that OCR “frequently exacerbates leakage” remains tentative.
