#!/usr/bin/env bash
set -e

export PGPASSWORD=test
psql -U program -d services <<-EOSQL
    CREATE SCHEMA IF NOT EXISTS films;
    CREATE SCHEMA IF NOT EXISTS cinema;
    CREATE SCHEMA IF NOT EXISTS tickets;
EOSQL
