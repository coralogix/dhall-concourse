#!/usr/bin/env bash

set -euo pipefail

echo '[INFO][dhall-concourse][refreeze.sh] Refreezing...'
deepest_level=$(find . -name 'package.dhall' | sed 's/[^\/]//g' | awk '{ print length }' | sort | tail -n 1)
for depth in $(seq "${deepest_level}" -1 1) ; do
  while IFS= read -r -d '' package_dhall ; do
    echo "[INFO][dhall-concourse][refreeze.sh] Freezing: ${package_dhall} ..."
    dhall freeze --cache --all --inplace "${package_dhall}"
  done < <(find . -mindepth "${depth}" -maxdepth "${depth}" -name 'package.dhall' -print0)
done
echo '[INFO][dhall-concourse][refreeze.sh] Finished refreezing successfully!'
