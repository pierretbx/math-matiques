prologues:=2;
verbatimtex
etex

u:=4cm;
pair A[];
  A1:=origin;
  A2:=(1,0)*u;
  A3:=(1,1)*u;
  A4:=(0,1)*u; A5:=(0.5,0.5)*u;  A6:=(0.5 , 0.87)*u;
  A7:=(0.33,0.67)*u;  A8:=(0.67 , 0.67)*u;

path pp;
  %pp:=A1{right}..A2{down}; %dissymétrique
  %pp:=A1--A2; % simple segment Effet micro-chip
  %pp:=A1{right}..{up}A7--A8{down}..A2{right};
  %pp:=A1{up}..A2{down};  %demicercle
  %pp:=A1{up}..A6..A2{down};  %Ovale
  %pp:=A1--A6--A2; %triangle équilatéral
  pp:=A1{dir=45}..A6{left}..A2{dir=-45}; %bouclette avec angle droit tip top
  %pp:=A1{right}..A6{left}..A2{right}; %bouclette

beginfig(1)

  pair A[];
  A1:=origin;
  A2:=(1,0)*u;
  A3:=(1,1)*u;
  A4:=(0,1)*u;
 draw A1--A2--A3--A4--cycle;

 pickup pencircle scaled 0.1 mm ;
 path p;
 p:=pp;
  draw p;

endfig;
beginfig(2)

  pair A[];
  A1:=origin;
  A2:=(1,0)*u;
  A3:=(1,1)*u;
  A4:=(0,1)*u;
pickup pencircle scaled 0.1 mm ;
  draw A1--A2--A3--A4--cycle dashed evenly;% withdots;


 path p;
 p:=pp;
  %draw p;
  path q;
  q:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  draw q;

endfig;


beginfig(3)

  path p;
 p:=pp;
 draw A1--A2--A3--A4--cycle dashed evenly;

 pickup pencircle scaled 0.1 mm ;

  %draw p;
  path q;
  q:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw q;
  p:=q;
   path qq;
  qq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  draw qq;

   endfig;


beginfig(4)
  path p;
 p:=pp;

 draw A1--A2--A3--A4--cycle dashed evenly;

 pickup pencircle scaled 0.1 mm ;

  path q;
  q:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw q;
  p:=q;
   path qq;
  qq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw qq;
  p:=qq;
  path qqq;
   qqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   draw qqq;

   endfig;


beginfig(5)
  path p;
 p:=pp;

 draw A1--A2--A3--A4--cycle dashed evenly;

 pickup pencircle scaled 0.1 mm ;

  path q;
  q:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw q;
  p:=q;
   path qq;
  qq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw qq;
  p:=qq;
  path qqq;
   qqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   %draw qqq;

    p:=qqq;
  path qqqq;
   qqqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   draw qqqq;

   endfig;


   beginfig(6)
  path p;
 p:=pp;

% draw A1--A2--A3--A4--cycle;

 pickup pencircle scaled 0.08 mm ;

  %draw p;
  path q;
  q:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw q;
  p:=q;
   path qq;
  qq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw qq;
  p:=qq;
  path qqq;
   qqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   %draw qqq;

    p:=qqq;
  path qqqq;
   qqqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   %draw qqqq;

   p:=qqqq;
  path qqqqq;
   qqqqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   draw qqqqq;



 endfig;


  beginfig(7)
   path p;
 p:=pp;

% draw A1--A2--A3--A4--cycle;

 pickup pencircle scaled 0.05 mm ;

  path q;
  q:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw q;
  p:=q;
   path qq;
  qq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw qq;
  p:=qq;
  path qqq;
   qqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   %draw qqq;

    p:=qqq;
  path qqqq;
   qqqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   %draw qqqq;

   p:=qqqq;
  path qqqqq;
   qqqqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   %draw qqqqq;

    p:=qqqqq;
  path qqqqqq;
   qqqqqq:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
   draw qqqqqq;

%p:=q;

%


endfig;
end
