# 07 Synthesis Note

## What This Paper Establishes
- Reasoning-heavy multimodal QA causes LVLMs to violate explicit non-disclosure policies, with leakage soaring to 93.5% on implicit policy queries (Table 3) and worsening when evidence spans multiple modalities (Table 4, Figure 3).
- The Doc-PP benchmark operationalizes these failures via 1,141 confidential targets drawn from 90 real PDF reports, making leakage measurable with checklist-based faithfulness scoring (Sections 3.2–3.4, Tables 1–2).
- The Decompose–Verify–Aggregation (DVA) prompting framework halves leakage for leading LVLMs relative to default, CoT, and revision prompts (Table 5, Figure 4), indicating structural verification helps enforce policies.

## What Remains Uncertain
- Whether DVA preserves answer utility: Table 5 reports only leakage, so any trade-off in faithfulness remains unquantified.
- How robust the OCR paradox is; Table 3 exhibits modest deltas, and no ablation teases apart OCR formatting vs. clarity effects.
- Generalization to richer policy grammars, multi-turn conversations, or adversarial red-teaming was not evaluated.

## What to Trust
- Relative leakage rankings among the tested LVLMs and prompting strategies, because metrics are tied to concrete targets/values and supported by qualitative failure analyses (Figures 1 and 4).
- Dataset composition claims (Tables 1–2) and construction pipeline, which are transparently documented with checklists and manual verification steps.

## What Not to Trust Yet
- Broader claims that OCR “frequently” increases leakage in all settings; current evidence is narrow and lacks statistical backing.
- Assumptions that DVA alone ensures compliance in production—verification still relies on the same LVLM and simple policies.

## Carry-Forward Notes for Cross-Paper Synthesis
- Use Doc-PP’s checklist-driven judging approach as a template when comparing other safety interventions, but track how different judge models or human oversight affect agreement.
- Investigate hybrids that combine DVA-style verification with tool-assisted grounding or retrievers to see whether leakage can drop without sacrificing faithfulness.
