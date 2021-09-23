#!/usr/bin/env bash

set -x
set -eo pipefail

DB_USER="${POSTGRES_USER:=postgres}"
DB_PASSWORD="${POSTGRES_PASSWORD:=password}"
DB_NAME="${POSTGRES_NAME:=newsletter}"
DB_PORT="${POSTGRES_PORT:=5432}"
DB_CONTAINER="db"

export PGPASSWORD="${DB_PASSWORD}"

until psql -h $DB_CONTAINER -U "${DB_USER}" -p "${DB_PORT}" -d "postgres" -c '\q'; do
  >&2 echo "Postgres is still unavailable - sleeping"
  sleep 1
done

export DATABASE_URL=postgres://${DB_USER}:${DB_PASSWORD}@$DB_CONTAINER:${DB_PORT}/${DB_NAME}

sqlx database create
