# 06 Local Positioning Against Prior Work

## Closest Papers (3-5)
| Paper | What This Paper Changes | Better/Worse Than Prior |
|---|---|---|
| Makovec et al. 2024 (RAG-enhanced GPT-4 compliance predictor) | Moves upstream from single-tool demo to standardized benchmark with curated synthetic documentation and human labels so others can compare models on the same data (`paper.txt:452-456`). | + Provides shared dataset/metrics; – still lacks retrieval and richer context Makovec explored. |
| Davvetas et al. 2025 (TAI Scan minimal-input risk classifier) | Focuses on detailed technical documentation excerpts rather than metadata-only inputs, enabling article-level compliance scoring comparisons (`paper.txt:456-459`). | + Richer input artifacts and agreement metrics; – does not evaluate risk-level classification breadth. |
| Kővári et al. 2025 (self-assessment chatbot) | Replaces interactive chatbot UX with offline benchmark to quantify underlying assessment fidelity before user interaction (`paper.txt:459-462`). | + Enables reproducible scoring; – drops multi-turn conversational assistance. |
| Li et al. 2025 (LLMs decide prohibited/permitted/out-of-scope) | Narrows to AIA high-risk articles with fine-grained Likert scoring instead of coarse categorical outputs (`paper.txt:462-465`). | + Higher-resolution labels and expert baseline; – less coverage of overall Act scope. |
| Sovrano et al. 2025 (LLM-assisted documentation drafting) | Uses similar generation insight but extends it to a full benchmark plus evaluation of downstream compliance scorers, not just drafting support (`paper.txt:181-185`, `paper.txt:488-490`). | + Adds expert annotations and scoring pipeline; – documentation realism still synthetic. |

## Novelty Judgment
- New: First open benchmark specifically for EU AI Act compliance scoring with synthetic-yet-plausibility-vetted documentation and human Likert labels (`paper.txt:120-215`, `paper.txt:248-271`). 
- Incremental: Builds on existing ideas of using LLMs for compliance or documentation but contributes the evaluation suite plus ablations (`paper.txt:404-481`, `paper.txt:1531-1563`). 
- Repackaged: Literature review largely reiterates prior AIR compliance tooling landscape without new theoretical framing (`paper.txt:448-516`). 

## Paper-Level Assessment
- Foundational / Useful incremental / Weak evidence: Useful incremental. 
- Why: Provides a needed dataset + baseline comparisons that the community can reuse, but relies on synthetic data with moderate annotator agreement, so it stops short of foundational proof that LLMs can replace compliance teams (`paper.txt:320-366`, `paper.txt:404-481`, `paper.txt:679-736`).
