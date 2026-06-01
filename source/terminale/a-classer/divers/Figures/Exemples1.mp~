%d'après Urs Oswald http://www.ursoswald.ch/

%prologues:=2;
u:=25;                        % 25 = 25bp = 25 PostScript points = 30/72 in
wi:=10;                       % width  in units u   
he:=9;                        % height in units u
hoehe:=he*u;                  % height
breite:=wi*u;                 % width
transform t, Txy;
pair P[];
path p[];
color sommet[], vecteur;      % 3D vectors: MetaPost type ``color''

rotX:=0;                     % angle of rotation around the x axis
rotY:=0;                     % angle of rotation around the y axis
rotZ:=-45;                     % angle of rotation around the z axis
vecteur:=(0,0,0);%(1.6, 1, 2.7);        % translation (in mathematical units)

P0=(3.2, 2.2)*u;              % origin in MetaPost coordinates (bp)
P1=(-.6, -.4)/1.5;            % x axis in mathematical coordinates

t:=identity                   %   t: maps mathematical 2D coordinates 
     scaled u                 %      onto MetaPost coordinates (bp)
       shifted P0;

Txy:=identity                 % Txy: maps 3D coordinates x,y onto 
       reflectedabout((0,0), (1,1))      %      MetaPost coordinates     
         yscaled ypart P1               
	   slanted (xpart P1/ypart P1)
	     transformed t;   
	   
vardef rotaX(expr SpaceVector, winkel) =              % rotation of 3D vector 
  pair yz;                                             % ``SpaceVector'' around
  yz:=(greenpart SpaceVector, bluepart SpaceVector);   % the x axis by the
  yz:=yz rotated winkel;                               % angle ``winkel''
  (redpart SpaceVector, xpart yz, ypart yz)
enddef;

vardef rotaY(expr SpaceVector, winkel) =              % rotation around the y axis
  pair zx;
  zx:=(bluepart SpaceVector, redpart SpaceVector);
  zx:=zx rotated winkel;
  (ypart zx, greenpart SpaceVector, xpart zx)
enddef;

vardef rotaZ(expr SpaceVector, winkel) =              % rotation around the z axis
  pair xy;
  xy:=(redpart SpaceVector, greenpart SpaceVector);
  xy:=xy rotated winkel;
  (xpart xy, ypart xy, bluepart SpaceVector)
enddef;

vardef getPixel(expr SpaceVector) =                    % returns MetaPost coordinates (bp)
  % SpaceVector: type ``color''                        % of spatial projection of
  (redpart SpaceVector, greenpart SpaceVector)         % 3D point 
    transformed Txy                                    % with coordinates ``SpaceVector''
      shifted (0, u*bluepart SpaceVector)  
enddef;

vardef Face(text t) =                 % returns cyclic path formed of the 
  forsuffixes $=t: z$-- endfor          % z points with suffixes in argument t
  cycle
enddef;	                

vardef Arete(text t) =                   % returns path formed of the 
  k:=0;                                 % z points with suffixes in argument t
  forsuffixes $=t: k:=k+1; endfor       % count number of arguments first  					
  i:=1;					
  forsuffixes $=t:             % problem: the last z must not be followed by --
    if i<k: z$-- else: z$ fi  
    hide(i:=i+1)       %hide: to prevent ``i:=i+1'' to be written into the path
  endfor               % no ; after ``)'' (would be written into path)
enddef;	                

def lot(expr n) =      % draws perpendicular line from point sommet[n]
  color SpaceVector;                    % to (x,y) plane 
  SpaceVector:=sommet[n];
  draw getPixel(SpaceVector)--getPixel((redpart SpaceVector,greenpart SpaceVector, 0));  
  draw_point(getPixel(SpaceVector), white, black);    
  draw_point( getPixel((redpart SpaceVector,greenpart SpaceVector, 0)), white, black);  
enddef;
	  
def draw_point(expr P, colInt, colPer) =
  fill fullcircle scaled 1mm shifted P withcolor colInt;
  draw fullcircle scaled 1mm shifted P withcolor colPer;
enddef;	  
	   
def Lote(text t) =        % invokes lot(n) for all the suffixes in 
  forsuffixes $=t:        % argument t
    lot($);
  endfor    
enddef;
  
sommet0:=(3, 0, 0);                       % definition of cube ``sommet''
sommet1:=(3, 3, 0);                       % (array of type color)
sommet2:=(0, 3, 0);                       % in mathematical 3D coordinates
sommet3:=(0, 0, 0);
sommet4:=(3, 0, 3);
sommet5:=(3, 3, 3);
sommet6:=(0, 3, 3);
sommet7:=(0, 0, 3);

beginfig(1);
  rotZ:=50;
  for i=0 upto 7:                            % rotation and translation
    sommet[i]:=rotaX(sommet[i], rotX);    % of cube
    sommet[i]:=rotaY(sommet[i], rotY);
    sommet[i]:=rotaZ(sommet[i], rotZ);
    sommet[i]:=sommet[i]+vecteur;
  endfor
    
  for i=0 upto 7:    %  z100,...,z107: MetaPost coordinates of 
    z[i+100]=getPixel(sommet[i]);           %  cube after rotation           
  endfor
  
  % --- Axes ---
  drawarrow getPixel((0, 0, 0))--getPixel((6, 0, 0)); 
  label.llft(btex $x$ etex, getPixel((6, 0, 0))+(0, 1mm));  
  drawarrow getPixel((0, 0, 0))--getPixel((0, 6, 0)); 
  label.rt  (btex $y$ etex, getPixel((0, 6, 0)));  
  drawarrow getPixel((0, 0, 0))--getPixel((0, 0, 6)); 
  label.top (btex $z$ etex, getPixel((0, 0, 6)));  
 
  % --- Cube after rotation ---
  fill Face(104, 105, 106, 107) withcolor .7red;
  fill Face(103, 100, 104, 107) withcolor .9red;
  fill Face(100, 101, 105, 104) withcolor .5red;    
  draw Arete(106, 102, 103) dashed evenly;  
  draw Arete(102, 101)      dashed evenly;
  draw Arete(107, 104, 100, 104, 105);      
  draw Face(101, 105, 106, 107, 103,100);  
endfig;
beginfig(2);
  %Pyramide
  sommet0:=(0, 0, 0);
  sommet1:=(3, 4, 0);
  sommet2:=(0, 7, 0);
  sommet3:=(0, 2, 5);
  %définition des points
  for i=0 upto 3:
    z[i]=getPixel(sommet[i]);
  endfor
% --- Grid ---

  for i=0 upto 5:    
      draw getPixel((i,0,0))--getPixel((i,5,0)) withcolor .7white;     
      draw getPixel((0,i,0))--getPixel((5,i,0)) withcolor .7white;    
      draw getPixel((0,i,0))--getPixel((0,i,5)) withcolor .7white;
      draw getPixel((0,0,i))--getPixel((0,5,i)) withcolor .7white;    
      draw getPixel((0,0,i))--getPixel((5,0,i)) withcolor .7white;
      draw getPixel((i,0,0))--getPixel((i,0,5)) withcolor .7white;
     endfor
  % --- End Grid ---
  
  % --- Frame ---
  draw (0, 0)--(breite, 0)--(breite, hoehe)--(0, hoehe)--cycle;
  
  % --- Axes ---
  drawarrow getPixel((0, 0, 0))--getPixel((6, 0, 0)); 
  label.llft(btex $x$ etex, getPixel((6, 0, 0))+(0, 1mm));  
  drawarrow getPixel((0, 0, 0))--getPixel((0, 6, 0)); 
  label.rt  (btex $y$ etex, getPixel((0, 6, 0)));  
  drawarrow getPixel((0, 0, 0))--getPixel((0, 0, 6)); 
  label.top (btex $z$ etex, getPixel((0, 0, 6)));  
  fill Face(0, 1, 3) withcolor .9red;
  fill Face(1, 2, 3) withcolor .7red;
  draw Face(0, 1, 2, 3);  
  draw Arete(3, 1);
  draw 1/2[z0,z3]--1/2[z1,z3];
  draw 1/2[z2,z3]--1/2[z1,z3];
  draw 1/2[z2,z3]--1/2[z0,z3] dashed evenly;
endfig;
beginfig(3);
  sommet0:=(0, 0, 0);
  sommet1:=(3, 4, 0);
  sommet2:=(0, 7, 0);
  sommet3:=(0,1,2.5);
  sommet4:=(1.5,3,2.5);
  sommet5:=(0,4.5,2.5);
  %sommet3:=(0, 2, 5);
  %définition des points
  for i=0 upto 5:
    z[i]=getPixel(sommet[i]);
  endfor
  fill Face(0,1,4,3) withcolor 0.9red;
  fill Face(1,2,5,4) withcolor 0.7red;
  fill Face(3,4,5) withcolor 0.5red;
  draw Arete(2,0) dashed evenly;
  draw Face(0,1,4,3);
  draw Face(1,2,5,4);
  draw Face(3,4,5);
endfig;
beginfig(4);
  sommet0:=(0, 0, 0);
  sommet1:=(3, 0, 0);
  sommet2:=(3, 7, 0);
  sommet3:=(0,7,0);
  sommet4:=(0,4,3);
  sommet5:=(0,0,3);
  sommet6:=(3,0,3);
  sommet7:=(3,4,3);
  sommet9:=(0, 10, 0);
  sommet10:=(0, 10, 3);
  sommet8:=(3,10,0);
  sommet11:=(3,10,3);
  %sommet3:=(0, 2, 5);
  %définition des points
  for i=0 upto 11:
    z[i]=getPixel(sommet[i]);
  endfor
  picture pgauche,pdroite,prot;
  pgauche=image(
    fill Face(1,2,7,6) withcolor 0.9red;
    fill Face(6,7,4,5) withcolor 0.7red;
    fill Face(3,4,7,2) withcolor 0.5red;
    draw Arete(5,0,1) dashed evenly;
    draw Arete(0,3) dashed evenly;
    draw Face(1,2,7,6);
    draw Face(4,5,6,7);
    draw Face(2,3,4,7);
    );
 
  pdroite=image(
    fill Face(2,8,11,7) withcolor 0.9blue;
    fill Face(4,7,11,10) withcolor 0.7blue;
    fill Face(8,9,10,11) withcolor 0.5blue;
    draw Arete(4,3,2) dashed evenly;
    draw Arete(3,9) dashed evenly;
    draw Face(2,8,11,7);
    draw Face(4,7,11,10);
    draw Face(8,9,10,11);
    );
  %draw pgauche;
  draw pdroite shifted(u*(2,0));
  rotX:=0;
  rotY:=0;
  rotZ:=-90;
  for i=0 upto 7:
    sommet[i]:=rotaX(sommet[i], rotX);
    sommet[i]:=rotaY(sommet[i], rotY);
    sommet[i]:=rotaZ(sommet[i], rotZ);
  endfor
  for i=0 upto 7:
    z[i+100]=getPixel(sommet[i]);
  endfor  
  draw Face(100,103,104,105);
  draw Face(104,105,106,107);
  draw Face(102,103,104,107);
  draw Arete(106,101,102) dashed evenly;
  draw Arete(100,101) dashed evenly;
  rotX:=0;
  rotY:=angle(z7-z2)-90;
  rotZ:=0;
  for i=0 upto 7:
    sommet[i]:=rotaX(sommet[i], rotX);
    sommet[i]:=rotaY(sommet[i], rotY);
    sommet[i]:=rotaZ(sommet[i], rotZ);
  endfor
  for i=0 upto 7:
    z[i+200]=getPixel(sommet[i]);
  endfor
  draw Face(200,203,204,205);
  draw Face(204,205,206,207);
  draw Face(202,203,204,207);
  draw Arete(206,201,202) dashed evenly;
  draw Arete(200,201) dashed evenly;
endfig;
beginfig(5);
  sommet0:=(0,0,0);
  sommet1:=(6,0,0);
  sommet2:=(6,6,0);
  sommet3:=(0,6,0);
  sommet4:=(0,6,6);
  sommet5:=(0,0,6);
  sommet6:=(6,0,6);
  sommet7:=(6,6,6);
  sommet8:=1/3[sommet7,sommet6];
  sommet9:=1/3[sommet7,sommet4];
  sommet10:=1/3[sommet7,sommet2];
  sommet11:=1/3[sommet2,sommet7];
  sommet12:=1/3[sommet2,sommet1];
  sommet13:=1/3[sommet2,sommet3];
  sommet14:=1/3[sommet1,sommet0];
  sommet15:=1/3[sommet1,sommet6];
  sommet16:=1/3[sommet1,sommet2];
  sommet17:=1/3[sommet6,sommet7];
  sommet18:=1/3[sommet6,sommet1];
  sommet19:=1/3[sommet6,sommet5];
  sommet20:=1/3[sommet5,sommet6];
  sommet21:=1/3[sommet5,sommet4];
  sommet22:=1/3[sommet5,sommet0];
  sommet23:=1/3[sommet4,sommet5];
  sommet24:=1/3[sommet4,sommet7];
  sommet25:=1/3[sommet4,sommet3];
  sommet26:=1/3[sommet3,sommet4];
  sommet27:=1/3[sommet3,sommet2];
  sommet28:=1/3[sommet3,sommet0];
  sommet29:=1/3[sommet0,sommet3];
  sommet30:=1/3[sommet0,sommet1];
  sommet31:=1/3[sommet0,sommet5];
  for i=0 upto 31:
    z[i]=getPixel(sommet[i]);
  endfor
  fill Face(15,16,12,11,10,8,17,18) withcolor red;
  fill Face(19,17,8,9,24,23,21,20) withcolor 0.6red;
  fill Face(11,13,27,26,25,24,9,10) withcolor 0.8red;
  fill Face(11,12,13) withcolor 0.7green;
  fill Face(8,9,10) withcolor 0.7green;
  fill Face(14,15,16) withcolor 0.7green;
  fill Face(17,18,19) withcolor 0.7green;
  draw Face(15,16,12,11,10,8,17,18);
  draw Face(19,17,8,9,24,23,21,20);
  draw Face(11,13,27,26,25,24,9,10);
  draw Face(11,12,13);
  draw Face(8,9,10);
  draw Face(14,15,16);
  draw Face(17,18,19);
  draw Arete(22,31,30,14) dashed evenly;
  draw Arete(31,29,28) dashed evenly;
  draw Arete(20,22,21) dashed evenly;
  draw Arete(23,25) dashed evenly;
  draw Arete(27,28,26) dashed evenly;
  draw Arete(29,30) dashed evenly;
endfig;
color pointducercle[];
beginfig(6);
  for i=0 upto 36:
    pointducercle[i]:=(2+cosd 10i,2+sind 10i,3);
  endfor;
  path bas;
  bas=getPixel(5(pointducercle29))
  for i=31 upto 36:..getPixel(5(pointducercle[i])) endfor
  ..getPixel(5(pointducercle0))
  for i=1 upto 11:..getPixel(5(pointducercle[i])) endfor
  ;
  path faceavant;
  faceavant=bas--(getPixel(5(pointducercle11)) shifted(u*(0,10)))--reverse(bas shifted(u*(0,10)))--(getPixel(5(pointducercle29)))--cycle;
  fill getPixel(5(pointducercle0))
  for i=1 upto 36:..getPixel(5(pointducercle[i])) endfor
  ..cycle withcolor (.8,.8,1);
  fill (getPixel(5(pointducercle0))
    for i=1 upto 36:..getPixel(5(pointducercle[i])) endfor
    ..cycle) shifted (u*(0,10)) withcolor (.8,.8,1);
  fill faceavant withcolor (.7,.7,1);
  draw faceavant;
  draw getPixel(5(pointducercle11))
  for i=12 upto 29:..getPixel(5(pointducercle[i])) endfor
  dashed evenly;
  draw (getPixel(5(pointducercle0))
    for i=1 upto 36:..getPixel(5(pointducercle[i])) endfor
    ..cycle) shifted (u*(0,10));
  draw getPixel(5(2,2,2.5))--(getPixel(5(2,2,5.5))) dashed dashpattern(on12bp off6bp on3bp off6bp);
  draw (getPixel(5(pointducercle29)) shifted(u*(0,10)))--getPixel(5(pointducercle11))--getPixel(5(pointducercle29)) dashed evenly;
endfig;
beginfig(7);
  sommet1:=(0,0,0);
  sommet2:=(5,0,0);
  sommet3:=(0,5,0);
  sommet4:=(0,0,5);
  for i=1 upto 4:
    z[i]=getPixel(sommet[i]);
  endfor
  fill Face(4,2,3) withcolor 0.9red;
  draw Face(4,2,3);
  draw Arete(4,1,2) dashed evenly;
  draw Arete(1,3) dashed evenly;
endfig;
beginfig(8);
  sommet1:=(5,0,0);
  sommet2:=(5,6,0);
  sommet3:=(1,6,0);
  sommet4:=(1,0,0);
  sommet5:=(2,3,5);
  sommet6:=(2,3,-5);
  for i=1 upto 6:
    z[i]=getPixel(sommet[i]);
  endfor;
  fill Face(5,2,1) withcolor 0.9red;
  fill Face(5,2,3) withcolor 0.7red;
  fill Face(6,2,3) withcolor 0.7red;
  fill Face(6,1,2) withcolor 0.5red;
  draw Face(5,1,2);
  draw Face(5,2,3);
  draw Face(6,2,3);
  draw Face(6,1,2);
  draw Arete(6,4,3,6) dashed evenly;
  draw Arete(5,4,1) dashed evenly;
endfig;
beginfig(9);
  sommet1:=(10,0,0);
  sommet2:=(10,10,0);
  sommet3:=(0,10,0);
  sommet4:=(0,0,0);
  sommet5:=(10,0,10);
  sommet6:=(10,10,10);
  sommet7:=(0,10,10);
  sommet8:=(0,0,10);
  sommet9:=1/2[sommet1,sommet6];
  sommet10:=1/2[sommet3,sommet6];
  sommet11:=1/2[sommet3,sommet8];
  sommet12:=1/2[sommet8,sommet1];
  sommet13:=1/2[sommet1,sommet3];
  sommet14:=1/2[sommet5,sommet7];
  sommet15:=2/3[sommet9,1/2[sommet10,sommet14]];
  sommet16:=2/3[sommet10,1/2[sommet11,sommet14]];
  sommet17:=2/3[sommet11,1/2[sommet12,sommet14]];
  sommet18:=2/3[sommet12,1/2[sommet9,sommet14]];
  sommet19:=2/3[sommet9,1/2[sommet10,sommet13]];
  sommet20:=2/3[sommet10,1/2[sommet11,sommet13]];
  sommet21:=2/3[sommet11,1/2[sommet12,sommet13]];
  sommet22:=2/3[sommet12,1/2[sommet9,sommet13]];
  for i=1 upto 22:
    z[i]=getPixel(sommet[i]);
  endfor;
  %Grand Cube
  draw Arete(1,2,6,5) withcolor 0.8white;
  draw Arete(5,8,7,6) withcolor 0.8white;
  draw Arete(2,3,7) withcolor 0.8white;
  draw Arete(8,4,1) dashed evenly withcolor 0.8white;
  draw Arete(4,3) dashed evenly withcolor 0.8white;
  %Octaèdre
  draw Face(9,10,14);
  draw Arete(10,11,14) dashed evenly;
  draw Arete(12,11,13) dashed evenly;
  draw Face(12,9,14);
  draw Face(9,10,13);
  draw Arete(11,13) dashed evenly;
  draw Face(12,9,13);
  %petit Cube
  drawoptions(withcolor 0.8white);
  draw Face(15,16,17,18);
  draw Face(19,20,21,22);
  draw Arete(18,22,21,17);
  draw Arete(15,19,20,16);
  drawoptions();
  for i=1 upto 22:
    fill fullcircle scaled 1mm shifted z[i];
    endfor;
endfig;
beginfig(10);
  sommet1:=(10,0,0);
  sommet2:=(10,10,0);
  sommet3:=(0,10,0);
  sommet4:=(0,0,0);
  sommet5:=(10,0,10);
  sommet6:=(10,10,10);
  sommet7:=(0,10,10);
  sommet8:=(0,0,10);
  for i:=1 upto 8:
    z[i]=getPixel(sommet[i]);
  endfor;
  %Cube
  drawoptions(withcolor red dashed evenly);
  draw Arete(1,2,6,5);
  draw Arete(5,8,7,6);
  draw Arete(2,3,7);
  draw Arete(8,4,1) dashed evenly;
  draw Arete(4,3) dashed evenly;
  drawoptions();
  %Tetraèdre
  fill Face(1,6,8) withcolor 0.9blue;
  fill Face(1,6,3) withcolor 0.8blue;
  draw Face(1,6,8);
  draw Face(3,6,1);
  draw Arete(3,8) dashed evenly;
endfig;
beginfig(11);%antiprisme à base pentagonale
  rotz:=22;
  sommet1:=rotaZ((1,0,-1),rotz);
  rotz:=72;
  sommet2:=rotaZ(sommet1,rotz);
  sommet3:=rotaZ(sommet2,rotz);
  sommet4:=rotaZ(sommet3,rotz);
  sommet5:=rotaZ(sommet4,rotz);
  sommet6:=2[sommet1,(0,0,0)];
  sommet7:=2[sommet2,(0,0,0)];
  sommet8:=2[sommet3,(0,0,0)];
  sommet9:=2[sommet4,(0,0,0)];
  sommet10:=2[sommet5,(0,0,0)];
  for i=1 upto 10:
    z[i]=getPixel(4(sommet[i]));
  endfor;
  fill Face(7,5,8) withcolor 0.9red;
  fill Face(5,8,1) withcolor 0.8red;
  fill Face(8,1,9) withcolor 0.9red;
  fill Face(1,9,2) withcolor 0.8red;
  fill Face(9,2,10) withcolor 0.9red;
  fill Face(6,7,8,9,10) withcolor 0.7red;
  draw Face(7,5,8);
  draw Face(5,8,1);
  draw Face(8,1,9);
  draw Face(1,9,2);
  draw Face(9,2,10);
  draw Face(6,7,8,9,10);
  draw Arete(2,3,4,5) dashed evenly;
  draw Arete(7,4,6,3,10) dashed evenly;
endfig;
beginfig(12);%antiprisme à base carrée
  rotz:=0;
  sommet1:=rotaZ((1,0,-1),rotz);
  rotz:=90;
  sommet2:=rotaZ(sommet1,rotz);
  sommet3:=rotaZ(sommet2,rotz);
  sommet4:=rotaZ(sommet3,rotz);
  sommet5:=rotaZ(2[sommet1,(0,0,0)],45);
  sommet6:=rotaZ(2[sommet2,(0,0,0)],45);
  sommet7:=rotaZ(2[sommet3,(0,0,0)],45);
  sommet8:=rotaZ(2[sommet4,(0,0,0)],45);
  for i=1 upto 8:
    z[i]=getPixel(4(sommet[i]));
  endfor;
  fill Face(4,6,1) withcolor 0.8red;
  fill Face(6,1,7) withcolor 0.9red;
  fill Face(1,7,2) withcolor 0.8red;
  fill Face(7,2,8) withcolor 0.7red;
  fill Face(5,6,7,8) withcolor 0.6red;
  draw Face(4,6,1);
  draw Face(6,1,7);
  draw Face(1,7,2);
  draw Face(7,2,8);
  draw Face(5,6,7,8);
  draw Arete(2,3,4,5,3,8) dashed evenly;
endfig;
beginfig(13);%antiprisme à base pentagonale+icosaedre
  rotz:=22;
  long=sqrt(2);
  sommet1:=rotaZ((1,0,-1/2),rotz);
  rotz:=72;
  sommet2:=rotaZ(sommet1,rotz);
  sommet3:=rotaZ(sommet2,rotz);
  sommet4:=rotaZ(sommet3,rotz);
  sommet5:=rotaZ(sommet4,rotz);
  sommet6:=2[sommet1,(0,0,0)];
  sommet7:=2[sommet2,(0,0,0)];
  sommet8:=2[sommet3,(0,0,0)];
  sommet9:=2[sommet4,(0,0,0)];
  sommet10:=2[sommet5,(0,0,0)];
  sommet11:=(0,0,long);
  sommet12:=(0,0,-long);
  for i=1 upto 12:
    z[i]=getPixel(6(sommet[i]));
  endfor;
  %fill Face(5,1,12) withcolor 0.8red;
  %fill Face(1,2,12) withcolor 0.7red;
  %fill Face(7,8,11) withcolor 0.9red;
  %fill Face(8,9,11) withcolor 0.8red;
  %fill Face(9,10,11) withcolor 0.7red;
  %fill Face(7,5,8) withcolor 0.9red;
  %fill Face(5,8,1) withcolor 0.8red;
  %fill Face(8,1,9) withcolor 0.8red;
  %fill Face(1,9,2) withcolor 0.7red;
  %fill Face(9,2,10) withcolor 0.7red;
  %bas
  draw Face(5,1,12);
  draw Face(1,2,12);
  draw Arete(5,4,12) dashed evenly;
  draw Arete(4,3,12) dashed evenly;
  draw Arete(3,2) dashed evenly;
  %haut
  draw Face(7,8,11);
  draw Face(8,9,11);
  draw Face(9,10,11);
  draw Arete(7,6,11) dashed evenly;
  draw Arete(6,10) dashed evenly;
  %milieu
  draw Face(7,5,8);
  draw Face(8,1,9);
  draw Face(9,2,10);
  draw Arete(7,4,6) dashed evenly;
  draw Arete(6,3,10) dashed evenly;
endfig;
end





  
 
