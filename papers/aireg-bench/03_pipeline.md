# 03 Method and Evaluation Pipeline

## System Pipeline
- Inputs: Intended-use prompts covering eight high-risk scenarios plus the relevant EU AI Act article text (Arts. 9, 10, 12, 14, 15) and compliance steering instructions (one-third compliant, two-thirds non-compliant). 
- Policy representation: Single-article extracts from the AIA, provided verbatim to gpt-4.1-mini during violation/profile and documentation prompts so that each excerpt encodes obligations tied to that article only (`paper.txt:197-215`, `paper.txt:248-269`, `paper.txt:1684-1695`). 
- Agent/planner components: Three sequential gpt-4.1-mini prompts—system overview generator, violation/compliance profile generator, and documentation generator—forming the controllable pipeline shown in Figure 2 (`paper.txt:176-305`). 
- Tools/environment: OpenAI API (gpt-4.1-mini) orchestrated via scripted prompts, plus post-generation plausibility filtering by legal experts; no retrieval or external tooling permitted during generation. 
- Output/action: 120 excerpt-length technical documentation sections, each framed as provider-authored material focused on one article/use-case pair with embedded compliance or violation details ready for annotation. 

## Evaluation Pipeline
- Dataset/task source: AIReg-Bench excerpts, each evaluated under a single AIA article with triple human Likert labels for compliance and plausibility (Tables 1 & 8; `paper.txt:320-366`). 
- Policy/constraint setup: LLM annotators receive the same excerpt plus article text and are instructed (Appendix F) to output compliance Likert scores and justifications without external tools, mirroring human conditions except for web access (`paper.txt:367-384`). 
- Baselines: Ten frontier proprietary models (GPT-5, GPT-4o, o3 family, Claude Sonnet 4, Gemini 2.5 Pro/Flash, Gemma 3, Grok 4/3 mini) plus two fine-tuned Saul legal models; ablations remove tone prompts or article text (Tables 2, 4, 5). 
- Metrics/judging: Quadratically weighted Cohen’s κ, Spearman’s ρ, mean absolute error, bias (signed difference), F1 for compliant vs. non-compliant, and alternative annotator test statistics (Tables 2–4 & 7; Figure 3). 
- Reported outcomes: Gemini 2.5 Pro reaches κw=0.863 and MAE=0.458 with 60% exact matches, while o3 mini bottoms out at κw=0.624; removing article text drops GPT-4o κw to 0.654; Saul-54B trails frontier κ (0.596) showing open models lag behind (`paper.txt:404-481`, `paper.txt:1531-1554`, `paper.txt:1564-1677`). 

## Stage-by-Stage Analysis
1. System overview drafting: establishes realistic AI provider settings before injecting compliance instructions; choosing gpt-4.1-mini balances cost and coherence, but any template repetition or hallucinated providers could leak unrealistic priors that bias downstream annotations (`paper.txt:176-193`). 
2. Compliance profile creation: guides the model toward specific violation/compliance patterns per article so the dataset spans varied failure modes; realism hinges on the initial quotation/guideline pairings, so weakly specified guidelines risk producing trivial or impossible violations (`paper.txt:197-215`, `paper.txt:1684-1709`). 
3. Documentation excerpt generation: converts profiles into show-don’t-tell narratives, making the benchmark feel like actual technical documentation; key choice is constraining perspective to the provider and one article, but this can omit cross-article dependencies and may oversimplify multi-obligation reasoning (`paper.txt:248-269`). 
4. Human plausibility/compliance annotation: validates construct validity and produces ground-truth Likert labels; although triple annotation mitigates variance, Krippendorff’s α=0.651 indicates subjectivity, so disagreements or annotator bias (-0.917/+0.600) can inject noise into training/evaluation (`paper.txt:320-366`). 
5. LLM evaluation runs: measures how closely models mimic expert medians with consistent prompts; design choice to forbid external tools keeps runs comparable but underestimates performance of RAG-based compliance systems, and prompt sensitivity (Table 4) shows failure points if instructions drift. 
