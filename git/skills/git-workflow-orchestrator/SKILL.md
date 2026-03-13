---
name: git-workflow-orchestrator
description: Route end-to-end Git execution across checks, atomic commits, conventional messages, and PR preparation. Use when the user asks for full Git workflow management from changes to PR.
---

# Git Workflow Orchestrator

Use this skill to coordinate the full flow. Delegate to specialized skills instead of mixing all logic in one prompt.

## Routing Rules

- "Run checks" -> `git-run-checks`
- "Split commits" or "atomic commit" -> `git-atomic-commit`
- "Write commit message" or "conventional commit" -> `git-conventional-commit`
- "Open/prepare PR" -> `git-pr-workflow`

## Default End-to-End Sequence

1. Inspect branch + diff.
2. Run `git-run-checks`.
3. Split and create atomic commits (`git-atomic-commit`).
4. Apply Conventional Commits (`git-conventional-commit`).
5. Rerun checks.
6. Prepare PR (`git-pr-workflow`).

## Non-Negotiable Rule

Never create a commit before checks pass on the relevant change slice.

## Boris-Inspired Guidance

See `./references/boris-best-practices.md` and enforce these principles across all delegated skills.

## Cross-Agent Notes

- Base workflow is agent-agnostic.
- Claude-specific slash commands and hooks are optional overlays, not required primitives.
