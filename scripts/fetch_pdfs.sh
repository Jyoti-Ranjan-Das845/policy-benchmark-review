#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
index_csv="$repo_root/papers/index.csv"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required" >&2
  exit 1
fi

if [[ ! -f "$index_csv" ]]; then
  echo "Missing index: $index_csv" >&2
  exit 1
fi

tail -n +2 "$index_csv" | while IFS=, read -r slug title url year owner status notes; do
  slug="${slug//\"/}"
  url="${url//\"/}"
  [[ -z "$slug" || -z "$url" ]] && continue

  paper_dir="$repo_root/papers/$slug"
  pdf_path="$paper_dir/paper.pdf"

  if [[ ! -d "$paper_dir" ]]; then
    echo "Skipping $slug (missing directory)"
    continue
  fi

  if [[ -f "$pdf_path" ]]; then
    echo "Exists: papers/$slug/paper.pdf"
    continue
  fi

  echo "Downloading $slug"
  if ! curl -L --fail --silent --show-error "$url" -o "$pdf_path"; then
    echo "Failed to download $slug from $url" >&2
    rm -f "$pdf_path"
  fi
done
