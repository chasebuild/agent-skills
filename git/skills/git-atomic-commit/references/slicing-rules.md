# Commit Slicing Heuristics

Use separate commits for:

- File moves/renames without content changes
- Pure formatting changes
- Public API changes
- Internal refactors with no behavior changes
- Feature behavior changes
- Test additions/updates
- Documentation or release notes

If in doubt, split more. You can squash later, but you cannot easily recover review clarity from a mixed commit.
