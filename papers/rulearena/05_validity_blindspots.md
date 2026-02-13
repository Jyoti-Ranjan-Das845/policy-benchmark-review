# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - Problem-wise precision/recall/AC/Acc (Sec. 3.4) track whether predicted rules match those in the curated solution scripts; they capture rule selection/execution but assume the reference rule set and parser labels are correct. Because rule usage is inferred via GPT-4o (App. C), errors in structured extraction could inflate/deflate metrics unrelated to actual policy following, so construct validity depends on the unverified auto-judge.

## Internal Validity
- Potential confounders/leakage:
  - Prompting: Only one CoT template with optional single example is reported (Sec. 4.1); if some models need different instructions or tool access, observed failures may be prompt-induced rather than capability limits.
  - Parser bias: GPT-4o both competes with and scores other models; without calibration, systematic over/under-counting of rules could bias recall/precision comparisons (Sec. 3.4, App. C).
  - Ground-truth scripts: Airline/tax answers come from custom scripts (Sec. 3.2); coding bugs or outdated policy tables would skew accuracy numbers.

## External Validity
- Generalization limits (tasks/models/policies):
  - Domains limited to U.S. airline baggage, NBA trades, and IRS taxes (Sec. 3.1); regulatory language in other industries or jurisdictions may have different structure.
  - Only long-context proprietary or large open LLMs are benchmarked; smaller instruction models or agentic systems with retrieval/tools may perform differently.
  - Policies frozen at collection time—real-world updates (e.g., annual tax table changes) are not represented, so real deployments needing temporal adaptation remain untested.

## Robustness Coverage
- Adversarial prompts: Not designed—the user instances are procedurally generated or annotated clean cases (Sec. 3.2), so adversarial phrasing is absent.
- Ambiguous/conflicting policies: Only briefly discussed via “similar rules” in NBA precision analysis (Table 7); no dedicated stress tests on contradictory clauses.
- Long-horizon behavior: Maximum difficulty increases number of rules per instance (Table 2), but there is no exploration of multi-turn interactions or sustained dialogues.
- Tool-use constraints: Main experiments forbid external calculators even though authors note oracle math/logical tools help (Abstract, Sec. 4), so robustness to tool availability is unknown.

## Reproducibility
- Missing implementation/eval details:
  - The paper omits exact prompts, sampling temperature, and parsing hyperparameters for GPT-4o (Sec. 4.1, App. C), making replication of CoT traces and structured outputs difficult.
  - NBA annotations rely on trained annotators (App. B.2) but no inter-annotator agreement or released templates are provided, so reproducing the exact dataset may require substantial guesswork.
  - Scripts transforming IRS and airline tables into executable rules are not described or shared, so verifying ground-truth computations would require reverse engineering (Sec. 3.2).

## Top Blind Spots
1. Reliance on GPT-4o as both competitor and evaluator without validation data leaves measurement error unquantified (Sec. 3.4, App. C).
2. The benchmark excludes scenarios where rules conflict or evolve over time, yet real deployments must resolve such dynamics.
3. Only single-turn text inputs are tested, so any agentic scaffolding (retrieval, planning, external calculators) remains unexplored even though authors claim tool help is significant (Abstract, Sec. 4.3).
