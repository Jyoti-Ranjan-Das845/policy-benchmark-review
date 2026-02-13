# 02 Argument Map

## Claim -> Method -> Evidence -> Conclusion
- Claim: LLMs deployed with contextual security policies cannot reliably prevent leakage, especially when indirect queries are posed (paper.txt:120-152,535-549).
- Method element tied to claim: Constructed CoPriva benchmark from QMSum transcripts with GPT-4.1-generated confidential/non-confidential targets, rule-based direct attacks, and QMSum-derived indirect attacks; evaluated 10 LLMs with GPT-4.1-as-judge leakage and faithfulness scoring (paper.txt:244-455,470-520).
- Evidence artifact(s): Dataset statistics (Table 4), model performance table (Table 5), and analytical figures on leakage vs. faithfulness, context, policy presence, domain, and reasoning traces (Figures 3–8) (paper.txt:429-719).
- Conclusion drawn by authors: Even top proprietary and reasoning models leak over 40% of the time on indirect attacks, and mitigation attempts only modestly help, so better contextual policy enforcement techniques are urgently needed (paper.txt:535-721,785-803).

## Assumptions vs Demonstrations
- Explicitly demonstrated: Scale and composition of CoPriva; quantitative leakage/faithfulness metrics for 10 LLMs; comparative analyses of leakage factors and mitigation strategies (paper.txt:429-719).
- Assumed but not demonstrated: GPT-4.1 policy generation/LLM judging are accurate proxies for human policy authors and auditors; QMSum transcripts generalize to other sensitive domains; example policies/discussion summaries fully capture all confidential spans (paper.txt:260-455,804-819).

## Logical Gaps
- Gap 1: No human evaluation of leakage beyond subset verification, so dependence on GPT-4.1 as judge may bias leakage rates yet this uncertainty is not quantified (paper.txt:421-455).
- Gap 2: Mitigation strategies are only tested on GPT-4o-mini with indirect attacks, leaving it unclear whether conclusions about revision prompting generalize across models or real deployment setups (paper.txt:698-721).
