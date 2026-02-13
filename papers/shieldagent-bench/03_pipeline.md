# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Policy corpora such as the EU AI Act and GitLab handbook, plus real-time agent observations/AX trees and proposed actions from the protected web agent (§3, Fig. 1).
- Policy representation: Linear Temporal Logic rules assembled into action-based probabilistic rule circuits with learned weights (ASPM) (Eq. 2–6, §3.2.4).
- Agent/planner components: SHIELDAGENT controller using GPT-4o to extract predicates, retrieve hybrid memory workflows, and plan shielding operations before probabilistic safety certification (Alg. 1, §3.3).
- Tools/environment: Tool library providing Search, Binary-Check, Detect, and Formal Verify operations backed by fine-tuned InternVL2 guardrail models and formal verification engines like Stormpy (§3.3); hybrid memory with short-term history and long-term workflow cache.
- Output/action: Binary safety label, list of violated rules, textual explanation with remediation guidance, and optionally updated policy model entries (§3.3, Fig. 19).

## Evaluation Pipeline
- Dataset/task source: SHIELDAGENT-BENCH (3110 unsafe + paired safe trajectories across six WebArena-style environments) plus augmented versions of ST-WebAgentBench, VWA-Adv, and AgentHarm (§4–5, Table 1, Table 3).
- Policy/constraint setup: Safety rules extracted from regulations+platform docs and augmented per benchmark sample; attacks from AgentPoison (agent-based) and AdvWeb (environment-based) enforce policy-targeted violations (Fig. 2, §4).
- Baselines: Direct GPT-4o judgment, Rule Traverse (per-rule prompts), GuardAgent (§5.1).
- Metrics/judging: Guardrail accuracy (ACC) + false positive rate (FPR) on safe/unsafe labels, average rule recall (ARR) for cited policies, inference cost (# GPT-4o queries, time), and online policy compliance rate when copiloting AWM (Table 2–4).
- Reported outcomes: SHIELDAGENT hits 90.4–91.7% ACC with 4.0–5.6% FPR and ARR up to 92.7% while cutting queries/time by ~65%/58% on SHIELDAGENT-BENCH; maintains SOTA across existing datasets and boosts online compliance by 12–21 points over AWM alone (§5.2, Table 2–4, Fig. 3).

## Stage-by-Stage Analysis
- Policy extraction & LTL conversion: Needed to transform lengthy regulations into verifiable constraints; relies on GPT-4o prompts plus vagueness scoring for prioritization (§3.2.2–3). Failure risk: hallucinated rules or missing scope because no human validation is reported.
- Verifiability refinement & redundancy pruning: Ensures predicates are observable and non-redundant so inference is tractable (Algorithm 2, Table 8, Fig. 4–6). Failure risk: merging distinct policies if embeddings cluster unrelated predicates, degrading coverage.
- Circuit assembly & weight learning: Clusters rules by action, learns probabilistic weights via hinge loss to balance safe/unsafe trajectories (Algorithm 3). Failure risk: requires sufficiently labeled data; pseudo-learning or simulation bias may overweight frequent policies.
- Inference/verification loop: Retrieves relevant circuits, plans shielding operations, runs tools to assign predicate truth values, then formal verification and probabilistic certification (Alg. 1, Fig. 18–19). Failure risk: chain-of-thought planning may time out or assign wrong predicate values when tools misfire or observations are ambiguous.
- Online deployment with task agent: Guardrail copilots with AWM, providing stepwise feedback (§5.2, Table 4). Failure risk: latency from repeated verification could prevent real-time use, and instructions conflicting with policies might cause over-conservatism.
