# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Natural-language user instruction plus user-provided info, and the hidden initial database state per domain/test case. (`paper.txt:255-304`)
- Policy representation: SOPs expressed simultaneously as natural-language constraint descriptions, directed action graphs, and executable oracle programs that encode permissible helper/service sequences. (`paper.txt:68-210`)
- Agent/planner components: LLM-based agents (18 proprietary and open-source models) invoked via native function-calling or ReAct/Act-only prompting to decide which tool to call next. (`paper.txt:281-304`,`paper.txt:415-438`)
- Tools/environment: Seven sandboxed customer-service domains totaling 97 service functions and 70 helper functions backed by rule-checking databases. (`paper.txt:250-279`)
- Output/action: A trajectory of tool calls (helper checks + service invocation) plus the resulting database state that is compared against the oracle for permissibility and completeness. (`paper.txt:200-244`)

## Evaluation Pipeline
- Dataset/task source: Tasks are generated automatically by permuting constraint satisfaction states for each service and prompting GPT-4o to instantiate user/database contexts, followed by automated and manual validation (Figures 4 & 10). (`paper.txt:231-279`,`paper.txt:773-900`)
- Policy/constraint setup: Every service function is linked to constraints, helper functions, and verifier programs so rule-based checkers can determine permissibility and expected outcomes. (`paper.txt:200-244`)
- Baselines: 18 models spanning GPT-4.x, Claude 3.x, Gemini 1.5/2.0, o4-mini-high, DeepSeek-R1, Llama 3.1 (8/70B), and Qwen2.5 (7–72B). (`paper.txt:281-287`)
- Metrics/judging: Trajectories must satisfy three checks—service permissibility, oracle database outcome match, and SOP action-graph completeness—to count as a pass; aggregated as per-domain and overall pass rates plus diagnostic breakdowns. (`paper.txt:200-244`,`paper.txt:311-351`,`paper.txt:449-499`)
- Reported outcomes: Table 3 quantifies pass rates, while Figures 5–9 analyze tool-set sensitivity, adversarial jailbreak robustness, prompting strategies, error causes, and performance vs. constraint count. (`paper.txt:311-499`)

## Stage-by-Stage Analysis
Stage 1 – Manual domain & SOP design: Ensures each domain has realistic services, constraints, helper functions, and DB schemas before automation; key choice is encoding SOPs as both text and executable verifiers so agents and oracles share tooling; failure risk is designer bias or mistakes propagating to all tests. (`paper.txt:773-823`)

Stage 2 – Constraint permutation & LLM case synthesis: Generates diverse scenarios by enumerating constraint combinations (required vs. customizable) and instantiating user/database fields via GPT-4o before constraint-verifier checks; key choice is limiting failing cases via k=1 to control redundancy; failure risk is synthetic data drift or verifier misalignment leading to mislabeled cases. (`paper.txt:824-900`)

Stage 3 – Agent evaluation with rule-based scoring: Runs LLM agents in the sandbox with full or oracle tool sets and grades trajectories via permissibility/outcome/procedure checks; key choice is multi-dimensional scoring to catch both outcome and process violations; failure risk is that automated judges may not capture nuanced partial compliance or real-world interaction patterns. (`paper.txt:200-304`,`paper.txt:311-378`)
