# 07 Synthesis Note

## What This Paper Establishes
- SOP-aware benchmarks need explicit policy representations; JourneyBench’s DAG-based pipeline and UJCS metric directly penalize missing/extra tool calls (Sections 2–3, Figure 3).
- Structured workflow orchestration (DPA) materially boosts policy adherence for multiple LLMs and domains, as evidenced by UJCS lifts in Tables 2–3.
- Synthetic benchmarks can include perturbations like missing parameters and failing tools to diagnose failure modes beyond simple goal completion (Section 2.2, Section 4.3).

## What Remains Uncertain
- Whether the same gains persist with human callers, more domains, or non-deterministic APIs, since experiments rely on scripted GPT-4o users and canned tool responses (Sections 2.2, 4.2, 7).
- How much of DPA’s benefit stems from prompt length reduction versus true state-machine control; no ablations isolate these factors (Section 4.1).
- The longevity of SOP DAGs as policies evolve—update mechanisms or continuous validation are unspecified (Section 7).

## What to Trust
- Quantitative comparisons between SPA and DPA, because methodology, datasets, and metrics are clearly described and tabulated (Tables 2–3, Section 3).
- Dataset composition and scenario generation process, which detail reviewer counts, BFS traversal, and deterministic tool responses (Section 2.2, Figure 3).

## What Not to Trust Yet
- Real-world deployment impact (6,000+ daily calls) lacking supporting telemetry or compliance audits (Section 4.2).
- Claims of conversational realism resting solely on LLM-as-judge QA scores without human raters or statistical tests (Section 4.2).

## Carry-Forward Notes for Cross-Paper Synthesis
- Track how other policy-compliance papers deal with prompt-length vs orchestration trade-offs to explain DPA’s advantage.
- Look for benchmarks introducing conflicting or evolving policies to complement JourneyBench’s deterministic DAGs.
- Compare UJCS-like structural metrics with human compliance audits to understand construct validity gaps in future syntheses.
