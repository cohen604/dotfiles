# Project Agent Guide

## Repository

- Purpose: TODO
- Primary language and framework: TODO
- Important boundaries: TODO

## Work Tracking

- Tracker: TODO (`linear` or `jira`)
- Team or project: TODO
- Ticket key examples: TODO
- Definition of done: TODO
- Allowed status transitions: TODO

## Commands

- Install: TODO
- Focused test: TODO
- Full test: TODO
- Lint: TODO
- Typecheck: TODO
- Build: TODO

## Architecture

- Start with `docs/architecture/overview.md`.
- Search `docs/decisions/` before changing APIs, schemas, infrastructure, security boundaries, or major dependencies.
- Read `docs/domain/invariants.md` before modifying domain behavior.
- Update or supersede relevant ADRs in the same change as the implementation.

## Conventions

- TODO: formatting and naming
- TODO: error handling
- TODO: testing expectations
- TODO: migration and compatibility rules

## Safety

- Never commit credentials or `.env` contents.
- Preserve unrelated worktree changes.
- Require explicit approval for ticket mutations, commits, pushes, pull requests, releases, and deployments.
