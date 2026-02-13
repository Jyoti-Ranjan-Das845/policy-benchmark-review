# 01 Intent Note

## Paper
- Title: DynaGuard: A Dynamic Guardian Model With User-Defined Policies
- Authors: Monte Hoover, Vatsal Baherwani, Neel Jain, Khalid Saifullah, Joseph Vincent, Chirag Jain, Melissa Kazemi Rad, C. Bayan Bruss, Ashwinee Panda, Tom Goldstein
- Venue/Year: arXiv preprint (cs.LG), October 2025
- URL: https://arxiv.org/abs/2509.02563

## Core Intent
- Research question (1 sentence): Can we build an open-weight guardian model that enforces arbitrary, user-defined textual policies with interpretable reasoning while remaining as fast as classifier-style guards?
- Main claim (1 sentence): The DynaBench dataset plus the DynaGuard training recipe yields small Qwen3-based guardians that outperform both static guardian models and GPT-4o-mini on traditional safety benchmarks and on unseen bespoke policies (Table 3).
- Evidence type expected (experiments/theory/benchmark/etc.): Synthetic-data generation pipeline description, supervised + GRPO fine-tuning details, benchmark experiments (F1 on DynaBench and safety suites), ablations, and limited downstream IFEval study.
- Key assumptions required for claim to hold: Synthetic rule/dialogue generation (Figure 2, Section 3.2) produces policies representative of real deployments; LLM-generated labels plus limited human validation (Section 3.3, Table 8) are accurate; comparing F1 across benchmarks is a fair measure of “guardian quality”; enforcing textual rules is sufficient to capture dynamic guardrail requirements.

## Reading Focus
- What to pay attention to first: Dataset construction/validation (Section 3) and the main comparison table plus ablations (Table 3–5) that substantiate the headline claim.
- What can be ignored in first pass: Extended prompt templates and hyperparameter tables in Appendix A unless reproducing the pipeline.
