#!/usr/bin/env bash
set -euo pipefail

repo_root="${1:-$(pwd)}"
cd "$repo_root"

run_cmd() {
  echo "+ $*"
  "$@"
}

has_pkg_script() {
  local script_name="$1"
  rg -q "\"${script_name}\"\\s*:" package.json
}

pick_node_pm() {
  if [ -f pnpm-lock.yaml ] && command -v pnpm >/dev/null 2>&1; then
    echo "pnpm"
  elif [ -f yarn.lock ] && command -v yarn >/dev/null 2>&1; then
    echo "yarn"
  elif [ -f bun.lockb ] && command -v bun >/dev/null 2>&1; then
    echo "bun"
  elif command -v npm >/dev/null 2>&1; then
    echo "npm"
  else
    echo ""
  fi
}

run_pkg_script() {
  local pm="$1"
  local script_name="$2"
  if [ "$pm" = "yarn" ]; then
    run_cmd yarn "$script_name"
  else
    run_cmd "$pm" run "$script_name"
  fi
}

if [ -f Makefile ] && rg -q '^check:' Makefile; then
  run_cmd make check
  exit 0
fi

if [ -f package.json ]; then
  pm="$(pick_node_pm)"
  if [ -z "$pm" ]; then
    echo "Found package.json but no Node package manager is installed." >&2
    exit 1
  fi

  if has_pkg_script check; then
    run_pkg_script "$pm" check
    exit 0
  fi

  if has_pkg_script verify; then
    run_pkg_script "$pm" verify
    exit 0
  fi

  found_any=0
  for script_name in lint typecheck test build; do
    if has_pkg_script "$script_name"; then
      found_any=1
      run_pkg_script "$pm" "$script_name"
    fi
  done

  if [ "$found_any" -eq 1 ]; then
    exit 0
  fi
fi

if [ -f Cargo.toml ] && command -v cargo >/dev/null 2>&1; then
  run_cmd cargo fmt --all -- --check
  run_cmd cargo clippy --all-targets --all-features -- -D warnings
  run_cmd cargo test --all-features
  exit 0
fi

if [ -f go.mod ] && command -v go >/dev/null 2>&1; then
  run_cmd go test ./...
  exit 0
fi

if { [ -f pyproject.toml ] || [ -f setup.py ] || [ -f requirements.txt ]; } && command -v pytest >/dev/null 2>&1; then
  run_cmd pytest
  exit 0
fi

echo "No supported check workflow detected. Define a project check command and rerun." >&2
exit 1
