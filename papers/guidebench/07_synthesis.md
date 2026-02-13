# 07 Synthesis Note

## What This Paper Establishes
- GUIDE BENCH offers a documented pipeline that scales to 1,272 human-verified tasks across seven operational domains, combining LLM synthesis with expert review (paper.txt:118-169, 349-489).
- Comparative evaluation of 18 LLMs highlights consistent deficits in math guideline following and shows that explicit guidelines plus CoT reasoning materially influence outcomes (paper.txt:512-848, 700-813).

## What Remains Uncertain
- Whether synthetic, Chinese-language tasks transfer to other languages or real operational systems, which the authors themselves flag as a limitation (paper.txt:870-878).
- Fidelity of GPT-4-based response parsing and rule filtering, since no accuracy or robustness analysis of those auxiliary models is provided (paper.txt:392-427, 607-610).

## What to Trust
- Reported accuracy/precision/recall numbers from Table 1, and focused ablations such as CoT vs no-CoT or rule-conversion strategies, because each is directly backed by quantitative evidence (paper.txt:512-536, 700-813).
- The conclusion that math tasks remain hardest, supported independently by introduction framing and detailed per-model metrics (paper.txt:136-142, 512-520).

## What Not to Trust Yet
- Claims that closed-source models are unsuitable for operational scenarios rely on access considerations rather than deployment tests (paper.txt:833-839).
- Implicit assurances that guideline edits fully mimic real-world regulatory updates lack user studies or longitudinal validation (paper.txt:428-453).

## Carry-Forward Notes for Cross-Paper Synthesis
- Treat GUIDE BENCH as a useful stress test for domain-rule compliance, especially math-heavy coupon calculations, but pair it with real-world logs or multilingual datasets when assessing broader policy-following claims (paper.txt:349-489, 833-848).
