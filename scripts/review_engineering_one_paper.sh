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

for f in 08_engineering_internals.md 09_mermaid_diagrams.md 10_metric_semantics.md 11_adopt_adapt_reject.md; do
  [[ -f "$paper_dir/$f" ]] || cp "$repo_root/templates/$f" "$paper_dir/$f"
done

status_file="$paper_dir/.status_engineering"
echo "RUNNING" > "$status_file"

prompt_file="$paper_dir/review_prompt_engineering.md"
cat > "$prompt_file" <<EOP
You are performing engineering-depth analysis for one research benchmark paper in this directory.

Sources:
- Prefer paper.txt if present.
- Use paper.pdf as backup.
- If a local code repository exists in ./repo, inspect it and cite concrete paths.

Task:
Fill these files with concrete, evidence-linked content:
1) 08_engineering_internals.md
2) 09_mermaid_diagrams.md
3) 10_metric_semantics.md
4) 11_adopt_adapt_reject.md

Rules:
- Keep existing section structure.
- Use exact file/function references when source repo is available.
- Mermaid diagrams must be benchmark-specific, not generic placeholders.
- Do not invent unavailable artifacts.
- Do not create extra output files besides editing the four markdown files.
EOP

if codex exec --full-auto -C "$paper_dir" "$(cat "$prompt_file")"; then
  echo "DONE" > "$status_file"
  echo "Completed engineering review: $slug"
else
  echo "FAILED" > "$status_file"
  echo "Failed engineering review: $slug" >&2
  exit 1
fi
