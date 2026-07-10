# OpenCode Harness

This directory is the stowable global OpenCode configuration. It provides a checkpointed delivery workflow with role-specific models and permissions, live ticket and documentation retrieval, and Git-backed project knowledge.

## Install

From the dotfiles root:

```sh
stow opencode
```

Open OpenCode and connect the OpenAI provider if it is not already authenticated:

```text
/connect
```

The configured baseline uses:

- `openai/gpt-5.4-mini` for intake, scouting, and verification
- `openai/gpt-5.4` for coordination and implementation
- `openai/gpt-5.5` for architecture and review

Only the OpenAI provider is enabled. This prevents proprietary code or ticket data from accidentally being sent through free providers.

## Configure A Repository

Choose one tracker template from the repository root:

```sh
cp ~/.config/opencode/project-templates/opencode.linear.json ./opencode.json
# or
cp ~/.config/opencode/project-templates/opencode.jira.json ./opencode.json
```

If the repository already has `opencode.json`, merge only the `mcp.linear.enabled` and `mcp.atlassian.enabled` values.

Use `AGENTS.example.md` as a checklist, but merge it with existing repository instructions instead of overwriting them. Copy the `docs/` skeleton only when the repository does not already have a documentation convention.

Project knowledge is stored in the repository:

- `docs/architecture/` for current system structure
- `docs/decisions/` for durable ADRs
- `docs/domain/` for terminology and invariants
- `docs/operations/` for runbooks

OpenCode sessions are work history. They are not the canonical project knowledge base.

## Authenticate MCP Servers

Run authentication from a repository whose `opencode.json` enables the selected tracker:

```sh
opencode mcp auth linear
# or
opencode mcp auth atlassian
```

Check connection state:

```sh
opencode mcp list
```

Linear and Atlassian tools remain `ask` for both reads and writes initially. This is intentional: authenticate first, observe the exact tool names exposed to the account, then replace broad tracker approval with verified read-tool allowlists while keeping mutations approval-gated.

Context7 and Grep by Vercel are enabled globally but exposed only to the read-only `researcher` agent. Context7 is authoritative only when it returns official, version-matched documentation. Grep results are examples, not API contracts.

## Daily Commands

- `/ticket PROJ-123`: produce a read-only Work Brief
- `/work PROJ-123`: intake, scout, research, plan checkpoint, build, review, and verify
- `/review [base]`: independently review current changes
- `/finish PROJ-123`: final verification and proposed delivery actions
- `/knowledge <question>`: answer from project knowledge and cited sources
- `/decision <topic>`: research and draft an ADR for approval
- `/handoff`: create a structured continuation summary

The `lead` agent never edits. Only `builder` edits, after the lead has presented a plan and the user has approved it. Ticket write-back is a separate task and every tracker tool call requires approval.

## Validate

```sh
opencode debug config
opencode models openai
opencode mcp list
```

The resolved config should show `lead` as the default primary agent. Verify that `builder` is the only custom agent with `edit: allow`, and that tracker MCPs are enabled by exactly one project override.

## Memory, Retrieval, And Cache

- Session continuity uses OpenCode sessions and automatic compaction.
- Durable personal workflow lives in global `AGENTS.md` and skills.
- Durable project decisions live in Git-backed project documentation.
- External documentation is retrieved on demand by `researcher`.
- A future full-text or vector index must be rebuildable from canonical sources and stored outside Git, for example under `~/.cache/opencode/project-knowledge/`.
- Do not cache final model answers, reviews, test results across commits, secrets, or authorization-sensitive results across users.

Add private RAG only after normal repository search and source-specific connectors repeatedly fail. Any index must retain source URI, source version, update time, content hash, and access scope.
