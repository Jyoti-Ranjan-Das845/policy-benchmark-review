# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| WebShop (Yao et al., 2022) | Extends beyond static product catalogs by adding LM-simulated users, deterministic APIs with both read/write actions, and explicit policy documents requiring rule following (§1, Figure 1). | Better: richer interaction loop and policy adherence checks; Worse: only two domains vs broader web browsing scope. |
| WebArena (Zhou et al., 2023) | Focuses on closed-form transactional APIs and enforced final database states instead of open web navigation, trading breadth for precise automatic evaluation (§1). | Better: faithful success labels via database diff; Worse: omits the messy DOM/world that WebArena captures. |
| LM-Emulated Sandbox for risk assessment (Ruan et al., 2023) | Replaces purely evaluator-focused sandboxes with full benchmarks that pit LLM agents against LM users to measure pass^k reliability (§2–§3). | Better: produces quantitative reliability curves and policy-aware tasks; Worse: still synthetic and lacks explicit safety stress tests. |
| Toolformer (Schick et al., 2023) / Berkeley Function Calling leaderboard | Rather than proposing new tool-learning methods, τ-bench supplies standardized, policy-rich tasks for evaluating any function-calling agent (§5). | Better: task diversity and user interaction; Worse: no new algorithmic advances beyond benchmark design. |

## Novelty Judgment
- New: Definition of pass^k for agent consistency and integration of LM-simulated users with policy documents for benchmarking (§3, Figure 4).
- Incremental: Uses existing LM tooling (function calling, ReAct) as baselines rather than novel algorithms; construction pipeline largely combines known data-generation techniques (§4).
- Repackaged: Failure analysis repurposes standard qualitative auditing but grounds it in τ-bench specifics (§5.2).

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental benchmark paper.
- Why: Provides a well-documented, reproducible evaluation suite with insightful empirical comparisons (Tables 1–3, Figures 3–6), but relies on synthetic domains and proxy metrics, so it stops short of being a foundational standard.
