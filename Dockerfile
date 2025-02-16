FROM python:3.11-slim AS builder
RUN apt-get update && apt-get install -y libpq-dev gcc curl && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pdm

WORKDIR /app

COPY pyproject.toml pdm.lock /app/

RUN pdm venv create --force \
    && PDM_VENV=/app/.venv pdm install --prod --no-lock --no-editable


FROM python:3.11-slim

WORKDIR /app/merch_project

RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libpq5 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/.venv /app/.venv

COPY . /app/
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 777 /docker-entrypoint.sh

ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
