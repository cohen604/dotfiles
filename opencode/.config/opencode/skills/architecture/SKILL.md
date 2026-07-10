---
name: architecture
description: Turn a Work Brief and repository evidence into an implementation-ready, risk-aware plan with acceptance and knowledge mapping.
---

# Architecture

## Procedure

1. Reconcile the Work Brief with current repository behavior.
2. Identify affected interfaces, data models, state transitions, failure modes, and operational behavior.
3. Prefer existing boundaries and patterns unless they cannot satisfy the requirement.
4. Consider backward compatibility, migrations, security, observability, rollout, and rollback where relevant.
5. Map each acceptance criterion to a code change and verification method.
6. Identify required documentation or ADR changes using the `project-knowledge` skill.
7. Separate required work from optional follow-up improvements.

## Plan Contract

- Summary and assumptions
- Current behavior
- Proposed design and affected boundaries
- Ordered implementation steps with likely files
- Acceptance-criterion mapping
- Test and verification strategy
- Risks, rollout, and rollback
- Project-knowledge impact
- Open questions and explicit approval checkpoint

Do not edit files while producing the plan.
