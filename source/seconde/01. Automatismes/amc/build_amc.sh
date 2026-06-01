#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$ROOT"

python3 outils/generer_banque.py
pdflatex -interaction=nonstopmode automatismes_seconde_amc.tex
rm -f automatismes_seconde_amc.aux automatismes_seconde_amc.log automatismes_seconde_amc.amc

for file in pdf_themes/*.tex
do
  (cd pdf_themes && pdflatex -interaction=nonstopmode "$(basename "$file")")
done
rm -f pdf_themes/*.aux pdf_themes/*.log pdf_themes/*.amc
