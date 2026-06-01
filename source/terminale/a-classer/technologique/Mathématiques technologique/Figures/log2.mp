input repere;

beginfig(1);
repere(-10,105,2mm,-2,3,2cm);
vardef f(expr x)=ln(x)/ln(10) enddef;
path C_f; 
C_f=courbefonc(f)(0.01,102,100);
draw C_f withcolor red withpen pencircle scaled 0.8;
nomme.ulft(C_f,5, "$C_{log}$");
draw axex(10,10);
draw axey(1,0.5);
marquepointcourbe(C_f,1,10,100);
draw quadrillage(10,1) dashed evenly;
endfig;

end.