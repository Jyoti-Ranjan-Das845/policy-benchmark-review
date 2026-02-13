# 08 Engineering Internals

## Source Artifacts Inspected
- Paper sections reviewed: Full paper.txt including Dec-POMDP formalism (§3.1), task generator (§3.2), evaluation (§3.3–4), and appendices for task/persona samples [paper.txt:210-1120].
- Public repo/docs reviewed: No local repo in `./repo`; only the paper artifacts were available.
- Version/commit notes: arXiv v1 dated 2025-06-09, authors’ first public release [paper.txt:1-37].

## Runtime Architecture
- Entry points: Each episode begins with a telecom scenario packet (user instruction + agent domain policy) fed into LiteLLM-powered agent/user simulators, instantiating the Dec-POMDP tuple (S, {Ai}, {Oi}, T, R, U, M) [paper.txt:210-255][paper.txt:372-379].
- Main control loop: Exactly one actor acts per turn, either emitting natural language (from M) or invoking a tool; the transition function then updates Sworld and Shistory before the next observation [paper.txt:217-244].
- Role orchestration: The agent performs CRM operations (lookups, toggles, plan changes) while coaching the user; the user simulator primarily executes guided device actions, keeping the intended complexity asymmetry (agent must reason, user mainly complies) [paper.txt:200-209][paper.txt:217-255].
- State ownership boundaries: Sworld factors into agent DB state (customers, plans, lines) and user DB state (device sensors, toggles). Each player mutates only their own store through WRITE tools, while Shistory logs the shared transcript for auditing [paper.txt:224-235][paper.txt:295-310].

## Data Model and State Transitions
- Primary entities: Agent CRM tables (`customers`, `lines`, `plans`) and user device schema (signal, SIM, airplane mode, data toggles) plus task metadata such as intent and persona tags [paper.txt:54-107][paper.txt:295-309][paper.txt:353-358].
- Mutable state stores: 6 agent WRITE + 7 READ tools for telecom, 15 WRITE + 15 READ tools for the user simulator, all interacting with their respective DB snapshots; assertion functions read the resulting world state for scoring [paper.txt:295-333].
- Critical invariants: (1) Solution traces must execute all required tool calls before assertions pass—benchmarks replay initialization and solution functions to guarantee solvability [paper.txt:320-346]; (2) Turn-level exclusivity avoids conflicting writes [paper.txt:228-241]; (3) Persona/issue constraints ensure mutually exclusive subtasks aren’t combined [paper.txt:337-358][paper.txt:840-914].

## Tooling and Policy Enforcement
- Tool interface design: Tools are decorated as READ/WRITE (e.g., `toggle_airplane_mode`, `get_customer_by_id`) with natural-language docstrings, exposed via the OpenAI tools schema to both agent and simulator; user tools purposely emit human-readable status bars instead of raw DB state [paper.txt:54-107][paper.txt:372-377].
- Policy encoding location: Domain-specific policy documents (original vs workflow variants) are injected into the agent prompt to shape reasoning; swapping these policies directly shifts pass^1 across Default/No-User/Oracle Plan modes [paper.txt:347-352][paper.txt:566-574].
- Validation and guardrails: Success is defined via assertion functions (status checks, action matching), while personas constrain simulator behavior; reliability is tracked through annotated user-error audits (telecom simulator 16% errors, 6% critical vs 40–47% in older domains) [paper.txt:360-370][paper.txt:353-358][paper.txt:790-817].

## Evaluation and Instrumentation
- Evaluation pipeline internals: Each task runs four deterministic trials (temperature 0) to populate pass^k across domains, intents, personas, action counts, and operating modes, enabling fine-grained attribution of reasoning vs coordination failures [paper.txt:372-585].
- Logging/trace artifacts: Shistory stores every conversational and tool event, enabling trajectory visualizations (Fig. 2) and manual replay for simulator QA and oracle-plan injections [paper.txt:224-235][paper.txt:289-333][paper.txt:790-810].
- Determinism knobs (seed, retries, temperature, etc.): Temperature fixed at 0, k ∈ {1..4} independent runs per task, and optional Oracle Plan input substitutes the ground-truth tool sequence to bound reasoning variance [paper.txt:372-376][paper.txt:468-515].

## Extensibility and Maintenance
- How to add a new domain/task: Follow Stages 1–5—LLM-generate PRD, schemas, and code (with unit tests) for agent tools; repeat for user tools; define atomic subtasks via init/solution/assert functions; compose tasks programmatically; author policy docs and personas; perform manual refinement [paper.txt:295-358][paper.txt:320-346].
- Coupling hotspots: Task generator ties directly to tool signatures (solution steps must map to callable tools), persona prompts and assertion functions assume specific schema fields, and any schema update cascades through prompts, validators, and synthesis scripts [paper.txt:320-358][paper.txt:353-369].
- Testing quality: Generated code ships with unit tests run until passing; composite tasks are automatically verified for solvability before inclusion; user simulator quality is double-annotated to separate benign vs critical deviations [paper.txt:301-346][paper.txt:790-817].

## Engineering Risks and Technical Debt
1. Heavy reliance on LLM-authored PRDs/tools still requires human experts for refinement and future domain coverage, limiting scalability despite the automation [paper.txt:301-352][paper.txt:823-836].
2. Dual-control balance depends on carefully constrained user affordances—without equally curated user tools, simulator errors could regress to the 40–47% seen in retail/airline domains [paper.txt:151-157][paper.txt:790-817].
3. Metrics degrade sharply with longer action horizons and harder issue mixes (pass^1 near zero beyond seven actions, lower scores on mobile_data_issue/mms_issue), so sampling shifts can skew headline numbers [paper.txt:575-638].
