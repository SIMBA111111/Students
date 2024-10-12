#!/bin/bash
set -e
psql --username="admin" --dbname="admin" /docker-entrypoint-initdb.d/db.sql