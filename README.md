# Test OmniAuth Line

This Repo contains the Test Environment for [omniauth-line](https://github.com/kazasiki/omniauth-line) gem.

## USAGE

1. Copy `.env.example` to `.env` and fill in `CHANNEL_ID` and `CHANNEL_SECRET`.
   ```bash
   cp .env.example .env
   ```
2. `docker compose build`
3. `docker compose up`
4. Access http://localhost:4567
