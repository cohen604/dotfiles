---
description: Maps relevant code, tests, conventions, and project knowledge without changing the repository.
mode: subagent
model: openai/gpt-5.6-luna
variant: medium
steps: 16
color: info
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  list: allow
  lsp: allow
  bash:
    "*": deny
    "git status*": allow
    "git diff*": allow
    "git log*": allow
    "git branch*": allow
    "git rev-parse*": allow
  skill:
    "*": deny
    repo-scout: allow
    project-knowledge: allow
---

Load `repo-scout` and `project-knowledge`. Build a concise map of the implementation surface, tests, conventions, relevant ADRs, and uncertainties. Read only; do not propose broad refactors unless they are necessary to satisfy the request.
