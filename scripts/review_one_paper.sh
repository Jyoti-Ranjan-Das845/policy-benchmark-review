#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <paper_slug>" >&2
  exit 1
fi

slug="$1"
repo_root="$(cd "$(dirname "$0")/.." && pwd)"
paper_dir="$repo_root/papers/$slug"

if [[ ! -d "$paper_dir" ]]; then
  echo "Missing paper directory: papers/$slug" >&2
  exit 1
fi

if [[ ! -f "$paper_dir/paper.txt" && ! -f "$paper_dir/paper.pdf" ]]; then
  echo "Missing source document for $slug (paper.txt or paper.pdf)" >&2
  exit 1
fi

if ! command -v codex >/dev/null 2>&1; then
  echo "codex CLI is required to run automated review agents." >&2
  exit 1
fi

status_file="$paper_dir/.status"
echo "RUNNING" > "$status_file"

prompt_file="$paper_dir/review_prompt.md"
cat > "$prompt_file" <<EOP
You are analyzing exactly one research paper in this directory.

Sources:
- Prefer \`paper.txt\` if present.
- Otherwise use \`paper.pdf\`.

Task:
Complete all seven markdown files with deep, evidence-linked analysis:
1. 01_intent.md
2. 02_argument_map.md
3. 03_pipeline.md
4. 04_evidence_audit.md
5. 05_validity_blindspots.md
6. 06_local_positioning.md
7. 07_synthesis.md

Rules:
- Keep the existing section structure in each file.
- Be concrete and cite tables/figures/sections where possible.
- Do not invent citations not present in the paper.
- Do not create extra output files besides editing the seven markdown files.
EOP

if codex exec --full-auto -C "$paper_dir" "$(cat "$prompt_file")"; then
  echo "DONE" > "$status_file"
  echo "Completed: $slug"
else
  echo "FAILED" > "$status_file"
  echo "Failed: $slug" >&2
  exit 1
fi
