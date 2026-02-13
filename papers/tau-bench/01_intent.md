# 01 Intent Note

## Paper
- Title: τ-bench: A Benchmark for Tool-Agent-User Interaction in Real-World Domains
- Authors: Shunyu Yao, Noah Shinn, Pedram Razavi, Karthik Narasimhan, Sierra research team
- Venue/Year: arXiv preprint (June 2024)
- URL: https://arxiv.org/abs/2406.12045

## Core Intent
- Research question (1 sentence): Can we systematically benchmark language agents on realistic tool use, user interaction, and domain policy compliance to assess their reliability for deployment? (§1 motivates the need via airline scenario in Figure 1.)
- Main claim (1 sentence): τ-bench provides LM-simulated user dialogues, domain-specific APIs/policies, and the pass^k reliability metric that collectively expose large performance gaps for current agents (<50% pass^1 everywhere in Table 2 and <25% pass^8 in Figure 4).
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction recipe (§3–4, Figure 2, Table 4) plus empirical evaluations across 12 models and 3 prompting strategies (§5, Table 2, Figures 3–6, Table 3).
- Key assumptions required for claim to hold: LM-based user simulation faithfully captures real users (§3, Stage III); each task truly admits a unique policy-compliant outcome after annotation (§4, Figure 2d); rule-based reward comparing database diffs + required strings is a sufficient proxy for user satisfaction (§3); pass^k computed from repeated LM rollouts with fixed prompts faithfully measures consistency (§3, §5.1). 

## Reading Focus
- What to pay attention to first: Benchmark formulation (Section 3) including reward/pass^k definitions, the three-stage construction pipeline (Section 4) that ensures uniqueness of outcomes, and experimental comparisons (Section 5—Table 2 for model ranking, Figures 3–6 for method, pass^k, and failure analyses).
- What can be ignored in first pass: Verbose schema dumps, API code, and trajectory transcripts in Appendices B–D unless checking implementation fidelity or replicating the benchmark (main narrative already summarizes Table 4 and sample runs).
