# 07 Synthesis Note

## What This Paper Establishes
- Dynamic, user-authored policies can be encoded as free-form text plus dialogues and used to train open-weight guardians that beat prior baselines on both bespoke and traditional safety benchmarks (Sections 3–4, Table 3).
- A synthetic-yet-validated policy dataset (61.5k train / 543 test) with disjoint rule banks and multi-turn contexts is feasible to build and shows measurable difficulty gradients (Figure 2, Table 2, Table 8–9).
- Dual-mode decoding that separates reasoning traces from fast answers is practical: non-CoT DynaGuard-8B is only ~1 F1 point behind reasoning mode while enabling explanations when requested (Table 3).

## What Remains Uncertain
- Whether these guardians remain accurate, fast, and trusted when auditing real human chats, especially longer conversations or multimodal outputs absent from Table 2.
- How explanations interact with human reviewers or autonomous systems beyond the single IFEval/Ministral demo (Table 6) and the toy revision case study.
- The extent to which weaknesses identified in Figure 3 and Table 10 (counting, factual knowledge, multi-clause rules) can be mitigated through additional data or architectural tweaks.

## What to Trust
- Relative F1 rankings among open-weight guardian models because Table 3 details the datasets, and Appendix A.10 provides seed counts/variance, making the comparisons reproducible.
- Reported dataset characteristics and label reliability—policy and dialogue length distributions (Table 2) plus human agreement metrics (Table 8–9) are concrete and checkable once the release is available.

## What Not to Trust Yet
- Claims that DynaGuard “provides critical tooling for language-model guardrails” in enterprise deployments: no latency benchmarks, human studies, or third-party audits are provided.
- Assertions that explanations consistently enable recovery in downstream agents; evidence is limited to one synthetic benchmark (Table 6) without ablations on explanation quality or feedback loops.

## Carry-Forward Notes for Cross-Paper Synthesis
- When comparing guardian approaches across papers, track whether datasets cover bespoke business rules (as DynaBench does) or only safety ontologies—this affects generalization claims.
- Map failure modes (Figure 3, Table 10–11) against other works’ blind spots to see whether combining datasets or training regimes could cover counting/factual-policy weaknesses.
