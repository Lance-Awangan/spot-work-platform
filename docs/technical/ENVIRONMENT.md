# Environment Variable Strategy

## Purpose
Environment variables store configuration and secrets separately from code.

## Rules
- `.env.example` is committed to the repository
- `.env` is local only and must never be committed
- Production secrets must be configured in the deployment platform, not in Git

## Current Variables
- `NODE_ENV` - runtime environment
- `PORT` - API server port
- `DATABASE_URL` - PostgreSQL connection string
- `JWT_SECRET` - token signing secret
- `JWT_EXPIRES_IN` - token expiry duration
- `API_BASE_URL` - backend base URL
- `WORKER_APP_URL` - worker frontend URL
- `BUSINESS_DASHBOARD_URL` - business frontend URL