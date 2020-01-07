#! /bin/bash
set -e

/usr/bin/psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  create extension IF NOT EXISTS fuzzystrmatch;
  create extension IF NOT EXISTS pg_trgm;
  create extension IF NOT EXISTS postgis;
  create extension IF NOT EXISTS postgis_topology;
EOSQL

# values from pgtune 22B RAM + 1CPU + SDD + WebApplication
echo timezone=UTC >> /var/lib/postgresql/data/postgresql.conf

