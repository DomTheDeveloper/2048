#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
latexmk -pdf -e '$bibtex = $ENV{"BIBTEX"} . " %O %B" if $ENV{"BIBTEX"};' \
  -interaction=nonstopmode -halt-on-error -file-line-error main.tex
python3 finalize.py check
