# Boris-Inspired Coding Agent Practices

Source: public thread by Boris Cherny (Claude Code) plus linked guidance.

## Core Practices

1. Code as little as possible; prefer the smallest valid change.
2. Read and reason before editing.
3. Plan tool usage and keep command output concise.
4. Parallelize only independent tasks.
5. Ground decisions in available context: code, docs, errors, tests.
6. Verify continuously (lint/tests/checks) during iteration.
7. Surface assumptions, uncertainty, and risks clearly.
8. Reuse proven local patterns before inventing new structures.

## Application to Git Workflows

- Run checks before each commit and before PR submission.
- Keep commits narrow so verification and rollback remain cheap.
- Keep PR narrative explicit about validation and risk.
