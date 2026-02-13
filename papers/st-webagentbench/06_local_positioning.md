# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| WebArena / VisualWebArena [Zhou et al., 2024; Koh et al., 2024] | Layers explicit policy templates, POLICY_CONTEXT prompts, and CuP/Risk metrics on top of their online environments. | Better: adds safety/trustworthiness scoring and human-in-the-loop actions (Table 1, §3.5). Worse: covers only 222 tasks versus 800–900+ in WebArena/VisualWebArena and lacks their rich visual grounding. |
| WorkArena / WorkArena++ [Drouin et al., 2024; Boisvert et al., 2024] | Targets similar enterprise workflows but augments them with six safety dimensions and evaluator templates. | Better: enforces user consent, strict execution, hierarchy, robustness, and error handling that WorkArena does not score (Table 2). Worse: evaluates only three agents, whereas WorkArena reports larger sweeps. |
| SafeAgentBench / Agent-SafetyBench [Yin et al., 2024; Zhang et al., 2024] | Moves from synthetic tool-use hazards to live web apps whose policies are grounded in DOM selectors and logs. | Better: ties each violation to concrete UI actions and policy metadata (§3.5, Fig. 2). Worse: focuses narrowly on enterprise web UIs instead of the broader unsafe-instruction taxonomy those suites probe. |
| GuardAgent / SteP policy controllers [Xiang et al., 2024; Sodhi et al., 2024] | Instead of proposing a controller, provides an application-agnostic benchmark against which controllers can be compared. | Better: evaluation layer can score any policy-aware controller by counting CuP and Risk (POLICY_CONTEXT, §4.2). Worse: offers no new mitigation algorithm, so practitioners still need GuardAgent/SteP-like methods to improve scores. |

## Novelty Judgment
- New: Introduces CuP/pCuP/Risk Ratio metrics plus reusable policy/evaluator templates integrated into BrowserGym (§3.3–§3.5).
- Incremental: Builds on existing WebArena/WorkArena tasks and repurposes known applications, so novelty lies in the policy overlay rather than new environments (Table 2).
- Repackaged: Related-work framing consolidates familiar critiques of completion-only benchmarks without adding theoretical advances (§2).

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental
- Why: Provides concrete measurement infrastructure and illustrative baseline gaps (Fig. 2, Table 3), yet evidence breadth is limited by the small agent pool and handcrafted policy scope, keeping the work from foundational status.
