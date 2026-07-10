---
name: project-knowledge
description: Retrieve and maintain Git-backed architecture, domain invariants, runbooks, and architecture decision records.
---

# Project Knowledge

Project knowledge is canonical only when it is stored in version-controlled project documentation or an explicitly named organization knowledge system.

## Retrieval

1. Read the project `AGENTS.md` knowledge section.
2. Search `docs/architecture/`, `docs/decisions/`, `docs/domain/`, and `docs/operations/` when present.
3. Follow ADR references to tickets, pull requests, specifications, and superseding ADRs.
4. Cite the file path and decision identifier in plans and reviews.
5. If no project knowledge exists for the topic, say so.

## Recording Decisions

Record a decision when it establishes a durable architecture, data, API, security, dependency, or operational constraint. Do not create ADRs for routine implementation detail.

An ADR contains:

- Title, status, and date
- Context and decision drivers
- Decision
- Alternatives considered
- Consequences and follow-up work
- Affected systems
- Related tickets, pull requests, and documents
- Superseded or superseding decision when applicable

Never silently promote conversation text or model inference into a project decision. Draft the decision, obtain approval, and commit it with the implementation. Supersede old ADRs instead of rewriting their history.

## Derived Indexes

Full-text and vector indexes are rebuildable caches. They must preserve source path, source version, updated time, content hash, and access scope. They never replace the source document.
