# 11 Adopt-Adapt-Reject Decision

## Component Decision Table
| Component | Decision (Adopt/Adapt/Reject) | Why | Engineering Effort (L/M/H) | Risk (L/M/H) | Immediate Next Step |
|---|---|---|---|---|---|
| Dual-control Dec-POMDP runtime (LiteLLM agent + user simulators with alternating tool actions) | Adopt | Clean separation of agent/user action spaces with shared state enables realistic troubleshooting flows and exposes ~20 point performance drops when the agent must guide a controller-sharing user, which mirrors production support loads [paper.txt:200-255][paper.txt:468-585] | M | M | Prototype telecom-style scenario to ensure our tool APIs map cleanly into Sworld/Shistory tracking. |
| Compositional task generator (atomic init/solution/assert chaining) | Adapt | Provides scalable coverage (2285 tasks before subsampling) with automatic solvability checks, but atomic subtasks and assertions must be rewritten for our domain schemas and policies [paper.txt:320-346] | H | M | Inventory our domain primitives, design equivalent init/solution/assert functions, and port generator scripts. |
| Policy document variants (original vs workflow prompts) | Adapt | Demonstrated that workflow policies help Default/No-User modes but can degrade Oracle Plan, so we should tailor prompt granularity per mode and model [paper.txt:566-574] | M | L | Run A/B tests on our policies to find when explicit workflows help vs confuse agents with precomputed plans. |
| Persona-aware user simulator with constrained tool set | Adopt | Tool-mediated personas cut simulator errors to 16% (6% critical) vs 40–47% for previous domains, giving a reliable harness for user diversity [paper.txt:151-157][paper.txt:353-358][paper.txt:790-817] | M | M | Define personas aligned with our customer profiles and implement matching tool subsets/output vocab. |
| Multi-mode evaluation (Default / No-User / Oracle Plan + action-count/intent slices) | Adopt | These slices isolate reasoning vs coordination regressions and highlight long-horizon collapse (pass^1→0 when >7 actions), giving actionable diagnostics [paper.txt:468-638] | L | L | Extend our evaluator to log pass^k per mode and per action-count bin before shipping. |

## Reuse Priorities (30-60-90 Days)
- 30 days: Stand up the dual-control runtime with placeholder tools, add Default vs No-User evaluation paths, and replicate telecom sample tasks end-to-end.
- 60 days: Port the compositional task generator + persona prompts to our schema, and calibrate workflow vs original policy documents per operating mode.
- 90 days: Expand analytics (action-count/intent bins, persona slices), harden simulator QA audits, and automate Oracle Plan derivation from generator traces.

## Hard No-Go Areas
- Do not import legacy single-control simulator assets (retail/airline) without redesigning their user toolsets—those setups exhibited 40–47% simulator error rates with double-digit critical mistakes, undermining benchmark credibility [paper.txt:790-817].
