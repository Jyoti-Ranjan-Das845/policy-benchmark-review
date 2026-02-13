# 07 Synthesis Note

## What This Paper Establishes
- Dual-control evaluation is feasible: the telecom Dec-POMDP with shared tooling can be generated programmatically and yields verifiable assertion-based scoring (Sections 3.1–3.3, Table 1).
- When users must execute parts of the workflow, success rates of current LLM agents fall sharply, indicating coordination as a distinct failure mode (Figures 3–4).
- Task attributes such as action length, subtask count, issue type, and persona materially correlate with pass^k, providing tunable difficulty knobs (Figures 5–7).
- Simulator reliability benefits from grounding user behavior in tool-defined affordances (Table 2), reducing one major benchmark noise source highlighted in τ-bench.

## What Remains Uncertain
- Whether similar gains in realism hold for other sectors (finance, healthcare) that may need different tool taxonomies.
- How real human users—who might ignore or misinterpret instructions—would interact with the agent, since personas remain scripted.
- To what extent failures stem from reasoning gaps vs conversational misunderstandings; no error taxonomy is provided for agent-side mistakes.
- The stability of results under stochastic decoding or more than four runs per task.

## What to Trust
- Relative difficulty comparisons across control modes, action lengths, and issue types because they reuse identical tasks and instrumentation, making aggregate deltas meaningful despite modest sample sizes.
- The qualitative conclusion that policy document structure matters: swapping to workflow-style guidance consistently shifts pass^1, giving practitioners a knob to tune.
- Reported simulator error rates for telecom, as they are double-annotated and show large reductions compared with legacy domains (Table 2).

## What Not to Trust Yet
- Claims that τ2-bench “improves real-world readiness” of agents; without human studies or safety analysis, that extrapolation remains speculative.
- Any absolute ranking of models beyond the four reported proprietary LLMs, since prompts and policies are tuned for them and reproducibility details are sparse.
- Assumptions that assertion checks fully capture success—the benchmark does not audit dialogue quality, empathy, or policy compliance beyond final state.

## Carry-Forward Notes for Cross-Paper Synthesis
- When comparing with other agent benchmarks, treat “dual control” as its own axis; it interacts strongly with workflow availability and tool controllability, so datasets lacking user actions are not directly comparable.
- The compositional subtask generator (Section 3.2) provides a recipe for scaling task difficulty—useful when triangulating with benchmarks like FlowBench or WebArena that rely on handcrafted tasks.
- Keep an eye on simulator design choices: giving the user structured tools substantially reduces annotation burden (Table 2), which could be a transferable insight for other multi-turn testbeds.
