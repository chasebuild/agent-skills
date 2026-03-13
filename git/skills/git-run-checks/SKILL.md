---
name: git-run-checks
description: Run repository checks before every commit and before opening a PR. Use when asked to "run checks", "validate changes", "verify before commit", or "pre-commit" in any codebase.
---

# Git Run Checks

Always run checks before creating a commit. If checks fail, do not commit.

## Workflow

1. Identify the project toolchain from files in the repo root.
2. Execute the highest-signal check command available.
3. If no single check command exists, run lint, typecheck, test, and build scripts in that order.
4. Stop at first failure, report root cause, fix, and rerun.
5. Only proceed to commit after all required checks pass.

## Preferred Check Order

- `make check` when available.
- JavaScript/TypeScript: `check` or `verify`, otherwise `lint`, `typecheck`, `test`, `build`.
- Rust: `cargo fmt --all -- --check`, `cargo clippy --all-targets --all-features -- -D warnings`, `cargo test --all-features`.
- Go: `go test ./...`.
- Python: `pytest`.

See `./references/check-order.md` for exact command mapping.

## Optional Helper Script

Use `./scripts/run-project-checks.sh` from the project root to auto-detect and run checks.

## Boris-Inspired Operating Rules

- Read and understand current state before running commands.
- Keep command output concise and action-oriented.
- Run verification in tight loops after each meaningful change.
- Reuse project-native commands instead of inventing new ones.
- State assumptions when check coverage is incomplete.

## Claude Mapping (Optional)

- If hooks are configured, wire this skill into pre-commit or pre-push hooks.
- If slash commands are available, expose a `/check` command that calls the helper script.
