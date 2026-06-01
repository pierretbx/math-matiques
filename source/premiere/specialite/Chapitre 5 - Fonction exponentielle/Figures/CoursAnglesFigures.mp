verbatimtex
%&latex
\documentclass{article}
\newcommand{\vect}[1]{\overrightarrow{#1\rule{0.1em}{0ex}}}
\begin{document}
etex


beginfig(1);
numeric u;
u=1.3cm ;
draw fullcircle scaled (2*u);

pair A,B;
A:=u*(cosd(-15),sind(-15));
B:=u*(cosd(100),sind(100));

drawarrow (0,0)--1.8*A;
drawarrow (0,0)--1.4*B;

drawarrow 0.3*A{dir 75}..0.3*B{dir 190};

dotlabel.llft(btex $0$ etex, (0,0));
dotlabel.lrt(btex $A$ etex,A);
dotlabel.ulft(btex $B$ etex,B);


label.bot(btex $\vect{u}$ etex, 0.5*A);
label.lft(btex $\vect{v}$ etex, 0.5*B);
endfig;



beginfig(2);
numeric u;
u=1cm ;

drawarrow (0,0)--(4*u,0);
drawarrow (0,0.1*u)--(2.4*u,0.1*u);
draw (0,0) withpen pencircle scaled 2 pt;
draw (0,0.1*u) withpen pencircle scaled 2 pt;

label.bot(btex $\vect{u}$ etex, (2*u,0));
label.top(btex $\vect{v}$ etex, (1.6*u,0.1*u));
endfig;

beginfig(3);
numeric u;
u=1cm ;
draw (0,0) withpen pencircle scaled 3 pt;
dotlabel.lft(btex $$ etex, (0,0));
drawarrow (0,0)--(4*u,0);
drawarrow (0,0)--(-2.4*u,0);

label.bot(btex $\vect{u}$ etex, (2*u,0));
label.top(btex $\vect{v}$ etex, (-1.2*u,0u));

label.top(btex $\pi$ etex, (0,0.5*u));
drawarrow (0.5*u,0){up}..(0,0.5*u)..(-0.5*u,0){down};
endfig;



beginfig(4);
numeric u;
u=1cm ;
draw (0,0) withpen pencircle scaled 3 pt;
drawarrow (0,0)--(1.5*u,0);
drawarrow (0,0)--(-cosd(45)*u,sind(45)*u);
drawarrow (0,0)--(-cosd(60)*1.2*u,-sind(60)*1.2*u);

label.bot(btex $\vect{u}$ etex, (1*u,0));
label.lft(btex $\vect{v}$ etex, (-cosd(45)*u-0.1*u,sind(45)*u));
label.ulft(btex $\vect{w}$ etex, (-cosd(60)*1.2*u-0.1*u,-sind(60)*1.2*u));

drawarrow (0.3*u,0){up}..(-cosd(45)*0.3*u,sind(45)*0.3*u);
drawarrow (-cosd(45)*0.4*u,sind(45)*0.4*u)..(-0.4*u,0)..(-cosd(60)*0.4*u,-sind(60)*0.4*u);
drawarrow 
(0.7*u,0){up}..(-cosd(45)*0.7*u,sind(45)*0.7*u)..(-cosd(60)*0.7*u,-sind(60)*0.7*u);

endfig;


beginfig(5);
numeric u;
u=1cm ;
draw (0,0) withpen pencircle scaled 3 pt;
drawarrow (0,0)--(1.5*u,0);
drawarrow (0,0)--(-cosd(45)*u,sind(45)*u);

label.bot(btex $\vect{u}$ etex, (1*u,0));
label.lft(btex $\vect{v}$ etex, (-cosd(45)*u-0.1*u,sind(45)*u));

drawarrow (0.3*u,0){up}..(-cosd(45)*0.3*u,sind(45)*0.3*u);
drawarrow reverse((0.6*u,0){up}..(-cosd(45)*0.6*u,sind(45)*0.6*u));

endfig;

beginfig(6);
numeric u;
u=1cm ;
draw (0,0) withpen pencircle scaled 3 pt;
drawarrow (0,0)--(1.5*u,0);
drawarrow (0,0)--(cosd(45)*u,sind(45)*u);
drawarrow (0,0)--(-cosd(45)*u,-sind(45)*u);

label.bot(btex $\vect{u}$ etex, (1*u,0));
label.lft(btex $\vect{v}$ etex, (cosd(45)*u-0.1*u,sind(45)*u));
label.rt(btex $-\vect{v}$ etex, (-cosd(45)*u,-sind(45)*u));

drawarrow (0.3*u,0){up}..(cosd(45)*0.3*u,sind(45)*0.3*u);
drawarrow (0.6*u,0){up}..(cosd(45)*0.6*u,sind(45)*0.6*u)..(-0.6*u,0)..(-cosd(45)*0.6*u,-sind(45)*0.6*u);

endfig;



beginfig(7);
numeric u;
u=1cm ;
draw (0,0) withpen pencircle scaled 3 pt;
drawarrow (0,0)--(1.5*u,0);
drawarrow (0,0)--(-1.5*u,0);
drawarrow (0,0)--(cosd(45)*u,sind(45)*u);


label.bot(btex $\vect{u}$ etex, (1*u,0));
label.bot(btex $-\vect{u}$ etex, (-1*u,0));
label.lft(btex $\vect{v}$ etex, (cosd(45)*u-0.1*u,sind(45)*u));

drawarrow (0.6*u,0){up}..(cosd(45)*0.6*u,sind(45)*0.6*u);
drawarrow (-0.3*u,0){down}..(0,-0.3*u)..(0.3*u,0)..(cosd(45)*0.3*u,sind(45)*0.3*u);

endfig;

beginfig(8);
numeric u;
u=1cm ;
draw (0,0) withpen pencircle scaled 3 pt;
drawarrow (0,0)--(1.5*u,0);
drawarrow (0,0)--(-1.5*u,0);
drawarrow (0,0)--(cosd(45)*u,sind(45)*u);
drawarrow (0,0)--(-cosd(45)*u,-sind(45)*u);

label.bot(btex $\vect{u}$ etex, (1*u,0));
label.bot(btex $-\vect{u}$ etex, (-1*u,0));
label.lft(btex $\vect{v}$ etex, (cosd(45)*u-0.1*u,sind(45)*u));
label.rt(btex $-\vect{v}$ etex, (-cosd(45)*u,-sind(45)*u));

drawarrow (0.5*u,0){up}..(cosd(45)*0.5*u,sind(45)*0.5*u);
drawarrow (-0.5*u,0){down}..(-cosd(45)*0.5*u,-sind(45)*0.5*u);

endfig;

beginfig(9);
numeric u,y,k;
u=1cm ;
y:=0.75*sqrt(3);
k:=0.6*u;
pair A,B,C,D,e,f;
A:=(0,0);
B:=u*(3,0);
e:=u*(4,0);
C:=u*(3.75,y);
D:=u*(1.5,y);
f:=u*(4.125,1.5*y);

draw A--B--C--D;
draw B--e dashed evenly;
draw C--f dashed evenly;

dotlabel.bot(btex $A$ etex,A);
dotlabel.bot(btex $B$ etex,B);
dotlabel.lrt(btex $C$ etex,C);
dotlabel.llft(btex $D$ etex,D);

drawarrow (B+k*unitvector(e-B)){up}..(B+k*unitvector(C-B)){dir 150};
drawarrow (C+0.7*k*unitvector(f-C)){dir 150}..(C+0.7*k*unitvector(D-C)){down};

label.rt(btex $\frac{\pi}{3}$ etex, B+((k*unitvector(e-B)) rotated 40));
label.ulft(btex $\frac{2\pi}{3}$ etex, C+((0.5*k*unitvector(f-C)) rotated 45));
endfig

end


