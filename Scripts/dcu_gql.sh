#!/bin/bash

docker compose down --remove-orphans && docker compose up backend_with_monolith_db
