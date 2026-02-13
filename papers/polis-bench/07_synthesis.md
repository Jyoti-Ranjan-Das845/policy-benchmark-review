# 07 Synthesis Note

## What This Paper Establishes
- Delivers a concrete bilingual policy benchmark with 3,058 clause/solution/compliance tasks, dual metrics, and a public evaluation pipeline that clearly differentiates reasoning vs chat LLMs (Sections 3–4, Tables 1–2).
- Shows, via extensive baselines, that compliance judgment remains the weakest capability even for leading closed-source models and that language (Chinese vs English) materially affects accuracy (Table 2, Figure 3).
- Demonstrates that multi-task LoRA fine-tuning on POLIS-Bench can dramatically lift open 8B models across all tasks (Figure 4) without obvious collapse on GPQA-Diamond (Table 3).

## What Remains Uncertain
- Whether the LLMJudge accuracy metric aligns with human compliance experts or merely reflects QwQ-32B’s preferences.
- How well the LLM-distilled questions reflect real policy workflows at subnational agencies or in other languages beyond Chinese/English.
- If POLIS-tuned models truly match GPT-4.1/Claude performance when run side-by-side on the same test split instead of relative to their own backbones.

## What to Trust
- Relative ordering insights (reasoning models > chat counterparts, compliance hardest) rely on multiple quantitative views and are likely robust.
- Dataset description and release plan are concrete enough to treat POLIS-Bench as a usable resource for reproducing the reported comparisons.

## What Not to Trust Yet
- Claims about reaching parity with closed-source systems and retaining broad general abilities rely on limited evidence (Figure 4, Table 3) and should be validated independently.
- Qualitative assurances about hallucination reduction (Figures 5–6) are anecdotal and not backed by systematic error analysis.

## Carry-Forward Notes for Cross-Paper Synthesis
- Dual-metric evaluation (cosine similarity + LLMJudge) plus evidenced-aligned annotations may be a useful template for other public-sector benchmarks, but future work should validate judges with human audits.
- The clear gap between Chinese and English accuracy suggests multilingual policy tasks need tailored data augmentation or judge calibration before deployment claims can be trusted.
