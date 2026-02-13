# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Structured user seeds providing journey IDs plus user attributes, along with pre-generated tool responses and SOP graphs (Section 2.2).
- Policy representation: Directed Acyclic Graph SOPs where nodes encode task descriptions, allowed tools, and conditional pathways over tool outputs (Section 2.1, Figure 2).
- Agent/planner components: Either a Static-Prompt Agent that receives the entire SOP plus tool list in one prompt, or a Dynamic-Prompt Agent orchestrator that advances node-by-node as a state machine (Section 4.1, Appendix A.3 referenced).
- Tools/environment: 41 mocked APIs spanning Telecommunications, E-commerce, and Loan Application domains with deterministic responses for branching fields and LLM-generated filler values (Table 1, Section 2.2).
- Output/action: Sequenced tool calls issued during simulated conversations, evaluated for order and parameter fidelity to the target journey (Section 3).

## Evaluation Pipeline
- Dataset/task source: 703 simulated conversations generated from BFS traversal of validated SOP graphs across three domains and three scenario types (correct context, missing parameter, failing function) (Figure 3, Section 2.2).
- Policy/constraint setup: Node-level rules enforce required inputs and branching; failing or missing inputs truncate reachable nodes to ensure deterministic expectation traces (Section 2.2).
- Baselines: SPA vs DPA instantiations across GPT-4o, GPT-4o-mini, Claude 3.5 Haiku, and Llama 3.3 (Section 4.2, Table 2).
- Metrics/judging: Tool Trace Alignment (binary), Tool Call Accuracy summed across parameters, and User Journey Coverage Score (UJCS) averaging per Eq. (1)–(2); supplemental LLM-as-judge QA rubric for conversational realism (Section 4.2).
- Reported outcomes: DPA lifts UJCS from 0.564 to 0.717 for GPT-4o and enables GPT-4o-mini+DPA to surpass GPT-4o+SPA; missing-parameter robustness improves from 0.309 to 0.530 for GPT-4o (Table 2) and consistency holds across domains (Table 3).

## Stage-by-Stage Analysis
- Phase 1 – Graph generation: Ensures diverse SOPs without weeks of manual authoring; key design is LLM-generated DAGs with automated validation; likely failure is hallucinated dependencies or cycles slipping past automated checks (Section 2.2).
- Phase 2 – Manual review: Provides human sanity check on logic, coherence, and complexity with 5-of-5 unanimity; design emphasizes contact-center agents as reviewers; failure risk is reviewer bias or insufficient domain coverage (Section 2.2).
- Phase 3 – User journey enumeration: BFS traversal enumerates reachable task paths so benchmark covers every policy branch; design choice is deterministic traversal tied to tool responses; failure point is combinatorial explosion or overlooked rare branches (Figure 3).
- Phase 4 – Scenario generation: Adds stressors (missing parameters, failing functions) by editing traces; design enforces removal of unreachable calls; likely failure is unrealistic error modeling or inconsistent trace truncation (Section 2.2).
- Runtime orchestration/evaluation: DPA controller interprets tool outputs and swaps prompts per node; design limits tool exposure and supports corrections; failure arises if orchestrator mis-parses tool responses or if SPA context overload causes instruction loss (Section 4.1).
