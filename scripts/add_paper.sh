#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <slug> <title> <url> [year] [owner] [notes]" >&2
  exit 1
fi

slug="$1"
title="$2"
url="$3"
year="${4:-}"
owner="${5:-}"
notes="${6:-}"
status="todo"

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
paper_dir="$repo_root/papers/$slug"

if [[ -d "$paper_dir" ]]; then
  echo "Paper directory already exists: $paper_dir" >&2
  exit 1
fi

mkdir -p "$paper_dir"

cat > "$paper_dir/meta.yaml" <<META
title: "$title"
url: "$url"
year: "$year"
owner: "$owner"
status: "$status"
notes: "$notes"
META

cp "$repo_root/templates/01_intent.md" "$paper_dir/01_intent.md"
cp "$repo_root/templates/02_argument_map.md" "$paper_dir/02_argument_map.md"
cp "$repo_root/templates/03_pipeline.md" "$paper_dir/03_pipeline.md"
cp "$repo_root/templates/04_evidence_audit.md" "$paper_dir/04_evidence_audit.md"
cp "$repo_root/templates/05_validity_blindspots.md" "$paper_dir/05_validity_blindspots.md"
cp "$repo_root/templates/06_local_positioning.md" "$paper_dir/06_local_positioning.md"
cp "$repo_root/templates/07_synthesis.md" "$paper_dir/07_synthesis.md"

printf '%s,"%s",%s,%s,%s,%s,"%s"\n' "$slug" "$title" "$url" "$year" "$owner" "$status" "$notes" >> "$repo_root/papers/index.csv"

echo "Created paper scaffold: papers/$slug"
