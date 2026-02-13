# 01 Intent Note

## Paper
- Title: Evaluating Implicit Regulatory Compliance in LLM Tool Invocation via Logic-Guided Synthesis
- Authors: Da Song, Yuheng Huang, Boqi Chen, Tianshuo Cong, Randy Goebel, Lei Ma, Foutse Khomh
- Venue/Year: arXiv preprint (cs.CL), Jan 2026
- URL: arXiv:2601.08196

## Core Intent
- Research question (1 sentence): Can we automatically synthesize executable tool-use tasks that test whether LLM agents comply with implicit regulatory constraints rather than only functional objectives?
- Main claim (1 sentence): The LOGISAFETYGEN pipeline produces LOGISAFETYBENCH, a 240-task benchmark that surfaces hidden regulatory non-compliance in state-of-the-art LLMs even when they achieve functional goals (Sections 3–5).
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction with methodological description plus empirical evaluation (coverage metrics, Pass@1 safety outcomes, failure analysis).
- Key assumptions required for claim to hold: (1) Regulations relevant to the domains can be captured by the two LTL templates used in Section 3.2; (2) tool schemas adapted from prior sandboxes reflect realistic financial, tele-health, and IoT operations (Section 4.1); (3) GPT-5-Mini-based extraction/masking faithfully represents the intended constraints; (4) Pass@1 with hidden safety oracles is a valid proxy for compliance.

## Reading Focus
- What to pay attention to first: Pipeline design in Figure 1 and Sections 3.2–3.4, benchmark construction and verification in Section 4, and model performance/coverage evidence in Table 2 and Figure 2.
- What can be ignored in first pass: Extended related-work survey and citation-heavy discussion (Section 2) unless cross-benchmark positioning is needed.
