input repere;

repere(-2,4,1cm,-2,2.5,1cm);
path C_f;
vardef f(expr x)= x**2-3 enddef;
C_f= courbefonc(f)(-2,3);
draw axes(1,1);
draw C_f withpen pencircle scaled 1;
drawoptions(withcolor red);
marquepointcourbe(C_f,-0.5,0.8,2.2,2.6);
fin;

end.