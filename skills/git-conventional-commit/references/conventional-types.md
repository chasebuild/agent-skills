# Conventional Commit Type Matrix

- `feat(auth): add token refresh endpoint`
- `fix(parser): handle empty input line`
- `refactor(cache): extract eviction policy interface`
- `perf(api): batch user lookup by tenant`
- `test(worker): add retry exhaustion scenario`
- `docs(readme): clarify local setup steps`
- `build(deps): bump serde to 1.0.220`
- `ci(actions): add rust stable matrix`
- `chore(repo): normalize editorconfig`

Breaking change example:

`feat(api)!: remove v1 session endpoint`

Footer:

`BREAKING CHANGE: clients must migrate to /v2/sessions`
