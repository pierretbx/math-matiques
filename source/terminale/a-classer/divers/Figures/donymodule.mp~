%%Module pour la géométrie dans l'espace d'après R.DONY "Graphismes scientifiques sur ordinateur" & "Graphismes dans le plan et dans l'espace".

%%TO DO
%Autres solides
%Appel par nom de fichier
%Animations
%Surfaces z=f(x,y)

input marith;
input sarith;
init_numbers(btex $-$ etex, btex$1$etex, btex$ times 10$etex, btex$"" sup -$etex, btex$"" sup 2$etex);
color Sommet[];

color Co[];
Co0=jaune;
Co1=violet;
Co2=orange;
Co3=ciel;
Co4=vert;
Co5=bleu;
Co6=rouge;

string typerepre;
typerepre:="proj";

%généralité
vardef Projette(expr X)=
  pair $;
  Xobs := -redpart(X)*Aux1 + greenpart(X)*Aux3;
  Yobs := -redpart(X)*Aux5 - greenpart(X)*Aux6 + bluepart(X)*Aux4;
  if typerepre="proj":
    Zobs := -redpart(X)*Aux7 - greenpart(X)*Aux8 - bluepart(X)*Aux2 + Rho;
    XProj := DE*Xobs/Zobs;
    YProj := DE*Yobs/Zobs;
  elseif typerepre="persp":
    XProj := DE*Xobs;
    YProj := DE*Yobs;
  fi;
  $=(XProj,YProj);
  $
enddef;

string pointilles;

vardef Initialisation(expr r,t,p,d)=
  Rho:=r;
  Theta:=t;
  Phi:=p;
  DE:=d;
  Aux1:=sind(Theta);
  Aux2:=sind(Phi);
  Aux3:=cosd(Theta);
  Aux4:=cosd(Phi);
  Aux5:=Aux3*Aux2;
  Aux6:=Aux1*Aux2;
  Aux7:=Aux3*Aux4;
  Aux8:=Aux1*Aux4;
  pointilles:="oui";
enddef;

%vues cachées

%lecture des faces et sommets;
vardef LectureSommet=
  color Sommet[];
%%A compléter si on souhaite inclure des nouveaux sommets
enddef;

vardef LectureFace=
%%A compléter si on souhaite définir les faces    
enddef;

vardef Face(text t)=
  j:=0;
  for p_=t :
    if numeric p_:
      a[j]:=p_;
      j:=j+1;
    fi;
  endfor;
  for k=1 upto (j-1):
    Fc[a0*100+(k-1)]:=a[k];
  endfor;
enddef;

vardef Oeil=(Rho*Aux7,Rho*Aux8,Rho*Aux2)
enddef;

vardef Vision(expr num)=
  save bb;
  color bb;
  bb=(redpart(Oeil-Sommet[num]),greenpart(Oeil-Sommet[num]),bluepart(Oeil-Sommet[num]));  
  bb
enddef;

vardef Normal(expr vecun,vecde,vectr)=
  save aa;
  color aa;
  P1:=redpart(vecde-vecun);
  P2:=greenpart(vecde-vecun);
  P3:=bluepart(vecde-vecun);
  Q1:=redpart(vectr-vecun);
  Q2:=greenpart(vectr-vecun);
  Q3:=bluepart(vectr-vecun);
  aa=(P2*Q3-Q2*P3,P3*Q1-Q3*P1,P1*Q2-Q1*P2);
  aa
enddef;

vardef ProduitScalaire(expr wec,mor)=
  redpart(wec)*redpart(mor)+greenpart(wec)*greenpart(mor)+bluepart(wec)*bluepart(mor)
enddef;

vardef Distance(expr aa,bb)=%Entre deux points
  sqrt((redpart(bb)-redpart(aa))*(redpart(bb)-redpart(aa))+(greenpart(bb)-greenpart(aa))*(greenpart(bb)-greenpart(aa))+(bluepart(bb)-bluepart(aa))*(bluepart(bb)-bluepart(aa)))
enddef;

vardef Module(expr aa)=%module d'un vecteur
sqrt((redpart(aa))**2+(greenpart(aa))**2+(bluepart(aa)**2))
enddef;

vardef DessineObjet=
  for l=1 upto NF:
    color cc,dd;
    dd=Vision(Fc[l*100+1]);
    cc=Normal(Sommet[Fc[l*100+1]],Sommet[Fc[l*100+2]],Sommet[Fc[l*100+3]]);
    if (ProduitScalaire(dd,cc)<0):
      if pointilles="oui":
	drawoptions(dashed dashpattern(on3bp off9bp));
	trace for k=1 upto Fc[100*l]:
	  Projette(Sommet[Fc[100*l+k]])--
	endfor
	cycle;
      fi;
    else:
      trace for k=1 upto Fc[100*l]:
	Projette(Sommet[Fc[100*l+k]])--
      endfor
      cycle;
    fi;
    drawoptions();
  endfor;
enddef;

vardef OrdrepourColore=
  cptvu:=1;%Compteur des faces vues
  cptnvu:=NF;%Compteur des faces non vues
  for l=1 upto NF:
    color cc,dd;
    dd=Vision(Fc[l*100+1]);
    cc=Normal(Sommet[Fc[l*100+1]],Sommet[Fc[l*100+2]],Sommet[Fc[l*100+3]]);
    if (ProduitScalaire(dd,cc)<0):
      Gc[100*cptnvu]:=Fc[100*l];
      for k=1 upto Fc[100*l]:
	Gc[100*cptnvu+k]:=Fc[100*l+k];
      endfor;
      cptnvu:=cptnvu-1;
    else:
      Gc[100*cptvu]:=Fc[100*l];
      for k=1 upto Fc[100*l]:
	Gc[100*cptvu+k]:=Fc[100*l+k];
      endfor;
      cptvu:=cptvu+1;
    fi;
  endfor;
enddef;

vardef DessineObjetColore=
  OrdrepourColore;
  for l=1 upto NF:
    color cc,dd;
    dd=Vision(Gc[l*100+1]);
    cc=Normal(Sommet[Gc[l*100+1]],Sommet[Gc[l*100+2]],Sommet[Gc[l*100+3]]);
    if (ProduitScalaire(dd,cc)<0):
      if pointilles="oui":
	drawoptions(dashed dashpattern(on3bp off9bp));
	trace for k=1 upto Gc[100*l]:
	  Projette(Sommet[Gc[100*l+k]])--
	endfor
	cycle;
      fi;
    else:
      fill for k=1 upto Gc[100*l]:
	Projette(Sommet[Gc[100*l+k]])--
      endfor
      cycle withcolor (ProduitScalaire(dd,cc)/(Module(dd)*Module(cc)))*jaune;%Co[l mod 7];
      trace for k=1 upto Gc[100*l]:
	Projette(Sommet[Gc[100*l+k]])--
      endfor
      cycle;
    fi;
    drawoptions();
  endfor;
enddef;

vardef TraceAxes=
  color Origine,Unitex,Unitey,Unitez;
  Origine=(0,0,0);
  Unitex=(3,0,0);
  Unitey=(0,3,0);
  Unitez=(0,0,3);
  drawoptions(dashed dashpattern(on 12bp off 6bp on 3bp off 6bp));
  drawarrow Projette(Origine)--Projette(Unitex) withcolor blue;
  drawarrow Projette(Origine)--Projette(Unitey);
  drawarrow Projette(Origine)--Projette(Unitez);
  drawoptions();
enddef;

vardef TraceGrille(expr NB)=
  color ppt[];
  for k=0 upto NB:
    ppt[k]:=(k,0,0);
    trace Projette(ppt[k]+(0,0,NB))--Projette(ppt[k])--Projette(ppt[k]+(0,NB,0));
    ppt[k]:=(0,k,0);
    trace Projette(ppt[k]+(NB,0,0))--Projette(ppt[k])--Projette(ppt[k]+(0,0,NB));
    ppt[k]:=(0,0,k);
    trace Projette(ppt[k]+(NB,0,0))--Projette(ppt[k])--Projette(ppt[k]+(0,NB,0));
  endfor;
enddef;

vardef Graduations(expr NB)=
  color ppp[];
  for k=1 upto NB:
    ppp[k]:=(k,0,0);
    dotlabel.bot(format("%10f",k),Projette(ppp[k]));
    ppp[k]:=(0,k,0);
    dotlabel.bot(format("%10f",k),Projette(ppp[k]));
    ppp[k]:=(0,0,k);
    dotlabel.rt(format("%10f",k),Projette(ppp[k]));
  endfor;
enddef;

vardef Projectionxy(expr po)=
  color ess;
  ess=(redpart(po),greenpart(po),0);
  trace Projette(po)--Projette(ess) dashed dashpattern(on 12bp off6bp on 3bp off6bp) withcolor rouge;
enddef;

vardef Projectionyz(expr po)=
  color ess;
  ess=(0,greenpart(po),bluepart(po));
  trace Projette(po)--Projette(ess) dashed dashpattern(on 12bp off6bp on 3bp off6bp) withcolor rouge;
enddef;

vardef Projectionzx(expr po)=
  color ess;
  ess=(redpart(po),0,bluepart(po));
  trace Projette(po)--Projette(ess) dashed dashpattern(on 12bp off6bp on 3bp off6bp) withcolor rouge;
enddef;

vardef PRojection(expr po)=
  Projectionxy(po);
  Projectionyz(po);
  Projectionzx(po);
enddef;

%%Surfaces d'équations paramétriques

vardef FX(expr t,v)=cosd(c*t)*cosd(c*v)
enddef;

vardef FY(expr t,v)=cosd(c*t)*sind(c*v)
enddef;

vardef FZ(expr t,v)=sind(c*t)
enddef;

vardef FamilleDesCourbesEnU=
  for k=Udebut step pasU until Ufin+2*pasU:
    for j=Vdebut step pasV until Vfin:
      trace Projette((FX(k,j),FY(k,j),FZ(k,j)))--Projette((FX(k,j+pasV),FY(k,j+pasV),FZ(k,j+pasV)));
    endfor;
  endfor;
enddef;

vardef FamilleDesCourbesEnV=
  for k=Vdebut step pasV until Vfin+pasV:
    for j=Udebut step pasU until Ufin+pasU:
      trace Projette((FX(j,k),FY(j,k),FZ(j,k)))--Projette((FX(j+pasU,k),FY(j+pasU,k),FZ(j+pasU,k)));
    endfor;
  endfor;
enddef;

vardef InitialiseParametre(expr ud,uf,up,vd,vf,vp)=
  Udebut:=ud;
  Ufin:=uf;
  pasU:=up;
  Vdebut:=vd;
  Vfin:=vf;
  pasV:=vp;
enddef;

%%%%------------------------------------------------------

%%Transformations

%Translations

vardef TranslateSommets(expr v)=
  for k=1 upto NbS:
    Sommet[k]:=Sommet[k]+v;
  endfor;
enddef;

vardef SymetriePlanZ(expr vv)=
  for k=1 upto NbS:
    w:=vv-bluepart(Sommet[k]);
    Sommet[k]:=(redpart(Sommet[k]),greenpart(Sommet[k]),w);
  endfor;
enddef;

vardef IntersectionDroite(expr aa,bb,cc,dd)=
  save tt;
  color tt;
  tt=whatever[aa,bb];
  tt=whatever[cc,dd];
  tt
enddef;

%%denis Roegel----------
vardef Intersectionplandroite(expr aa,bb,cc,dd,ee)=
  save int;
  boolean int;
  color gg,caaa[];
  caaa3=Normal(aa,bb,cc)/Module(Normal(aa,bb,cc));
  caaa1=aa-dd;
  caaa2=ee-dd;
  if ProduitScalaire(caaa2,caaa3)<>0:
    caaa4=caaa2*(ProduitScalaire(caaa1,caaa3)/ProduitScalaire(caaa2,caaa3));
    int:=true;
  else: % the line is parallel to the plane
    int:=false;
  fi;
  int
enddef;

vardef IntersectionPlanDroite(expr aa,bb,cc,dd,ee)=%plan (aa,bb,cc) droite(dd,ee)
  if Intersectionplandroite(aa,bb,cc,dd,ee):
    gg=dd+caaa4;
  fi;
  gg
enddef;

vardef ProjectionsurPlan(expr aa,bb,cc,dd)=%Projection du point aa sur le plan (bbccdd)
  save di,vc;
  color va,vb,vc;
  va=Normal(bb,cc,dd)/Module(Normal(bb,cc,dd));
  vb=aa-bb;
  di=-ProduitScalaire(vb,va);
  va:=di*va;
  vb:=vb+va;
  vc=bb+vb;
  vc
enddef;

vardef Intersectionplanplan(expr AA,BB,CC,DD,EE,FF)=%besoin pour la suite
  color trial[];
  path INTer;
  if Intersectionplandroite(DD,EE,FF,AA,BB):
    trial1=IntersectionPlanDroite(DD,EE,FF,AA,BB);
  else:% there is no intersection or the intersection is the line
    trial1=IntersectionPlanDroite(DD,EE,FF,AA,1/2[BB,CC]);
  fi;
  if Intersectionplandroite(DD,EE,FF,AA,CC):
    trial2=IntersectionPlanDroite(DD,EE,FF,AA,CC);
  else:% there is no intersection or the intersection is the line
    trial2=IntersectionPlanDroite(DD,EE,FF,CC,1/2[BB,AA]);%modif de cp
  fi;
  %INTer=segment(10[trial1,trial2],10[trial2,trial1]);
  INTer=droite(trial1,trial2);
  INTer
enddef;

vardef IntersectionPlanPlan(expr aa,bb,cc,dd,ee,ff)=
  %a vérifier
  save da,db,dc,int,INTER;
  boolean int;
  path INTER;
  da=Module(aa-ProjectionsurPlan(aa,dd,ee,ff));
  %show da;
  db=Module(bb-ProjectionsurPlan(bb,dd,ee,ff));
  %show db;
  dc=Module(cc-ProjectionsurPlan(cc,dd,ee,ff));
  %show dc;
  if (da=db) and (db=dc): % the two planes are parallel
    int:=false;
  else:
    int:=true;
    if (da=db):
      INTER=droite(aa,bb);
    elseif (db=dc):
      INTER=droite(bb,cc);
    elseif (dc=da):
      INTER=droite(cc,aa);
    elseif (da>=db) and (da>=dc):
      INTER=Intersectionplanplan(aa,bb,cc,dd,ee,ff);
    elseif (db>=da) and (db>=dc):
      INTER=Intersectionplanplan(bb,cc,aa,dd,ee,ff);
    elseif (dc>=da) and (dc>=db):
      INTER=Intersectionplanplan(cc,aa,bb,dd,ee,ff);
    fi;
  fi;
  INTER
enddef;
%%---------------------

%Cube
vardef Cube(text t)=
  picture cub;
  cub=image(
  NbS:=8;
  Sommet1:=(1,0,0);
  Sommet2:=(1,1,0);
  Sommet3:=(0,1,0);
  Sommet4:=(0,0,0);
  Sommet5:=(0,0,1);
  Sommet6:=(1,0,1);
  Sommet7:=(1,1,1);
  Sommet8:=(0,1,1);
%%Faces
  NF:=6;
  Fc[100]:=4;Fc[101]:=1;Fc[102]:=4;Fc[103]:=3;Fc[104]:=2;
  Fc[200]:=4;Fc[201]:=4;Fc[202]:=5;Fc[203]:=8;Fc[204]:=3;
  Fc[300]:=4;Fc[301]:=1;Fc[302]:=6;Fc[303]:=5;Fc[304]:=4;
  Fc[400]:=4;Fc[401]:=5;Fc[402]:=6;Fc[403]:=7;Fc[404]:=8;
  Fc[500]:=4;Fc[501]:=2;Fc[502]:=3;Fc[503]:=8;Fc[504]:=7;
  Fc[600]:=4;Fc[601]:=1;Fc[602]:=2;Fc[603]:=7;Fc[604]:=6;
  DessineObjet;
  k:=1;
  for p_=t:
    if color p_:
      p_=Sommet[k];
      k:=k+1;
    fi
  endfor;
  );
cub
enddef;

%Cube
vardef Paveh(text t)=
  picture paveh;
  paveh=image(
  NbS:=8;
  Sommet1:=(0.75,0,0);
  Sommet2:=(0.75,1.5,0);
  Sommet3:=(0,1.5,0);
  Sommet4:=(0,0,0);
  Sommet5:=(0,0,1);
  Sommet6:=(0.75,0,1);
  Sommet7:=(0.75,1.5,1);
  Sommet8:=(0,1.5,1);
%%Faces
  NF:=6;
  Fc[100]:=4;Fc[101]:=1;Fc[102]:=4;Fc[103]:=3;Fc[104]:=2;
  Fc[200]:=4;Fc[201]:=4;Fc[202]:=5;Fc[203]:=8;Fc[204]:=3;
  Fc[300]:=4;Fc[301]:=1;Fc[302]:=6;Fc[303]:=5;Fc[304]:=4;
  Fc[400]:=4;Fc[401]:=5;Fc[402]:=6;Fc[403]:=7;Fc[404]:=8;
  Fc[500]:=4;Fc[501]:=2;Fc[502]:=3;Fc[503]:=8;Fc[504]:=7;
  Fc[600]:=4;Fc[601]:=1;Fc[602]:=2;Fc[603]:=7;Fc[604]:=6;
  DessineObjet;
  k:=1;
  for p_=t:
    if color p_:
      p_=Sommet[k];
      k:=k+1;
    fi
  endfor;
  );
paveh
enddef;

%Cube
vardef Pavev(text t)=
  picture pavev;
  pavev=image(
  NbS:=8;
  Sommet1:=(1,0,0);
  Sommet2:=(1,0.75,0);
  Sommet3:=(0,0.75,0);
  Sommet4:=(0,0,0);
  Sommet5:=(0,0,1.5);
  Sommet6:=(1,0,1.5);
  Sommet7:=(1,0.75,1.5);
  Sommet8:=(0,0.75,1.5);
%%Faces
  NF:=6;
  Fc[100]:=4;Fc[101]:=1;Fc[102]:=4;Fc[103]:=3;Fc[104]:=2;
  Fc[200]:=4;Fc[201]:=4;Fc[202]:=5;Fc[203]:=8;Fc[204]:=3;
  Fc[300]:=4;Fc[301]:=1;Fc[302]:=6;Fc[303]:=5;Fc[304]:=4;
  Fc[400]:=4;Fc[401]:=5;Fc[402]:=6;Fc[403]:=7;Fc[404]:=8;
  Fc[500]:=4;Fc[501]:=2;Fc[502]:=3;Fc[503]:=8;Fc[504]:=7;
  Fc[600]:=4;Fc[601]:=1;Fc[602]:=2;Fc[603]:=7;Fc[604]:=6;
  DessineObjet;
  k:=1;
  for p_=t:
    if color p_:
      p_=Sommet[k];
      k:=k+1;
    fi
  endfor;
  );
pavev
enddef;

vardef Pave(text t)(expr aa,bb,cc)=
  picture pave;
  pave=image(
  NbS:=8;
  Sommet1:=(aa,0,0);
  Sommet2:=(aa,bb,0);
  Sommet3:=(0,bb,0);
  Sommet4:=(0,0,0);
  Sommet5:=(0,0,cc);
  Sommet6:=(aa,0,cc);
  Sommet7:=(aa,bb,cc);
  Sommet8:=(0,bb,cc);
%%Faces
  NF:=6;
  Fc[100]:=4;Fc[101]:=1;Fc[102]:=4;Fc[103]:=3;Fc[104]:=2;
  Fc[200]:=4;Fc[201]:=4;Fc[202]:=5;Fc[203]:=8;Fc[204]:=3;
  Fc[300]:=4;Fc[301]:=1;Fc[302]:=6;Fc[303]:=5;Fc[304]:=4;
  Fc[400]:=4;Fc[401]:=5;Fc[402]:=6;Fc[403]:=7;Fc[404]:=8;
  Fc[500]:=4;Fc[501]:=2;Fc[502]:=3;Fc[503]:=8;Fc[504]:=7;
  Fc[600]:=4;Fc[601]:=1;Fc[602]:=2;Fc[603]:=7;Fc[604]:=6;
  DessineObjet;
  k:=1;
  for p_=t:
    if color p_:
      p_=Sommet[k];
      k:=k+1;
    fi
  endfor;
  );
pave
enddef;

vardef Tetraedrer(text t)=
  picture tetrar;
  tetrar=image(
    %Sommets
    NbS:=4;
    Sommet1:=(0,0,1);
    Sommet2:=(-0.4714045,-0.8164965,-1/3);
    Sommet3:=(0.942809,0,-1/3);
    Sommet4:=(-0.4714045,0.8164965,-1/3);
    %Faces
    NF:=4;
    Fc[100]:=3;Fc[101]:=1;Fc[102]:=2;Fc[103]:=3;
    Fc[200]:=3;Fc[201]:=1;Fc[202]:=3;Fc[203]:=4;
    Fc[300]:=3;Fc[301]:=1;Fc[302]:=4;Fc[303]:=2;
    Fc[400]:=3;Fc[401]:=2;Fc[402]:=4;Fc[403]:=3;
    DessineObjet;
    k:=1;
    for p_=t:
      if color p_:
	p_=Sommet[k];
	k:=k+1;
      fi
    endfor;
    );
  tetrar
enddef;

endinput;
