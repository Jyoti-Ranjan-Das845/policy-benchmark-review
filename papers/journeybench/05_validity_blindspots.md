# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following? UJCS (Eq. 1–2, Section 3) only rewards exact tool order and parameter matches, so it captures SOP compliance but ignores conversational nuance, partial recovery paths, or human judgment about acceptable deviations.

## Internal Validity
- Potential confounders/leakage: GPT-4o user simulators occasionally hallucinate inputs or exit early (Section 4.3), potentially penalizing agents unfairly; deterministic tool responses eliminate real API nondeterminism, so SPA vs DPA differences might partly stem from prompt length rather than orchestration logic; reviewer unanimity in Phase 2 could still encode shared biases.

## External Validity
- Generalization limits (tasks/models/policies): Only three customer-support domains with 41 tools are tested (Table 1), and just four LLM families are compared (Table 2); SOP DAGs are static, so dynamic or loosely specified policies are not represented; real callers present speech, accents, and emotions that the text-only setup omits (Section 7).

## Robustness Coverage
- Adversarial prompts: No adversarial or malicious user behaviors are introduced beyond missing-parameter/FoF perturbations (Section 2.2), so jailbreak resilience is untested.
- Ambiguous/conflicting policies: SOPs are crisp DAGs with deterministic branching; the study never examines conflicting policies or soft rules, which commonly cause compliance drift.
- Long-horizon behavior: Average 10.91 turns (Table 1) is longer than some benchmarks but still modest compared with real escalations; no scenarios exceed the 40-turn cap.
- Tool-use constraints: Tools never change schemas or latencies, and pre-generated responses remove quota or auth constraints, missing a major policy failure source in production.

## Reproducibility
- Missing implementation/eval details: Pseudocode for the orchestrator and SOP interpreter is relegated to appendices (A.2–A.3) without code; user seeds are described but not released; production deployment metrics (Section 4.2) lack telemetry, hindering independent replication.

## Top Blind Spots
1. Lack of human evaluation comparing SPA vs DPA outputs beyond automated UJCS and LLM judges.
2. Absence of evidence that benchmark SOPs evolve with policy updates or handle inconsistent business rules.
3. Limited coverage of tool failures—only single-call fail-stop cases—ignores cascading outages or stale data.
