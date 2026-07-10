---
name: ticket-writeback
description: Apply one explicitly approved Linear or Jira comment or status change and report the confirmed result.
---

# Ticket Write-back

External tracker changes are never inferred from completion.

## Procedure

1. Receive the target issue and proposed mutation from the lead.
2. Restate the issue key, URL, exact comment, and exact status or field changes.
3. Obtain explicit user approval for that exact mutation.
4. Invoke only the minimum required tracker tool.
5. Report the returned issue state and link.

Do not add labels, assign users, change estimates, transition statuses, or post extra comments unless each action was included in the approved proposal. If the tracker state changed since it was read, stop and request confirmation.
