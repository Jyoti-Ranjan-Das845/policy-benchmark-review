# 07 Synthesis Note

## What This Paper Establishes
- LOGISAFETYGEN can translate regulatory text into executable compliance tests via LTL templates, safety-constrained fuzzing, and safety masking, yielding LOGISAFETYBENCH with 240 verified tasks covering finance, tele-health, and smart home domains (Sections 3–4, Figure 1).
- The resulting benchmark surfaces compliance failures distinct from functional errors: logic-guided traces have better safety coverage (Table 2), and even frontier models show unsafe successes when safety cues are implicit, especially under goal-oriented prompts or high API density (Figure 2).
- Failure taxonomies reveal heterogeneous error sources—semantic grounding, instruction adherence, and ordering violations—providing concrete diagnosis targets for agent developers (Figure 3).

## What Remains Uncertain
- Whether two LTL templates are expressive enough for diverse regulatory regimes, since no alternative logics or richer policies were tested (Section 3.2).
- How robust the benchmark is to adversarial, multilingual, or conflicting policy instructions, which were filtered out during scope alignment (Sections 3.2, 3.4).
- If pipeline stages generalize beyond the ToolEmu-derived APIs or scale to longer horizons and dynamic environments (Section 4.1).

## What to Trust
- Quantitative coverage improvements over the GPT-5-Mini generator (Table 2) and the Pass@1/risk breakdowns showing safety gaps (Figure 2) are well-specified and reproducible given access to the benchmark.
- The qualitative failure categories (Figure 3) align with typical agent debugging experiences (syntax vs semantic vs compliance ordering) and are grounded in automated log analysis.

## What Not to Trust Yet
- Assertions about benchmark reliability that are based only on acceptance rates without inter-rater agreement or release of verification rubrics (Section 4.2).
- Implicit claims that compliance reasoning stems from reading the provided regulations; the study never measures whether models reference or cite the policy text.

## Carry-Forward Notes for Cross-Paper Synthesis
- Use this paper’s framing of Ambiguity/Validity/Inference gaps (Section 3.1) to categorize how other policy-benchmark efforts translate rules into code.
- Compare coverage metrics such as Adjacent Transition Coverage when evaluating future automatic benchmark generators.
- Treat the sharp goal-vs-workflow degradation (Figure 2) as an anchor for analyzing how prompt structure affects safety adherence in other domains.
