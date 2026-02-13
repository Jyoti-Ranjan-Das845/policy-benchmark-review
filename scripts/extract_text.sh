#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

if ! command -v pdftotext >/dev/null 2>&1; then
  echo "pdftotext is not installed. Install poppler to enable PDF text extraction." >&2
  exit 1
fi

for paper_dir in "$repo_root"/papers/*; do
  [[ -d "$paper_dir" ]] || continue
  pdf="$paper_dir/paper.pdf"
  txt="$paper_dir/paper.txt"
  [[ -f "$pdf" ]] || continue
  if [[ -f "$txt" ]]; then
    echo "Exists: ${txt#$repo_root/}"
    continue
  fi
  echo "Extracting: ${paper_dir#$repo_root/}"
  pdftotext "$pdf" "$txt"
done
