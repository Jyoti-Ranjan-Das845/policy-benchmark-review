# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - pass^k hinges solely on whether DB assertions succeed (Section 3.3), so it measures end-state correction rather than the quality of conversational guidance or adherence to every policy clause; agents that brute-force tool calls without explaining steps would still score well.

## Internal Validity
- Potential confounders/leakage:
  - Differences between the “original” and “workflow” policies change accuracy substantially (Figure 4) yet the prompts are not normalized for length, so gains may stem from richer demonstrations rather than the dual-control setting.
  - Only 4 deterministic rollouts per task (Section 4.1) means stochastic variability is under-sampled—single bad run on a long task can dominate pass^k, skewing comparisons among models or personas.
  - Although Table 2 shows low simulator error rates for telecom, there is no quantitative link between residual simulator mistakes and agent failures, so some pass^k drops could still be simulator-induced.

## External Validity
- Generalization limits (tasks/models/policies):
  - Telecom is the only domain with dual control; the conclusions might not hold for other sectors such as home automation or medical workflows.
  - The study evaluates just four proprietary models and one simulator (gpt-4.1), so it is unclear whether open-weight or smaller agents exhibit the same deltas.
  - Personas are stylized (Appendix A.1) and may not represent real novice/expert behaviors, limiting extrapolation to human-facing deployments.

## Robustness Coverage
- Adversarial prompts: Not explored; user simulator follows supportive personas, so the benchmark does not stress misleading or malicious users.
- Ambiguous/conflicting policies: Policies are deterministic troubleshooting playbooks, so there is little coverage of conflicting constraints or policy gaps beyond the workflow/original comparison.
- Long-horizon behavior: Figure 5 highlights degradation above seven actions, but there are no targeted stress tests (e.g., repeated retries, looping) to verify whether agents recover from extended failures.
- Tool-use constraints: Tool schemas are hand-crafted and deterministic (Table 1), meaning there is no notion of rate limits, partial observations, or noisy tool outputs common in production systems.

## Reproducibility
- Missing implementation/eval details:
  - While prompts are said to be in Appendices C–D, the paper omits precise hyperparameters per model (context length, stop tokens) and the seed data for the 114-task subsample, making exact reproduction difficult.
  - Cost estimates are provided, but there is no release plan for the telecom environment, so independent verification hinges on code availability outside the paper.

## Top Blind Spots
1. Attribution of failure modes to “communication” lacks qualitative or causal analysis; the benchmark does not log structured error types beyond simulator mistakes.
2. Human realism is untested—the user simulator never deviates from scripted personas, so claims about readiness for real-world customer support are speculative.
3. Safety and escalation pathways (e.g., ###TRANSFER###) receive minimal analysis; premature termination is only discussed qualitatively in Appendix E without mitigation strategies.
