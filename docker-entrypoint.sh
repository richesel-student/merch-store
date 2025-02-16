#!/bin/bash
set -e

wait_for_it() {
  local host="$1"
  local port="$2"
  local retries=30

  echo "Waiting for $host:$port to be available..."

  for i in $(seq 1 $retries); do
    if nc -z "$host" "$port"; then
      echo "$host:$port is available!"
      return 0
    fi
    echo "Retrying in 2 seconds..."
    sleep 2
  done

  echo "Error: $host:$port is still not available after $retries attempts!"
  exit 1
}


wait_for_it db 5432


python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate


exec gunicorn --bind 0.0.0.0:8080 merch_project.wsgi:application
