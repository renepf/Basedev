# Basedev — language-agnostic project base template

A clean starting point for any new project (web, mobile, CLI, service — any stack). Copy this folder and you inherit a production-ready Claude Code agent pipeline, a curated skill library, MCP wrappers, and a sibling-repo operations model. Nothing project-specific lives here.

## What's inside

```
.claude/
├── agents/          16 core agents (pipeline + specialists) at top level
│   ├── ecc/         vendored Everything-Claude-Code agents
│   └── agency/      vendored agency-agents, by division
├── commands/        /orchestrate, /po (+ vendored /ecc:*)
├── skills/          curated skill library
└── rules/           language-organized guidelines
.cursor/rules/       Cursor rules (GitHub-flow + local OPS)
_ops-template/       skeleton for the sibling <PROJECT>-OPS repo
mcps/                MCP server wrappers
.env.example         environment variable template
```

## The agent pipeline

An orchestrator sequences a gated pipeline and keeps an auditable trail in a sibling `<PROJECT>-OPS/` repo:

**spec → implement → test → review (peer ∥ over-engineering) → merge-readiness**

Core agents: `orchestrator`, `requirements-engineer`, `product-owner`, `engineer`, `frontend-ui`, `high-fidelity-developer`, `backend-api`, `infra-specialist`, `ci-cd-specialist`, `qa-engineer`, `peer-reviewer`, `ponytail-reviewer`, `pr-reviewer`, `cro-analyst`, `salespage-specialist`, `prompt-architect`.

Run it: `/orchestrate <task>`. Shape a requirement: `/po <request>`.

## The OPS model

Process docs never pollute the app repo. Copy `_ops-template/` next to your code as `<project>-OPS/` — a numbered-division playbook (`00-GOVERNANCE` … `09-AGENT_WORKSPACE`) where every agent writes plans, handovers, and decisions, indexed in `INDEX.md`.

## Getting started

```bash
cp -R Basedev my-project && cd my-project
cp .env.example .env.local        # fill in your secrets (never committed)
```

Then open in Claude Code and run `/orchestrate`.

## Environment

Copy `.env.example` → `.env.local` and fill values. `.env.local` is gitignored — real secrets stay local.

## License

Vendored content under `.claude/agents/ecc/`, `.claude/agents/agency/`, and `.claude/skills/` retains its upstream MIT license and attribution (see the `ATTRIBUTION` / `LICENSE` files in each). The template scaffolding itself is free to reuse.
