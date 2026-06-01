#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$ROOT"

if [ -x "$HOME/bin/latex" ]; then
  PATH="$HOME/bin:$PATH"
  export PATH
fi

latex -interaction=nonstopmode receuil_seconde.tex
latex -interaction=nonstopmode receuil_seconde.tex
dvips receuil_seconde.dvi -o receuil_seconde.ps
if [ -x /usr/local/bin/ps2pdf ]; then
  /usr/local/bin/ps2pdf -dALLOWPSTRANSPARENCY receuil_seconde.ps receuil_seconde.pdf
elif [ -x /opt/local/bin/ps2pdf ]; then
  /opt/local/bin/ps2pdf -dALLOWPSTRANSPARENCY receuil_seconde.ps receuil_seconde.pdf
else
  ps2pdf -dALLOWPSTRANSPARENCY receuil_seconde.ps receuil_seconde.pdf
fi

rm -f receuil_seconde.aux \
      receuil_seconde.dvi \
      receuil_seconde.fdb_latexmk \
      receuil_seconde.fls \
      receuil_seconde.out \
      receuil_seconde.ps \
      receuil_seconde.toc
