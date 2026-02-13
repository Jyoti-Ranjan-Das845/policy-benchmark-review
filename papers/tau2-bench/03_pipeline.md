# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Scenario-specific user instructions + persona descriptors, agent domain policy, and tool schemas for both agent CRM and mocked user device (Section 3.1–3.2, Appendix A).
- Policy representation: Domain policy documents generated from solved task traces, optionally augmented with workflow-style step lists (Stage 4, Appendices D.2.2–D.2.3).
- Agent/planner components: Function-calling LLMs (gpt-4.1, gpt-4.1-mini, o4-mini, claude-3.7-sonnet) prompted with generic TAU guidelines plus telecom policy (Section 4.1).
- Tools/environment: Dec-POMDP environment where agent tools (6 write/7 read) hit the CRM DB and user tools (15 write/15 read) manipulate a simulated phone; actions verified through DB state assertions (Table 1, Section 3.1).
- Output/action: Multi-turn dialogues that mix natural-language guidance with tool calls from both parties until assertion checks mark the issue resolved or the interaction terminates.

## Evaluation Pipeline
- Dataset/task source: 15 atomic subtask groups composed into 2285 telecom tasks, subsampled to 114 covering 3 intents and multiple subtask counts (Section 3.2, Table 3–4).
- Policy/constraint setup: Each run binds the agent to one of two policy documents (original vs workflow) and enforces telecom domain rules plus Dec-POMDP turn-taking; only assertion-based success checks are used (Section 3.3, Figure 4 caption).
- Baselines: Same tasks executed under Default (dual control), No-User (agent controls both tool sets), and Oracle Plan (ground-truth action list provided) for each model, plus persona/intent stratifications (Section 4.2, Figures 3–7).
- Metrics/judging: pass^k across k∈{1…4} rollouts per task, action/subtask histograms, and manual annotation of simulator errors (Section 4, Table 2, Figures 3–7).
- Reported outcomes: Telecom pass^1 tops out at 49% (claude-3.7) vs 74% on retail (gpt-4.1) (Figure 3); removing dual control boosts gpt-4.1 from 0.34 to 0.52 pass^1, and supplying oracle plans raises it to 0.73 (Figure 4); higher action counts or harder intents drive success toward zero (Figures 5–6); Easy personas outperform None/Hard (Figure 7); simulator errors fall to 16% with no critical failures (Table 2).

## Stage-by-Stage Analysis
Stage 1 (agent DB/tools): Needed to anchor CRM-side state transitions; relies on LLM-generated schemas refined via unit tests, but errors in generated tool semantics could silently bias evaluation if not all corner cases are covered (Section 3.2).
Stage 2 (user DB/tools): Introduces a controllable mocked phone so user actions are grounded; choice to mirror real device toggles mitigates hallucinations, yet fidelity depends on how well the mock captures complex device behavior (Section 3.2).
Stage 3 (programmatic task creation): Provides scalable, verifiable tasks by composing atomic subtasks; design hinges on correct grouping of mutually exclusive subtasks, and generation bugs could create unsatisfiable or redundant tasks (Section 3.2, Table 3–4).
Stage 4 (policy creation): Supplies agents with procedural guidance inferred from solved tasks; policy phrasing materially changes performance (Figure 4), so any misalignment between policy and actual environment can confound measured capability.
Stage 5 (manual refinement): Human pass tightens the coupling between tools, policies, and tasks; residual inconsistencies—e.g., persona instructions conflicting with policies—are still possible and would manifest as unexplained agent failures or simulator errors (Section 3.2, Appendix E).
