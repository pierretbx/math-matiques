verbatimtex
%&latex
\documentclass{article}
\newcommand{\vect}[1]{\overrightarrow{#1\rule{0.1em}{0ex}}}
\begin{document}
etex


beginfig(1);
numeric u;
u=1.5cm ;
drawarrow (-u,0)--(u,0);
drawarrow (0,-u)--(0,u);
draw fullcircle scaled (2*u);
draw (0,sind(45)*u)--(cosd(45)*u,sind(45)*u) dashed evenly;
draw (cosd(45)*u,0)--(cosd(45)*u,sind(45)*u) dashed evenly;
draw (0,0)--(cosd(45),sind(45))*u;
drawarrow (0.3*u,0){up}..(0.3*cosd(45)*u,0.3*sind(45)*u);
dotlabel.llft(btex $O$ etex, (0,0));
dotlabel.lrt(btex $A$ etex, (u,0));
dotlabel.ulft(btex $B$ etex, (0,u));
dotlabel.lft(btex $\sin x$ etex, (0,sind(45)*u));
dotlabel.bot(btex $\cos x$ etex, (cosd(45)*u,0));
dotlabel.urt(btex $M(x)$ etex,(cosd(45)*u,sind(45)*u));
endfig;

beginfig(2);
numeric u;
u=2.5cm ;
drawarrow (-1.2*u,0)--(1.2*u,0);
drawarrow (0,-1.2*u)--(0,1.2*u);
draw fullcircle scaled (2*u);
%draw (0,0)--(cosd(45)*u,sind(45)*u);
draw (-cosd(45)*u,sind(45)*u)--(cosd(45)*u,-sind(45)*u);
draw (-cosd(45)*u,-sind(45)*u)--(cosd(45)*u,sind(45)*u);
draw (cosd(45)*u,sind(45)*u)--(-cosd(45)*u,sind(45)*u)--(-cosd(45)*u,-sind(45)*u)--(cosd(45)*u,-sind(45)*u)-- cycle dashed evenly;
drawarrow (0.3*u,0){up}..(0.3*cosd(45)*u,0.3*sind(45)*u);
drawarrow (0.35*u,0){down}..(0.35*cosd(45)*u,-0.35*sind(45)*u);
drawarrow (0.5*u,0){up}..(0,0.5*u)..(-0.5*cosd(45)*u,0.5*sind(45)*u);
drawarrow (0.4*u,0){up}..(0,0.4*u)..(-0.4*cosd(45)*u,-0.4*sind(45)*u);
dotlabel.llft(btex $0$ etex, (0,0));
dotlabel.lrt(btex $A$ etex, (u,0));
dotlabel.ulft(btex $B$ etex, (0,u));
dotlabel.ulft(btex $\sin x$ etex, (0,sind(45)*u));
dotlabel.llft(btex $-\sin x$ etex, (0,-sind(45)*u));
dotlabel.llft(btex $\cos x$ etex, (cosd(45)*u,0));
dotlabel.lrt(btex $-\cos x$ etex, (-cosd(45)*u,0));
label.top(btex $x$ etex,(cosd(45)*u,sind(45)*u));
label.top(btex $\pi-x$ etex,((-cosd(45)-0.1)*u,sind(45)*u));
label.bot(btex $\pi+x$ etex,((-cosd(45)-0.1)*u,-sind(45)*u));
label.bot(btex $-x$ etex,(cosd(45)*u,(-sind(45)-0.05)*u));
endfig;


beginfig(3);
numeric u;
u=2.5cm ;
drawarrow (-1.2*u,0)--(1.2*u,0);
drawarrow (0,-1.2*u)--(0,1.2*u);
draw fullcircle scaled (2*u);
draw (0,0)--(cosd(30)*u,sind(30)*u);
draw (0,0)--(cosd(60)*u,sind(60)*u);
draw (0,0)--(-cosd(60)*u,sind(60)*u);

draw (cosd(30)*u,0)--(cosd(30)*u,sind(30)*u) dashed evenly;
draw (cosd(60)*u,0)--(cosd(60)*u,sind(60)*u) dashed evenly;
draw (0,sind(30)*u)--(cosd(30)*u,sind(30)*u) dashed evenly;
draw (-cosd(60)*u,sind(60)*u)--(cosd(60)*u,sind(60)*u) dashed evenly;
draw (-cosd(60)*u,sind(60)*u)--(-cosd(60)*u,0) dashed evenly;


drawarrow (0.3*u,0){up}..(0.3*cosd(30)*u,0.3*sind(30)*u);
drawarrow (0.4*u,0){up}..(0.4*cosd(60)*u,0.4*sind(60)*u);
drawarrow (0.35*u,0){up}..(0.4*cosd(120)*u,0.4*sind(120)*u);

dotlabel.llft(btex $0$ etex, (0,0));
label.bot(btex $A$ etex, (1.1*u,0.2*u));
dotlabel.bot(btex $$ etex, (u,0));
dotlabel.ulft(btex $B$ etex, (0,u));

dotlabel.lft(btex $\sin x$ etex, (0,sind(30)*u));
dotlabel.llft(btex $\cos x$ etex, (0,sind(60)*u));
dotlabel.bot(btex $\cos x$ etex, (cosd(30)*u,0));
dotlabel.bot(btex $\sin x$ etex, (cosd(60)*u,0));
dotlabel.bot(btex $-\sin x$ etex, (cosd(120)*u,0));
label.top(btex $x$ etex,(cosd(30)*u,sind(30)*u));
label.lft(btex $\frac{\pi}{2}+x$ etex,((cosd(120)-0.05)*u,(sind(120)+0.1)*u));
label.rt(btex $\frac{\pi}{2}-x$ etex,(cosd(60)*u,(sind(60)+0.1)*u));
endfig;


beginfig(4);
%coordonnees polaires
numeric u;
pair O,i,j,M;
u=0.5cm;

O:=(0,0);
i=(1,0)*u;
j=(0,1)*u;
M:=(4,3)*u;

drawarrow O--i;
drawarrow O--j;
draw (-i)--(5*i);
draw (-j)--(4*j);
draw O--M;
label.llft(btex $O$ etex, O);
label.bot(btex $\vect{i}$ etex, 0.5*i);
label.lft(btex $\vect{j}$ etex, 0.5*j);
label.top(btex $r$ etex , 0.5*M);

drawarrow 2*i{up}..0.4*M{(-3,4)};
label.lrt(btex $\theta$ etex , (2,1)*u);

dotlabel.top(btex $M$ etex , M);
endfig;

end


beginfig(5);
numeric u;
u=2.5cm ;
draw fullcircle scaled 5cm;
draw fullcircle scaled 8cm;

draw (0,0)--(1.8*u,0);
draw (0,0)--(-1.8*u,0);
draw (0,0)--(0,1.8*u);
draw (0,0)--(0,-1.8*u);

drawarrow (0,0)--(u,0);
drawarrow (0,0)--(0,u);

drawarrow (0,0)--(cosd(120)*1.6*u,sind(120)*1.6*u);
draw (cosd(120)*1.6*u,sind(120)*1.6*u)--(cosd(120)*1.6*u,0) dashed evenly;
draw (cosd(120)*1.6*u,sind(120)*1.6*u)--(0,sind(120)*1.6*u) dashed evenly;
draw (cosd(120)*u,sind(120)*u)--(cosd(120)*u,0) dashed evenly;
draw (cosd(120)*u,sind(120)*u)--(0,sind(120)*u) dashed evenly;
drawarrow (0,0)--(cosd(120)*u,sind(120)*u);

drawarrow (0.3*u,0){up}..(0,0.3*u)..(0.3*cosd(120)*u,0.3*sind(120)*u);

dotlabel.llft(btex $0$ etex, (0,0));
dotlabel.lft(btex $N$ etex, ((cosd(120))*u,sind(120)*u));
dotlabel.top(btex $M$ etex,(cosd(120)*1.6*u,sind(120)*1.6*u));
label(btex $\theta$ etex, (0.3*u,0.3*u));

label.bot(btex $\vect{\imath}$ etex, (0.5*u,0));
label.rt(btex $\vect{\jmath}$ etex, (0,0.5*u));
%label.lft(btex $\vect{u}$ etex, ((cosd(120))*u*0.5,sind(120)*u*0.5));
label.bot(btex $x$ etex, (cosd(120)*1.6*u,0)) ;
label.rt(btex $y$ etex, (0,sind(120)*1.6*u)) ;
label.bot(btex $\cos \theta$ etex, (cosd(120)*u,0)) ;
label.rt(btex $\sin \theta$ etex, (0,sind(120)*u)) ;

endfig;


end


