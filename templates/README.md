# Project templates

Reusable webapp base trees. Copy one as a new project, fill the placeholders.

| Template | Stack | Use when |
|---|---|---|
| [`webapp-nextjs`](./webapp-nextjs/) | Next.js full-stack + Prisma + Postgres | One language, app + API in a single Next app. Fastest start. |
| [`webapp-nextjs-fastapi`](./webapp-nextjs-fastapi/) | Next.js + FastAPI + Postgres | Separate Python API; heavier backend / ML / non-JS services. |

Each ships: app tree, `docker-compose.yml` (db + services, healthchecks), `.env.example`, CI workflow, and a `README.md`. Structure follows the `deployment-patterns`, `hexagonal-architecture`, and framework skills in `.claude/skills/`.
