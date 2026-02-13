# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| CoPriva (Chang et al., 2025) | Extends text-only policy-preservation QA into multimodal document settings with cross-modal evidence and reasoning-heavy implicit queries (Sections 1, 3). | Better coverage of real documents; comparable reliance on synthetic policies. |
| ConfAIde / PrivacyLens (Mireshghallah et al., 2024; Shao et al., 2024) | Moves beyond contextual-integrity norms to enforce explicit, user-defined prohibitions tied to concrete values (Section 2). | More controllable evaluation but narrower social-norm scope. |
| VLM-GEOPRIVACY (Anonymous, 2025) | Shifts focus from spatial location privacy to document-grounded financial/operational policies using tables, charts, and figures (Section 2). | Richer document modalities; still lacks geography-specific reasoning. |
| M-LongDoc / SustainableQA (Chia et al., 2025; Ali et al., 2025) | Builds on these document QA corpora by overlaying policy annotations, leakage metrics, and mitigation baselines (Section 3.2.1). | Adds safety dimension but inherits dependence on their document genres. |

## Novelty Judgment
- New: Identification of the Reasoning-Induced Safety Gap and OCR Paradox in LVLM policy preservation, plus the DVA structural prompting defense (Sections 4.2–4.3).
- Incremental: Benchmarking six existing LVLMs with standard prompting baselines mirrors prior text-only studies, albeit in a multimodal context.
- Repackaged: Dataset construction uses known LLM-assisted clipping/checklist techniques similar to CheckEval (Lee et al., 2025), repurposed for policy preservation.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental.
- Why: The work offers a concrete benchmark and a practical mitigation recipe with quantitative gains (Tables 3–5), but depends on synthetic policies, modest document variety, and LLM-as-a-judge scoring, limiting foundational claims.
