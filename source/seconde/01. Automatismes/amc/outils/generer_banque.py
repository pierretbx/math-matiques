from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
THEMES = ROOT / "themes"
PDF_THEMES = ROOT / "pdf_themes"


def texnum(x):
    if isinstance(x, float):
        s = f"{x:.2f}".rstrip("0").rstrip(".")
    else:
        s = str(x)
    return s.replace(".", "{,}")


def frac(a, b):
    return rf"\frac{{{a}}}{{{b}}}"


def uniq_choices(correct, wrongs):
    out = []
    for value in wrongs:
        if value != correct and value not in out:
            out.append(value)
    n = 1
    while len(out) < 3:
        value = f"${n}$"
        if value != correct and value not in out:
            out.append(value)
        n += 1
    return out[:3]


def question(group, qid, prompt, correct, wrongs, horiz=True):
    env = "choiceshoriz" if horiz else "choices"
    lines = [
        rf"\element{{{group}}}{{",
        rf"\begin{{question}}{{{qid}}}",
        prompt,
        rf"\begin{{{env}}}",
        rf"\correctchoice{{{correct}}}",
    ]
    for wrong in uniq_choices(correct, wrongs):
        lines.append(rf"\wrongchoice{{{wrong}}}")
    lines += [rf"\end{{{env}}}", r"\end{question}", "}"]
    return "\n".join(lines)


def write_theme(filename, questions):
    THEMES.mkdir(parents=True, exist_ok=True)
    text = "\n\n".join(questions) + "\n"
    (THEMES / filename).write_text(text, encoding="utf-8")


def write_pdf_theme(filename, group, title):
    PDF_THEMES.mkdir(parents=True, exist_ok=True)
    source = rf"""\documentclass[a4paper,11pt]{{article}}
\usepackage[utf8]{{inputenc}}
\usepackage[T1]{{fontenc}}
\usepackage[french]{{babel}}
\usepackage{{amsmath,amssymb}}
\usepackage{{geometry}}
\geometry{{margin=1.5cm}}
\usepackage[box]{{automultiplechoice}}

\input{{../themes/{filename}}}

\begin{{document}}
\AMCrandomseed{{20260601}}
\onecopy{{1}}{{
\begin{{center}}
{{\Large Automatismes - {title}}}\\[2mm]
{{\small 70 questions, une seule bonne reponse par question.}}
\end{{center}}

\noindent Nom : \dotfill \hfill Classe : \dotfill

\medskip
\noindent Pour chaque question, cocher une seule reponse.

\shufflegroup{{{group}}}
\insertgroup{{{group}}}

\AMCcleardoublepage
\AMCformBegin
\AMCform
}}
\end{{document}}
"""
    (PDF_THEMES / filename).write_text(source, encoding="utf-8")


def calcul():
    qs = []
    for i in range(10):
        a, b, c, d = i + 1, i + 2, i + 3, i + 4
        num, den = a * d + c * b, b * d
        qs.append(question("calcul", f"calcul-fraction-somme-{i+1}", rf"Calculer ${frac(a,b)}+{frac(c,d)}$.", f"${frac(num,den)}$", [f"${frac(a+c,b+d)}$", f"${frac(num,b+d)}$", f"${frac(a*c,den)}$"]))
    for i in range(10):
        a, b, c, d = i + 2, i + 3, i + 4, i + 5
        qs.append(question("calcul", f"calcul-fraction-produit-{i+1}", rf"Calculer ${frac(a,b)}\times {frac(c,d)}$.", f"${frac(a*c,b*d)}$", [f"${frac(a+c,b+d)}$", f"${frac(a*c,b+d)}$", f"${frac(a+c,b*d)}$"]))
    for i in range(10):
        a, m, n = i + 2, (i % 4) + 2, (i % 3) + 1
        qs.append(question("calcul", f"calcul-puissance-produit-{i+1}", rf"Réduire $ {a}^{m}\times {a}^{n}$.", f"${a}^{m+n}$", [f"${a}^{m*n}$", f"${a}^{m-n}$", f"${2*a}^{m+n}$"]))
    for i in range(10):
        a, b = i + 3, i + 5
        qs.append(question("calcul", f"calcul-developper-{i+1}", rf"Développer et réduire $ {a}(x+{b})$.", f"${a}x+{a*b}$", [f"${a}x+{b}$", f"$x+{a*b}$", f"${a}x-{a*b}$"]))
    for i in range(10):
        a, b = i + 2, i + 4
        qs.append(question("calcul", f"calcul-factoriser-{i+1}", rf"Factoriser $ {a}x+{a*b}$.", f"${a}(x+{b})$", [f"$x({a}+{a*b})$", f"${a}(x-{b})$", f"${a*b}(x+{a})$"]))
    for i in range(10):
        a, sol = i + 2, i + 3
        b = a * sol + i + 1
        c = i + 1
        qs.append(question("calcul", f"calcul-equation-{i+1}", rf"Résoudre $ {a}x+{c}={b}$.", f"$x={sol}$", [f"$x={sol+1}$", f"$x={b-c}$", f"$x={a+sol}$"]))
    for i in range(10):
        value = (i + 12) / 10
        power = i % 4 + 2
        qs.append(question("calcul", f"calcul-scientifique-{i+1}", rf"Écrire $ {texnum(value)}\times 10^{power}$ sous forme décimale.", f"${texnum(value * 10**power)}$", [f"${texnum(value * 10**(power-1))}$", f"${texnum(value * 10**(power+1))}$", f"${texnum(value + 10**power)}$"]))
    return qs


def proportions():
    qs = []
    for i in range(10):
        pct, total = 5 * (i + 1), 80 + 20 * i
        val = pct * total / 100
        qs.append(question("proportions", f"prop-partie-{i+1}", rf"Calculer ${pct}\%$ de ${total}$.", f"${texnum(val)}$", [f"${texnum(pct+total)}$", f"${texnum(total/pct)}$", f"${texnum(val*10)}$"]))
    for i in range(10):
        val, pct = 12 + 3 * i, 10 + 5 * (i % 6)
        total = val * 100 / pct
        qs.append(question("proportions", f"prop-total-{i+1}", rf"${val}$ représente ${pct}\%$ d'une quantité. Quelle est cette quantité ?", f"${texnum(total)}$", [f"${texnum(val*pct/100)}$", f"${texnum(val+pct)}$", f"${texnum(total/10)}$"]))
    for i in range(10):
        a, b, c = i + 2, i + 5, 3 * (i + 2)
        x = b * c / a
        qs.append(question("proportions", f"prop-quatrieme-{i+1}", rf"Dans un tableau de proportionnalité, ${a}$ correspond à ${b}$. À quoi correspond ${c}$ ?", f"${texnum(x)}$", [f"${texnum(a*c/b)}$", f"${texnum(b+c-a)}$", f"${texnum(a+b+c)}$"]))
    for i in range(10):
        scale, dist = 1000 * (i + 1), i + 2
        real = dist * scale
        qs.append(question("proportions", f"prop-echelle-{i+1}", rf"Sur un plan à l'échelle $1:{scale}$, ${dist}$ cm représentent quelle distance réelle ?", f"${real}$ cm", [f"${dist+scale}$ cm", f"${texnum(real/100)}$ cm", f"${texnum(scale/dist)}$ cm"]))
    for i in range(10):
        den = [2, 4, 5, 8, 10, 20, 25, 40, 50, 100][i]
        num = max(1, den // 4)
        pct = 100 * num / den
        qs.append(question("proportions", f"prop-fraction-pourcentage-{i+1}", rf"Convertir ${frac(num,den)}$ en pourcentage.", f"${texnum(pct)}\%$", [f"${texnum(num/den)}\%$", f"${texnum(den/num)}\%$", f"${texnum(100*den/num)}\%$"]))
    for i in range(10):
        pct = 5 + 5 * i
        qs.append(question("proportions", f"prop-coeff-hausse-{i+1}", rf"Quel coefficient multiplicateur correspond à une hausse de ${pct}\%$ ?", f"${texnum(1+pct/100)}$", [f"${texnum(pct/100)}$", f"${texnum(1-pct/100)}$", f"${texnum(100+pct)}$"]))
    for i in range(10):
        a, b = 20 + 5 * i, 50 + 10 * i
        pct = 100 * a / b
        qs.append(question("proportions", f"prop-comparaison-{i+1}", rf"Quelle part représente ${a}$ sur ${b}$ ?", f"${texnum(pct)}\%$", [f"${texnum(b/a)}\%$", f"${texnum(a+b)}\%$", f"${texnum(100*b/a)}\%$"]))
    return qs


def evolutions():
    qs = []
    for i in range(10):
        price, pct = 40 + 10 * i, 5 + 2 * i
        qs.append(question("evolutions", f"evo-prix-hausse-{i+1}", rf"Un prix de ${price}$ € augmente de ${pct}\%$. Nouveau prix ?", f"${texnum(price*(1+pct/100))}$ €", [f"${texnum(price+pct)}$ €", f"${texnum(price*(1-pct/100))}$ €", f"${texnum(price*pct/100)}$ €"]))
    for i in range(10):
        price, pct = 60 + 10 * i, 5 + 2 * i
        qs.append(question("evolutions", f"evo-prix-baisse-{i+1}", rf"Un prix de ${price}$ € baisse de ${pct}\%$. Nouveau prix ?", f"${texnum(price*(1-pct/100))}$ €", [f"${texnum(price-pct)}$ €", f"${texnum(price*(1+pct/100))}$ €", f"${texnum(price*pct/100)}$ €"]))
    for i in range(10):
        a, b = 50 + 10 * i, 55 + 12 * i
        rate = (b - a) / a * 100
        qs.append(question("evolutions", f"evo-taux-{i+1}", rf"Une grandeur passe de ${a}$ à ${b}$. Quel est le taux d'évolution ?", f"${texnum(rate)}\%$", [f"${texnum(b-a)}\%$", f"${texnum((a-b)/b*100)}\%$", f"${texnum(b/a)}\%$"]))
    for i in range(10):
        pct = 10 + 2 * i
        qs.append(question("evolutions", f"evo-coeff-baisse-{i+1}", rf"Coefficient multiplicateur d'une baisse de ${pct}\%$ ?", f"${texnum(1-pct/100)}$", [f"${texnum(1+pct/100)}$", f"${texnum(pct/100)}$", f"${texnum(100-pct)}$"]))
    for i in range(10):
        a, b = 5 + i, 10 + i
        coeff = (1+a/100)*(1-b/100)
        rate = (coeff-1)*100
        qs.append(question("evolutions", f"evo-successive-{i+1}", rf"Une hausse de ${a}\%$ suivie d'une baisse de ${b}\%$ correspond à quel taux global ?", f"${texnum(rate)}\%$", [f"${texnum(a-b)}\%$", f"${texnum(a+b)}\%$", f"${texnum(b-a)}\%$"]))
    for i in range(10):
        final, pct = 99 + 11 * i, 10
        initial = final / 1.1
        qs.append(question("evolutions", f"evo-valeur-initiale-{i+1}", rf"Après une hausse de $10\%$, une valeur vaut ${final}$. Valeur initiale ?", f"${texnum(initial)}$", [f"${texnum(final*0.9)}$", f"${texnum(final+10)}$", f"${texnum(final/0.9)}$"]))
    for i in range(10):
        a, b = 30 + 4 * i, 42 + 5 * i
        qs.append(question("evolutions", f"evo-variation-absolue-{i+1}", rf"Une quantité passe de ${a}$ à ${b}$. Quelle est la variation absolue ?", f"${b-a}$", [f"${a-b}$", f"${b/a}$", f"${a+b}$"]))
    return qs


def fonctions():
    qs = []
    for i in range(10):
        a, b, x = i % 5 + 1, i - 4, i + 1
        qs.append(question("fonctions", f"fct-image-affine-{i+1}", rf"Soit $f(x)={a}x+({b})$. Calculer $f({x})$.", f"${a*x+b}$", [f"${a+x+b}$", f"${a*x-b}$", f"${x+b}$"]))
    for i in range(10):
        a, b, y = i % 5 + 2, i + 1, (i % 5 + 2) * (i + 2) + i + 1
        sol = (y - b) // a
        qs.append(question("fonctions", f"fct-antecedent-affine-{i+1}", rf"Soit $f(x)={a}x+{b}$. Quel antécédent de ${y}$ ?", f"${sol}$", [f"${sol+1}$", f"${y-b}$", f"${a+y}$"]))
    for i in range(10):
        a, x, y = i % 6 - 2, i + 1, (i % 6 - 2) * (i + 1)
        qs.append(question("fonctions", f"fct-lineaire-point-{i+1}", rf"La fonction linéaire $f(x)={a}x$ a pour représentation une droite passant par quel point ?", f"$({x};{y})$", [f"$({x};{y+1})$", f"$({y};{x})$", f"$({x};{a+x})$"]))
    for i in range(10):
        x1, y1, x2, y2 = 0, i + 2, 2, i + 6
        m = (y2 - y1) / (x2 - x1)
        qs.append(question("fonctions", f"fct-coeff-directeur-{i+1}", rf"Une droite passe par $(0;{y1})$ et $(2;{y2})$. Son coefficient directeur est :", f"${texnum(m)}$", [f"${y2-y1}$", f"${texnum((y1+y2)/2)}$", f"${y1}$"]))
    for i in range(10):
        a, b = i % 4 + 1, i - 3
        qs.append(question("fonctions", f"fct-ordonnee-origine-{i+1}", rf"Pour $f(x)={a}x+({b})$, l'ordonnée à l'origine est :", f"${b}$", [f"${a}$", f"${a+b}$", f"${-b}$"]))
    for i in range(10):
        a = i % 5 - 2
        nature = "croissante" if a > 0 else "décroissante" if a < 0 else "constante"
        wrongs = [x for x in ["croissante", "décroissante", "constante", "ni affine ni linéaire"] if x != nature]
        qs.append(question("fonctions", f"fct-variation-lineaire-{i+1}", rf"La fonction $f(x)={a}x+1$ est :", nature, wrongs))
    for i in range(10):
        a, b, x = i % 5 + 1, i + 2, i + 3
        qs.append(question("fonctions", f"fct-appartenance-{i+1}", rf"Le point $({x};{a*x+b})$ appartient à la courbe de quelle fonction ?", f"$f(x)={a}x+{b}$", [f"$f(x)={b}x+{a}$", f"$f(x)={a}x-{b}$", f"$f(x)=x+{a*x+b}$"]))
    return qs


def geometrie():
    qs = []
    triples = [(3,4,5),(5,12,13),(6,8,10),(7,24,25),(8,15,17),(9,12,15),(10,24,26),(12,16,20),(15,20,25),(20,21,29)]
    for i, (a, b, c) in enumerate(triples, 1):
        qs.append(question("geometrie", f"geo-pythagore-{i}", rf"Triangle rectangle de côtés perpendiculaires ${a}$ cm et ${b}$ cm. Hypoténuse ?", f"${c}$ cm", [f"${a+b}$ cm", f"${c-1}$ cm", f"${a*b}$ cm"]))
    for i in range(10):
        base, h = i + 4, i + 3
        qs.append(question("geometrie", f"geo-aire-triangle-{i+1}", rf"Aire d'un triangle de base ${base}$ cm et de hauteur ${h}$ cm ?", f"${texnum(base*h/2)}$ cm$^2$", [f"${base*h}$ cm$^2$", f"${base+h}$ cm$^2$", f"${texnum((base+h)/2)}$ cm$^2$"]))
    for i in range(10):
        r = i + 1
        qs.append(question("geometrie", f"geo-aire-disque-{i+1}", rf"Aire d'un disque de rayon ${r}$ ?", f"${r*r}\\pi$", [f"${2*r}\\pi$", f"${r}\\pi$", f"${r*r*2}\\pi$"]))
    for i in range(10):
        r = i + 2
        qs.append(question("geometrie", f"geo-perimetre-cercle-{i+1}", rf"Périmètre d'un cercle de rayon ${r}$ ?", f"${2*r}\\pi$", [f"${r*r}\\pi$", f"${r}\\pi$", f"${2+r}\\pi$"]))
    for i in range(10):
        x1, y1, x2, y2 = i, i + 2, i + 4, i + 6
        qs.append(question("geometrie", f"geo-milieu-{i+1}", rf"Milieu de $A({x1};{y1})$ et $B({x2};{y2})$ ?", f"$({texnum((x1+x2)/2)};{texnum((y1+y2)/2)})$", [f"$({x1+x2};{y1+y2})$", f"$({x2-x1};{y2-y1})$", f"$({x1};{y2})$"]))
    for i in range(10):
        l, L, h = i + 2, i + 3, i + 4
        qs.append(question("geometrie", f"geo-volume-pave-{i+1}", rf"Volume d'un pavé droit de dimensions ${l}$, ${L}$ et ${h}$ ?", f"${l*L*h}$", [f"${l+L+h}$", f"${2*(l*L+l*h+L*h)}$", f"${l*L}$"]))
    for i in range(10):
        a, b = 30 + i, 70 - i
        qs.append(question("geometrie", f"geo-angle-triangle-{i+1}", rf"Dans un triangle, deux angles mesurent ${a}^\circ$ et ${b}^\circ$. Troisième angle ?", f"${180-a-b}^\circ$", [f"${a+b}^\circ$", f"${180-a}^\circ$", f"${180-b}^\circ$"]))
    return qs


def statsprobas():
    qs = []
    for i in range(10):
        a, b, c = i + 2, i + 4, i + 9
        qs.append(question("statsprobas", f"stat-moyenne-{i+1}", rf"Moyenne de ${a}$, ${b}$ et ${c}$ ?", f"${texnum((a+b+c)/3)}$", [f"${a+b+c}$", f"${texnum((a+c)/2)}$", f"${c-b}$"]))
    for i in range(10):
        vals = [i + 1, i + 3, i + 5, i + 8, i + 9]
        qs.append(question("statsprobas", f"stat-mediane-{i+1}", rf"Médiane de la série ${', '.join(map(str, vals))}$ ?", f"${vals[2]}$", [f"${vals[0]}$", f"${texnum(sum(vals)/len(vals))}$", f"${vals[-1]}$"]))
    for i in range(10):
        vals = [i + 2, i + 7, i + 9, i + 12]
        qs.append(question("statsprobas", f"stat-etendue-{i+1}", rf"Étendue de la série ${', '.join(map(str, vals))}$ ?", f"${vals[-1]-vals[0]}$", [f"${vals[-1]+vals[0]}$", f"${vals[-1]}$", f"${vals[0]}$"]))
    for i in range(10):
        eff, total = i + 3, 20 + 2 * i
        qs.append(question("statsprobas", f"stat-frequence-{i+1}", rf"Dans un groupe de ${total}$ élèves, ${eff}$ ont choisi latin. Fréquence ?", f"${frac(eff,total)}$", [f"${frac(total,eff)}$", f"${eff+total}$", f"${frac(eff,100)}$"]))
    for i in range(10):
        fav, total = i + 1, 10 + i
        qs.append(question("statsprobas", f"proba-simple-{i+1}", rf"Une expérience a ${total}$ issues équiprobables dont ${fav}$ favorables. Probabilité ?", f"${frac(fav,total)}$", [f"${frac(total,fav)}$", f"${frac(fav,total-fav)}$", f"${fav+total}$"]))
    for i in range(10):
        fav, total = i + 2, 12 + i
        qs.append(question("statsprobas", f"proba-contraire-{i+1}", rf"Si $P(A)={frac(fav,total)}$, alors $P(\\overline{{A}})$ vaut :", f"${frac(total-fav,total)}$", [f"${frac(fav,total)}$", f"${frac(total,total-fav)}$", f"${frac(total+fav,total)}$"]))
    for i in range(10):
        a, b, total = i + 1, i + 3, 20 + i
        qs.append(question("statsprobas", f"proba-union-incompatible-{i+1}", rf"$A$ et $B$ incompatibles, $P(A)={frac(a,total)}$ et $P(B)={frac(b,total)}$. $P(A\\cup B)$ ?", f"${frac(a+b,total)}$", [f"${frac(a*b,total)}$", f"${frac(a+b,2*total)}$", f"${frac(a,total)}$"]))
    return qs


DATA = [
    ("01_calcul_numerique_algebrique.tex", "calcul", "Calcul numérique et algébrique", calcul),
    ("02_proportions_pourcentages.tex", "proportions", "Proportions et pourcentages", proportions),
    ("03_evolutions_variations.tex", "evolutions", "Évolutions et variations", evolutions),
    ("04_fonctions_representations.tex", "fonctions", "Fonctions et représentations", fonctions),
    ("05_geometrie.tex", "geometrie", "Géométrie", geometrie),
    ("06_statistiques_probabilites.tex", "statsprobas", "Statistiques et probabilités", statsprobas),
]


def main():
    for filename, group, title, factory in DATA:
        questions = factory()
        if len(questions) != 70:
            raise ValueError(f"{filename}: {len(questions)} questions au lieu de 70")
        write_theme(filename, questions)
        write_pdf_theme(filename, group, title)


if __name__ == "__main__":
    main()
