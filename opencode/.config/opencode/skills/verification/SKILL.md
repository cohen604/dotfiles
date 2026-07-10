---
name: verification
description: Select and run focused then broad checks, mapping concrete evidence to acceptance criteria without editing files.
---

# Verification

## Procedure

1. Discover documented commands from `AGENTS.md`, contribution docs, manifests, and CI configuration.
2. Start with the narrowest test, lint, typecheck, or build command that covers the change.
3. Expand verification according to shared-contract and blast-radius risk.
4. Inspect the final diff and worktree status.
5. Map test evidence to acceptance criteria.
6. Distinguish change-induced failures from environment or pre-existing failures, with evidence.

Do not edit files, update snapshots, or regenerate fixtures unless that was explicitly approved as implementation work.

## Report

- Commands run and outcomes
- Acceptance criteria directly verified
- Behavior verified only by inspection
- Failures and likely ownership
- Checks not run and why
- Residual risk
