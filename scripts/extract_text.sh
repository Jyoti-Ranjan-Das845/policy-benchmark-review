#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

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

  if command -v pdftotext >/dev/null 2>&1; then
    pdftotext "$pdf" "$txt"
    continue
  fi

  if [[ -x "$repo_root/.venv/bin/python" ]]; then
    "$repo_root/.venv/bin/python" - "$pdf" "$txt" <<'PY'
import sys
from pathlib import Path
from pypdf import PdfReader

pdf_path = Path(sys.argv[1])
txt_path = Path(sys.argv[2])

reader = PdfReader(str(pdf_path))
pages = []
for page in reader.pages:
    pages.append(page.extract_text() or "")

txt_path.write_text("\n\n".join(pages), encoding="utf-8")
PY
    continue
  fi

  echo "No extractor available. Install poppler (pdftotext) or create .venv with pypdf." >&2
  exit 1
done
