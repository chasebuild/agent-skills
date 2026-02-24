#!/usr/bin/env bash
set -euo pipefail

base_ref="${1:-HEAD}"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Run this inside a git repository." >&2
  exit 1
fi

if git rev-parse "$base_ref" >/dev/null 2>&1; then
  files="$(git diff --name-only "$base_ref")"
else
  files="$(git diff --name-only)"
fi

if [ -z "$files" ]; then
  echo "No changed files found."
  exit 0
fi

echo "Suggested slices by top-level path:"
# Group by first path segment, handling root files as '.'
printf '%s\n' "$files" | awk -F/ '{print (NF==1?".":$1)}' | sort | uniq -c | while read -r count group; do
  echo "- $group ($count files)"
  printf '%s\n' "$files" | awk -v g="$group" -F/ '{k=(NF==1?".":$1); if (k==g) print "  - "$0}'
done
