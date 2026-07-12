---
description: Run independent code and performance reviews of current changes or a supplied base reference.
agent: lead
---

Review the current repository changes. Treat `$ARGUMENTS` as an optional base reference, ticket key, or focus area.

Invoke `reviewer` and `performance-reviewer` as separate, read-only passes. Use the ticket and approved plan from session context when available. Otherwise infer intent only from repository evidence and state the limitation. Report each agent's findings independently, ordered by severity, without editing files.
