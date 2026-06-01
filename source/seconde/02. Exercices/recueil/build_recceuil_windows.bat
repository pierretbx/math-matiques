@echo off
setlocal

rem Compilation Windows du recueil.
rem Le recueil utilise PSTricks : il faut passer par latex -> dvips -> ps2pdf.

cd /d "%~dp0"

where latex >nul 2>nul
if errorlevel 1 (
  echo Erreur : la commande latex est introuvable.
  echo Installez MiKTeX ou TeX Live, puis verifiez que latex est dans le PATH.
  exit /b 1
)

where dvips >nul 2>nul
if errorlevel 1 (
  echo Erreur : la commande dvips est introuvable.
  echo Installez MiKTeX ou TeX Live, puis verifiez que dvips est dans le PATH.
  exit /b 1
)

where ps2pdf >nul 2>nul
if errorlevel 1 (
  echo Erreur : la commande ps2pdf est introuvable.
  echo Installez Ghostscript, puis verifiez que ps2pdf est dans le PATH.
  exit /b 1
)

latex -interaction=nonstopmode receuil_seconde.tex
if errorlevel 1 exit /b 1

latex -interaction=nonstopmode receuil_seconde.tex
if errorlevel 1 exit /b 1

dvips receuil_seconde.dvi -o receuil_seconde.ps
if errorlevel 1 exit /b 1

ps2pdf -dALLOWPSTRANSPARENCY receuil_seconde.ps receuil_seconde.pdf
if errorlevel 1 exit /b 1

del /q receuil_seconde.aux 2>nul
del /q receuil_seconde.dvi 2>nul
del /q receuil_seconde.fdb_latexmk 2>nul
del /q receuil_seconde.fls 2>nul
del /q receuil_seconde.out 2>nul
del /q receuil_seconde.ps 2>nul
del /q receuil_seconde.toc 2>nul

echo.
echo Compilation terminee : receuil_seconde.pdf

endlocal
