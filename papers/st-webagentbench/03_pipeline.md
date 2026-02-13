# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: BrowserGym surfaces DOM trees, accessibility trees, and page screenshots plus the POLICY_CONTEXT string that lists hierarchy-aware policies and active rules for each task (§3.5, Fig. 1).
- Policy representation: JSON/YAML templates (Tables 5–15) instantiate six safety dimensions; each task binds selectors, must_include strings, and evaluator types to create concrete policy instances (§3.2–§3.5).
- Agent/planner components: Unmodified public agents—AgentWorkflowMemory, WorkArena-Legacy, and WebVoyager—each combining an LLM (e.g., GPT-4-class) with planning/memory loops, but none augmented with Special policy reasoning (§4.1).
- Tools/environment: WebArena applications (GitLab, ShoppingAdmin) plus SuiteCRM hosted through BrowserGym, extended with the human_in_the_loop action and asynchronous LangGraph compatibility (§3.4–§3.5, Table 19).
- Output/action: Agents emit browser commands (click, type, navigate) or human-in-the-loop messages; runs are logged as trajectories with evaluated success flags and dimension-wise violation counts for downstream CuP/Risk calculations (§3.3–§3.4).

## Evaluation Pipeline
- Dataset/task source: 222 tasks spanning GitLab (47), ShoppingAdmin (8), SuiteCRM (167) derived from WebArena workflows and augmented to stress enterprise operations (Table 2, §3.4).
- Policy/constraint setup: 646 instantiated policies across user consent, boundary, strict execution, hierarchy adherence, robustness/security, and error handling dimensions, each tied to predefined evaluators (Tables 2, 5–15).
- Baselines: AgentWorkflowMemory (AWM), WorkArena-Legacy, and WebVoyager, each run once across all tasks without code changes (§4.1).
- Metrics/judging: Completion Rate (CR), Completion under Policy (CuP), Partial CR (PCR), Partial CuP (pCuP), and per-dimension Risk Ratio defined in §3.3; additional correlation analyses remove single dimensions (Table 3) and bin by policy count (Appendix C).
- Reported outcomes: Fig. 2 shows CR of 33.8/12.8/26.0% for AWM/WebVoyager/WorkArena-Legacy but CuP drops to 20.0/10.3/15.0% with user-consent and strict-execution dominating risk; Table 3 reports correlation gains of +0.13 and +0.15 when those dimensions are removed; Appendix C finds CuP falling from 18.2% (one policy) to 7.1% (>5 policies) with risk ratio slope ≈0.11 per additional template.

## Stage-by-Stage Analysis
- Stage 1 – Policy derivation & templating: Needed to turn enterprise incident data plus expert interviews into six orthogonal dimensions (§3.2, Appendix B); key choice was enforcing Porg ≻ Puser ≻ Ptask and encoding reusable templates; failure point is incomplete coverage or misinterpreted hierarchy that mislabels legitimate actions as violations.
- Stage 2 – Task instantiation across apps: Provides realistic workflows by extending WebArena and SuiteCRM (Table 2); key choice is selecting tasks with irreversible operations to justify policies; failure likely from UI drift or brittle selectors that break when the underlying app changes.
- Stage 3 – Prompt injection & observation packaging: POLICY_CONTEXT strings appended to every observation teach agents about active policies (§4.2); key choice is concatenating full hierarchies rather than summarized hints; failure point is that long prompts may exceed model context limits or be ignored altogether.
- Stage 4 – Agent interaction loop in BrowserGym: Agents map multimodal observations to actions, optionally triggering human_in_the_loop (Table 19); design emphasizes multi-modal access and human opt-out; failure risk comes from agents misunderstanding DOM identifiers or the synthetic confirmation responses, leading to false consent compliance.
- Stage 5 – Post-hoc evaluators & metric aggregation: Custom evaluators (e.g., element_action_match, is_ask_the_user) compute CR/CuP/Risk (§3.3, §3.5); key choice is binary violation counting per dimension; likely failure arises if evaluators miss nuanced violations (false negatives) or treat benign deviations as breaches (false positives), skewing Risk Ratios.
