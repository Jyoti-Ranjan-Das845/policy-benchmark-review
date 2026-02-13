# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: For each episode the agent receives the domain policy markdown as a system prompt plus the live dialogue history with the LM-simulated user who starts from a task instruction defining identity, intent, and preferences (§3, Figure 2d).
- Policy representation: Policies encode textual rules about databases, procedures, and constraints (e.g., baggage allowances, return eligibility) and are injected verbatim into the system message (§3, Figure 2c).
- Agent/planner components: Agents are zero-shot LLMs (function-calling, ReAct, or Act) that decide whether to respond to the user or call a tool at every turn; the pass^k analysis re-runs the same task with different stochastic samples (§5).
- Tools/environment: Deterministic Python API tools that read/write JSON databases of users, products/orders, or flights/reservations (Figure 2a–b, Table 4) form the environment; tool outputs are appended to agent context but hidden from the user.
- Output/action: Success is measured by the final database write actions (transaction log) and whether mandated information (e.g., refund amounts) appears verbatim in user-facing replies (§3).

## Evaluation Pipeline
- Dataset/task source: Two domains—τ-retail (115 tasks) and τ-airline (50 tasks)—are derived from hand-designed schemas plus LM-generated entries and manually verified task annotations ensuring unique outcomes (Table 1, §4).
- Policy/constraint setup: Each domain ships with domain-specific policy documents and fixed tool definitions; trials cap at 30 agent actions, agent temperature 0.0, user temperature 1.0 to induce diverse conversations (§5).
- Baselines: 12 proprietary and open models including gpt-4o/-turbo/-32k, claude-3 variants, Gemini-1.5, Mistral Large, Mixtral-8x22B, and Llama-3-70B, tested mainly via function calling plus ReAct/Act ablations (§5.1, Figure 3).
- Metrics/judging: pass^1 (average reward) and pass^k (probability all k trials succeed) computed from rule-based reward raction×routput; cost estimates also reported (§3, §5.1).
- Reported outcomes: Table 2 shows top pass^1≈61% (retail) and 35% (airline), pass^8 falls below 25% even for gpt-4o (Figure 4), and failure analyses attribute errors to wrong arguments/info, rule violations, and partial resolutions (Figure 5–6, Table 3).

## Stage-by-Stage Analysis
- Stage I (manual schema/policy design): Necessary to ensure coherent databases, realistic APIs, and enforceable rules; choice to simplify real industries keeps annotation feasible but risks omitting edge-case logic (§4).
- Stage II (LM data generation): Scales user/product/flight entries via GPT-4-authored sampling scripts, maintaining diversity; potential failure if LM-generated data introduce inconsistencies or biases that policy text misses (§4).
- Stage III (manual task annotation & validation): Guarantees each instruction has a single correct set of write actions and required user-facing strings; annotators iteratively run gpt-4-turbo FC traces (>40 trials per τ-retail task in Figure 7) to detect ambiguous instructions, so failures can arise if alternative valid strategies remain undiscovered or later schema tweaks desynchronize user instructions and ground-truth actions (§4, Figure 2d).
