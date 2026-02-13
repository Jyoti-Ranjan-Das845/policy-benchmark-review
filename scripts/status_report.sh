#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"

echo "slug,status"
for d in "$repo_root"/papers/*; do
  [[ -d "$d" ]] || continue
  slug="$(basename "$d")"
  if [[ -f "$d/.status" ]]; then
    status="$(cat "$d/.status")"
  else
    status="TODO"
  fi
  echo "$slug,$status"
done
