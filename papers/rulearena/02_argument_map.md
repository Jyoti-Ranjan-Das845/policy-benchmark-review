# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: LLMs that handle 20k-token prompts still fail to follow authentic real-world rules, so new benchmarks and metrics are needed (Sec. 1, Sec. 4).
- Method element tied to claim: Construct RULE ARENA with 95 curated rules across airline, NBA, and tax domains, generate/annotate 816 problems with ground-truth scripts or expert labels, and evaluate long-context LLMs with CoT reasoning plus structured parsing of their outputs (Sec. 3.1–3.4, Sec. 4.1, App. B–C).
- Evidence artifact(s): Dataset statistics (Table 1–2), main problem-wise results (Table 3), rule-wise statistics and figures (Fig. 2, Table 4–7), and diagnostic analyses on prompting/representation (Sec. 4.3.1).
- Conclusion drawn by authors: Even frontier reasoning models such as o1-preview reach only ~50–60% accuracy on the easiest level and degrade sharply on harder settings, primarily because they miss relevant rules rather than misapplying them, signaling a need for research on rule recall and aggregation (Sec. 4.2–4.3).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Benchmark coverage and difficulty distribution (Sec. 3.1–3.3); calculation of rule-level and problem-level metrics from parsed outputs (Sec. 3.4); empirical failure rates across models/prompts (Table 3); systematic weaknesses such as neglecting non-essential rules or compositional operations (Table 5–6).
- Assumed but not demonstrated: Reliability of GPT-4o structured extraction for scoring (App. C); correctness of automatically scripted ground truths and NBA annotator judgments; representativeness of the three domains for “real-world” rule following; that CoT plus 1-shot prompts reflect best practices for each closed-source model.

## Logical Gaps
- Gap 1: The paper does not quantify parser accuracy or inter-rater agreement for the rule-usage matrix, so metric validity hinges on an unverified auto-judge (Sec. 3.4, App. C).
- Gap 2: No ablation compares benchmark-derived insights with actual downstream deployments (e.g., airline chatbots), leaving unclear whether low scores translate to practical failure rates beyond the specific synthetic/annotated instances.
