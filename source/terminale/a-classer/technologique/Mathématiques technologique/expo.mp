input repere;

beginfig(1);
repere(-4,5.5,2cm,-1,8,2cm);
draw axex(1,1);
draw axey(1,1);
draw quadrillage(1,1) dashed evenly;
path G;
vardef d(expr x)=(1.5)**x enddef;
G= courbefonc(d)(-4,10);
draw G withpen pencircle scaled 1 withcolor pourpre;
label("$\mathcal{C}_f: y=1,5^x$" ,(3,5)) withcolor pourpre;
label("$x$",(4.8,-0.2));
label("$y$",(-0.2,7.8));
vardef u(expr n)=(1.5)**n enddef; 
taillepoint:=4;
draw suite(u,0,5) withcolor 0.5blue;
fin;
endfig;

beginfig(2);
repere(-4,5.5,2cm,-1,8,2cm);
draw axex(1,1);
draw axey(1,1);
draw quadrillage(1,1) dashed evenly;
path G,H;
vardef d(expr x)=(1.5)**x enddef;
vardef e(expr x)=(0.7)**x enddef;
G= courbefonc(d)(-4,10);
H= courbefonc(e)(-4,10);
draw G withpen pencircle scaled 1 withcolor pourpre;
draw H withpen pencircle scaled 1 dashed evenly withcolor olive;
label("$\mathcal{C}_f: y=1,5^x$" ,(3,5)) withcolor pourpre;
label("$\mathcal{C}_g: y=0.7^x$" ,(-2.5,3.2)) withcolor olive;
label("$x$",(4.8,-0.2));
label("$y$",(-0.2,7.8));

%vardef u(expr n)=(1.5)**n enddef; 
%taillepoint:=4;
%draw suite(u,0,5) withcolor 0.5blue;

fin;
endfig;



beginfig(3);
repere(-1,10,1cm,-1,10,1cm);
draw axex.llft(1,1);
draw axey.llft(1,1);
draw papiermillimetre;
%draw quadrillage(0.5,0.5) dashed evenly;
path G,H;
vardef d(expr x)=10*((0.8)**x) enddef;
vardef e(expr x)=(1.3)**x-1 enddef;
G= courbefonc(d)(0,10);
H= courbefonc(e)(0,10);
draw G withpen pencircle scaled 1 withcolor 0.8red;
draw H withpen pencircle scaled 1 dashed evenly withcolor 0.9blue;

label("$x$",(9.8,0.2));
label("$y$",(0.3,9.8));
fin;
endfig;

beginfig(4);
repere(-3,3,2cm,-1,4,2cm);
draw axex.llft(1,1);
draw axey.llft(1,1);
draw quadrillage(0.5,0.5) dashed evenly;
path G;
vardef d(expr x)=2*(3**x) enddef;
G= courbefonc(d)(-3,3);
draw G withpen pencircle scaled 1 withcolor 0.8red;
label("$x$",(2.8,0.1));
label("$y$",(0.1,3.8));
label("$\mathcal{C}_f$",(0.5,2.6)) withcolor 0.8red;
fin;
endfig;
end.