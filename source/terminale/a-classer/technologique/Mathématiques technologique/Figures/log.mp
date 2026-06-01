input latexmp ;
input repere ;
setupLaTeXMP(inputencoding="latin1",fontencoding="T1");

beginfig(1);
repere(-10,120,2mm,-1.5,3,2cm);
vardef f(expr x)=ln(x)/ln(10) enddef;
path C_f;
C_f=courbefonc(f)(0.01,120,100);
draw C_f withcolor red withpen pencircle scaled 0.8;
%nomme.ulft(C_f,5,btex $C_{log}$ etex);
marquepointcourbe(C_f,1,10,100);
draw quadrillage(10,1) dashed evenly;
%draw axex(10,10);
%draw axey(1,0.5);
fin;
endfig;