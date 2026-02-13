# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| LlamaGuard (Inan et al., 2023) | Moves beyond fixed safety ontology by letting users supply arbitrary policies at runtime and by emitting explanations (Sections 1–4). | Better on policy flexibility and DynaBench F1 (Table 3) but lacks multimodal support and mature product tooling. |
| WildGuard / Aegis2.0 datasets (Han et al., 2024; Ghosh et al., 2024) | Expands scope from safety categories to bespoke business rules with 61.5k multi-turn samples and explicit policy banks (Section 3, Table 2). | Better diversity of policies and multi-turn structure, though still synthetic vs. Aegis2.0’s partially human data. |
| GuardReasoner (Liu et al., 2025) | Retains reasoning ability but adds fast non-CoT mode plus open weights by fine-tuning Qwen3 instead of relying on larger API models (Section 3.4, Table 3). | Better latency options and DynaBench F1; GuardReasoner still has deeper CoT prompting knobs and prior safety coverage. |
| NemoGuard (Aegis 2.0 model card) | Introduces chain-of-thought control tags and mixture training so explanations can drive downstream corrections (Table 6). | Higher F1 on DynaBench (Table 3) but NemoGuard remains tied to curated safety configs and lacks dynamic policy prompting. |

## Novelty Judgment
- New: Joint release of a large dynamic-policy dataset plus dual-mode guardian weights that toggle reasoning or fast inference with control tokens.
- Incremental: Applying standard SFT+GRPO recipe to Qwen3 backbones and evaluating on existing safety suites broadens prior guardian comparisons but uses familiar methods.
- Repackaged: Prompt templates, persona banks, and manual audits extend established synthetic-data pipelines rather than inventing a fundamentally new data-generation paradigm.

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental
- Why: Provides reproducible open-weight guardians with demonstrable F1 gains (Table 3) and a harder evaluation set (Table 2), yet relies heavily on synthetic data and limited downstream testing (Table 6), so it is more of a strong engineering contribution than a foundational theory result.
