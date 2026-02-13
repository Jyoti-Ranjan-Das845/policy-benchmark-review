# 09 Mermaid Diagrams

## Component Diagram
```mermaid
graph TD
  TG["Task Generator\nAtomic init/solution/assert combos\n(2285 telecom tasks)"] --> SCN["Scenario Packet\nUser Intent + Persona + Policy"]
  SCN -->|LiteLLM prompts| AG["Agent\nfunction-calling LLM\nOriginal/Workflow Policy"]
  SCN -->|LiteLLM prompts| US["User Simulator\nfunction-calling LLM\nScenario instruction"]
  AG -->|6 write + 7 read| AT["Agent Tool Suite\nCRM DB (customers/lines/plans)"]
  US -->|15 write + 15 read| UT["User Tool Suite\nMock Device DB (signal/SIM/data)"]
  AT --> WS["Shared State S = Sworld ⊗ Shistory"]
  UT --> WS
  WS --> EVT["Assertion Evaluator\npass^k, persona/intent slices"]
  AG --> WS
  US --> WS
```

_Source: dual-control Dec-POMDP with distinct agent/user tools, telecom task program synthesis, and assertion-based evaluation [paper.txt:217-370][paper.txt:295-358]._

## Interaction Sequence
```mermaid
sequenceDiagram
  participant User as "User Simulator"
  participant Agent as "Agent"
  participant ATools as "Agent Tools"
  participant UTools as "User Tools"

  User->>Agent: "No Service on phone" (persona instruction)
  Agent->>ATools: call get_customer_by_phone("555-123-2002")
  ATools-->>Agent: CRM record (customer_id C1001)
  Agent->>User: "Check airplane mode & status bar"
  User->>UTools: get_network_status()
  UTools-->>User: Airplane Mode ON, SIM invalid
  User->>Agent: Reports findings
  Agent->>User: "Turn off airplane mode"
  User->>UTools: toggle_airplane_mode()
  UTools-->>User: Mode OFF but still No Signal
  User->>Agent: Status update
  Agent->>User: "Reseat SIM card"
  User->>UTools: reseat_sim_card()
  UTools-->>User: SIM active, signal restored
  User->>Agent: Confirms connectivity; tool log closes assertions
```

_Sequence derived from Appendix A.3 telecom trajectory showing alternating tool calls/messages in Default mode [paper.txt:1038-1120]._

## Evaluation Flow
```mermaid
flowchart LR
  subgraph Execution
    RUN["k deterministic runs per task\n(temp=0, k<=4)"]
    RUN --> HIST["Shistory Logs\nmessages + tool traces"]
  end
  HIST --> ASRT["Assertion Runner\n(telecom uses status assertions only)"]
  ASRT --> PASS["pass^k Calculator\nDefault / No-User / Oracle Plan"]
  PASS --> SLICE["Analytics\nper intent, persona, action-count bins"]
  SLICE --> RPTS["Reports & Figures\npass^k curves, drop-off >7 actions"]
```

_Evaluation uses deterministic LiteLLM runs, history logs, and assertion-only success checks for telecom, producing pass^k curves by mode/issue/persona/action length [paper.txt:360-585][paper.txt:588-789]._
