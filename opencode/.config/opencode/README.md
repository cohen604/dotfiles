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

- `openai/gpt-5.6-luna` for intake, scouting, research, and verification
- `openai/gpt-5.6-terra` for implementation
- `openai/gpt-5.6-sol` for coordination, architecture, and code review
- `openai/gpt-5.6-sol-pro` for the dedicated performance review

Only the OpenAI provider is enabled. This prevents proprietary code or ticket data from accidentally being sent through free providers.

## Configure A Repository

Choose one tracker template from the repository root:

```sh
cp ~/.config/opencode/project-templates/opencode.linear.json ./opencode.json
# or
cp ~/.config/opencode/project-templates/opencode.jira.json ./opencode.json
```

For Linear, rename the template's `linear_workspace_slug` MCP key to a stable, unique name such as `linear_acme` or `linear_personal`. OpenCode stores MCP OAuth credentials by this server name. Reusing the same name in multiple repositories reuses the same local credential entry.

If the repository already has `opencode.json`, merge the selected MCP entry instead of replacing the file.

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
opencode mcp auth linear_acme
# or
opencode mcp auth atlassian
```

Replace `linear_acme` with the unique MCP name configured in that repository. A second folder can use `linear_personal` and authenticate independently. Only the MCP declared by the current repository is loaded into that OpenCode process.

Unique names isolate OpenCode's stored credentials, but Linear determines the authorization scope. For strict workspace isolation, use separate Linear accounts or a workspace-restricted API token. The `opencode.linear-token.json` template reads a token from `~/.config/opencode/secrets/linear-workspace-slug-token`; rename both the MCP key and secret filename per workspace.

Check connection state:

```sh
opencode mcp list
```

Linear and Atlassian tools remain `ask` for both reads and writes initially. This is intentional: authenticate first, observe the exact tool names exposed to the account, then replace broad tracker approval with verified read-tool allowlists while keeping mutations approval-gated.

Context7 and Grep by Vercel are enabled globally but exposed only to the read-only `researcher` agent. Context7 is authoritative only when it returns official, version-matched documentation. Grep results are examples, not API contracts.

## Secrets

No secret values belong in this repository.

- Provider credentials created through `/connect` are stored locally in `~/.local/share/opencode/auth.json`.
- MCP OAuth credentials are stored locally in `~/.local/share/opencode/mcp-auth.json`, keyed by MCP server name.
- `CONTEXT7_API_KEY` is read from the environment. Context7 also works anonymously at lower limits.
- The static Linear template uses `{file:...}` substitution so tracker tokens are not inherited by agent-run test processes.
- `secrets/` and `*.local.json` under the OpenCode config directory are ignored, but a system keychain or secret manager is preferred over plaintext files.

Because the zsh configuration is also managed as dotfiles, do not write token values directly into a committed `.zshrc` or `.zshenv`. Export them from an untracked local file or inject them when launching OpenCode through a secret manager.

Raw secrets do not need to be visible to agents. OpenCode resolves `{env:...}` and `{file:...}` while building the MCP connection; agents receive only the MCP tools allowed by their permission rules. Verify connectivity with `opencode mcp list`. Avoid sharing `opencode debug config` output because resolved headers may contain secret values.

## Daily Commands

- `/ticket PROJ-123`: produce a read-only Work Brief
- `/work PROJ-123`: intake, scout, research, plan checkpoint, build, review, and verify
- `/review [base]`: run independent code and performance reviews of current changes
- `/finish PROJ-123`: final verification and proposed delivery actions
- `/knowledge <question>`: answer from project knowledge and cited sources
- `/decision <topic>`: research and draft an ADR for approval
- `/handoff`: create a structured continuation summary

The `lead` agent never edits. Only `builder` edits, after the lead has presented a plan and the user has approved it. Ticket write-back is a separate task and every tracker tool call requires approval.

## Agent Iteration Limits

`steps` is a maximum number of agentic iterations before OpenCode forces a text response. It is not the number of workflow steps an agent must perform.

The one-purpose agents have initial ceilings based on their expected retrieval or verification loops: ticket write-back 10, ticket intake 12, scouting and research 16, architecture 18, and code review, performance review, and verification 24. `lead` and `builder` are intentionally uncapped because their workloads vary too much for a defensible fixed limit. Tune the bounded ceilings from observed truncations, latency, and `opencode stats`, not by increasing every value preemptively.

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
