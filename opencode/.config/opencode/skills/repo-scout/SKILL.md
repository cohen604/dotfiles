---
name: repo-scout
description: Locate the smallest relevant code, tests, conventions, and project knowledge for a requested change.
---

# Repository Scout

## Procedure

1. Read the closest applicable `AGENTS.md` and repository contribution guidance.
2. Inspect worktree status before drawing conclusions from files.
3. Search by domain concept, public symbol, route, error text, configuration key, and related tests.
4. Trace the relevant call path and data flow far enough to identify contracts and side effects.
5. Search `docs/architecture/`, `docs/decisions/`, `docs/domain/`, and operational runbooks when present.
6. Identify documented build, lint, typecheck, and focused test commands.
7. Stop when the implementation boundary is clear; do not catalog the whole repository.

## Output

- Relevant files and why they matter
- Current behavior and call path
- Existing tests and reusable patterns
- Applicable ADRs, invariants, and conventions
- Likely change boundary
- Unknowns requiring research or clarification
- Worktree conditions that must be preserved
