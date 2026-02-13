# 09 Mermaid Diagrams

## Component Diagram
```mermaid
graph TD
  A["Agent"] --> B["Orchestrator"]
  C["User Simulator"] --> B
  B --> D["Environment"]
  D --> E["Tool Layer"]
  D --> F["State Store"]
  B --> G["Evaluator"]
```

## Interaction Sequence
```mermaid
sequenceDiagram
  participant U as "User Simulator"
  participant O as "Orchestrator"
  participant A as "Agent"
  participant E as "Environment"

  U->>O: "User message"
  O->>A: "Forward message"
  A->>O: "Tool call or reply"
  O->>E: "Execute tool call"
  E-->>O: "Tool result"
  O-->>A: "Result"
```

## Evaluation Flow
```mermaid
flowchart LR
  T["Trajectory"] --> C["Checks"]
  C --> DB["State Assertions"]
  C --> ACT["Action Matching"]
  C --> COM["Communication Checks"]
  DB --> S["Score"]
  ACT --> S
  COM --> S
```

## Notes
- Replace generic nodes with benchmark-specific components.
- Keep diagrams faithful to code and paper artifacts.
