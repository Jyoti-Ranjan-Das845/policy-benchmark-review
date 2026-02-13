# 07 Synthesis Note

## What This Paper Establishes
- Binary classification guardrails trained on a purpose-built dataset can reach ≥90% accuracy and 87.6% F1 while running in ~22 ms, outperforming both safety-focused guardrails and much larger foundation models (Tab. 2).
- POLICYGUARDBENCH supplies ~60k balanced pairs with cross-subdomain coverage and supports both full-trajectory and prefix-based evaluations, enabling systematic study of early violation detection (Tab. 1 & 3).
- POLICYGUARD-4B maintains ~91% OOD accuracy under leave-one-domain-out splits and offers the highest EA-F1 among tested systems, showing generalization and efficiency are not mutually exclusive (Tab. 4–5).

## What Remains Uncertain
- Whether GPT-generated policies match real organizational constraints or omit critical edge cases.
- How noisy automated annotations are and whether errors bias trained models toward particular action patterns (§3.1).
- The effect of deploying POLICYGUARD-4B in live agent loops, including user experience when the guardrail interrupts tasks.

## What to Trust
- Comparative metrics derived directly from the shared benchmark—Tables 2–5 give concrete accuracy, latency, and OOD numbers under clearly described setups (§4).
- Dataset statistics in Tab. 1, which enumerate domains, source/target splits, and violation balance, appear internally consistent with the described curation process (§3.2).

## What Not to Trust Yet
- Claims that the model enforces “policy compliance” in practice; policies are synthetic, and no integration with real agents or human policy owners is demonstrated.
- Any implication that the approach handles adversarial or conflicting policies—the dataset intentionally filters for atomic, clean rules (§3.1).

## Carry-Forward Notes for Cross-Paper Synthesis
- Treat POLICYGUARDBENCH results as an offline baseline; when comparing with other guardrail papers, note whether they operate on synthetic policy/trajectory datasets or live agent environments, and adjust evaluations accordingly.
- Look for future work combining this dataset with formal verification (e.g., SHIELDAGENT) or adaptive guardrails (e.g., AGRAIL) to assess complementary strengths and gaps.
