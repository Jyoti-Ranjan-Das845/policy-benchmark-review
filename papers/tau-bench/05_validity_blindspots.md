# 05 Validity and Blind Spots

## Construct Validity
- Does metric really measure policy following?
  - Reward only checks that final database state matches the annotated “unique” outcome and that required substrings appear in user replies (§3); it does not actually verify that the agent obtained explicit confirmations, complied with all timing rules, or explained reasoning to the user, so agents could technically violate policy text yet still score r=1.
  - pass^k captures stochastic consistency across replays but assumes the LM user’s variability reflects real conversations; without human traces or adversarial perturbations, the metric may overestimate consistency in the wild (§5.1).

## Internal Validity
- Potential confounders/leakage:
  - Same policy text is shared between evaluation and agent prompting, so improvements might stem from memorizing instructions rather than genuine reasoning (§5.2).
  - The LM user sees only agent-facing dialogue; if the user prompt inadvertently mirrors ground-truth actions (Figure 2d), agents could implicitly infer the correct outcome, blurring causality.
  - Tool schemas and examples appear inside the system prompt; models pretrained on similar code snippets (e.g., toolformer-style corpora) may recognize patterns, yielding inflated scores compared with fresh tools.

## External Validity
- Generalization limits (tasks/models/policies):
  - Only two domains (retail and airline) with synthetic data are provided (Table 1), so generalizing to other industries, multilingual contexts, or noisy databases remains untested.
  - User simulation is GPT-4-0613 with stylized instructions (§3); real customers might inject sarcasm, corrections, or multi-modal data absent here.
  - The benchmark assumes policies are static Markdown documents; many deployments involve evolving regulations or partially observable rules.

## Robustness Coverage
- Adversarial prompts: Not evaluated—users follow scripted intents and temperature 1.0 sampling but never intentionally try to jailbreak the agent (§3).
- Ambiguous/conflicting policies: Annotators aim for unique outcomes (§4), so agents are rarely tested on conflicting guidelines; yet real policies often contain grey areas.
- Long-horizon behavior: Tasks are capped at 30 agent actions (§5), so extremely long workflows or multi-session handoffs are outside scope.
- Tool-use constraints: Tools are deterministic and always available; outages, latency, or partial permissions—key issues for Ops teams—are missing (Table 4).

## Reproducibility
- Missing implementation/eval details:
  - The paper specifies temperatures, action limits, and tool lists (§5, Table 4), but full prompts for every domain plus scripts for routput string checking are relegated to the GitHub reference; replicators need that artifact.
  - Cost analysis assumes specific API pricing ($0.38/$0.23 per retail trial) (§5.1); running locally with different models may change budgets substantially.

## Top Blind Spots
1. Human realism: No user studies confirm that the GPT-4 simulator produces representative or adversarial behavior, so conclusions about real customer-facing reliability remain speculative.
2. Policy adherence auditing: Since the reward ignores conversational justifications, there is no guardrail against agents silently executing actions without the mandated confirmations (explicitly mentioned in policies).
3. Domain breadth: With only synthetic retail/airline data, it is unclear whether pass^k trends hold in higher-stakes settings (e.g., finance, healthcare) or multimodal tools.
