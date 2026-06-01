%% ============================================================================
%% tortue.mp
%% ============================================================================
%% Jean-Michel Sarlat (http://melusine.eu.org/syracuse/metapost/)
%% Version 1 - 22 février 2005

%% Les tables (chemin,point actuel,orientation,direction)
path tortue_p[];
pair tortue_xy[] ;
numeric tortue_m[];
numeric tortue_a[];

%% L'enregistrement d'une tortue (initialisation)
def tortue(expr n, x , y , a , m ) =
    tortue_xy[n] := (x,y) ;
    tortue_a[n] := a ;
    tortue_m[n] := m ;
    tortue_p[n] := (x,y);
enddef;

%% La tortue <n> se dédouble, <m> à cet instant se superpose à <n>
def blop(expr n,m) =
    tortue(m,(xpart tortue_xy[n]),(ypart tortue_xy[n]),tortue_a[n],tortue_m[n]);
enddef;

%% La tortue tourne (sur place)
def tourne(expr n, a ) =
    tortue_a[n] := tortue_a[n] + a * tortue_m[n];
enddef;

%% La tortue se retourne, sa gauche est notre droite !
def retourne(expr n ) =
    tortue_m[n] := -tortue_m[n];
enddef;

%% La tortue avance d'une certaine distance et fait ce qu'on lui demande
vardef avance(expr n,l)(suffix m) =
    pair position;
    position =  tortue_xy[n] + ((l,0) rotated tortue_a[n]);
    m(tortue_xy[n],position);
    tortue_xy[n] := position;
    tortue_p[n] := tortue_p[n]--position;
enddef;

%% Remplissage du polygone circonscrit par le chemin de la tortue
vardef remplis(expr n,c) =
    fill tortue_p[n]--cycle withcolor c;
enddef;

%% Une chose que la tortue peut faire en se déplaçant : laisser une trace !
vardef trace(expr a,b) =
    draw a--b;
enddef;




    
 