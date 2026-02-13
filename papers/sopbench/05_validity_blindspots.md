# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following? Multi-dimensional scoring (permissibility, oracle DB outcome, SOP completeness) targets procedural compliance, yet it assumes the handcrafted constraints capture every safety rule and that helper-function coverage is complete; latent policy nuances outside the directed action graph remain invisible. (`paper.txt:200-244`)

## Internal Validity
- Potential confounders/leakage: Synthetic databases, helper tools, and verifier code are authored by the benchmark team, so any bias or bug transfers simultaneously to both oracle and agent toolsets, potentially masking systematic mistakes (shared schema leakage). (`paper.txt:773-809`) The tool-set ablation (Figure 5) also shows context length sensitivity, meaning that observed failures may reflect prompt packing rather than SOP reasoning alone. (`paper.txt:368-378`)

## External Validity
- Generalization limits (tasks/models/policies): SOPBench emulates only seven customer-service domains with constraint-conjunction workflows and acknowledges exclusion of other control-flow patterns (e.g., IF-THEN-ELSE), so pass rates may not transfer to real enterprises with richer interactions or multi-turn user exchanges. (`paper.txt:535-545`)

## Robustness Coverage
- Adversarial prompts: Only a single “use the most appropriate tool asap” jailbreak is tested on two domains, leaving other attack styles unexplored. (`paper.txt:368-414`)
- Ambiguous/conflicting policies: All SOPs are deterministic and fully specified; the benchmark does not probe how agents resolve conflicting constraints or unclear guidance. (`paper.txt:200-244`)
- Long-horizon behavior: Max trajectory length is 20 tool calls, and constraint graphs rarely exceed six steps (Figure 9), so extreme long-horizon planning is untested. (`paper.txt:299-304`,`paper.txt:465-499`)
- Tool-use constraints: Agents always have access to the same helper/service APIs as the oracle; no experiments restrict tools, rate-limit calls, or inject latency/errors. (`paper.txt:250-304`)

## Reproducibility
- Missing implementation/eval details: While the paper lists models and tool-calling methods, it omits exact prompt templates for proprietary FC runs, retry heuristics beyond “up to five times,” and seeds/logging needed to replicate pass rates. (`paper.txt:281-304`)

## Top Blind Spots
1. Reliance on synthetic SOPs and data without human validation of realism may misrepresent actual compliance difficulty. (`paper.txt:773-809`)
2. Limited adversarial coverage risks overestimating robustness or underestimating failure modes present in more varied attacks. (`paper.txt:368-414`)
3. Absence of human-evaluated baselines or statistical significance leaves it unclear whether small differences between models (e.g., 2–3% gaps) are meaningful. (`paper.txt:311-351`)
