#!/usr/bin/env bash

set -euo pipefail

echo '[INFO][dhall-concourse][.githooks/check-format.sh] Checking formatting...'
while IFS= read -r -d '' dhall_file ; do
  echo "[INFO][dhall-concourse][.githooks/check-format.sh] Checking: ${dhall_file} ..."
  dhall format --check --inplace "${dhall_file}"
done < <(find . -name '*.dhall' -print0)
echo '[INFO][dhall-concourse][.githooks/check-format.sh] Finished checking formatting successfully!'
