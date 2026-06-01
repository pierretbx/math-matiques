verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\begin{document}
etex;

input repere;

vardef v(expr x)= (x**3)/40-3*(x**2)/10+7*x/10+27/5 enddef;

repere(-4,17,0.4cm,-2,10,0.4cm);
 path C_u,C_v;
 C_v:=courbefonc(v,-0.5,11,40);
 numeric a,b;
 a:=5; b:=3;
 pair vect;
 vect:=_c(a,-b);
 C_u:=C_v shifted vect;
 draw axes(0,0);
 draw C_u;
 draw C_v;
 pair A,B;
 A:=_c(9.5,v(9.5));
 B:=A shifted vect;
 draw projectionaxes(A,btex $x$ etex,btex $v(x)$ etex,6) dashed evenly;
 draw projectionaxes(B,btex $x+a$ etex,btex $u(x+a)$ etex,6) dashed evenly;
 drawarrow B--A;
 draw vecteur.lft(_c(-0.5,v(9.5)-b),_c(0,b),btex $b$ etex);
 draw vecteur.bot(_c(9.5,-0.5),_c(a,0),btex $a$ etex);
 nomme.ulft(C_v,10.5);
 nomme.ulft(C_u,10.5+a);
fin;


vardef f(expr x)= x**2 enddef;

repere(-1.5,1.5,1.5cm,-0.5,2.5,1.5cm);
 path C_f,C_g;
 C_f:=courbefonc(f,-1.5,1.5,40);
 C_g:=C_f yscaled 2;
 draw axes(0,0);
 pair A,B;
 A:=_c(1,f(1));
 B:=A yscaled 2;
 draw projectionaxes(B,btex $x$ etex,btex $2u(x)$ etex) dashed evenly;
 draw projectiony.lft(A,btex $u(x)$ etex) dashed evenly;
 draw C_f withpen pencircle scaled 1.5bp;
 draw C_g;
fin;

repere(-1.5,1.5,1.5cm,-0.5,2.5,1.5cm);
 path C_f,C_h;
 C_f:=courbefonc(f,-1.5,1.5,40);
 C_h:=C_f yscaled 0.5;
 draw axes(0,0);
 pair A,B;
 A:=_c(1.2,f(1.2));
 B:=A yscaled 0.5;
 draw projectionaxes(A,btex $x$ etex,btex $u(x)$ etex) dashed evenly;
 draw projectiony.lft(B,btex $\frac{1}{2}u(x)$ etex) dashed evenly;
 draw C_f withpen pencircle scaled 1.5bp;
 draw C_h;
fin;

repere(-1.5,1.5,1.5cm,-2,2.5,1.5cm);
 path C_f,C_i;
 C_f:=courbefonc(f,-1.5,1.5,40);
 C_i:=C_f yscaled -0.75;
 draw axes(0,0);
 pair A,B;
 A:=_c(1.2,f(1.2));
 B:=A yscaled -0.75;
 draw projectionaxes(A,"",btex $u(x)$ etex) dashed evenly;
 draw projectiony.lft(B,btex $-\frac{3}{4}u(x)$ etex) dashed evenly;
 draw projectionx.lrt(B,btex $x$ etex) dashed evenly;
 draw C_f withpen pencircle scaled 1.5bp;
 draw C_i;
fin;

end