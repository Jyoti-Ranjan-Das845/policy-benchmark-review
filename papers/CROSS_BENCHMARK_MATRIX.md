# Cross Benchmark Matrix

## 1) Benchmark Comparison Matrix
| Benchmark | Control Mode | Policy Representation | Task Generation Method | Evaluator Type | Key Metrics | Simulator Fidelity | Engineering Complexity | Reproducibility Quality | Biggest Blind Spot | Recommendation |
|---|---|---|---|---|---|---|---|---|---|---|
| ST-WebAgentBench | Single-control web agent | Natural-language policy categories + operators | Curated web tasks | Rule/operator checks over trajectories | pass@k, risk ratio | Medium | High | Medium | Limited causal failure attribution | Adapt |
| tau-bench | Single-control TAU | Domain markdown policies | Hand-built tasks + constrained goals | DB end-state + output checks | pass^1, pass^k | Medium | Medium | Medium-High | LM-user realism not human-validated | Adopt |
| tau2-bench | Dual-control (agent+user tools) | Original/workflow telecom policies | Compositional subtasks (init/solve/assert) | Assertion-based + mode ablations | pass^k by mode, intent, actions | High (improved vs tau) | High | Medium | Single dual-control domain only | Adopt |
| SOPBench | Single-control with SOP constraints | SOP documents + constraints | Scenario-driven SOP tasks | Constraint and task completion checks | pass@1-style success metrics | Medium | Medium | Medium | SOP ambiguity/conflicts under-tested | Adapt |
| JourneyBench | Single-control business journey adherence | Journey/business policy specs | Workflow-journey tasks | Policy adherence + outcome checks | adherence/success rates | Medium | Medium-High | Medium | External validity beyond selected journeys | Adapt |
| ShieldAgent-Bench | Guard-over-agent trajectories | Extracted verifiable safety rules | Adversarial trajectory construction | Rule-circuit + policy reasoning guard | safety pass/fail, attack robustness | Medium | High | Medium | Runtime latency and deployment overhead unclear | Adapt |
| PolicyGuardBench | Policy-grounded guard/evaluator | Synthetic/structured policy descriptions | Policy synthesis + challenge sets | LLM judge + policy compliance checks | compliance metrics, robustness deltas | Medium | Medium-High | Medium | Judge dependence and policy leakage risk | Adapt |
| DynaGuard / DynaBench | Guard model over policy+dialogue | Dynamic user-defined rule lists | Synthetic generation + manual validation | PASS/FAIL classification with audits | macro-F1 across suites | Medium-High | High | Medium | Heavy synthetic-data dependence | Adapt |
| Keep Security! / CoPriva | Privacy/security policy compliance | Policy clauses for confidentiality/privacy | Synthetic + benchmark blending | Judge-based security/privacy checks | F1/accuracy-style compliance scores | Medium | Medium | Medium | Narrow downstream integration validation | Adapt |
| LogiSafetyBench | Logic-structured safety checks | Logic-form policy/constraint templates | Logic-centered scenario generation | Logic consistency + safety outcome checks | logic/safety success rates | Medium | Medium | Medium | Real-world policy messiness underrepresented | Adapt |
| RuleArena | Rule-following competition/tasks | Explicit rule sets | Arena-style task composition | Rule satisfaction + task success | pass/satisfaction rates | Medium | Medium | Medium | Weak linkage to real user workflows | Adapt |
| GuideBench | Guideline adherence benchmark | Guideline documents/prompts | Instruction-guideline task creation | Guideline-following eval | adherence + success scores | Medium | Medium | Medium | Policy conflict and ambiguity stress limited | Adapt |
| POLIS-Bench | Policy/legal instruction evaluation | Policy/legal text prompts | Curated legal/policy tasks | LLM judge + rubric scoring | compliance/quality metrics | Medium | Medium | Medium | Limited longitudinal process evaluation | Adapt |
| AIReg-Bench | Regulatory compliance judgment | EU AI Act article excerpts | Synthetic technical docs + legal annotation | Human median labels + LLM annotator agreement | kappa, rho, MAE, F1 | Medium | Medium | Medium | Single-turn synthetic docs vs real audits gap | Adapt |
| Doc-PP | Policy-preserving doc QA | Explicit non-disclosure policy statements | Real docs + generated explicit/implicit queries | Leakage + faithfulness judging | leakage rate, checklist faithfulness | Medium | Medium-High | Medium | Single-clause policy grammar and judge limits | Adopt |

## 2) Cross-Paper Failure Taxonomy
| Failure Class | Typical Pattern Across Benchmarks | Most Affected Benchmarks | Likely Root Cause |
|---|---|---|---|
| Coordination Failure | Strong drop when user must act or collaborate | tau2-bench, journeybench, ST-WebAgentBench | Decentralized control + weak dialogue strategy |
| Policy Ambiguity Failure | Model picks plausible but non-compliant interpretation | SOPBench, GuideBench, RuleArena, POLIS-Bench | Underspecified/conflicting policy text |
| Evaluator Brittleness | Small phrasing shifts flip pass/fail or judge score | AIReg-Bench, Doc-PP, PolicyGuardBench, CoPriva | Judge-model sensitivity, rubric ambiguity |
| Simulator Artifact Failure | Agent success depends on simulator behavior quirks | tau-bench, tau2-bench, JourneyBench | Imperfect user simulator realism |
| Long-Horizon Breakdown | Performance collapses with more steps/actions | tau-bench, tau2-bench, ST-WebAgentBench | Planning drift, context degradation |
| Synthetic-Data Leakage | Gains tied to synthetic style or generation priors | DynaBench, AIReg-Bench, PolicyGuardBench | Generator-judge-train overlap |
| Guardrail Circumvention | Safety guard misses edge-case or compositional violation | ShieldAgent-Bench, DynaBench, LogiSafetyBench | Incomplete rule coverage, brittle parsers |

## 3) Benchmark Trust Scores (1-5)
Score dimensions: Evidence Quality (EQ), Metric Validity (MV), Engineering Robustness (ER), Reproducibility (RP), Generalization Confidence (GC)

| Benchmark | EQ | MV | ER | RP | GC | Total/25 |
|---|---:|---:|---:|---:|---:|---:|
| ST-WebAgentBench | 3 | 3 | 4 | 3 | 2 | 15 |
| tau-bench | 4 | 4 | 4 | 4 | 3 | 19 |
| tau2-bench | 4 | 4 | 4 | 3 | 3 | 18 |
| SOPBench | 3 | 3 | 3 | 3 | 2 | 14 |
| JourneyBench | 3 | 3 | 4 | 3 | 2 | 15 |
| ShieldAgent-Bench | 4 | 3 | 4 | 3 | 3 | 17 |
| PolicyGuardBench | 3 | 3 | 3 | 3 | 2 | 14 |
| DynaGuard / DynaBench | 4 | 3 | 4 | 3 | 3 | 17 |
| Keep Security! / CoPriva | 3 | 3 | 3 | 3 | 2 | 14 |
| LogiSafetyBench | 3 | 3 | 3 | 3 | 2 | 14 |
| RuleArena | 3 | 3 | 3 | 3 | 2 | 14 |
| GuideBench | 3 | 3 | 3 | 3 | 2 | 14 |
| POLIS-Bench | 3 | 3 | 3 | 3 | 2 | 14 |
| AIReg-Bench | 4 | 4 | 3 | 3 | 2 | 16 |
| Doc-PP | 4 | 4 | 4 | 3 | 3 | 18 |

Interpretation:
- 19-25: High-confidence benchmark for direct reuse
- 15-18: Good benchmark with adaptation required
- <=14: Use mainly for targeted components, not as full template

## 4) Reusable Component Shortlist (Adopt/Adapt/Reject)
| Component Pattern | Adopt/Adapt/Reject | Source Benchmarks | Why |
|---|---|---|---|
| DB state + assertion-based deterministic evaluation | Adopt | tau-bench, tau2-bench | High signal, low judge subjectivity |
| Mode ablations (Default/No-User/Oracle) | Adopt | tau2-bench | Isolates coordination vs reasoning failures |
| Compositional task generators (init/solution/assert) | Adapt | tau2-bench, RuleArena | Scales coverage but needs domain-specific invariants |
| Policy workflow variants (manual vs workflow) | Adapt | tau2-bench, JourneyBench | Useful lever, but model-specific effects |
| Human-validated simulator QA loop | Adopt | tau2-bench, DynaBench | Prevents hidden benchmark artifacts |
| LLM-judge-only scoring without deterministic checks | Adapt | AIReg-Bench, PolicyGuardBench, CoPriva | Fast but brittle; add deterministic anchors |
| Synthetic-only data without realism controls | Reject (as sole source) | DynaBench-like pipelines | Overfitting risk and weak external validity |
| Leakage-focused verify stage (decompose-verify-aggregate) | Adopt | Doc-PP | Practical and portable mitigation pattern |

## 5) Immediate Build Guidance for Your Benchmark
1. Use tau2-bench style dual-control runtime + tau-bench style deterministic evaluation core.
2. Add Doc-PP style verification stage for policy-sensitive outputs.
3. Keep AIReg-Bench style agreement metrics for judge calibration, but never rely on judge-only scoring.
4. Require per-benchmark mode ablations and action-length slices before claiming robustness.
