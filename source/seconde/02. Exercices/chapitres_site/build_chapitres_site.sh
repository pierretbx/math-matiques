#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$ROOT"

PATH="$HOME/bin:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH
TEXINPUTS="../recueil//:"
export TEXINPUTS

for file in \
  01_representation_graphique_fonction \
  02_multiples_diviseurs_nombres_premiers \
  03_geometrie_vectorielle \
  04_informations_chiffrees \
  05_ensembles_de_nombres \
  06_calcul_litteral \
  07_probabilites \
  08_reperage_geometrie_vectorielle \
  09_fonctions_de_reference \
  10_statistiques \
  11_fonctions_affines_droites_systemes
do
  "$HOME/bin/latex" -interaction=nonstopmode "$file.tex"
  "$HOME/bin/latex" -interaction=nonstopmode "$file.tex"
  "$HOME/bin/dvips" "$file.dvi" -o "$file.ps"
  if [ -x /opt/local/bin/ps2pdf ]; then
    /opt/local/bin/ps2pdf -dALLOWPSTRANSPARENCY "$file.ps" "$file.pdf"
  elif [ -x /usr/local/bin/ps2pdf ]; then
    /usr/local/bin/ps2pdf -dALLOWPSTRANSPARENCY "$file.ps" "$file.pdf"
  else
    ps2pdf -dALLOWPSTRANSPARENCY "$file.ps" "$file.pdf"
  fi
  rm -f "$file.aux" "$file.dvi" "$file.fdb_latexmk" "$file.fls" "$file.log" "$file.out" "$file.ps" "$file.toc"
done
