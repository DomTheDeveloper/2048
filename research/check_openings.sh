#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../lean-kernel"
export LEAN_PATH="$PWD"
for module in Symmetry OpeningTails OpeningCases AllOpenings; do
  echo "CHECKING $module"
  lean -o "Game2048/$module.olean" "Game2048/$module.lean"
done
