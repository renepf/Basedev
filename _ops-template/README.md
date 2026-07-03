# `<PROJECT>-OPS` — operational playbook

This folder is a **template skeleton**. Copy it next to your code repo and rename it so the two sit side by side:

```
parent/
├── <project>/          # the app repo — code + conventional READMEs only
└── <project>-OPS/      # this, renamed — all process docs, handovers, plans, decisions
```

**Single source of truth** for *everyone* — stakeholders (sales, ops, client success, management) **and** developers/AI agents. Durable docs and all AI work-product live here, never in the app repo.

- **For developers:** code stays in the app repo. Plans, handovers, decisions, notes → `09-AGENT_WORKSPACE/`. Operational docs (PRDs, runbooks, ICP) → the numbered folders.
- **For AI agents:** all work-product (plans, handovers, decisions, notes) is written under `09-AGENT_WORKSPACE/`, and every doc is registered with a row in `INDEX.md` (the registry + orchestrator context wiki — read it first).

## Folder structure

```
<PROJECT>-OPS/
├── INDEX.md                  ← doc registry / orchestrator context wiki — read first
├── HANDOVER.md               ← current rolling state-of-play
├── 00-GOVERNANCE/            ← decision authority, approval matrix, product PRD
├── 01-SALES_OUTREACH/        ← ICP, personas, sequences, lead scoring
├── 02-CLIENT_MANAGEMENT/     ← onboarding, client records, success playbooks
├── 03-AGENTIC_SYSTEM/        ← agent roster, daily cycle, tool-access decisions
├── 04-INFRASTRUCTURE/        ← deploy / DR / analytics / MCP runbooks
├── 05-REPORTING/             ← analytics PRDs, dashboards, metrics
├── 08-WEBSITE/               ← dated product/website PRDs, plans, summaries
└── 09-AGENT_WORKSPACE/       ← AI work-product
    ├── plans/<N>-<slug>/     ← per-issue PRD.md / research.md / implementation-plan.md
    ├── handovers/            ← YYYY-MM-DD-<agent>-<scope>.md
    ├── decisions/            ← decision records
    └── notes/                ← scratch research
```

> Numbered gaps (06/07) are intentional — leave room to slot divisions without renumbering.

## The discipline

1. Agent work-product → `09-AGENT_WORKSPACE/` (plans / handovers / decisions / notes).
2. Operational/business docs → the matching numbered folder.
3. Every doc gets a row in `INDEX.md`.
4. Every agent run writes a handover to `09-AGENT_WORKSPACE/handovers/` before the next gate.
5. The orchestrator keeps `HANDOVER.md` and `INDEX.md` current as its working memory.
