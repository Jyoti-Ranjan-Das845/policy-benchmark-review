# 01 Intent Note

## Paper
- Title: τ2-Bench: Evaluating Conversational Agents in a Dual-Control Environment
- Authors: Victor Barres, Honghua Dong, Soham Ray, Xujie Si, Karthik Narasimhan
- Venue/Year: arXiv preprint (cs.AI), 2025
- URL: https://arxiv.org/abs/2506.07982

## Core Intent
- Research question (1 sentence): Can a Dec-POMDP-based benchmark where both agent and user issue tool calls expose the communication and coordination limits of modern conversational agents (Section 3)?
- Main claim (1 sentence): Introducing τ2-Bench with a telecom dual-control domain shows sizable performance drops versus single-control or oracle settings, revealing dual-control coordination as an unsolved challenge (Sections 3–4, Figures 3–5).
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction description plus empirical evaluation of multiple LLM agents across ablations and task breakdowns.
- Key assumptions required for claim to hold: The simulated user remains reliable enough to attribute errors to the agent (Section 4.3, Table 2); the telecom tasks and policies capture salient, verifiable troubleshooting workflows (Section 3.2, Appendix A/D); pass^k metrics reflect genuine task completion (Section 4.2).

## Reading Focus
- What to pay attention to first: Section 3.1–3.3 for the Dec-POMDP/task design pipeline, Table 1 for environment scope, and Section 4 (Figures 3–7) for ablations contrasting default, No-User, and Oracle settings.
- What can be ignored in first pass: Detailed trajectory transcripts and persona descriptions in Appendix A, plus full workflow documents in Appendix D, unless validating assumptions about instructions and policies.
