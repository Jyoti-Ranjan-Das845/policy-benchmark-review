# Landscape Synthesis: Policy-Following Agent Benchmarks

## Executive Summary
The strongest designs in this landscape combine three properties: (1) explicit policy artifacts, (2) state-grounded evaluation, and (3) failure-isolating ablations. The weakest designs rely on single-shot LLM judging over synthetic-only distributions without strong calibration.

Across the 15 reviewed benchmarks, the most reusable engineering patterns come from:
- `tau-bench` and `tau2-bench` for deterministic, state-based evaluation and ablation rigor.
- `Doc-PP` for practical verification-stage mitigation.
- `AIReg-Bench` for agreement-style evaluator calibration metrics.

## What The Field Does Well
1. Operationalized policy-following as measurable tasks rather than broad chat quality.
2. Expanded beyond naive task success to reliability-style metrics (pass^k and variants).
3. Introduced domain realism in selected settings (telecom, business journeys, document workflows).
4. Improved benchmark diagnostics with mode ablations and complexity slices.

## Common Failure Patterns
1. Construct validity drift: metrics often measure proxy compliance, not full policy intent.
2. Judge brittleness: rubric/wording changes can swing outcomes.
3. Simulator dependence: user simulators still inject non-trivial noise.
4. Long-horizon collapse: action-heavy tasks trigger sharp performance degradation.
5. Synthetic overreach: synthetic distributions can overstate real-world readiness.

## Highest-Value Gaps (What To Build Next)
1. Multi-policy conflict settings (hierarchical and contradictory rules).
2. Dual-control domains beyond telecom (finance ops, IT admin, healthcare workflow).
3. Hybrid evaluation stack: deterministic state checks + calibrated judge layer + human audit slice.
4. Severity-weighted violation scoring, not just binary pass/fail.
5. Reproducibility hardening: fixed seeds, artifact hashes, and standardized run manifests.

## Design Principles For Your Benchmark
1. Make policy first-class:
- Store policy as versioned artifacts (rule text, precedence, exceptions, change history).

2. Separate capabilities causally:
- Always run at least 3 modes: normal, no-user, oracle-plan (or equivalent).

3. Prefer deterministic anchors:
- Use state assertions and trace invariants as primary score path.
- Keep judge models only for residual semantics and calibrate them explicitly.

4. Engineer for diagnosis, not just ranking:
- Report failures by class (coordination, ambiguity, evaluator, simulator, horizon).

5. Score trust, not just performance:
- Include evaluator agreement, simulator reliability, and distribution-shift sensitivity.

## Proposed Evaluation Stack (Recommended)
1. Primary: deterministic end-state and action-invariant checks.
2. Secondary: calibrated LLM judge with inter-rater audit slice.
3. Tertiary: manual adversarial review on a stratified subset.

## 90-Day Execution Plan
1. Days 1-30
- Implement dual-control runtime skeleton.
- Implement deterministic assertion evaluator.
- Create 30-50 compositional tasks with solvability checks.

2. Days 31-60
- Add mode ablations and complexity slices.
- Add simulator QA protocol and error taxonomy.
- Add verification-stage mitigation for policy-sensitive generation.

3. Days 61-90
- Add multi-policy conflict tracks.
- Add severity-weighted scoring and reliability reporting.
- Freeze v1 release with reproducibility bundle.

## Clear Adopt/Adapt/Reject Position
- Adopt: deterministic state checks, dual-control ablations, simulator QA, verification-stage filtering.
- Adapt: compositional generators, workflow-style policy prompts, LLM judge pipelines.
- Reject: judge-only evaluation and synthetic-only claims of real-world readiness.

## Final Recommendation
Build your benchmark around a `tau2 + tau + Doc-PP` core:
- tau2-bench for collaboration/control realism,
- tau-bench for robust state-grounded scoring discipline,
- Doc-PP for output verification under policy constraints,
then calibrate evaluator trust using AIReg-style agreement reporting.
