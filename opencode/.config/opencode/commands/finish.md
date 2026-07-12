---
description: Verify completed work, assess project-knowledge impact, and propose exact delivery actions.
agent: lead
---

Finish the current work for `$ARGUMENTS`.

Invoke `verifier`, confirm code-review and performance-review findings are resolved, inspect final worktree state, and map evidence to acceptance criteria. Check whether ADRs, architecture documents, or runbooks need updating. Return a concise completion report and proposed ticket comment or transition.

Do not invoke `ticket-writer`, commit, push, or create a pull request until the user explicitly approves each external action.
