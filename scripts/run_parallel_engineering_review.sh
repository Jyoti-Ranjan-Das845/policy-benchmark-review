#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
workers="${1:-3}"

find "$repo_root/papers" -mindepth 1 -maxdepth 1 -type d -print0 \
  | xargs -0 -n1 -P"$workers" -I{} bash -lc '
      slug="$(basename "$1")"
      "$2/scripts/review_engineering_one_paper.sh" "$slug"
    ' _ {} "$repo_root"
