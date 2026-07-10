---
name: implementation
description: Implement an approved plan with controlled scope, dirty-worktree safety, tests, and documentation updates.
---

# Implementation

## Procedure

1. Confirm the approved scope and inspect worktree status.
2. Read every target file and its relevant tests before editing.
3. Preserve unrelated user changes and established repository patterns.
4. Make the smallest coherent change that satisfies the acceptance criteria.
5. Add or update tests at the behavior boundary affected by the change.
6. Update approved ADRs, architecture documents, or runbooks in the same change.
7. Run focused checks, inspect the diff, then run broader checks justified by the blast radius.

## Boundaries

- Do not introduce speculative abstractions.
- Do not refactor unrelated code.
- Do not weaken tests to make them pass.
- Do not commit, push, create a pull request, mutate tickets, release, or deploy.
- Stop and report when the approved plan is invalidated by repository evidence.

## Report

- Files and behavior changed
- Acceptance criteria satisfied
- Tests and commands run with outcomes
- Project knowledge changed
- Residual risks and unverified areas
