prologues:=2;
verbatimtex
etex
beginfig(1)  %%%% spirale de carrés
    pair A,B,C,D;
    u:=20cm;
    A=(0,0); B=(u,0); C=(u,u); D=(0,u);

    transform T;
    A transformed T = 1/5[A,B];
    B transformed T = 1/5[B,C];
    C transformed T = 1/5[C,D];

    path p;
    p = A--B--C--D--cycle;
    for i=0 upto 100:
      draw p withpen pencircle scaled 0.15mm;
      p:= p transformed T;
    endfor;
 endfig;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(2)  %%%% spirale de triangles
    pair A,B,C;
    u:=2cm;
    A=(0,0); B=(u,0); C=(0.5u,sqrt3*u/2);

    transform T;
    A transformed T = 1/12[A,B];
    B transformed T = 1/12[B,C];
    C transformed T = 1/12[C,A];

    path p;
    p = A--B--C--cycle;
    for i=0 upto 100:
      draw p withpen pencircle scaled 0.01bp;
      p:= p transformed T;
    endfor;
 endfig;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 beginfig(3) %% Flocon Von Koch
  u:=4cm;
  vardef koch(expr A,B,n) =
    save C; pair C;
    C = A rotatedaround(1/3[A,B], 120);
    if n>0:
      koch( A,        1/3[A,B], n-1);
      koch( 1/3[A,B], C,        n-1);
      koch( C,        2/3[A,B], n-1);
      koch( 2/3[A,B], B,        n-1);
    else:
      draw A--1/3[A,B]--C--2/3[A,B]--B withpen pencircle scaled 0.015mm;;
    fi;
  enddef;
  z0=(u,0);
  z1=z0 rotated 120;
  z2=z1 rotated 120;
  koch( z0, z1, 5 );
  koch( z1, z2, 5 );
  koch( z2, z0, 5 );
endfig;
%%%
u:=20cm;
beginfig(4)  %Sur un segment
 z0=(u,0);
  z1=-z0 ;
  koch( z0, z1, 0 );
endfig;

beginfig(5)  %Sur un segment
 z0=(u,0);
  z1=-z0 ;
  koch( z0, z1, 1 );
endfig;
beginfig(6)  %Sur un segment
 z0=(u,0);
  z1=-z0 ;
  koch( z0, z1, 2 );
endfig;
beginfig(7)  %Sur un segment
 z0=(u,0);
  z1=-z0 ;
  koch( z0, z1, 3 );

endfig;
beginfig(8)  %Sur un segment
 z0=(u,0);
  z1=-z0 ;
  koch( z0, z1, 4 );
endfig;
beginfig(8)  %Sur un segment
 z0=(u,0);
  z1=-z0 ;
  koch( z0, z1, 6 );
endfig;

beginfig(9)  %Koch Puzzle
 z0=(u,0);
  z1=-z0 ; z2=(0,1/sqrt3)*u;
  koch( z0, z1, 1 );
   koch( z1, z2, 1 );
endfig;
beginfig(10)  %Koch Puzzle
 z0=(u,0);
  z1=-z0 ; z2=(0,1/sqrt3)*u;
  koch( z0, z1, 2 );
   koch( z1, z2, 2 );
 endfig;
 beginfig(11)  %Koch Puzzle
 z0=(u,0);
  z1=-z0 ; z2=(0,1/sqrt3)*u;
  koch( z0, z1, 3 );
   koch( z1, z2, 3 );
 endfig;


 beginfig(12) %% Cantor
  u:=4cm; h=2mm;
pickup pencircle scaled 0.01mm yscaled 60;

vardef cantor(expr A,B,n)=
     if n>0:
      cantor( A,        1/3[A,B], n-1);
      cantor( 2/3[A,B], B,        n-1);
    else:
    draw A--1/3[A,B] ;
    draw 2/3[A,B]--B ;

    fi;
  enddef;


%%%%%%%%%%%%%%%%%%%%
   z0=(u,0); z1=-z0; z3=(0,-0.03)*u;
   draw z0--z1;
   for n=1 upto 6:
     cantor(z0+n*z3,z1+n*z3,n-1);
   endfor;
 endfig;
 %%%%%%%%%%%%%%%%%%%%%%%%%%
 beginfig(13) %% Arbre
   u:=1cm;
   z0=(0,0);
   a=50; %angle des 1eres branches avec l'horizontale.
   z1=(0,-3*u); z2=(2*cosd(a),2*sind(a))*u; z3=(-2*cosd(a),2*sind(a))*u;
   path p[];
   transform T, TT;
   T=identity scaled 2/3 rotated (90-a) shifted z3;
   TT=identity scaled 2/3 rotated (a-90) shifted z2;
   pickup pencircle scaled 4bp; draw z0--z1;

   pickup pencircle scaled 4bp;
   %p0=z0--z2--z0--z3--z0;
   p0=z2--z0--z3;
   draw p0;

%pickup pencircle scaled 10bp; draw point 0  of p0;%z0--z1;

 %  p1=p0 scaled 2/3 rotated (90-a) shifted point 0 of p0;%transformed T;
   %p2=p0 transformed TT;%scaled 2/3 rotated (a-90) shifted z2;
  % draw p1;
   %draw p2;


 vardef arbre(expr q,n) =
   transform Q, QQ;
   Q=identity scaled 2/3 rotatedaround( point 0 of q ,(90-a)) shifted point infinity of q;
   QQ=identity scaled 2/3 rotatedaround( point 0 of q ,(90-a)) shifted point 0 of q;
    save qq, qqq, qqqq; path qq, qqq, qqqq;
    qq=q transformed Q;
    qqq=q transformed QQ;
    %qqqq=qqq--q--qq;
    if n>0:
     % arbre( qqqq, n-1);
      arbre( qqq, n-1);
      arbre( qq, n-1);

    else:
      %draw qqqq withpen pencircle scaled 2bp;
      draw qqq withpen pencircle scaled 2bp;
      draw qq withpen pencircle scaled 2bp;
    fi;
  enddef;
  arbre(p0,0);
  arbre(p0,1);
 arbre(p0,2);
  arbre(p0,3);
endfig;
beginfig(14) %% Arbre Pour un TP "arbre" en TS
  u:=4cm; %h=2mm;
  pair A[], B[], C[];
  numeric k, t;
  A0=(0,0);
  A1=(0,u);
  draw A0--A1;
  B1=A1 rotatedaround(A0,40);
    C1=A1 rotatedaround(A0,10);
    C2=A1 rotatedaround(A0,20);
    C3=A1 rotatedaround(A0,30);
  draw A0--B1 dashed evenly;
  B2=B1 scaled 0.6;

  B3=B2 shifted A1;
  draw B3--A1;
  draw B2--B3 dashed evenly;
  draw A1..C1..C2..C3..B1 dashed evenly;
  draw ((A1..C1..C2..C3..B1) scaled 0.2);
  dotlabel.rt(btex $A$ etex, A0);
  dotlabel.rt(btex $B$ etex, A1);
  dotlabel.llft(btex $B_1$ etex, B1);
  dotlabel.llft(btex $B_2$ etex, B2);
  dotlabel.llft(btex $C$ etex, B3);
  label.lft(btex $t$ etex, (-0.05u,0.25u));
endfig;




 end
