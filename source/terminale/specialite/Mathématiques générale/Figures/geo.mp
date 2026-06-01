marksize=4pt;
def draw_mark(expr p,a) =
begingroup
save t, dm; pair dm;
t=arctime a of p;
dm=marksize*unitvector direction t of p rotated 90;
drawarrow (-.5dm.. .5dm) shifted point t of p;
endgroup
enddef;

%%%%%%%%%%%%%%%%%%%%%
%pour les angles orientés
%%%%%%%%%%%%%%%%%%%%%%%

def draw_marked(expr p,n)=
begingroup
save amid;
amid= .5*arclength p;
for i=-(n-1)/2 upto (n-1)/2 : draw_mark(p, amid+.6marksize*i);
endfor
drawarrow p;
endgroup
enddef;


%%%%%%%%%%%%%%%%%%%%%%%%%%
%pour les segments et angles non orientés
%%%%%%%%%%%%%%%%%%%%%%%%%
def draw_markeds(expr p,n)=
begingroup
save amid;
amid= .5*arclength p;
for i=-(n-1)/2 upto (n-1)/2 : draw_mark(p, amid+.6marksize*i);
endfor
%draw p;
endgroup
enddef;


angle_radius=8pt;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% angles géométriques
%%%%%%%%%%%%%%%%%%%%%%%%%%%

def mark_angleg(expr a, b, c, n)=
begingroup 
save s, p; path p;
p= unitvector(a-b){(a-b)rotated 90}..unitvector(c-b);
s=1.6marksize/length(point 1 of p-point 0 of p);
if s<angle_radius : s:=angle_radius; fi
 draw_markeds(p scaled s shifted b,n);
endgroup
enddef;





%%%%%%%%%%%%%%%%%%%%%%%%%
%angle +
%%%%%%%%%%%%%%%%%%%%%%


def mark_angle(expr a, b, c, n)=
begingroup 
save s, p; path p;
p= unitvector(a-b){(a-b)rotated 90}..unitvector(c-b);
s=1.6marksize/length(point 1 of p-point 0 of p);
if s<angle_radius : s:=angle_radius; fi
 draw_marked(p scaled s shifted b,n);
endgroup
enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%angle négatif
%%%%%%%%%%%%%%%%%%%%%%%%%%

def mark_anglem(expr a, b, c, n)=
begingroup 
save s, p; path p;
p= unitvector(a-b){(a-b)rotated -90}..unitvector(c-b);
s=.9marksize/length(point 1 of p-point 0 of p);
if s<angle_radius : s:=angle_radius; fi
 draw_marked(p scaled s shifted b,n);
endgroup
enddef;



def mark_rt_angle( expr a,b,c)=
draw ((1,0)--(1,1)--(0,1))zscaled (angle_radius*unitvector(a-b))shifted b
enddef;
