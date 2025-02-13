FROM python:3.11-slim AS builder
RUN apt-get update && apt-get install -y libpq-dev gcc curl && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pdm

WORKDIR /app

COPY pyproject.toml pdm.lock /app/

RUN pdm venv create --force \
    && PDM_VENV=/app/.venv pdm install --prod --no-lock --no-editable


FROM python:3.11-slim

WORKDIR /app/merch_project

COPY --from=builder /app/.venv /app/.venv

COPY . /app/

ENV PATH="/app/.venv/bin:$PATH"

#COPY merch_project/static /app/static
RUN python manage.py collectstatic --noinput
EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "merch_project.wsgi:application"]
