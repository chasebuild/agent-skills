# agent-skills

Reusable skills repository for `npx skills add`.

## Install

```bash
npx skills add https://github.com/chasebuild/agent-skills
```

You can also install from a local clone:

```bash
npx skills add .
```

## Included Skill Sets

- Git workflow skills:
  - `git-workflow-orchestrator`
  - `git-run-checks`
  - `git-atomic-commit`
  - `git-conventional-commit`
  - `git-pr-workflow`
- Rust skills imported from `actionbook/rust-skills` under `skills/`
- Agent reference files required by imported Rust skills under `agents/`

## Guarantees

- Commit flow enforces checks-before-commit guidance.
- Commit history guidance is atomic + Conventional Commits.
- PR workflow guidance includes validation evidence and risk reporting.

## Maintenance

Sync upstream Rust skills:

```bash
./scripts/sync-rust-skills.sh /path/to/rust-skills
```

Validate all skills:

```bash
./scripts/validate-all-skills.sh
```

## Sources

- Rust skills upstream: https://github.com/actionbook/rust-skills
- Boris thread reference: https://x.com/bcherny/status/2007179832300581177
