---
name: code-review
description: Independently review a change for correctness, regressions, security, test gaps, and consistency with project decisions.
---

# Code Review

Review the requested diff and enough surrounding code to validate its contracts. Do not edit files.

## Priority

1. Incorrect behavior and unmet acceptance criteria
2. Data loss, security, concurrency, and permission issues
3. Backward compatibility and failure handling
4. Missing or misleading tests
5. Performance and operational regressions
6. Violations of established architecture or ADRs

## Output

Lead with findings ordered by severity:

- `BLOCKER`: unsafe to merge or fundamentally incorrect
- `HIGH`: likely user-visible defect or serious regression
- `MEDIUM`: meaningful correctness, maintenance, or test risk
- `LOW`: bounded improvement worth addressing

Each finding includes a file and line reference, the failure scenario, and the smallest defensible correction. Then list open questions and residual verification gaps. If there are no findings, say so directly.
