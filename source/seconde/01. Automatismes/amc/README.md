# Automatismes seconde avec AMC

Les questions sont rangees par theme dans `themes/`.

Le fichier principal est `automatismes_seconde_amc.tex`.
Les PDF complets par theme sont produits dans `pdf_themes/`.

Chaque theme contient 70 questions et chaque question possede une seule bonne reponse.

Pour modifier le nombre de questions par theme, changer les lignes :

```tex
\newcommand{\nbCalcul}{8}
\newcommand{\nbProportions}{5}
\newcommand{\nbEvolutions}{4}
\newcommand{\nbFonctions}{5}
\newcommand{\nbGeometrie}{5}
\newcommand{\nbStatsProbas}{6}
```

Chaque fichier de theme ne contient que des questions AMC du type :

```tex
\element{calcul}{
\begin{question}{identifiant}
...
\begin{choiceshoriz}
\correctchoice{...}
\wrongchoice{...}
\end{choiceshoriz}
\end{question}
}
```

Pour regenerer la banque et les PDF :

```sh
./build_amc.sh
```
