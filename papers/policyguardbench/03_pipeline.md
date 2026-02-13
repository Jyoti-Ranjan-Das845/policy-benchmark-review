# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Standardized multi-step trajectories from SCRIBEAGENT runs inside WEBARENA, each tagged with domain/subdomain metadata (§3.1), plus synthesized textual policies tied to those subdomains.
- Policy representation: Short natural-language rules that are atomic, executable, and mapped to source/target subdomains to support within- and cross-subdomain pairing (§3.1, Fig. 2).
- Agent/planner components: No autonomous agent is trained; instead the guardrail is a Qwen3-4B-Instruct backbone fine-tuned end-to-end (POLICYGUARD-4B) to classify trajectory–policy pairs (§3.3).
- Tools/environment: GPT-4o used for policy synthesis, embedding retrieval and keyword heuristics for policy matching, gpt-oss-120B for large-scale annotation (§3.1); training/evaluation executed on H100 GPUs (§4.1).
- Output/action: A deterministic binary prediction (`violation` vs. `no violation`) per trajectory–policy pair, optionally at different prefix lengths (§4.2–4.3).

## Evaluation Pipeline
- Dataset/task source: POLICYGUARDBENCH balanced subset of 59,997 pairs covering Reddit, Map, GitLab, Shopping, and Shopping-Admin domains with 42% violations and 41.6% cross-subdomain samples (§3.2, Tab. 1).
- Policy/constraint setup: Same synthesized policies as training, paired with either full trajectories or prefixes of length 1–5 to probe early detection (§3.2, Tab. 3).
- Baselines: Frontier APIs (DeepSeek-V3.1, Gemini-1.5-Pro, Claude-Sonnet-4), open-source Llama/Qwen/Gemma models, and safety guardrails (LlamaGuard v1–4, ShieldGemma) prompted for binary classification (Tab. 2).
- Metrics/judging: Accuracy, F1, and per-example latency for full sequences (Tab. 2); prefix accuracy (Tab. 3); ID/OOD accuracy & F1 under leave-one-domain-out (Tab. 4); FLOPs and efficiency-adjusted F1 (EA-F1) (Tab. 5).
- Reported outcomes: POLICYGUARD-4B reaches 90.1% accuracy / 87.6% F1 with 22.5 ms latency (Tab. 2), sustains 85.3% average prefix accuracy (Tab. 3), achieves ≥90% OOD F1 (Tab. 4), and delivers EA-F1 38.9 that exceeds much larger baselines (Tab. 5).

## Stage-by-Stage Analysis
1. Trajectory standardization (§3.1): Needed to turn noisy browser logs into comparable sequences; design choice is to normalize actions and canonicalize objects; failure point is potential loss of nuanced context or truncation of long behaviors.
2. Policy synthesis (§3.1, Fig. 2): Provides the rule set required for compliance checking; design emphasizes atomic constraints and domain/subdomain tagging; failure risk stems from GPT-4o hallucinations or policies that do not match real site affordances.
3. Trajectory–policy matching (§3.1): Ensures each trajectory is evaluated against relevant rules; design combines embeddings, keywords, and LLM scoring; failure risk is mismatched pairs that create spurious violations or trivial negatives.
4. Violation annotation (§3.1): Supplies supervised labels at scale; design uses gpt-oss-120B imitation of human judgments with confidence filtering; failure risk comes from systematic bias or lack of reported inter-annotator agreement, yielding noisy supervision.
5. Guardrail training (§3.3): Converts the classification task into an instruction-tuning problem on Qwen3-4B; design emphasizes template consistency and full-parameter SFT; failure risk is overfitting to style cues or memorizing domain artifacts instead of policy logic.
6. Benchmark evaluation (§4): Validates accuracy/efficiency/prefix behavior; design compares against both foundation and guardrail baselines; failure risk is that offline metrics may not translate to interventions in live agent systems, so deployment impact remains untested.
