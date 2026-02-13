# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| τ-Bench [40] | Earlier benchmark checks policy compliance for function calling but not whether every helper-service step matches an SOP graph; SOPBench adds directed action graphs plus oracle scoring for intermediate steps. (`paper.txt:514-518`) | Better: richer procedural verification; Worse: τ-Bench may use more realistic APIs. |
| ComplexFuncBench [47] | Also evaluates constraint adherence, yet SOPBench contributes seven domains with executable helper tools and multi-dimensional judges. (`paper.txt:514-518`) | Better: larger tool coverage and automated oracle; Worse: narrower task diversity. |
| SOP-Agent [41] | Provides SOP-guided agent architecture, whereas SOPBench turns SOP compliance into an evaluation target for arbitrary agents. (`paper.txt:503-510`) | Better: benchmark can stress any agent; Worse: does not offer assistance mechanisms like SOP-Agent. |
| CodeAgent [44] | Demonstrates SOP usage in coding workflows; SOPBench generalizes the idea to customer-service tools and automated scoring. (`paper.txt:503-510`) | Better: evaluation infrastructure; Worse: less domain expertise in programming tasks. |
| RuleBench / RuleArena [29,49] | Focused on textual rule-following; SOPBench extends the idea to tool-mediated actions with databases. (`paper.txt:519-526`) | Better: actions visibly change state; Worse: limited rule forms (mostly AND/OR/chain). |

## Novelty Judgment
- New: Executable SOP-directed graphs plus rule-based judges that simultaneously check outcomes and procedure completeness for tool-using agents. (`paper.txt:68-244`)
- Incremental: Uses standard LLM agents (FC/ReAct) and constraint permutation similar to prior rule benchmarks. (`paper.txt:281-304`,`paper.txt:824-900`)
- Repackaged: Reframes SOP-guided ideas from prior agent works into a benchmark offering, not a new controller. (`paper.txt:503-518`)

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental
- Why: Provides valuable infrastructure plus empirical comparisons (Table 3, Figures 5–9) but does not introduce new algorithms or theoretical guarantees. (`paper.txt:311-499`)
