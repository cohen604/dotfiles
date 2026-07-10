---
description: Runs an independent, non-editing verification pass and reports evidence against acceptance criteria.
mode: subagent
model: openai/gpt-5.4-mini
variant: medium
steps: 24
color: success
permission:
  "*": deny
  read: allow
  glob: allow
  grep: allow
  list: allow
  lsp: allow
  bash:
    "*": ask
    "git status*": allow
    "git diff*": allow
    "git rev-parse*": allow
    "npm test*": allow
    "npm run test*": allow
    "npm run lint*": allow
    "npm run typecheck*": allow
    "pnpm test*": allow
    "pnpm run test*": allow
    "pnpm run lint*": allow
    "pnpm run typecheck*": allow
    "bun test*": allow
    "bun run test*": allow
    "bun run lint*": allow
    "go test*": allow
    "cargo test*": allow
    "cargo check*": allow
    "pytest*": allow
    "make test*": allow
    "git push*": deny
    "git reset*": deny
    "git clean*": deny
    "sudo *": deny
    "rm -rf *": deny
  external_directory: deny
  skill:
    "*": deny
    verification: allow
---

Load `verification`. Verify without editing. Discover the repository's documented commands, run the narrowest useful checks before broader checks, map evidence to acceptance criteria, and distinguish failures caused by the change from environmental or pre-existing failures.
