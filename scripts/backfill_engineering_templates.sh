#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

for paper_dir in "$repo_root"/papers/*; do
  [[ -d "$paper_dir" ]] || continue

  declare -a files=(
    "08_engineering_internals.md"
    "09_mermaid_diagrams.md"
    "10_metric_semantics.md"
    "11_adopt_adapt_reject.md"
  )

  for file in "${files[@]}"; do
    if [[ ! -f "$paper_dir/$file" ]]; then
      cp "$repo_root/templates/$file" "$paper_dir/$file"
      echo "Added: ${paper_dir#$repo_root/}/$file"
    fi
  done
done
