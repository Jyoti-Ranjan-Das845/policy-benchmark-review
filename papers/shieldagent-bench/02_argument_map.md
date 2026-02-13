# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: SHIELDAGENT enforces explicit safety policies over agent action trajectories more accurately and efficiently than prior guardrails while remaining grounded in verifiable rules (§1, §5).
- Method element tied to claim: Construct ASPM from extracted LTL rules (§3.2), retrieve action-specific rule circuits with hybrid memory and specialized shielding operations (§3.3), and deploy a probabilistic safety certification step (Alg. 1) to flag unsafe actions.
- Evidence artifact(s): Table 2 (accuracy/FPR/ARR/cost on SHIELDAGENT-BENCH), Table 3 + Fig. 3 (performance on ST-WebAgentBench, VWA-Adv, AgentHarm), Table 4 (online policy compliance gains), Appendix Table 8 (effect of ASPM refinement).
- Conclusion drawn by authors: SHIELDAGENT achieves state-of-the-art guardrail accuracy (up to 91.7% ACC, 4.0% FPR) with high rule recall (≥92.7%) and lower API/time cost, validating policy-reasoned guardrails as a practical defense (§5.2).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Quantitative guardrail accuracy, rule-recall, false-positive rates, inference cost relative to Direct, Rule Traverse, GuardAgent across multiple datasets (Tables 2–4); reduction in rule vagueness after optimization (Table 8/Fig. 4–6); curated benchmark scale (Table 1, Fig. 2).
- Assumed but not demonstrated: Fidelity of GPT-4o policy extraction to original regulations, robustness of the probabilistic inference threshold across unseen domains, correctness of formal verification code generation, and reliability of attack algorithms to cover real adversarial strategies (§3.2.2, §4).

## Logical Gaps
- Gap 1: No human or automated audit of whether extracted LTL rules faithfully reflect legal/policy text; performance gains could stem from mis-specified rules rather than general reasoning improvements.
- Gap 2: Generalization to other agent modalities/tools is claimed qualitatively (§3.3, §6) but never empirically validated beyond web agents, leaving cross-domain robustness untested.
