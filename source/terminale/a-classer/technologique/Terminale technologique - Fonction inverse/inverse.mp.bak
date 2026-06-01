input repere;

beginfig(1);
repere(-7,7,1cm,-7,7,1cm);
draw axex(1,1);
draw axey(1,1);
draw quadrillage(0.5,0.5) dashed evenly;
path G;
vardef d(expr x)=1/x enddef;
G= courbefonc(d)(-7,-0.1);
draw G withpen pencircle scaled 1 withcolor pourpre;
path D;
D= courbefonc(d)(0.1,7);
draw D withpen pencircle scaled 1 withcolor pourpre;
label("$\mathcal{C}_f: y=\frac{1}{x}$" ,(3.5,3)) withcolor pourpre;
label("$x$",(6.5,-0.5));
label("$\mathcal{C}_f: y=\frac{1}{x}$" ,(3.5,3)) withcolor pourpre;
label("$y$",(-0.5,6.5));
fin;
endfig;

beginfig(2);
repere(-8,170,0.08cm,-5,110,0.1cm);
draw axex(10,10);
draw axey(10,10);
draw quadrillage(10,10) dashed evenly;
path G;
vardef d(expr x)=x-100+(6400/x) enddef;
G= courbefonc(d)(40,160);
draw G withpen pencircle scaled 1 withcolor pourpre;
fin;
endfig;

end.