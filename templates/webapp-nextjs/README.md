# Webapp base template — Next.js full-stack + Postgres

Single Next.js app (app router + route handlers/server actions) with Prisma + Postgres. One language end-to-end.

```
app/        routes + route handlers (API lives in app/api/*/route.ts)
lib/        db client, server utils (server-only)
components/ UI
prisma/     schema + migrations
```

## Quick start
```bash
cp .env.example .env
docker compose up -d db          # postgres
npm install
npx prisma migrate dev           # create schema
npm run dev                      # http://localhost:3000
```
Or full stack in containers: `docker compose up -d` (db + web).

Health: `http://localhost:3000/api/health` (also checks DB).

## Conventions
- **Server-only secrets** never imported into client components. `lib/db.ts` is server-only.
- API = route handlers under `app/api/*/route.ts`; mutations = server actions.
- DB access through Prisma via `lib/db.ts` (singleton, avoids dev hot-reload leaks).
