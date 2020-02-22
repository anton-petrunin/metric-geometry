input macros
input hatching
input mparrows

verbatimtex
%&latex
\documentclass[oneside]{book}
\usepackage{../lectures}
\begin{document}
etex

filenametemplate "%j-%1c.mps";
prologues:=3;
setarrows(barbedsharp);
linecap:=butt;
%linejoin:=mitered;
%filenametemplate "%j-%1c.svg";
outputformat := "eps";

beginfig(1) 
save u,n;
u:=1.4cm;
n:=7;

draw (0,0)*u--(1,0)*u--(1,1)*u--(0,1)*u;

for i=2 step 1 until n:
draw (1/i,0)*u--(1/i,1)*u penhair;
endfor

dOt (0,0)*u,(0,1)*u;

label.lft(btex $\dots$ etex, (1/n,.5)*u);
label.lft(btex $p$ etex, (0,0)*u);
label.lft(btex $q$ etex, (0,1)*u);

endfig;

beginfig(2)
save u;
u:=1cm;

setbounds currentpicture to (-2.1,-1.7)*u--(2.1,-1.7)*u--(2.1,.8)*u--(-2.1,.8)*u--cycle;

z.www=(1,-3)*u;
z.q=(-1,-3)*u;
save p,q;
path p[];
path q[];

p[1]=circle((1/1,0)*u,u/1);
q[1]=circle((-1/1,0)*u,u/1);
draw p[1] yscaled .5;
draw q[1] yscaled .5;
draw ((support.lft(p[1],z.www)--z.www--support.rt(p[1],z.www))) yscaled .5;
draw ((support.rt(q[1],z.q)--z.q--support.lft(q[1],z.q))) yscaled .5;

for i=2 step 1 until 100:
p[i]=circle((1/i,0)*u,u/i);
q[i]=circle((-1/i,0)*u,u/i);
draw p[i] yscaled .5;
draw q[i] yscaled .5;
draw ((z.www--support(p[i],z.www)) cutbefore p[i-1]) yscaled .5;
draw ((z.q--support.lft(q[i],z.q)) cutbefore q[i-1]) yscaled .5;
endfor

endfig;

beginfig(3) 
save u;
u:=1cm;

z.o=origin;
z.a=(0,1)*u;
z.b=z.a rotated 120;
z.c=z.a rotated -120;

draw z.o--z.a;
draw z.o--z.b;
draw z.o--z.c;

Dot z.a,z.b,z.c,z.o;

label.top(btex $a$ etex, z.a);
label.llft(btex $b$ etex, z.b);
label.lrt(btex $c$ etex, z.c);
endfig;

beginfig(10) 
save u;
u:=.3cm;

draw (0,0)*u--(6,0)*u--(6,6)*u--(0,6)*u--cycle penhair;
draw (0,0)*u--(6,6)*u penbold;
draw (0,0)*u--(1,0)*u--(1,1)*u--(2,1)*u--(2,2)*u--(3,2)*u--(3,3)*u--(4,3)*u--(4,4)*u--(5,4)*u--(5,5)*u--(6,5)*u--(6,6)*u penbold;

endfig;

beginfig(30) 

save u,v,n;
v:=1.8;
u:=1cm;
n:=6;

for i=1 step 1 until n:
draw (-i,v/i)*u--(4,v/i)*u penhair;
Dot (-i,v/i)*u;
endfor

draw (-n,0)*u--(4,0)*u pensemibold;

label.top(btex $\spc{X}_1$ etex, (.5*4,v)*u);
label.top(btex $\spc{X}_2$ etex, (.5*3,v/2)*u);
label(btex $\dots$ etex, (0,v/n)*.5*u);
label.bot(btex $\spc{X}_\infty$ etex, (0,0)*u);

endfig;

beginfig(70) 
save u;
u:=1cm;

z.a=(0,0)*u;
z.b=(1,0)*u;

save p;
path p[];

p1=circle(z.a,z.b-z.a);
p2=circle(z.b,z.a-z.b);

draw p1;
draw p2;

hatchfill p1 withcolor (77, 1mm, -.5bp);
hatchfill p2 withcolor (177, 1mm, -.5bp);

label.top(btex $\spc{M}_4$ etex, z.b rotatedabout(z.a,60)+(0,2));
whitelabel(btex $\spc{E}_4$ etex, .5[z.a,z.b]);
whitelabel(btex $\spc{P}_4$ etex, 1.5[z.a,z.b]);
whitelabel(btex $\spc{N}_4$ etex, (-.5)[z.a,z.b]);
endfig;

beginfig(71) 
save u;
u:=1cm;

z.a=(0,0)*u;
z.b=(1,0)*u;
z.c=(.4,1.1)*u;
z.d=(.55,.25)*u;

z.a1=(2,0)*u;
z.b1=(3,0)*u;
z.c1=(2.1,.9)*u;
z.d1=(2.95,1.05)*u;

draw z.a--z.b--z.c--z.d--cycle;
draw z.a--z.c;
draw z.b--z.d;

draw z.a1--z.b1--z.c1--z.d1--cycle;
draw z.a1--z.c1;
draw z.b1--z.d1;

dOt z.a,z.b,z.c,z.d,z.a1,z.b1,z.c1,z.d1;
endfig;

beginfig(72) 
save u;
u:=1cm;

z.p=(0,0)*u;
z.q=(1.5,1.3)*u;
z.x=(1,0)*u;
z.y=(-.2,1)*u;
z.z=.6[z.x,z.y];

draw z.p--z.x--z.q--z.y--cycle;
draw z.x--z.y;
draw z.p--z.z--z.q dashed evenly;

dOt z.x,z.y,z.z,z.p,z.q;

label.lrt(btex $\tilde x$ etex, z.x);
label.ulft(btex $\tilde y$ etex, z.y);
label.top(btex $\tilde z$ etex, z.z);
label.llft(btex $\tilde p$ etex, z.p);
label.urt(btex $\tilde q$ etex, z.q);
endfig;

beginfig(73) 
save u;
u:=1.4cm;

z.p=(0,0)*u;
z.x=(.2,1)*u;
z.y=(1.2,.1)*u;
z.z=.9[z.p,.4[z.x,z.y]];

draw z.x..z.z..z.y;
draw z.p{.1,1}..z.x;
draw z.p{1,.1}..z.y;
draw z.p{.5,.5}..z.z;

dOt z.x,z.y,z.z,z.p;

label.top(btex $\tilde x$ etex, z.x);
label.rt(btex $\tilde y$ etex, z.y);
label.urt(btex $\tilde z$ etex, z.z);
label.llft(btex $\tilde p$ etex, z.p);

endfig;

beginfig(74) 
save u;
u:=1.4cm;

z.p=(0,0)*u;
z.x=(.2,1)*u;
z.y=(1.2,.1)*u;
z.z=.4[z.x,z.y];
z.yy=z.y rotatedabout(z.z,-20);

draw z.x--z.y;
draw z.p--z.x;
draw z.p--z.y dashed evenly;
draw z.p--z.z;
draw z.p--z.yy--z.z;

dOt z.x,z.y,z.z,z.p,z.yy;

label.top(btex $\tilde x$ etex, z.x);
label.rt(btex $\tilde y$ etex, z.y);
label.bot(btex $\tilde y'$ etex, z.yy);
label.urt(btex $\tilde z$ etex, z.z);
label.llft(btex $\tilde p$ etex, z.p);

endfig;

beginfig(75) 
save u;
u:=1.4cm;

z.p=(0,0)*u;
z.x=(.2,1)*u;
z.y=(1.2,.1)*u;
z.xx=.4[z.p,z.x];
z.yy=.3[z.p,z.y];

draw z.p--z.y;
draw z.p--z.x;
draw z.xx--z.yy;

dOt z.x,z.y,z.p,z.xx,z.yy;

label.top(btex $x$ etex, z.x);
label.rt(btex $y$ etex, z.y);
label.bot(btex $\bar y$ etex, z.yy);
label.lft(btex $\bar x$ etex, z.xx);
label.llft(btex $p$ etex, z.p);

endfig;
end
