# 07 Synthesis Note

## What This Paper Establishes
- τ-bench formalizes agent evaluation with LM-driven user dialogues, deterministic APIs, and policy documents, delivering two concrete domains (retail, airline) plus the pass^k reliability metric (§3–4, Table 1, Figure 4).
- Empirical benchmarking across 12 models shows large performance gaps and highlights that even gpt-4o resolves <50% of airline tasks, while open-weight models lag further (Table 2, Figure 3).
- Failure analyses pinpoint dominant error families (wrong info/arguments, policy violations, partial handling) and show that removing policy guidance hurts models unevenly (Figure 5–6, Table 3).

## What Remains Uncertain
- Whether LM-simulated users accurately reflect real customer variability or adversarial behavior remains untested (§3).
- It is unclear if pass^k trends generalize beyond τ-retail or to settings with dynamic policies, partial observability, or noisy tools.
- The benchmark does not yet evaluate mitigation techniques (fine-tuning, scaffolding), so the path to improvement is speculative (§5.2, §6).

## What to Trust
- The construction recipe and released assets provide enough specificity for replication or extension (Figure 2, Table 4).
- Relative ordering of tested models/methods is backed by consistent evaluation settings and multiple trials (Table 2, Figure 3).
- The observed drop in consistency with higher k is directly measured via repeated trials with fixed prompts, making Figure 4 a trustworthy signal.

## What Not to Trust Yet
- Claims about readiness for real-world deployment, because metrics only check database diffs and string matches, ignoring policy-justification quality (§3).
- Any assertion that error categories proven on τ-retail transfer to τ-airline or other industries; evidence is limited to one failure sample (§5.2).
- Implicit suggestion that policy documents meaningfully help all agents—the ablation indicates some models barely use them (Table 3).

## Carry-Forward Notes for Cross-Paper Synthesis
- pass^k offers a complementary reliability view that can be reused when comparing future agent-training methods; ensure new work reports both pass^1 and pass^k for consistency.
- τ-bench’s mix of policy text + deterministic APIs is a template for building other domains (finance, healthcare) to stress-test policy adherence.
- When synthesizing across papers, treat LM-simulated user studies as provisional until corroborated by human-in-the-loop evaluations.
