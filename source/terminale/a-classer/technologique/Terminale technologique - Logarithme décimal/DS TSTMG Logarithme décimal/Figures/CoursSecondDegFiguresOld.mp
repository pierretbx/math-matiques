verbatimtex
\documentclass{article}
\usepackage{amsmath}
\begin{document}
etex;

input courbes;

%============================================================================
def fx(expr t) =
 			   t
enddef;
def fy(expr t) =
                (0.25)*(t**2)+(0.75)*t-1
enddef;
%============================================================================

beginfig(1);
path p; 
repere(0,0,-5,3,-2,2,0.5cm,1cm);
r_axes;
r_origine;
p = f_courbe(-5,2,100);
z0 = r_point(-4.2,fy(-4));
z1 = r_point(1.2,fy(1));
r_ppoint(-4,fy(-4));
r_ppoint(1,fy(1));
label.bot(btex $x_1$ etex, z0);
label.bot(btex $x_2$ etex, z1);
r_point_proj(-1.5,fy(-1.5));
z2 = r_point(-1.5,0);
label.top(btex $-\frac{b}{2a}$ etex, z2);
z3 = r_point(0,fy(-1.5));
label.rt(btex $P\left(-\frac{b}{2a}\right)$ etex, z3);
draw p;
r_fin;
endfig;


%============================================================================
def fx(expr t) =
 			   t
enddef;
def fy(expr t) =
                t**2-2*t+1
enddef;
%=============================================================================
beginfig(2);


path p;
repere(0,0,-1,3,-1,3,1cm,1cm);
r_axes;
r_origine;
p = f_courbe(-1,3,100);
z0 = r_point(1,fy(1));
r_ppoint(1,fy(1));
r_point_proj(1,fy(1));
label.bot(btex $x_0=-\frac{b}{2a}$ etex, z0);
draw p;
r_fin;
endfig;

%============================================================================
def fx(expr t) =
 			   t
enddef;
def fy(expr t) =
                t**2+2*t+2
enddef;
%=============================================================================
beginfig(3);

path p; 
repere(0,0,-2.5,1.5,-0.7,3.2,1cm,1cm);
r_axes;
r_origine;
p = f_courbe(-2.5,1.5,100);
r_point_proj(-1,fy(-1));
r_ppoint(-1,fy(-1));
z0=r_point(-1,0);
label.bot(btex $-\frac{b}{2a}$ etex, z0);
z1 = r_point(0,fy(-1));
label.rt(btex $P\left(-\frac{b}{2a}\right)$ etex, z1);
draw p;
r_fin;
endfig;


%============================================================================
def fx(expr t) =
 			   t
enddef;
def fy(expr t) =
                (-0.25)*(t**2)-(0.75)*t+1
enddef;
%=============================================================================
beginfig(4);

path p; 
repere(0,0,-5,3,-2,2,0.5cm,1cm);
r_axes;
r_origine;
p = f_courbe(-5,2,100);
z0 = r_point(-3.8,fy(-4));
z1 = r_point(0.8,fy(1));
r_ppoint(-4,fy(-4));
r_ppoint(1,fy(1));
label.bot(btex $x_1$ etex, z0);
label.bot(btex $x_2$ etex, z1);
r_point_proj(-1.5,fy(-1.5));
z2 = r_point(-1.5,0);
label.bot(btex $-\frac{b}{2a}$ etex, z2);
z3 = r_point(0,fy(-1.5));
label.rt(btex $P\left(-\frac{b}{2a}\right)$ etex, z3);
draw p;
r_fin;
endfig;

%============================================================================
def fx(expr t) =
 			   t
enddef;
def fy(expr t) =
                -(t**2)+2*t-1
enddef;
%=============================================================================
beginfig(5);

path p;
repere(0,0,-1,3,-3,1,1cm,1cm);
r_axes;
r_origine;
p = f_courbe(-1,3,100);
z0 = r_point(1,fy(1));
r_ppoint(1,fy(1));
r_point_proj(1,fy(1));
label.top(btex $x_0=-\frac{b}{2a}$ etex, z0);
draw p;
r_fin;
endfig;

%============================================================================
def fx(expr t) =
 			   t
enddef;
def fy(expr t) =
                -(t**2)-2*t-2
enddef;
%=============================================================================
beginfig(6);

path p;
repere(0,0,-2.5,1.5,-3.2,0.8,1cm,1cm);
r_axes;
r_origine;
p = f_courbe(-2.5,1.5,100);
r_point_proj(-1,fy(-1));
r_ppoint(-1,fy(-1));
z0=r_point(-1,0);
label.top(btex $-\frac{b}{2a}$ etex, z0);
z1 = r_point(0,fy(-1));
label.rt(btex $P\left(-\frac{b}{2a}\right)$ etex, z1);
draw p;
r_fin;
endfig;


end