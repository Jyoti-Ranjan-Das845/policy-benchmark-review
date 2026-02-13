# 07 Synthesis Note

## What This Paper Establishes
- Provides a reproducible pipeline (Figure 2) that synthesizes 120 single-article technical documentation excerpts for five EU AI Act obligations, each annotated by three legal experts for compliance and plausibility, yielding balanced label distributions (Tables 1 & 8; `paper.txt:176-305`, `paper.txt:320-395`, `paper.txt:1684-1690`). 
- Benchmarks ten frontier LLMs (plus two legal fine-tunes) on this dataset under matched prompts, reporting κw, ρ, MAE, bias, F1, and alternative annotator metrics; Gemini 2.5 Pro tops the chart with κw=0.863/MAE=0.458 while o3 mini lags (`paper.txt:367-481`, `paper.txt:1515-1556`, `paper.txt:1670-1678`). 
- Shows prompt context matters: removing article text or using harsher tones worsens GPT-4o agreement, highlighting sensitivity to evaluation setup (Table 4; `paper.txt:1531-1554`). 

## What Remains Uncertain
- Whether synthetic excerpts—even with plausibility medians of 4/5 and α=0.651—match the complexity of real provider documentation or courtroom interpretations (`paper.txt:248-271`, `paper.txt:320-366`). 
- How models would behave in multi-turn, tool-assisted compliance workflows that regulators actually run, since benchmark interactions are one-shot with no retrieval (`paper.txt:367-384`, `paper.txt:723-736`). 
- Transferability to other AIA articles (e.g., Art. 11) or other jurisdictions’ AIR remains speculative (`paper.txt:197-215`, `paper.txt:679-686`). 

## What to Trust
- Quantitative agreement gaps between models: κw/MAE/F1 comparisons directly computed across identical tasks are solid and expose model ordering (Table 2; Table 3). 
- Evidence that article text access plus calibrated tone prompts meaningfully boost accuracy, because ablation deltas are large and methodologically clean (Table 4). 
- Distributional statistics of compliance vs. plausibility labels, since every excerpt receives three human scores and tables report all 360 entries (Tables 1 & 8). 

## What Not to Trust Yet
- Any claim that these LLMs are audit-ready replacements for compliance assessors—annotations are subjective, biased, and rooted in synthetic artifacts (`paper.txt:352-366`). 
- Extrapolations to regulation types beyond the covered AIA articles or to longitudinal monitoring, which the benchmark does not test (`paper.txt:679-736`). 
- Assertions that fine-tuned legal models cannot catch up; only Saul variants were tested and formatting issues limited their showing (`paper.txt:1555-1563`). 

## Carry-Forward Notes for Cross-Paper Synthesis
- Use AIReg-Bench results as a baseline when evaluating retrieval-augmented or tool-using compliance agents; compare whether adding real documentation or multi-turn dialogue closes the κw gap the authors observed. 
- Track construct-validity improvements—future work using actual provider filings or harmonized standards could confirm whether the synthetic approach here correlates with regulatory outcomes (`paper.txt:679-708`). 
- When comparing papers, note whether they control for prompt tone/article access like Table 4; failure to do so may confound model rankings on policy-compliance evaluations.
