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
u:=.7cm;

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

beginfig(4) 
save u;
u:=.7cm;

z.p=(1,0)*u;
z.q=-z.p;
z.x=(0,1)*u;
z.y=-z.x;

save p;
path p;
p=z.p--z.x--z.q--z.y--cycle;


hatchfill p withcolor (77, 1mm, -.5bp);

draw p;
drawarrow ddline (z.q,z.p)(.3,.3);
drawarrow ddline (z.y,z.x)(.3,.3);

Dot z.x,z.y,z.p,z.q;

label.urt(btex $x$ etex, z.x);
label.lrt(btex $y$ etex, z.y);
label.lrt(btex $p$ etex, z.p);
label.llft(btex $q$ etex, z.q);
endfig;

beginfig(5) 
save u;
u:=2cm;

z.x=origin;
z.y=(1,0)*u;
z.p=(.3,.8)*u;
z.q=(.5,-.7)*u;
z.pp=z.p rotated -25;
z.ppp=z.p rotated -10;
z.qq=z.q rotated 18;
z.qqq=z.q rotated 8;

labelarcsprof(z.y, z.x, z.pp, 12, 10, btex $\alpha$ etex);
labelarcsprof2(z.y, z.x, z.qq, 12, 10, btex $\beta$ etex);
rimmark(z.x--z.p,z.x--z.pp);
rimmark2(z.x--z.q,z.x--z.qq);

draw z.p--z.x--z.y--z.q;
draw z.p--z.y;
draw z.q--z.x;

drawarrow ddarc(z.p,z.ppp,z.pp)(-4,-4);
drawarrow ddarc(z.q,z.qqq,z.qq)(-4,-4);

draw z.pp--z.y--z.qq dashed evenly;
draw z.pp--z.qq--z.x--cycle;

dOt z.x,z.y,z.p,z.q,z.pp,z.qq;

label.lft(btex $\tilde x$ etex, z.x);
label.rt(btex $\tilde y$ etex, z.y);
label.top(btex $\tilde p$ etex, z.p);
label.bot(btex $\tilde q$ etex, z.q);

endfig;

beginfig(6) 
save u;
u:=1.6cm;

z.x=origin;
z.y=(1,0)*u;
z.q=(-.1,-.7)*u;
z.pp=-.8*z.q;
z.p=z.pp rotated 25;
z.ppp=z.p rotated -10;


rimmark(z.x--z.p,z.x--z.pp);

draw z.p--z.x--z.y--z.q;
draw z.p--z.y;
draw z.q--z.x--z.pp;

drawarrow ddarc(z.p,z.ppp,z.pp)(-4,-4);

draw z.pp--z.y dashed evenly;


dOt z.x,z.y,z.p,z.q,z.pp;

label.lft(btex $\tilde x$ etex, z.x);
label.rt(btex $\tilde y$ etex, z.y);
label.top(btex $\tilde p$ etex, z.p);
label.bot(btex $\tilde q$ etex, z.q);

endfig;

beginfig(7) 
save u;
u:=2cm;

z.p=origin;
z.x=(1,1)*u;
z.z=(1.2,-.8)*u;
z.y=.5[z.x,z.z];

labelarcsprof(z.x, z.p, z.y, 10, 22, btex $=\alpha+\eps$ etex rotated (.5*(angle(z.y-z.p)+angle(z.x-z.p))));
labelarcsprof2(z.y, z.p, z.z, 10, 21, btex $=\beta+\eps$ etex rotated (.5*(angle(z.y-z.p)+angle(z.z-z.p))));

draw ddline(z.p,z.x)(0,.2);
draw ddline(z.p,z.y)(0,.2);
draw ddline(z.p,z.z)(0,.2);
draw z.x--z.z;

dOt z.p,z.x,z.y,z.z;

whitelabel(btex $t$ etex rotated angle(z.x-z.p), .5[z.p,z.x]+(0,-2)); 
whitelabel(btex $s(t,\tau)$ etex rotated angle(z.y-z.p), .7[z.p,z.y]+(0,1)); 
whitelabel(btex $\tau$ etex rotated angle(z.z-z.p), .5[z.p,z.z]);
endfig;

beginfig(8) 
save u,k;
u:=.7cm;
k=.4;


z.p0=(0,0)*u;
z.p1=(2,1)*u;
z.q0=(1,-2)*u;
z.q1=(3,-2.2)*u;

z.a=k[z.p0,z.p1];
z.b=k[z.q0,z.p1];
z.c=k[z.q0,z.q1];

draw z.p0--z.p1--z.q0--z.q1;
draw z.a--z.b--z.c penhair dashed evenly;
draw z.a--z.c penhair;
draw z.p0--z.q0 penhair;
draw z.p1--z.q1 penhair;

dOt z.p0,z.p1,z.q0,z.q1,z.a,z.b,z.c;

label.lft(btex $\gamma_1(0)$ etex, z.p0);
label.urt(btex {\small $\gamma_1(1)=\delta(1)$} etex, z.p1);
label.bot(btex $\gamma_2(1)$ etex, z.q1);
label.llft(btex {\small $\gamma_2(0)=\delta(0)$} etex, z.q0);
label.top(btex $\gamma_1(t)$ etex, z.a);
label.rt(btex $\delta(t)$ etex, z.b);
label.bot(btex $\gamma_2(t)$ etex, z.c);
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

label.top(btex $x$ etex, z.x);
label.rt(btex $y$ etex, z.y);
label.urt(btex $z$ etex, z.z);
label.llft(btex $p$ etex, z.p);

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

beginfig(80) 
save u,p;
u:=1cm;
path p[];

z.o=(0,0)*u;
z.a=(.3,.7)*u;
z.b=(1,1)*u;

draw z.o..z.a..z.b--cycle;

dOt z.o,z.a,z.b;

label.llft(btex $\gamma(0)$ etex, z.o);
label.ulft(btex $\gamma(a)$ etex, z.a);
label.urt(btex $\gamma(b)$ etex, z.b);

endfig;

beginfig(81) 
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

label.top(btex $x$ etex, z.x);
label.rt(btex $ y$ etex, z.y);
label.urt(btex $ z$ etex, z.z);
label.llft(btex $ p$ etex, z.p);

endfig;

beginfig(82) 
save u;
u:=2cm;

z.p=(0,0)*u;
z.x=(.2,1)*u;
z.y=(1.2,.1)*u;
z.z=.4[z.x,z.y];
z.yy=z.y rotatedabout(z.z,-30);
z.w=whatever[z.x,z.yy]=whatever[z.p,z.z];

draw z.p--z.z;
draw z.p--z.yy--z.z--z.x--cycle;
draw z.x--z.yy dashed evenly;

dOt z.x,z.z,z.p,z.yy,z.w;

label.top(btex $\dot x$ etex, z.x);
label.bot(btex $\dot y$ etex, z.yy);
label.urt(btex $\dot z$ etex, z.z);
label.llft(btex $\dot p$ etex, z.p);
label.lft(btex $\dot w$ etex, z.w);

endfig;

beginfig(83) 
save u,p;
u:=2cm;
path p[];

z.x=(0,0)*u;
z.y=(2,0)*u;
z.z=.55[z.x,z.y];
z.zx=z.z rotatedabout(z.x,-25);
z.zxx=z.z rotatedabout(z.x,-15);
z.zy=z.z rotatedabout(z.y,30);
z.zyy=z.z rotatedabout(z.y,20);
z.p=z.zy+((z.zx-z.zy) zscaled (.5,3));
z.zxy=z.zx rotatedabout(z.p,-2);

p0=arc(z.z,z.zxx,z.zx)--arc(z.zx,z.zxy,z.zy)--(arc(z.zy,z.zyy,z.z))--cycle;

hatchfill p0 withcolor (40, 3, -.5bp);

p1=arc(z.z,z.zxx,z.zx);

for i=0 step 3 until abs(z.x-z.z):
draw p1 shifted -z.x scaled ((abs(z.x-z.z)-i)/(abs(z.x-z.z))) shifted z.x;
endfor

p2=arc(z.zy,z.zyy,z.z);

for i=0 step 3 until abs(z.y-z.z):
draw p2 shifted -z.y scaled ((abs(z.y-z.z)-i)/(abs(z.y-z.z))) shifted z.y;
endfor

p3=arc(z.zx,z.zxy,z.zy);

for i=0 step 3 until abs(z.p-z.zx):
draw p3 shifted -z.p scaled ((abs(z.p-z.zx)-i)/(abs(z.p-z.zx))) shifted z.p;
endfor

draw z.x--z.y--z.p--cycle;
draw z.x--z.zx--z.p--z.zy--z.y;


dOt z.p,z.x,z.y,z.z,z.zx,z.zy;

label.lft(btex $\tilde x$ etex, z.x);
label.rt(btex $\tilde y$ etex, z.y);
label.top(btex $\tilde z$ etex, z.z);
label.llft(btex $\tilde z_x$ etex, z.zx);
label.lrt(btex $\tilde z_y$ etex, z.zy);
label.bot(btex $\tilde p$ etex, z.p);

endfig;

beginfig(84) 
save u,p;
u:=1.4cm;
path p[];

z.a=(0,0)*u;
z.b=(1.1,0)*u;
z.c=(1.9,0)*u;
z.d=(3,0)*u;

z.z1=(1.4,.3)*u;
z.z2=(1.5,-.2)*u;
z.x0=(.5,.1)*u;
z.x1=1.8[z.x0,z.z1];
z.x2=1.9[z.x0,z.z2];



p1=z.a{.1,1}..z.c{.2,-1}..cycle;
p2=z.b{.2,1}..z.d{-.3,-1}..cycle;

draw p1;
draw p2;

hatchfill p1 withcolor (77, 1.5mm, -.5bp);
hatchfill p2 withcolor (177, 1.5mm, -.5bp);

draw z.x0--z.x1--z.x2--cycle pensemibold;
draw z.z1--z.z2--z.x1 pensemibold;

dOt z.x0,z.x1,z.x2,z.z1,z.z2;

whitelabel.urt(btex $\spc{U}^1$ etex, point 1.7 of p1);
whitelabel.lft(btex $\spc{U}^2$ etex, point 1 of p2);
whitelabel.top(btex $A$ etex, point 1.6 of p2);

whitelabel.ulft(btex $x$ etex, z.x0);
whitelabel.urt(btex $y$ etex, z.x1);
whitelabel.lrt(btex $z$ etex, z.x2);
whitelabel.top(btex $a$ etex, z.z1);
whitelabel.bot(btex $b$ etex, z.z2+(0,-1));
endfig;

beginfig(85) 
save u,p;
path p[];
u:=1cm;



z.a0=origin;
z.a1=(1,0)*u;
z.b0=(2.5,0)*u;
z.b1=z.b0+z.a1;
z.l=(-.4)[z.a0,z.b1];
z.r=(1.4)[z.a0,z.b1];

y.shift=1.5*u;
y.gap=.5*u;

z.v=unitvector(z.b0-z.a1+(0,y.gap/2));
z.w=unitvector(z.b0-z.a1+(0,-y.gap/2));

z.aa0=z.a0 shifted (0,-y.shift);
z.aaa0=z.a0 shifted (0,-y.shift-y.gap);

z.aa1=z.a1 shifted (0,-y.shift);
z.aaa1=z.a1 shifted (0,-y.shift-y.gap);

z.bb0=z.b0 shifted (0,-y.shift-y.gap/2);
z.bb1=z.b1 shifted (0,-y.shift-y.gap/2);

draw z.l--z.r penhair;
draw z.a0--z.a1 penbold;
draw z.b0--z.b1 penbold;

draw z.aa0--z.aa1 penbold;
draw z.aaa0--z.aaa1 penbold;
draw z.bb0--z.bb1 penbold;

draw z.aa1--z.bb0--z.aaa1 penhair;


draw (z.l--z.a0) shifted (z.aa0-z.a0) penhair;
draw (z.l--z.a0) zscaled z.w shifted (z.aa0-z.a0) penhair;
draw (z.l--z.a0) shifted (z.aaa0-z.a0) penhair;
draw (z.l--z.a0) zscaled z.v shifted (z.aaa0-z.a0) penhair;
draw (z.a1--z.r) shifted (z.a0-z.a1) zscaled z.v shifted (z.aa1-z.a0) penhair;
draw (z.a1--z.r) shifted (z.a0-z.a1) zscaled z.w shifted (z.aaa1-z.a0) penhair;
draw (z.b1--z.r) shifted (z.a0-z.b1) zscaled z.v shifted (z.bb1-z.a0) penhair;
draw (z.b1--z.r) shifted (z.a0-z.b1) zscaled z.w shifted (z.bb1-z.a0) penhair;


label.top(btex $A$ etex, .5[z.a0,z.a1]);
label.top(btex $B$ etex, .5[z.b0,z.b1]);
whitelabel(btex $\mathcal{R}^0$ etex zscaled z.w, z.r shifted (z.a0-z.a1) zscaled z.w shifted (z.aaa1-z.a0));
whitelabel(btex $\mathcal{R}^1$ etex zscaled z.w, z.r shifted (z.a0-z.b1) zscaled z.w shifted (z.bb1-z.a0));
whitelabel(btex $\mathcal{R}^2$ etex zscaled z.v, z.r shifted (z.a0-z.b1) zscaled z.v shifted (z.bb1-z.a0));
whitelabel(btex $\mathcal{R}^3$ etex zscaled z.v, z.r shifted (z.a0-z.a1) zscaled z.v shifted (z.aa1-z.a0));

endfig;

beginfig(86) 
save u,p;
path p[];
u:=1cm;

z.p=origin;
z.q=(1.5,0)*u;
z.v=(2,1)*u;
z.w=(1.5,-1.5)*u;

p0=z.p{z.w}..z.q..{-z.v}z.p;
p1=z.v--p0--z.w{z.w}..tension 5..{-z.v}cycle;

draw subpath (0,4) of p1;
hatchfill p0--cycle withcolor (77, 1.5mm, -.5bp);
hatchfill p1 withcolor (37, 1.5mm, -.5bp);

dOt z.p;

label.lft(btex $p$ etex, z.p);
whitelabel(btex $X$ etex, .6[z.p,z.q]);
whitelabel(btex $D$ etex, 1.3[z.p,z.q]);
endfig;

beginfig(87) 
save u,p;
path p[];
u:=1cm;


z.o=origin;
z.r=(0,-1.2)*u;
z.x=z.r rotated 20;
z.y=z.r rotated -20;
z.l=(0,.15)*u;

z.x0=-z.x;
z.x1=z.x0+2*z.l;
z.x2=z.x1+2*z.l;
z.x3=z.x2+2*z.l;

z.y0=-z.y;
z.y1=z.y0+1*z.l;
z.y2=z.y1+2*z.l;
z.y3=z.y2+2*z.l;

draw circle(z.o,z.x) pensemibold;
draw z.x0..z.y1..z.x;
draw z.x1..z.y2..z.x;
draw subpath (0,1) of (z.x2..z.y3..z.x);
draw subpath (1,2) of (z.x2..z.y3..z.x) pensemibold;
draw z.y1..z.x1..z.y;
draw z.y2..z.x2..z.y;
draw z.y3..z.x3..z.y pensemibold;

dOt z.x,z.x0,z.x1,z.x2,z.x3,z.y,z.y0,z.y1,z.y2,z.y3;

label.top(btex $\alpha$ etex, z.r);
label.bot(btex $\alpha$ etex, -z.r);
label.lft(btex {\small $\pi-\alpha$} etex rotated 90, z.r rotated 90);
label.rt(btex {\small $\pi-\alpha$} etex rotated -90, z.r rotated -90);
endfig;

beginfig(88) 
save u,p;
path p[];
u:=1cm;

z.z0=origin;
z.z1=(-.5,-1)*u;

z.x=(-.5,1)*u;
z.y=(.6,1.3)*u;
z.v=(1.2,1.2)*u;
z.w=(-1.2,1.2)*u;

p1=z.z0{z.v}...z.z1{0,1}...cycle;
p2=z.z0{z.w}...z.z1{1,-.5}...cycle;

hatchfill p1 withcolor (77, 1.5mm, -.5bp);
hatchfill p2 withcolor (10, 1.5mm, -.5bp);
draw p1;
draw p2;
draw z.x--z.z0--z.y;

draw -z.v--z.v;
draw -z.w--z.w;

dOt z.z0,z.x,z.y;

whitelabel.lft(btex $A$ etex, point .4 of p1);
whitelabel.rt(btex $B$ etex, point .6 of p2);
label.lft(btex $x$ etex, z.x);
label.rt(btex $y$ etex, z.y);
whitelabel.bot(btex $z_0$ etex, z.z0+(0,-2));

endfig;

end
