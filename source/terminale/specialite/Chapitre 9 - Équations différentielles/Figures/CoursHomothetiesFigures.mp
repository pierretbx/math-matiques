verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\newcommand{\vect}[1]{\overrightarrow{#1\rule{0.1em}{0ex}}}
\begin{document}
etex;

numeric u;
u:=1cm;

beginfig(1)
drawarrow (0.5,1)*u--(2.5,2)*u;
drawarrow (2,0.5)*u--(4,1.5)*u;
label.ulft(btex $\vect{u}$ etex, (1.5,1.5)*u);
label.llft(btex $M$ etex, (2,0.5)*u);
label.urt(btex $M'$ etex, (4,1.5)*u);
endfig;

beginfig(2)
pair M,M',N,N',v;
v:=(2,1)*u;
M:=(2,0.5)*u;
M':=M+v;
N:=(3.5,0)*u;
N':=N+v;
drawarrow (0.5,1)*u--(2.5,2)*u;
drawarrow M--M' dashed evenly;
drawarrow N--N' dashed evenly;
drawarrow M--N;
drawarrow M'--N';
label.ulft(btex $\vect{u}$ etex, (1.5,1.5)*u);
label.llft(btex $M$ etex, M);
label.urt(btex $M'$ etex, M');
label.llft(btex $N$ etex, N);
label.urt(btex $N'$ etex, N');
endfig;

beginfig(3)
pair O,M,M',o,m,m';
O:=(0.5,0.5)*u;
M:=(2.5,1.5)*u;
M'-O=1.5(M-O);
o:=(6,1)*u;
m:=(8,2)*u;
m'-o=-0.5(m-o);
drawarrow O--M';
drawarrow O--M;
drawarrow o--m';
drawarrow o--m;
dotlabel.llft(btex $O$ etex, O);
label.lrt(btex $M$ etex, M);
label.lrt(btex $M'$ etex, M');
dotlabel.lrt(btex $O$ etex, o);
label.lrt(btex $M$ etex, m);
label.lrt(btex $M'$ etex, m');
label.urt(btex $k>0$ etex, (2.5,0.5)*u);
label.urt(btex $k<0$ etex, (7,0.5)*u);
endfig;

beginfig(4)
pair O,M,M',N,N';
O:=(0.5,0.5)*u;
M:=(2.5,0.5)*u;
N:=(3.5,2)*u;
M'-O=1.5*(M-O);
N'-O=1.5*(N-O);
drawarrow M--N;
drawarrow M'--N';
draw O--M'+0.5*u*unitvector(M'-O);
draw O--N'+0.5*u*unitvector(N'-O);
dotlabel.llft(btex $O$ etex, O);
label.bot(btex $M$ etex, M);
label.bot(btex $M'$ etex, M');
label.top(btex $N$ etex, N);
label.top(btex $N'$ etex, N');
endfig;

beginfig(5)
pair O,A,A',B,B',C,C';
O:=(0.5,2)*u;
A:=(2.5,3.5)*u;
B:=(2.5,2)*u;
C:=(2.5,1)*u;
A'-O=1.5*(A-O);
B'-O=1.5*(B-O);
C'-O=1.5*(C-O);
draw O--A';
draw O--B';
draw O--C';
draw (2.5,0.5)*u--(2.5,4)*u;
draw (3.5,0)*u--(3.5,4.5)*u;
dotlabel.lft(btex $O$ etex, O);
label.ulft(btex $A$ etex, A);
label.rt(btex $A'$ etex, A');
label.urt(btex $B$ etex, B);
label.rt(btex $B'$ etex, B');
label.llft(btex $C$ etex, C);
label.lrt(btex $C'$ etex, C');
endfig;

beginfig(6)
pair O,A,B,C,A',B',C';
O:=(2,1.5)*u;
A:=(3,3)*u;
B:=(3,1)*u;
C:=(5,2)*u;
A'-O=-0.5*(A-O);
B'-O=-0.5*(B-O);
C'-O=-0.5*(C-O);
draw C--A--B;
draw C'--A'--B';
draw A--A' dashed evenly;
draw B--B' dashed evenly;
draw C--C' dashed evenly;
drawarrow A+0.5*u*unitvector(B-A){right}..A+0.5*u*unitvector(C-A);
drawarrow A'+0.35*u*unitvector(B'-A'){left}..A'+0.5*u*unitvector(C'-A');
dotlabel.bot(btex $O$ etex, O);
label.top(btex $A$ etex, A);
label.bot(btex $A'$ etex, A');
label.bot(btex $B$ etex, B);
label.top(btex $B'$ etex, B');
label.lrt(btex $C$ etex, C);
label.llft(btex $C'$ etex, C');
endfig;

beginfig(7)
pair O,A,A',M,M';
O:=(0.5,2)*u;
A:=(2.5,2)*u;
M:=A+(cosd(70),sind(70))*0.75*u;
A'-O=2*(A-O);
M'-O=2*(M-O);
draw O--A';
draw O--M';
draw fullcircle scaled (1.5*u) shifted A;
draw fullcircle scaled (3*u) shifted A';
dotlabel.lft(btex $O$ etex, O);
dotlabel.bot(btex $A$ etex, A);
dotlabel.bot(btex $A'$ etex, A');
dotlabel.top(btex $M$ etex, M);
dotlabel.top(btex $M'$ etex, M');
endfig;
end