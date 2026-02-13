# 01 Intent Note

## Paper
- Title: ST-WebAgentBench: A Benchmark for Evaluating Safety and Trustworthiness in Web Agents
- Authors: Ido Levy, Ben Wiesel, Sami Marreed, Alon Oved, Avi Yaeli, Segev Shlomov (IBM Research)
- Venue/Year: arXiv preprint, Aug 2025
- URL: https://arxiv.org/abs/2410.06703

## Core Intent
- Research question (1 sentence): How can we benchmark web agents on enterprise-style tasks while explicitly measuring whether they satisfy layered safety and trustworthiness policies rather than just finishing the task?
- Main claim (1 sentence): ST-WebAgentBench couples 222 WebArena-style tasks with 646 policy instances across six safety dimensions, introduces CuP/pCuP/Risk Ratio metrics, and shows current open agents fail to comply, so policy-aware evaluation is necessary.
- Evidence type expected (experiments/theory/benchmark/etc.): Benchmark construction plus empirical evaluation of existing agents.
- Key assumptions required for claim to hold: (i) The selected GitLab, ShoppingAdmin, and SuiteCRM tasks and handcrafted policies adequately proxy enterprise workflows (§3.4, Table 2); (ii) policy templates and evaluators faithfully capture the intended constraints (Tables 5–15); (iii) BrowserGym observations plus POLICY_CONTEXT blocks accurately inform agents without altering their base behavior (§4.1); (iv) one-off benchmark runs on three agents are representative of broader agent classes (Fig. 2).

## Reading Focus
- What to pay attention to first: Bench design (policy hierarchy, six dimensions, metrics in §3.1–§3.3), benchmark statistics (Table 2), experimental results/ablations (Fig. 2, Table 3, Appendix C) showing CuP vs CR gaps.
- What can be ignored in first pass: Detailed JSON/YAML policy templates and evaluator listings in Appendix D/F unless verifying implementation specifics; long related-work survey (§2) can be skimmed initially.
