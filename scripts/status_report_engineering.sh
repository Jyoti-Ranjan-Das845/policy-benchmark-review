#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

echo "slug,engineering_status"
for d in "$repo_root"/papers/*; do
  [[ -d "$d" ]] || continue
  slug="$(basename "$d")"
  if [[ -f "$d/.status_engineering" ]]; then
    status="$(cat "$d/.status_engineering")"
  else
    status="TODO"
  fi
  echo "$slug,$status"
done
