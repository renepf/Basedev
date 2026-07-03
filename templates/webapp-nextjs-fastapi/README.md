# Webapp base template — Next.js + FastAPI + Postgres

Reusable starting tree. Copy this folder as a new project, then fill the placeholders.

```
frontend/   Next.js (app router, TS)
backend/    FastAPI (hexagonal: api → domain → adapters), Postgres via SQLAlchemy + Alembic
docker-compose.yml   postgres + api + web for local dev
.github/workflows    lint + test both halves
```

## Quick start
```bash
cp .env.example .env
docker compose up -d          # postgres + api(:8000) + web(:3000)
# or run each half locally:
cd backend  && uv sync && uvicorn app.main:app --reload
cd frontend && npm install && npm run dev
```

Health checks: web `http://localhost:3000/api/health`, api `http://localhost:8000/health`.

## Structure conventions
- **backend**: `api/` (HTTP adapters) → `domain/` (entities + use-cases, no framework imports) → `adapters/` (db, external). `db/` holds session + base. Migrations in `migrations/` (Alembic).
- **frontend**: `app/` routes, `components/` UI, `lib/` client/util. Server-only secrets never reach the client.
