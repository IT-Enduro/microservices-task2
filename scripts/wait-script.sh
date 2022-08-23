#!/usr/bin/env bash

pids=()
for host in "localhost:8060" "localhost:8070" "localhost:8080"; do
  "$(pwd)"/scripts/wait-for.sh -t 120 "$host" -- echo "Host $host is active" &
  pids+=($!)
done

for pid in "${pids[@]}"; do
  if ! wait "${pid}"; then
    exit 1
  fi
done
