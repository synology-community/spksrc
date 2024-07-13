#!/bin/bash
set -e

for f in spk/*/build.sh; do
  # dir=$(dirname "$f")
  echo "Building $f"
  # bash "$f"
  (cd "$(dirname "$f")" && bash build.sh)

  echo "Done building $f"
  echo "Current directory: $(pwd)"
done