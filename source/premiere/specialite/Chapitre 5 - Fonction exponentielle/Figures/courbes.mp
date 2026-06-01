verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\begin{document}
etex;

%======================Fonctions usuelles==========================================
numeric Pi,E;
Pi:= 3.14159;
E:= 2.7828;

vardef sin(expr x) =
        sind(x/Pi*180)
enddef;

vardef cos(expr x) =
        cosd(x/Pi*180)
enddef;

vardef tan(expr x) =
        sin(x)/cos(x)
enddef;

vardef exp(expr x) =
        mexp(x*256)
enddef;

vardef ln(expr x) =
        mlog(x)/256
enddef;

% Définition du repère ===================================================
def repere(expr Ox,Oy,Xmin,Xmax,Ymin,Ymax,Ux,Uy) =
       % affectations des variables
	   _ox := Ox ; _oy := Oy  ; _ux := Ux ; _uy := Uy;
	   _xmin := Xmin ; _xmax := Xmax ; _ymin := Ymin ; _ymax := Ymax;
	   _r_xmin := _xmin*_ux+_ox; % l'abscisse minimale 
	   _r_xmax := _xmax*_ux+_ox; %l'abscisse maximale
	   _r_ymin := _ymin*_uy+_oy; %l'ordonnée minimale
	   _r_ymax := _ymax*_uy+_oy %l'ordonnée maximale
enddef;

% Placer les axes du repère ==============================================

def r_axes =
           pickup pencircle scaled 1.2pt;
           drawarrow (_r_xmin,_oy)..(_r_xmax,_oy);
		   drawarrow (_ox,_r_ymin)..(_ox,_r_ymax);
		   pickup pencircle scaled 0.5pt;
		   label.bot(btex $x$ etex, (_r_xmax-1mm,_oy));
		   label.lft(btex $y$ etex, (_ox,_r_ymax-1mm))
enddef;

% Placer l'origine =======================================================

def r_origine =
             label.lft(btex $O$ etex,(_ox,_oy-2mm));
			 pickup pencircle scaled 3pt;
			 draw (_ox,_oy);
			 pickup pencircle scaled 0.5pt
enddef;

%Graduation des unités ===================================================
def r_unites =
             draw (_ox+_ux,_oy-1mm)--(_ox+_ux,_oy+1mm);
			 draw(_ox-1mm,_oy+_uy)--(_ox+1mm,_oy+_uy)
enddef;

%Définir un point dans ce plan ===========================================
def r_point(expr x,y) =
       (_ox+x*_ux,_oy+y*_uy)
enddef;

%Graduation des axes =====================================================
def grad_x(expr n) =
           numeric _a;
           _a = floor(_xmin)*_ux+_ox;
		   pickup pencircle scaled 0.1pt;
           for i=0 upto (floor(_xmax)+1-floor(_xmin))/n-1:
		   draw (_a+i*n*_ux,_oy-1mm)--(_a+i*n*_ux,_oy+1mm);
		   endfor
		   pickup pencircle scaled 0.5pt;
enddef;
def grad_y(expr n) =
           numeric _b;
           _b = floor(_ymin)*_uy+_oy;
           for i=0 upto (floor(_ymax)+1-floor(_ymin))/n-1:
		   draw (_ox-1mm,_b+i*n*_uy)--(_ox+1mm,_b+i*n*_uy);
		   endfor
enddef;

%Quadrillage===============================================================
def quad_x(expr n) =
           numeric _a,_b,_c,_d;
           _a = floor(_xmin)*_ux+_ox; _b = floor(_ymin)*_uy+_oy;
		   _c = (floor(_xmax)+1)*_ux+_ox; _d = (floor(_ymax)+1)*_uy+_oy;
		   pickup pencircle scaled 0.1pt;
           for i=0 upto (floor(_xmax)+1-floor(_xmin))/n -1:
		   draw (_a+i*n*_ux,_b)--(_a+i*n*_ux,_d) withcolor 0.4white;
		   endfor
		   pickup pencircle scaled 0.5pt;
		   for i=0 upto (floor(_xmax)+1-floor(_xmin)) -1:
		   draw (_a+i*_ux,_b)--(_a+i*_ux,_d);
		   endfor
		   
enddef;
def quad_y(expr n) =
           numeric _a,_b,_c,_d;
           _a = floor(_xmin)*_ux+_ox; _b = floor(_ymin)*_uy+_oy;
		   _c = (floor(_xmax)+1)*_ux+_ox; _d = (floor(_ymax)+1)*_uy+_oy;
		   pickup pencircle scaled 0.1pt;
           for i=0 upto (floor(_ymax)+1-floor(_ymin))/n -1:
		   draw (_a,_b+i*n*_uy)--(_c,_b+i*n*_uy) withcolor 0.4white;
		   endfor
		   pickup pencircle scaled 0.5pt;
		   for i=0 upto (floor(_ymax)+1-floor(_ymin)) -1:
		   draw (_a,_b+i*_uy)--(_c,_b+i*_uy);
		   endfor
		   
enddef;

%Placer un point plein dans ce repère ====================================
def r_ppoint(expr x,y) =
        pickup pencircle scaled 3pt;
        draw (_ox+x*_ux,_oy+y*_uy);
		pickup pencircle scaled 0.5pt 
enddef;




%Placer un point creux dans ce repère ====================================
def r_cpoint(expr x,y) =
        path _e;
		_e = fullcircle scaled 3pt shifted(_ox+x*_ux,_oy+y*_uy);
		draw _e;
		fill _e withcolor white
enddef;

%Label des unités ========================================================
def r_labelxy =
              label.bot(btex $+1$ etex,(_ox+_ux,_oy-1mm));
			  label.lft(btex $+1$ etex, (_ox-1mm,_oy+_uy))
enddef;

%Definir un segment ================================================
def r_segment(expr a,b,c,d) =
       (_ox+a*_ux,_oy+b*_uy)--(_ox+c*_ux,_oy+d*_uy)
enddef;

%Definir une droite // à l'axe des ordonnées =============================
def rx_droite(expr k) =
       (_ox+k*_ux,_r_ymin)--(_ox+k*_ux,_r_ymax)
enddef;

%Definir une droite définie par un point et son coeff dir ================
def r_droitedir(expr a,b,m) =
       (_r_xmin,_oy+(m*_xmin+b-m*a)*_uy)--(_r_xmax,_oy+(m*_xmax+b-m*a)*_uy)
enddef;

%Projection d'un point sur les axes ======================================
def r_point_proj(expr x,y) =
       draw(_ox+x*_ux,_oy)--(_ox+x*_ux,_oy+y*_uy)--(_ox,_oy+y*_uy) dashed evenly;
	   r_ppoint(x,y)
enddef;

%On enlève ce qui sort du repère =========================================
def r_fin =
           clip currentpicture to (_r_xmin,_r_ymin)--(_r_xmin,_r_ymax)--
		   (_r_xmax,_r_ymax)--(_r_xmax,_r_ymin)--cycle
enddef;

%Tracer des courbes en dimension 2 =======================================
%Sont prédéfinies avant beginfig les expressions fx(t) et fy(t)===========
def f_point(expr t) =
                    r_point(fx(t),fy(t))
enddef;
def f_courbe(expr ti,tf,n) =
            f_point(ti)
			for i=1 upto n:
			...f_point(ti+(i/n)*(tf-ti))
			endfor
enddef;

%Dérivée de f sous réserve d'existence=====================================
def fx_derive(expr a) =
			 ((fx(a+0.001))-(fx(a)))/0.001
enddef;
def fy_derive(expr a) =			 
			 ((fy(a+0.01))-(fy(a)))/0.01
enddef;

%Tangente à la courbe en un point régulier tel que x'(t) différent de 0=====
def f_tangente(expr a) =
            r_droitedir(fx(a),fy(a),(fy_derive(a))/(fx_derive(a)))
enddef;
%Tracé de la tangente en un point régulier tel que x'(t) différent de 0=====
def tracef_tangente(expr a,b) =
            pair _f[];
			_f1=f_point(a)+b*(1*_ux,(fy_derive(a))/(fx_derive(a))*_uy);
			_f2=f_point(a)-b*(1*_ux,(fy_derive(a))/(fx_derive(a))*_uy);
            drawdblarrow _f1.._f2;
            pickup pencircle scaled 0.5pt;
			r_ppoint(fx(a),fy(a))
enddef;
%===========================================================================
%===========================================================================
%definition de g
%Sont prédéfinies avant beginfig les expressions gx(t) et gy(t)===========
def g_point(expr t) =
                    r_point(gx(t),gy(t))
enddef;
def g_courbe(expr ti,tf,n) =
            g_point(ti)
			for i=1 upto n:
			...g_point(ti+(i/n)*(tf-ti))
			endfor
enddef;

%===========================================================================
%Dérivée de g sous réserve d'existence=====================================
def gx_derive(expr a) =
			 (gx(a+0.00001)-gx(a))/0.00001
enddef;
def gy_derive(expr a) =			 
			 (gy(a+0.00001)-gy(a))/0.00001
enddef;

%Tangente à la courbe en un point régulier tel que x'(t) différent de 0=====
def g_tangente(expr a) =
            r_droitedir(gx(a),gy(a),(gy_derive(a))/(gx_derive(a)))
enddef;
%Tracé de la tangente en un point régulier tel que x'(t) différent de 0=====
def traceg_tangente(expr a,b) =
            pair _g[];
			_g1=g_point(a)+b*(1*_ux,(gy_derive(a))/(gx_derive(a))*_uy);
			_g2=g_point(a)-b*(1*_ux,(gy_derive(a))/(gx_derive(a))*_uy);
            drawdblarrow _g1.._g2;
            pickup pencircle scaled 0.5pt;
			r_ppoint(gx(a),gy(a))
enddef;
%===========================================================================
%Sont prédéfinies avant beginfig les expressions hx(t) et hy(t)===========
def h_point(expr t) =
                    r_point(hx(t),hy(t))
enddef;
def h_courbe(expr ti,tf,n) =
            h_point(ti)
			for i=1 upto n:
			...h_point(ti+(i/n)*(tf-ti))
			endfor
enddef;

%Dérivée de h sous réserve d'existence=====================================
def hx_derive(expr a) =
			 (hx(a+0.00001)-hx(a))/0.00001
enddef;
def hy_derive(expr a) =			 
			 (hy(a+0.00001)-hy(a))/0.00001
enddef;

%Tangente à la courbe en un point régulier tel que x'(t) différent de 0=====
def h_tangente(expr a) =
            r_droitedir(hx(a),hy(a),(hy_derive(a))/(hx_derive(a)))
enddef;
%Tracé de la tangente en un point régulier tel que x'(t) différent de 0=====
def traceh_tangente(expr a,b) =
            pair _h[];
			_h1=h_point(a)+b*(1*_ux,(hy_derive(a))/(hx_derive(a))*_uy);
			_h2=h_point(a)-b*(1*_ux,(hy_derive(a))/(hx_derive(a))*_uy);
            drawdblarrow _h1.._h2;
            pickup pencircle scaled 0.5pt;
			r_ppoint(hx(a),hy(a))
enddef;










