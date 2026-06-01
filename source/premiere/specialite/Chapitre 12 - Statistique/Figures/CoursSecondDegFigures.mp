input latexmp;
input repere;

u=1cm;

repere(-2.5,1.5,u,-2,2,u);
 path C_f;
 draw axes(0,0);
 vardef f(expr x)=x**2+1.5*x-1 enddef;
 C_f=courbefonc(f,-2.5,1,50);
 draw C_f withpen pencircle scaled 1;
 draw projectionaxes(_c(-0.75,f(-0.75)),LaTeX("$-\frac{b}{2a}$"),LaTeX("$P(-\frac{b}{2a})$")) dashed evenly;
 label.llft(LaTeX("$x_1$"),_c(-2,0));
 label.lrt(LaTeX("$x_2$"),_c(0.5,0));
fin;

repere(-1,3,u,-1,3,u);
 path C_f;
 draw axes(0,0);
 vardef f(expr x)=x**2-2*x+1 enddef;
 C_f=courbefonc(f,-1,3,50);
 draw C_f withpen pencircle scaled 1;
 label.bot(LaTeX("$x_0=-\frac{b}{2a}$"),_c(1,0));
fin;

repere(-2.5,1.5,u,-0.7,3.2,u);
 path C_f;
 draw axes(0,0);
 vardef f(expr x)=x**2+2*x+2 enddef;
 C_f=courbefonc(f,-2.5,1.5,50);
 draw C_f withpen pencircle scaled 1;
 draw projectionaxes(_c(-1,f(-1)),LaTeX("$-\frac{b}{2a}$"),LaTeX("$P(-\frac{b}{2a})$")) dashed evenly;
fin;

repere(-2.5,1.5,u,-2,2,u);
 path C_f;
 draw axes(0,0);
 vardef f(expr x)=-(x**2)-1.5*x+1 enddef;
 C_f=courbefonc(f,-2.5,1,50);
 draw C_f withpen pencircle scaled 1;
 draw projectionaxes(_c(-0.75,f(-0.75)),LaTeX("$-\frac{b}{2a}$"),LaTeX("$P(-\frac{b}{2a})$")) dashed evenly;
 label.lrt(LaTeX("$x_1$"),_c(-2,0));
 label.llft(LaTeX("$x_2$"),_c(0.5,0));
fin;

repere(-1,3,u,-3,1,u);
 path C_f;
 draw axes(0,0);
 vardef f(expr x)=-(x**2)+2*x-1 enddef;
 C_f=courbefonc(f,-1,3,50);
 draw C_f withpen pencircle scaled 1;
 label.top(LaTeX("$x_0=-\frac{b}{2a}$"),_c(1,0));
fin;

repere(-2.5,1.5,u,-3.2,0.7,u);
 path C_f;
 draw axes(0,0);
 vardef f(expr x)=-(x**2)-2*x-2 enddef;
 C_f=courbefonc(f,-2.5,1.5,50);
 draw C_f withpen pencircle scaled 1;
 draw projectionaxes(_c(-1,f(-1)),LaTeX("$-\frac{b}{2a}$"),LaTeX("$P(-\frac{b}{2a})$")) dashed evenly;
fin;

end