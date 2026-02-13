# 07 Synthesis Note

## What This Paper Establishes
- LLMs conditioned on explicit policies still leak sensitive info when probed indirectly, as shown by the >40-point gap between direct and indirect leakage across 10 models (paper.txt:470-540).
- CoPriva offers a reproducible recipe—QMSum transcripts + GPT-4.1-generated Pc/Pn targets + rule-based attacks—to stress contextual confidentiality at scale (paper.txt:244-320,429-468).

## What Remains Uncertain
- Whether GPT-4.1 judgments accurately reflect human red-team assessments or merely align with GPT-style phrasing (paper.txt:421-455).
- How leakage behaves in multi-turn, tool-using, or non-meeting contexts, which the benchmark does not cover (paper.txt:249-320,535-596).
- Generality of mitigation strategies since only GPT-4o-mini was tested and improvements were modest (paper.txt:698-721).

## What to Trust
- Quantitative dataset statistics (Table 4) and the stark leakage rates in Table 5 rest on straightforward counts and binary judgements, so the relative vulnerability ranking across models is credible (paper.txt:429-520).
- Qualitative insights that domains like committee meetings leak more and that restricting context spans can worsen leakage follow directly from Figures 5–7 (paper.txt:582-655).

## What Not to Trust Yet
- Claims tying leakage to faithfulness or policy presence depend on descriptive plots without statistical tests, so causal interpretations remain speculative (paper.txt:520-607).
- Mitigation conclusions extrapolated from a single-model ablation lack evidence that the same prompts would help other systems (paper.txt:698-721).

## Carry-Forward Notes for Cross-Paper Synthesis
- Treat CoPriva as a stress test for policy obedience but pair it with human auditing or alternative judges when comparing future defenses.
- When evaluating new safeguards, report both indirect leakage rates and faithfulness to ensure improvements are not simply refusing to answer Pn content.
