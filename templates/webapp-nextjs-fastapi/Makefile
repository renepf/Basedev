.PHONY: up down dev-api dev-web test
up:    ; docker compose up -d
down:  ; docker compose down
dev-api: ; cd backend && uvicorn app.main:app --reload
dev-web: ; cd frontend && npm run dev
test:  ; cd backend && pytest -q && cd ../frontend && npm test --silent
