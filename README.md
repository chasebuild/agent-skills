# agent-skills

Reusable skills repository for `npx skills add`.

## Install a Skill Group

Install Git skills:

```bash
npx skills add vercel-labs/agent-skills/git
```

Install Rust skills:

```bash
npx skills add vercel-labs/agent-skills/rust
```

Install React skills:

```bash
npx skills add vercel-labs/agent-skills/react
```

Install context-engineering skills:

```bash
npx skills add vercel-labs/agent-skills/context-engineering
```

Install from a local clone:

```bash
npx skills add ./context-engineering
npx skills add ./git
npx skills add ./react
npx skills add ./rust
```

Each top-level group is an installable root with its own `skills/` directory. The Rust group also includes its required `agents/` directory.

## Groups

`context-engineering`

- Mirrored skills from `muratcankoylan/Agent-Skills-for-Context-Engineering`
- `advanced-evaluation`
- `bdi-mental-states`
- `context-compression`
- `context-degradation`
- `context-fundamentals`
- `context-optimization`
- `evaluation`
- `filesystem-context`
- `hosted-agents`
- `memory-systems`
- `multi-agent-patterns`
- `project-development`
- `tool-design`

`git`

- `git-workflow-orchestrator`
- `git-run-checks`
- `git-atomic-commit`
- `git-conventional-commit`
- `git-pr-workflow`

`react`

- Mirrored React-related skills from `vercel-labs/agent-skills`
- `composition-patterns`
- `react-best-practices`
- `react-native-skills`
- `web-design-guidelines`

`rust`

- Rust skills imported from `actionbook/rust-skills`
- Shared agent reference files required by those Rust skills

## Guarantees

- Commit flow enforces checks-before-commit guidance.
- Commit history guidance is atomic plus Conventional Commits.
- PR workflow guidance includes validation evidence and risk reporting.

## Maintenance

Sync upstream Rust skills into `rust/`:

```bash
./scripts/sync-rust-skills.sh /path/to/rust-skills
```

Validate every skill group:

```bash
./scripts/validate-all-skills.sh
```

## Sources

- Context engineering skills upstream: https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering
- Rust skills upstream: https://github.com/actionbook/rust-skills
- React skills upstream: https://github.com/vercel-labs/agent-skills
- Boris thread reference: https://x.com/bcherny/status/2007179832300581177
