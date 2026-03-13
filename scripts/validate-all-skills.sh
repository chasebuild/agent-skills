#!/usr/bin/env bash
set -euo pipefail

group_roots=()

for candidate in */; do
  [ -d "$candidate" ] || continue
  candidate="${candidate%/}"
  if [ -d "$candidate/skills" ]; then
    group_roots+=("$candidate")
  fi
done

if [ "${#group_roots[@]}" -eq 0 ]; then
  echo "No skill group directories found" >&2
  exit 1
fi

status=0

for group_dir in "${group_roots[@]}"; do
  [ -d "$group_dir" ] || continue

  if [ ! -d "$group_dir/skills" ]; then
    echo "ERROR: missing skills/ directory in $group_dir" >&2
    status=1
    continue
  fi

  for skill_dir in "$group_dir"/skills/*; do
    [ -d "$skill_dir" ] || continue
    skill_file="$skill_dir/SKILL.md"

    if [ ! -f "$skill_file" ]; then
      echo "ERROR: missing SKILL.md in $skill_dir" >&2
      status=1
      continue
    fi

    if ! head -n 1 "$skill_file" | rg -q '^---$'; then
      echo "ERROR: frontmatter start separator missing in $skill_file" >&2
      status=1
      continue
    fi

    frontmatter="$(
      awk '
        NR == 1 { next }
        /^---$/ { exit 0 }
        { print }
      ' "$skill_file"
    )"

    if [ -z "$frontmatter" ]; then
      echo "ERROR: empty frontmatter in $skill_file" >&2
      status=1
      continue
    fi

    if ! printf '%s\n' "$frontmatter" | rg -q '^name:'; then
      echo "ERROR: name field missing in $skill_file" >&2
      status=1
    fi

    if ! printf '%s\n' "$frontmatter" | rg -q '^description:'; then
      echo "WARN: description field missing in $skill_file (allowed for internal skills)" >&2
    fi
  done
done

for helper in \
  git/skills/git-run-checks/scripts/run-project-checks.sh \
  git/skills/git-atomic-commit/scripts/suggest-slices.sh \
  git/skills/git-conventional-commit/scripts/compose-conventional-commit.sh \
  git/skills/git-pr-workflow/scripts/pr-checklist.sh \
  scripts/sync-rust-skills.sh \
  scripts/validate-all-skills.sh; do
  if [ ! -x "$helper" ]; then
    echo "ERROR: helper script is not executable: $helper" >&2
    status=1
  fi
done

if [ "$status" -ne 0 ]; then
  echo "Validation failed." >&2
  exit 1
fi

echo "Validation passed."
