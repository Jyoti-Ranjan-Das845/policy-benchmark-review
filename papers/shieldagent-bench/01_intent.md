# 01 Intent Note

## Paper
- Title: SHIELDAGENT: Shielding Agents via Verifiable Safety Policy Reasoning
- Authors: Zhaorun Chen, Mintong Kang, Bo Li
- Venue/Year: ICML 2025 (PMLR 267)
- URL: https://shieldagent-aiguard.github.io/

## Core Intent
- Research question (1 sentence): How can we build a guardrail agent that enforces explicit safety policies over the action trajectories of autonomous LLM agents operating in web environments?
- Main claim (1 sentence): The proposed SHIELDAGENT, powered by an action-based safety policy model (ASPM), enforces policy compliance more accurately and efficiently than existing guardrail baselines while introducing the comprehensive SHIELDAGENT-BENCH benchmark.
- Evidence type expected (experiments/theory/benchmark/etc.): Experiments on new and existing guardrail benchmarks, ablations/appendix diagnostics.
- Key assumptions required for claim to hold: (1) Safety policies can be faithfully extracted and formalized into verifiable LTL rules via GPT-4o-driven pipelines (§3.2); (2) The probabilistic rule circuits capture the true dependency between actions and policy violations (§3.2.4); (3) Benchmarks (Table 2–4) accurately reflect real-world risk distribution and evaluation; (4) Attack generators (AgentPoison, AdvWeb) reliably induce policy-violating trajectories (§4).

## Reading Focus
- What to pay attention to first: Section 3 (ASPM construction + inference workflow) and Section 5/Table 2–4 for performance/efficiency evidence; Figure 1 for pipeline overview; Section 4/Table 1 for benchmark scope.
- What can be ignored in first pass: Detailed appendix prompts/algorithm listings (Appendix C–H) unless verifying rule-refinement implementation specifics.
