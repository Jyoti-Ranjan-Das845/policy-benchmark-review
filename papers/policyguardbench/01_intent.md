# 01 Intent Note

## Paper
- Title: TOWARDS POLICY-COMPLIANT AGENTS: LEARNING EFFICIENT GUARDRAILS FOR POLICY VIOLATION DETECTION
- Authors: Xiaofei Wen, Wenjie Jacky Mo, Yanan Xie, Peng Qi, Muhao Chen
- Venue/Year: arXiv preprint, 2025
- URL: https://rakanwen.github.io/PolicyGuard

## Core Intent
- Research question (1 sentence): How can we build and evaluate guardrails that reliably detect policy violations in long-horizon web-agent trajectories across domains and subdomains?
- Main claim (1 sentence): The authors’ POLICYGUARDBENCH dataset plus the fine-tuned 4B-parameter POLICYGUARD model deliver high-accuracy, efficient, and generalizable policy-compliance detection for agent trajectories (§§3–4, Tab. 2–5).
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction details, supervised training procedure, and comparative experiments versus foundation and guardrail baselines.
- Key assumptions required for claim to hold: (1) GPT-4o–synthesized policies and gpt-oss-120B–assisted annotations accurately reflect real policy requirements (§3.1); (2) ScribeAgent/WebArena trajectories capture representative agent behavior; (3) Binary violation labels and prefix truncations are sufficient proxies for real guardrail decisions; (4) Latency on H100 hardware extrapolates to deployment settings (Tab. 2 & 5).

## Reading Focus
- What to pay attention to first: Dataset construction pipeline (Fig. 2, §3.1–3.2) for policy coverage/label quality, and evaluation tables (Tab. 2–5) that substantiate accuracy, prefix robustness, cross-domain generalization, and efficiency.
- What can be ignored in first pass: Extended related-work survey (§2) and optimization hyperparameters (§A) unless reproduction or positioning details are specifically needed later.
