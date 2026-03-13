#!/usr/bin/env bash
set -euo pipefail

upstream_root="${1:-/tmp/rust-skills}"
target_root="rust"

if [ ! -d "$upstream_root/skills" ]; then
  echo "Expected upstream skills at: $upstream_root/skills" >&2
  echo "Clone with: git clone https://github.com/actionbook/rust-skills.git /tmp/rust-skills" >&2
  exit 1
fi

mkdir -p "$target_root/skills" "$target_root/agents"

for skill_dir in "$upstream_root"/skills/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  echo "Syncing skill: $skill_name"
  rm -rf "$target_root/skills/$skill_name"
  cp -R "$skill_dir" "$target_root/skills/$skill_name"
done

echo "Syncing Rust agents/"
rm -rf "$target_root/agents"
cp -R "$upstream_root/agents" "$target_root/agents"

echo "Done. Run ./scripts/validate-all-skills.sh next."
