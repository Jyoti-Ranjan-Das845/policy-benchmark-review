# 07 Synthesis Note

## What This Paper Establishes
- Realistic rule-guided reasoning remains difficult: Across airline, NBA, and tax tasks, even o1-preview peaks at 0.63 accuracy on the easiest airline level and often <0.3 on harder NBA/tax levels despite perfect precision (Table 3, Sec. 4.2.1).
- Failure modes are diagnosable: Rule-wise metrics surface that non-essential rules are frequently skipped (Table 5) and compositional aggregations suffer poor correctness (Table 6), providing concrete targets for model or system design.
- Benchmark infrastructure is in place: RULE ARENA defines 95 authentic policies with difficulty tiers and structured scoring interfaces (Sec. 3.1–3.4, App. B–C), enabling reproducible comparison among long-context LLMs.

## What Remains Uncertain
- Reliability of the GPT-4o parser that underpins all per-rule metrics is unreported (Sec. 3.4), so conclusions about recall bottlenecks could change with human auditing.
- The impact of alternative prompting, retrieval, or tool-augmented agents is unexplored even though authors note oracle tools help (Abstract, Sec. 4.3).
- How well benchmark scores extrapolate to real deployments (airline chatbots, NBA contract review, tax prep) is unknown because no field study or downstream evaluation is provided.

## What to Trust
- Descriptive statistics (Tables 1–2) and the main accuracy/recall gaps (Table 3) rest on transparent generation scripts and numerically large sample sizes, so comparative performance rankings across models and difficulty tiers are credible.

## What Not to Trust Yet
- Fine-grained rule-level diagnoses (Tables 5–7, Fig. 2) depend on unvalidated auto-parsing and omit numeric recall/correctness values, so treat the categorical insights (e.g., “non-essential rules are missed”) as hypotheses needing manual confirmation.
- Claims about correlation strength between recall and accuracy (Sec. 4.3.1) lack coefficients or plots, so the supposed “almost linear” relationship should be empirically verified.

## Carry-Forward Notes for Cross-Paper Synthesis
- When comparing rule-following datasets, note that RULE ARENA stresses long-context policy digestion while providing structured scoring; however, its scope is narrow and assumes a capable parser. Cross-paper synthesis should therefore weigh parser-backed metrics against human-judged ones and consider whether observed bottlenecks (e.g., skipping optional fees) recur in other benchmarks.
