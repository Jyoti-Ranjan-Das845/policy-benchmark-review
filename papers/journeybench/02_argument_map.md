# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: Policy-aware customer-support agents require structured workflow control (DPA) plus a purpose-built benchmark (JourneyBench) to achieve high SOP adherence (Sections 2–4).
- Method element tied to claim: Represent SOPs as DAGs with conditional pathways, auto-generate user journeys and perturbation scenarios, and run agents via either static prompts or a state-machine orchestrator (Figure 3, Section 4.1).
- Evidence artifact(s): Tables 2–3 showing UJCS improvements of DPA over SPA across scenario types and domains; Table 1 benchmarking dataset depth.
- Conclusion drawn by authors: JourneyBench plus DPA reliably enforces business policies, enabling smaller models like GPT-4o-mini+DPA to outperform larger ones with SPA and providing a foundation for production deployments (Section 4.2).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Pipeline for generating and validating SOP graphs (Section 2.2); deterministic tool-response setup; UJCS computation (Section 3); comparative UJCS scores for four LLMs under SPA vs DPA (Tables 2–3); scenario robustness (missing parameters, failing functions).
- Assumed but not demonstrated: That GPT-4o user simulation mirrors human callers without leakage (Section 2.2); that 5-of-5 agent reviews ensure task realism across industries; production deployment claims of 6,000+ daily calls lack logs; cost figure ($388.88) implies scalability but no budget analysis.

## Logical Gaps
- Gap 1: No ablation separates gains from DPA’s node-level prompting versus reduced tool availability, making it unclear which design element drives UJCS gains.
- Gap 2: Benchmark realism beyond three curated domains is asserted via expert review and LLM-as-judge QA but lacks human evaluation of actual agent outputs or comparison with live traffic distributions.
