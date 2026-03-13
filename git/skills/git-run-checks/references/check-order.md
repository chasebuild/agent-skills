# Check Command Selection

Use this precedence:

1. `make check`
2. `npm run check` / `pnpm run check` / `yarn check` / `bun run check`
3. `npm run verify` / `pnpm run verify` / `yarn verify` / `bun run verify`
4. Script fan-out:
   - `lint`
   - `typecheck`
   - `test`
   - `build`
5. Language fallback checks:
   - Rust: `cargo fmt --all -- --check`, `cargo clippy --all-targets --all-features -- -D warnings`, `cargo test --all-features`
   - Go: `go test ./...`
   - Python: `pytest`

If no applicable checks are found, fail closed and request a project-specific check command.
