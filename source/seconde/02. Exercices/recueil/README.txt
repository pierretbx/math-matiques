# Recueil d'exercices de seconde

Ce dossier contient le recueil LaTeX rangé par chapitres, ainsi que le PDF final.

## Compiler le recueil

Dans TeXmaker, ouvrir :

```text
receuil_seconde.tex
```

Puis lancer une commande utilisateur contenant :

```sh
sh build_recceuil.sh
```

Depuis un terminal, on peut aussi lancer la même commande dans ce dossier :

```sh
sh build_recceuil.sh
```

Sous Windows, ouvrir une invite de commandes dans le dossier du recueil puis lancer :

```bat
build_recceuil_windows.bat
```

Ce fichier suppose que MiKTeX ou TeX Live fournit `latex` et `dvips`, et que Ghostscript fournit `ps2pdf`.

Le fichier produit est :

```text
receuil_seconde.pdf
```

La compilation utilise la chaîne :

```text
latex -> dvips -> ps2pdf
```

avec l'option Ghostscript :

```sh
-dALLOWPSTRANSPARENCY
```

## Modifier un exercice

Tous les exercices utilisés par le recueil sont dans :

```text
chapitres/
```

Chaque chapitre contient un fichier `chapitre.tex`, puis éventuellement :

```text
manu.tex
thierry.tex
virginie.tex
pierre.tex
```

Pour corriger ou ajouter un exercice, il faut modifier directement le fichier du chapitre concerné, puis recompiler.

La commande d'exercice est :

```tex
\exo
```

La numérotation est automatique. Par exemple, dans le chapitre 4, le douzième exercice sera affiché :

```text
Exercice 4.12
```

## Modifier les chapitres

Le fichier principal est :

```text
receuil_seconde.tex
```

Il donne l'ordre des chapitres.

Les titres des chapitres sont dans les fichiers :

```text
chapitres/*/chapitre.tex
```

## Modifier la présentation ou la mise en page

La page de titre, le sommaire, les marges, les en-têtes, la présentation et les commandes globales sont dans :

```text
recueil_preambule.tex
```

Les préambules techniques hérités des anciens fichiers sont rangés dans :

```text
preambules/
```

Les images utilisées sur la présentation sont :

```text
logo4.eps
lion_vector.eps
```

## Sources d'origine

Les anciens fichiers de départ de Manu, Thierry, Virginie et Pierre ne sont plus nécessaires pour modifier le recueil courant.

Ils ont été rangés dans :

```text
sources_originales/sources_originales.zip
```

Ce fichier sert seulement d'archive si l'on veut retrouver les sources initiales.

## Structure du dossier

```text
receuil_seconde.tex           fichier principal
recueil_preambule.tex         présentation, mise en page, commandes communes
build_recceuil.sh             compilation du PDF
build_recceuil_windows.bat    compilation du PDF sous Windows
chapitres/                    exercices réellement utilisés dans le recueil
preambules/                   préambules techniques LaTeX
sources_originales/           archive des anciennes sources
logo4.eps                     logo de page de titre
lion_vector.eps               lion de la présentation
receuil_seconde.pdf           PDF final
```
