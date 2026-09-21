#!/usr/bin/env bash
# Reproduce the complete consolidated development; no partial pass is called a full audit.
set -euo pipefail
cd "$(dirname "$0")/.."
mode="${1:-full}"
case "$mode" in full|--computations-only) ;; *) echo 'Use full or --computations-only' >&2; exit 2;; esac
if [ "$mode" = full ]; then rm -f research/audit/final-verification.json; fi
bash research/check.sh "$mode"
python3 research/supplement_checks.py
if [ "$mode" = full ]; then
  (cd lean-kernel; export LEAN_PATH="$PWD"; lean -o Game2048/DeadlineSlack.olean Game2048/DeadlineSlack.lean) 2>&1 | tee research/audit/deadline-kernel.log
  python3 research/final_audit.py
else
  echo 'CONSOLIDATED COMPUTATIONAL CHECKS PASSED; no fresh Lean audit claimed.'
fi
