# 07 Synthesis Note

## What This Paper Establishes
- SHIELDAGENT combines explicit policy extraction (ASPM) with probabilistic verification to guard LLM web agents, delivering higher accuracy/recall and lower false positives than Direct, Rule Traverse, and GuardAgent across four datasets (Tables 2–4, Fig. 3).
- Curates SHIELDAGENT-BENCH: 960 safety instructions paired with safe/unsafe trajectories spanning seven risk categories, six environments, and both agent- and environment-based attacks (Fig. 2, Table 1, Table 9).
- Provides qualitative tooling (Fig. 18–19) showing how guardrail planning, formal verification, and certification steps interlock, suggesting a viable System-2 pattern for policy-grounded oversight.

## What Remains Uncertain
- Fidelity of GPT-4o–generated policies/rules relative to actual regulations is unverified; mis-specified rules could inflate accuracy.
- Transferability to non-web agents, other policy domains, or settings without the same tool library is not tested (§6 only claims generality).
- The probabilistic circuit thresholds’ sensitivity to distribution shifts or noisy predicate assignments is unexplored.

## What to Trust
- Comparative metrics showing SHIELDAGENT’s accuracy/FPR/ARR advantages and lower cost on SHIELDAGENT-BENCH and legacy datasets (Tables 2–3) — improvements are consistent and sizable.
- Benchmark scale/coverage claims (Table 1, Table 9) because they rest on transparent counts and a detailed data pipeline (Fig. 2).
- Evidence that ASPM optimization compresses rule/predicate sets and reduces vagueness (Table 8, Fig. 4–6), even if the downstream effect is not isolated.

## What Not to Trust Yet
- Assertions that the guardrail “ensures explicit compliance” for arbitrary agents or policies (Abstract, §6) — only web scenarios were evaluated.
- Claims of robustness against broad attack surfaces; evaluation includes two attack families but omits prompt-based/social engineering threats.
- Any implication that the policy extraction faithfully encodes legal intent; no human/legal audits or error analysis are supplied.

## Carry-Forward Notes for Cross-Paper Synthesis
- Treat SHIELDAGENT as evidence that structured rule circuits plus tool-enhanced verification can meaningfully reduce FPR without excessive latency; combine with other papers exploring lighter-weight guardrails to map the Pareto frontier.
- Benchmark design (paired safe/unsafe trajectories + policy annotations) could inform broader guardrail evaluations; future work should adapt the template to different modalities (embodied, GUI, API-only).
- Investigate whether the vagueness-reduction heuristics (embedding-based prioritization, clustering) generalize to other domains or if alternative rule-induction methods (symbolic/ILP) outperform GPT-4o pipelines.
