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


beginfig(9) 
save u,p;
path p[];
u:=1.4cm;

z0=(0,0)*u;
z1=(1,-.8)*u;
z2=(2,0)*u;
z3=(1,-1.4)*u;

z.x=(0,-.3)*u;
z.y=(2,-.2)*u;
z.t=(1.6,-.8)*u;

p0=z0..z1..z2..z3..cycle;
p1=
point 0 of p0+(10*unitvector(direction 0 of p0) rotated 90)..
point 1 of p0+(10*unitvector(direction 1 of p0) rotated 90)..
point 2 of p0+(10*unitvector(direction 2 of p0) rotated 90)..
point 3 of p0+(10*unitvector(direction 3 of p0) rotated 90)..cycle;
p2=z.x{1,-2}..z.t..{1,2}z.y;

hatchfill p0--reverse(p1)--cycle withcolor (77, 1mm, -.5bp);
draw p0;
draw p1;
draw z.t--z.x--z.y;
draw p2;

dOt z.t,z.x,z.y;

label.top(btex $K$ etex, z3);
whitelabel(btex $\Omega$ etex, point 3.5 of p0);
label.lft(btex $x$ etex, z.x);
label.rt(btex $y$ etex, z.y);
label.rt(btex $\alpha(s)$ etex, z.t);
endfig;

beginfig(11) 
save u,p;
path p[];
u:=1cm;

z.p=(0,0)*u;
z.q=(0,-2)*u;

p0=z.p{1,.3}..{-1,-.2}z.q..cycle;

draw p0;
draw z.p--z.q;

dOt z.p,z.q;

label.top(btex $p$ etex, z.p);
label.bot(btex $q$ etex, z.q);
label.rt(btex $\gamma$ etex, point .5 of p0);
endfig;

beginfig(12) 
save u,p;
path p[];
u:=1cm;

p0=circle(origin,1*u);

fill p0 withcolor 0;

for i=1/2**4 step 1/2**4 until 4:
draw point i of p0 --4*point i of p0;

clip currentpicture to (-2,-2)*u--(2,-2)*u--(2,2)*u--(-2,2)*u--cycle;

endfor

endfig;

beginfig(13) 
save u,p,a,b,c,r;
path p[];
u:=1.4cm;
a:=30;
b:=30;
c:=56;
r:=1/4;

p0=(.5+r,0)*u--(.5+r,r)*u--(.5-r,r)*u--(.5-r,0)*u--cycle;
p1=(0,.5+r)*u--(r,.5+r)*u--(r,.5-r)*u--(0,.5-r)*u--cycle;

picture box;
box:= image(
hatchfill p0 withcolor (c, 1mm, -.5bp);
hatchfill p1 withcolor (c-90, 1mm, -.5bp);
draw (0,0)*u--(1,0)*u--(1,1)*u--(0,1)*u;
draw subpath (0,3) of p0;
draw subpath (0,3) of p1;
);

z.x=(cosd(b),-sind(b)*sind(a))*u;
z.y=(-sind(b),-cosd(b)*sind(a))*u;
z.z=(0,cosd(a))*u;

transform T[];

origin=origin transformed T1;
z.x=(0,1)*u transformed T1;
z.y=(1,0)*u transformed T1;

origin=origin transformed T2;
z.y=(0,1)*u transformed T2;
z.z=(1,0)*u transformed T2;

origin=origin transformed T3;
z.z=(0,1)*u transformed T3;
z.x=(1,0)*u transformed T3;

draw box transformed T1;
draw box transformed T2;
draw box transformed T3;

endfig;

beginfig(15) 
save u,p,a,b,c,r;
path p[];
u:=1.4cm;
a:=30;
b:=40;
c:=37;
r:=1/4;

z=(.5,.5)*u;


picture box;
box:= image(
draw (.5,0)*u--(.5,.5)*u--(0,.5)*u;
draw (0,0)*u--(1,0)*u--(1,1)*u--(0,1)*u;
dOt z;
);

z.x=(cosd(b),-sind(b)*sind(a))*u;
z.y=(-sind(b),-cosd(b)*sind(a))*u;
z.z=(0,cosd(a))*u;

transform T[];

origin=origin transformed T1;
z.x=(0,1)*u transformed T1;
z.y=(1,0)*u transformed T1;

origin=origin transformed T2;
z.y=(0,1)*u transformed T2;
z.z=(1,0)*u transformed T2;

origin=origin transformed T3;
z.z=(0,1)*u transformed T3;
z.x=(1,0)*u transformed T3;

draw box transformed T1;
draw box transformed T2;
draw box transformed T3;

label.urt(btex $x$ etex transformed T3, z transformed T3);
label.ulft(btex $y$ etex rotated -90 transformed T2, z transformed T2);
label.bot(btex $z$ etex rotated 90 transformed T1, z transformed T1);
endfig;

beginfig(17) 
save u;
u:=1cm;

z.z=origin;
z.r=(1,1)*u;
draw circle(z.z,z.r);

z.p=(.3,-.2)*u;
z.q=-z.p;

draw z.p--z.q;

z.s=(.5,-.5)*u;
save p; path p[];
p1= z.p{up}..z.r..z.q{-1,-1}..z.s..cycle;

draw p1;

p2=(subpath (0,2) of p1) rotated 180;

draw p2 dashed evenly;


dOt z.p,z.q,z.r,-z.r,z.z;

label.rt(btex $p$ etex, z.p);
label.ulft(btex $q$ etex, z.q);
label.urt(btex $z$ etex, z.z);
label.urt(btex $r$ etex, z.r);
label.llft(btex $r^{*}$ etex, -z.r);

label.ulft(btex $\alpha_1$ etex, point 1.6 of p1+(1,0));
label.ulft(btex $\alpha_1^{*}$ etex, point .6 of p2+(1,0));
endfig;

beginfig(19) 
save u;
u:=1cm;
path p[];

z.p=(-.5,.8)*u;
z.r=(1.4,0)*u;
z.a=(-.6,0)*u;
z.b=(.7,0)*u;

p1=-z.r..z.p..z.r;
p2=z.a..tension 1.5..point 1 of p1{direction 1 of p1}..tension 1.5..z.b;


hatchfill p2--cycle withcolor (77, 1mm, -.5bp);
draw p1;
draw p2;
draw ddline(-z.r,z.r)(.2,.2);

draw ddline(z.p,z.p+direction 1 of p1)(1.2,.2);

dOt z.p;

label.ulft(btex $p$ etex, z.p);
whitelabel.bot(btex $R$ etex, z.p+(6,-6));
label.bot(btex $W_0$ etex, 1.3*z.r);
label.ulft(btex $W$ etex, z.p+1.2*(direction 1 of p1));
endfig;

beginfig(21) 
save u;
u:=1cm;
path p[];

z.x=(-1,0)*u;
z.y=(-.8,.4)*u;
z.z=(1,0)*u;
z.p=.5[z.x,z.z];
z.pq=.4[z.y,z.z];
z.q=3.3[z.p,z.pq];

z.z0=(1.2,-.8)*u;
z.z2=(1.1,1.3)*u;

z.x0=(-1.1,-.8)*u;
z.x2=(-.9,1.3)*u;


p1=z.x--z.y--z.z--cycle;

hatchfill p1 withcolor (77, 1mm, -.5bp);
draw p1;
draw z.p--z.q;
draw z.z0--z.z--z.z2 pensemibold;
draw z.x0--z.x--z.y--z.x2 pensemibold;

dOt z.x,z.y,z.z,z.p,z.q,z.pq;

label.bot(btex $p$ etex, z.p);
label.top(btex $q$ etex, z.q);
label.lft(btex $x$ etex, z.x);
label.lft(btex $y$ etex, z.y);
label.rt(btex $z$ etex, z.z);
label.rt(btex $\partial \bar S$ etex, z.z2);
label.lft(btex $\partial \bar S$ etex, z.x2);
endfig;

beginfig(23) 
save u;
u:=.6cm;
path p[];

p0=circle(origin,.7*u);
p1=circle(origin,2*u);
p2=point .4 of p0{(point 0 of p0) rotated 30}..{(point 0 of p1) rotated 30}point 0 of p1;
z3= point .3 of p2;
z4= point .7 of p2;
p3=z3..z4 rotated 60..z3 rotated 120..z4 rotated 180..z3 rotated -120..z4;

hatchfill p0--reverse(p1)--cycle withcolor (77, 2mm, -.5bp);
draw p0;
draw p1;
draw p2;
draw subpath (.3,.7) of p2 penbold;
draw p3 penbold;

%label.rt(btex $\gamma_1$ etex, point 2 of p0);
%label.lft(btex $\gamma_1$ etex, point 2 of p1);
%whitelabel.top(btex $N$ etex, (0,4)+point 3 of p1);
whitelabel.bot(btex $\alpha$ etex, point .2 of p2);
whitelabel.rt(btex $\beta$ etex, point 3 of p3);

endfig;

beginfig(25) 
save u;
u:=.7cm;
path p[];

p1=circle(origin,2*u);
p2=point .3 of p1{-(point .3 of p1)}..(0,1.3)*u..{point 1.7 of p1}point 1.7 of p1;

hatchfill p1 withcolor (77, 2mm, -.5bp);
draw p1;
draw subpath (1.7,2.3) of p1  penbold;
draw p2 penbold;

Dot point .5 of p1, point 1.5 of p1, point 2.5 of p1, point 3.5 of p1;

dOt point .3 of p1, -(point .3 of p1),point 1.7 of p1;

label.rt(btex $\alpha$ etex, point 0 of p1);
label.lft(btex $\alpha$ etex, point 2 of p1);
label.top(btex $\beta$ etex, point 1 of p1);
label.bot(btex $\beta$ etex, point 3 of p1);
whitelabel.bot(btex $\gamma_1$ etex, point 1 of p2);
whitelabel.bot(btex $\DD$ etex, origin);

label.urt(btex $\gamma_1(0)$ etex, point .3 of p1);
label.ulft(btex $\gamma_1(1)$ etex, point 1.7 of p1);
label.llft(btex $\gamma_1(0)$ etex, -(point .3 of p1));
endfig;

beginfig(27) 
save u;
u:=4/3cm;
path p[];

z.a0=(0,1)*u rotated 5;
z.b0=(0,1)*u rotated -5;
z.c0=(0,.2)*u rotated 60;
z.a1=z.a0 rotated 120;
z.a2=z.a0 rotated -120;
z.b1=z.b0 rotated 120;
z.b2=z.b0 rotated -120;
z.c1=z.c0 rotated 120;
z.c2=z.c0 rotated -120;

p0=z.a0..tension 2..z.c0..tension 2..z.b1--z.a1..tension 2..z.c1..tension 2..z.b2--z.a2..tension 2..z.c2..tension 2..z.b0--cycle;

hatchfill p0 withcolor (77, 2mm, -.5bp);
draw p0 pensemibold;
endfig;

beginfig(29)
save u,p;
path p[];
u:=.7cm;

z.a=origin;
z.b=(1,0)*u;
z.c=z.b rotated 60;
z.aa=z.b+z.c;
z.bb=z.c-z.b;
z.cc=-z.bb;

p1=z.cc..z.a..z.c..z.aa..cycle;
p2=z.aa..z.b..z.a..z.bb..cycle;
p3=z.bb..z.c..z.b..z.cc..cycle;

p4=
subpath (3,4) of p1
--
reverse(subpath (1,3) of p3)
--
reverse(subpath (1,2) of p1)
--
(subpath (2,4) of p2)
--
cycle;

p5=subpath(3,4) of p2--subpath(0,1) of p2
--
reverse(subpath (0,2) of p3)
--
cycle;

hatchfill p4  withcolor (20, 1mm, -.5bp);
hatchfill p5  withcolor (120, 1mm, -.5bp);
draw p1;
draw p2;
draw p3;

endfig;

beginfig(100) 
save u;
u:=.3cm;

draw (0,0)*u--(6,0)*u--(6,6)*u--(0,6)*u--cycle penhair;
draw (0,0)*u--(6,6)*u penbold;
draw (0,0)*u--(1,0)*u--(1,1)*u--(2,1)*u--(2,2)*u--(3,2)*u--(3,3)*u--(4,3)*u--(4,4)*u--(5,4)*u--(5,5)*u--(6,5)*u--(6,6)*u penbold;


endfig;

beginfig(105) 
save u;
u:=1cm;

z.p=origin;
z.x=(1,.4)*u;
z.y=(-.1,-.7)*u;
z.z=(-.8,.7)*u;

draw z.p--z.x;
draw z.p--z.y;
draw z.p--z.z;

dOt z.p,z.x,z.y,z.z;

label.lrt(btex $p$ etex, z.p);
label.rt(btex $x$ etex, z.x);
label.bot(btex $y$ etex, z.y);
label.lft(btex $z$ etex, z.z);

endfig;

beginfig(200) 
save u,n;
u:=.4cm;
n:=4;

draw (0,0)*u--(n+.5,0)*u pensemibold;


for i=0 step 1 until n:
draw (i,0)*u--(i,i+1)*u pensemibold;
Dot (i,i+1)*u;
endfor

Dot (0,0)*u;

label.bot(btex $o$ etex, (0,0)*u);
label.top(btex $x_0$ etex, (0,0+1)*u);
label.top(btex $x_1$ etex, (1,1+1)*u);
label.top(btex $x_2$ etex, (2,2+1)*u);
label.top(btex $x_3$ etex, (3,3+1)*u);
label.top(btex $x_4$ etex, (4,4+1)*u);
endfig;

beginfig(205) 
save u;
u:=.5cm;

draw (-4.3,2)*u--(4.3,2)*u pensemibold;
draw (0,1)*u--(0,3)*u pensemibold;
draw (1,1)*u--(1,3)*u pensemibold;
draw (2,1)*u--(2,3)*u pensemibold;
draw (3,1)*u--(3,3)*u pensemibold;
draw (4,1)*u--(4,3)*u pensemibold;

draw (-4.3,-2)*u--(4.3,-2)*u pensemibold;
draw (0,-2)*u--(0,-1)*u pensemibold;
draw (1,-3)*u--(1,-1)*u pensemibold;
draw (2,-3)*u--(2,-1)*u pensemibold;
draw (3,-3)*u--(3,-1)*u pensemibold;
draw (4,-3)*u--(4,-1)*u pensemibold;

Dot
(-4,2)*u,(-3,2)*u,(-2,2)*u,(-1,2)*u,(-0,2)*u,(1,2)*u,(2,2)*u,(3,2)*u,(4,2)*u,
(-0,3)*u,(1,3)*u,(2,3)*u,(3,3)*u,(4,3)*u,
(1,1)*u,(2,1)*u,(3,1)*u,(4,1)*u,
(-4,-2)*u,(-3,-2)*u,(-2,-2)*u,(-1,-2)*u,(-0,-2)*u,(1,-2)*u,(2,-2)*u,(3,-2)*u,(4,-2)*u,
(1,-1)*u,(2,-1)*u,(3,-1)*u,(4,-1)*u,
(1,-3)*u,(2,-3)*u,(3,-3)*u,(4,-3)*u,
(-0,1)*u,(-0,-1)*u,(-0,1)*u,(-0,-1)*u
;

label.lft(btex $\dots$ etex, (-4.3,2)*u);
label.lft(btex $\dots$ etex, (-4.3,-2)*u);
label.rt(btex $\dots$ etex, (4.3,2)*u);
label.rt(btex $\dots$ etex, (4.3,-2)*u);

label.top(btex $\spc{X}$ etex, (-1.5,2)*u);
label.top(btex $\spc{Y}$ etex, (-1.5,-2)*u);
endfig;

beginfig(210) 
save u;
u:=.5cm;

draw (-1,0)*u--(0,1)*u--(1,0)*u--(0,-1)*u--cycle pensemibold;
draw (0,1)*u--(0,-1)*u pensemibold;

dOt (-1,0)*u,(0,1)*u,(1,0)*u,(0,-1)*u,(0,0)*u;
endfig;

beginfig(405)
save u,p,a;
path p[];
u:=1cm;
a:=60;

z.a=(1,0)*u;
z.b=-z.a;
z.shift=(3,0)*u;

p0=z.a{.7,1}..z.b{-.4,-1}..cycle;

draw p0;
draw z.a--z.b;
hatchfill  p0 withcolor (a, 1mm, -.5bp);

draw (subpath (0,1) of p0) xscaled -1 shifted z.shift;
draw (subpath (1,2) of p0) shifted z.shift;
draw (z.a--z.b) shifted z.shift;
hatchfill  ((subpath (0,1) of p0) xscaled -1 shifted z.shift)--cycle withcolor (180-a, 1mm, -.5bp);
hatchfill  ((subpath (1,2) of p0) shifted z.shift)--cycle withcolor (a, 1mm, -.5bp);

dOt z.a,z.b,z.a shifted z.shift,z.b shifted z.shift;

whitelabel.top(btex $L_1$ etex, origin);
whitelabel.bot(btex $L_2$ etex, origin);
whitelabel.top(btex $L_1'$ etex, z.shift);
whitelabel.bot(btex $L_2$ etex, z.shift);

label.bot(btex $D$ etex, point 1.6 of p0);
label.bot(btex $D'$ etex, z.shift+ point 1.6 of p0);
label.rt(btex $a$ etex, z.a);
label.lft(btex $b$ etex, z.b);
label.rt(btex $a$ etex, z.a shifted z.shift);
label.lft(btex $b$ etex, z.b shifted z.shift);
endfig;

beginfig(410)
save u,p,a,r;
path p[];
u:=1cm;
a:=60;
r:=10;

z.a=(1,0)*u;
z.b=-z.a;
z.shift=(3,0)*u;

p0=z.a{.7,1}..z.b{-.4,-1}..cycle;

p1=circle(z.a,r);
p2=circle(z.b,r);


draw p0;
draw z.a--z.b;

draw p1 cutbefore (z.a--z.b) cutafter p0;
draw p2 cutafter (z.a--z.b) cutbefore subpath (1,2) of p0;



dOt z.a,z.b;

label.top(btex $D$ etex, .5[z.a,z.b]);
label.rt(btex $a$ etex, z.a);
label.lft(btex $b$ etex, z.b);
label.llft(btex $\alpha$ etex, z.a+10*dir(195));
label.lrt(btex $\beta$ etex, z.b+8*dir(-35));
endfig;

beginfig(415)
save u,p;
path p[];
u:=1cm;

p1=circle((0,1)*u,1*u);
p2=circle((0,2)*u,2*u) cutafter ((4,2)*u--(-4,2)*u);
p3=circle((0,3)*u,3*u) cutafter ((4,2)*u--(-4,2)*u);
p4=circle((0,4)*u,4*u) cutafter ((4,2)*u--(-4,2)*u);
p5=circle((0,5)*u,5*u) cutafter ((5,2)*u--(-5,2)*u);

draw p1;
draw p2;
draw p3;
draw p4;
draw p5;

draw (-10,0)*u--(10,0)*u;

clip currentpicture to (-4,-.5)*u--(4,-.5)*u--(4,2)*u--(-4,2)*u--cycle;

whitelabel(btex $A_1$ etex, point 1 of p1);
whitelabel(btex $A_2$ etex, point 4 of p2);
whitelabel(btex $A_3$ etex, point 4 of p3);
whitelabel(btex $A_4$ etex, point 4 of p4);
whitelabel(btex $A_5$ etex, point 4 of p5);
label.rt(btex $A_\infty$ etex, (4,0)*u);
endfig;

beginfig(500) 

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
label.top(btex $\dots$ etex, (0,0)*u);
label.bot(btex $\spc{X}_\infty$ etex, (0,0)*u);

endfig;


beginfig(505)
save u,p,n;
path p[];
u:=.25cm;
n:=10;

z.r=(n,0)*u;
z.l=-z.r;
z.ur=(1,0)*u rotated 60 shifted z.r;
z.lr=z.ur yscaled -1;
z.ul=z.ur xscaled -1;
z.ll=-z.ur;

z.shift=(0,-3)*u;
z4=(0,4)*u;

draw z.ur--z.r--z.l--z.ul;
draw z.lr--z.r;
draw z.ll--z.l;

dOt z.ur,z.ul,z.lr,z.ll;

p0=(z.r--z.l--z.l-z4--z.r-z4--cycle) shifted z.shift;
hatchfill p0 withcolor (45, 4mm, -.5bp);
hatchfill p0 withcolor (-45, 4mm, -.5bp);
draw p0;
dOt z.r shifted z.shift,z.l shifted z.shift,(z.l-z4) shifted z.shift,(z.r-z4) shifted z.shift;

whitelabel(btex $\ell^1$ etex, z.shift-z4/2);
label.ulft(btex {\scriptsize $1$} etex, .5[z.r,z.ur]);
label.llft(btex {\scriptsize $1$} etex, .5[z.r,z.lr]);
label.urt(btex {\scriptsize $1$} etex, .5[z.l,z.ul]);
label.lrt(btex {\scriptsize $1$} etex, .5[z.l,z.ll]);
label.top(btex $s$ etex, origin);
label.top(btex $s$ etex, z.shift);
label.lft(btex {\scriptsize $4$} etex, z.l+z.shift-z4/2);
endfig;

beginfig(605)
save u,p;
path p[];
u:=1cm;

z0=origin;
z1=(1,0)*u;
z2=2*z1;
z3=3*z1;
z4=4*z1;
z.e=4.5*z1;

z11=z1 + z1 rotated 90;
z21=z2 + z1 rotated 80;
z22=z2 + z1 rotated 100;
z31=z3 + z1 rotated 75;
z32=z3 + z1 rotated 90;
z33=z3 + z1 rotated 105;
z41=z4 + z1 rotated 69;
z42=z4 + z1 rotated 83;
z43=z4 + z1 rotated 97;
z44=z4 + z1 rotated 114;

draw z0--z.e pensemibold;
draw z1--z11 pensemibold;
draw z2--z21 pensemibold;
draw z2--z22 pensemibold;
draw z3--z31 pensemibold;
draw z3--z32 pensemibold;
draw z3--z33 pensemibold;
draw z4--z41 pensemibold;
draw z4--z42 pensemibold;
draw z4--z43 pensemibold;
draw z4--z44 pensemibold;

Dot z0,z1,z11,z2,z21,z22,z3,z31,z32,z33,z4,z41,z42,z43,z44;

label.rt(btex $\dots$ etex, z.e);

label.bot(btex $v_0$ etex, z0);
label.bot(btex $v_1$ etex, z1);
label.bot(btex $v_2$ etex, z2);
label.bot(btex $v_3$ etex, z3);
label.bot(btex $v_4$ etex, z4);
endfig;

beginfig(700) 
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

beginfig(710) 
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

beginfig(720) 
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

beginfig(730) 
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

beginfig(740) 
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

beginfig(750) 
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

beginfig(800) 
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

beginfig(810) 
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

beginfig(820) 
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

beginfig(830) 
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

fill p0 withcolor 0;

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

beginfig(831) 
save u,p;
u:=2cm;
path p[];

z.x=(0,0)*u;
z.y=(2,0)*u;
z.z=.52[z.x,z.y];
z.zx=z.z rotatedabout(z.x,-25);
z.zxx=z.z rotatedabout(z.x,-20);
z.zy=z.z rotatedabout(z.y,30);
z.zyy=z.z rotatedabout(z.y,20);
z.p=z.zy+((z.zx-z.zy) zscaled (.5,4));
z.zxy=z.zx rotatedabout(z.p,-2);

p0=arc(z.z,z.zxx,z.zx)--arc(z.zx,z.zxy,z.zy)--(arc(z.zy,z.zyy,z.z))--cycle;

fill p0 withcolor 0;

p1=arc(z.z,z.zxx,z.zx);

for i=0 step 6 until abs(z.x-z.z):
draw p1 shifted -z.x scaled ((abs(z.x-z.z)-i)/(abs(z.x-z.z))) shifted z.x;
endfor

p2=arc(z.zy,z.zyy,z.z);

for i=0 step 6 until abs(z.y-z.z):
draw p2 shifted -z.y scaled ((abs(z.y-z.z)-i)/(abs(z.y-z.z))) shifted z.y;
endfor

p3=arc(z.zx,z.zxy,z.zy);

for i=0 step 6 until abs(z.p-z.zx):
draw p3 shifted -z.p scaled ((abs(z.p-z.zx)-i)/(abs(z.p-z.zx))) shifted z.p;
endfor

draw z.x--z.y--z.p--cycle penbold;
draw z.x--z.zx--z.p--z.zy--z.y penbold;


%dOt z.p,z.x,z.y,z.z,z.zx,z.zy;
endfig;

beginfig(840) 
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

beginfig(850) 
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

beginfig(860) 
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

beginfig(870) 
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
p3=z.y3..z.x3..z.y;
draw p3 pensemibold;

dOt z.x,z.x0,z.x1,z.x2,z.x3,z.y,z.y0,z.y1,z.y2,z.y3;

label.top(btex $\alpha$ etex, point .5 of p3);
label.top(btex $\alpha$ etex, z.r);
label.bot(btex $\alpha$ etex, -z.r);
label.lft(btex {\small $\pi-\alpha$} etex rotated 90, z.r rotated 90);
label.rt(btex {\small $\pi-\alpha$} etex rotated -90, z.r rotated -90);
endfig;

beginfig(880) 
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

beginfig(910) 
save u,p,n;
path p[];
u:=1cm;
n=10;

p0=(0,0)*u--(5,0)*u;

draw p0;

for i=0 step 1/n until 1.1:
draw circle(point i of p0, .7*u);
dOt point i of p0;
endfor

whitelabel.lft(btex $\spc{B}^0$ etex,(-4,0) +point 0 of p0);
whitelabel.bot(btex $\spc{B}^1$ etex, (0,-4) +point 1/n of p0);
whitelabel.bot(btex $\dots$ etex rotated angle(direction (n+1)/(2*n) of p0), (2,-1)+point (n+1)/(2*n) of p0);
whitelabel.rt(btex $\spc{B}^n$ etex, (4,0) +point 1 of p0);
endfig;

beginfig(930) 
save u,p;
path p[];
u:=1cm;

z.a0=(0,.3)*u;
z.l=(-2.5,0)*u;
z.a1=z.l+(0,1)*u;
z.a2=z.l+(-1,0)*u;
z.a3=z.l+(0,-1)*u;

p0=z.a0..z.a1..z.a2..z.a3..-z.a0..-z.a1..-z.a2..-z.a3..cycle;
p1=z.a0{left}..tension 5..-z.a0{right}..tension 5..cycle;

draw p0;
draw subpath (0,1) of p1;
draw subpath (1,2) of p1 dashed evenly;
endfig;

beginfig(950) 
save u,p,n;
path p[];
u:=1cm;
n=5;

z.p=origin;
z.x=(-3,-4)*u;
z.y=(3.5,-4)*u;

draw z.x--z.y;
draw z.p--z.x;
draw z.p--z.y;

z.x[0][n]=z.x;
z.x[n][n]=z.y;
for i=1 step 1 until n-1:
z.x[i][n]=(i/n+normaldeviate/(20*n))[z.x,z.y];
draw z.p--z.x[i][n];
endfor

for i=0 step 1 until n:
for j=1 step 1 until n-1:
z.x[i][j]=(j/n+normaldeviate/(20*n))[z.p,z.x[i][n]];
endfor
endfor

for i=1 step 1 until n:
for j=1 step 1 until n-1:
draw z.x[i-1][j+1]--z.x[i][j]--z.x[i-1][j];
endfor
endfor

for i=0 step 1 until n:
for j=1 step 1 until n:
dOt z.x[i][j];
endfor
endfor

dOt z.p;


label.urt(btex $p=x^{0,0}=\dots=x^{N,0}$ etex, z.p);
label.lrt(btex $y=x^{N,N}$ etex, z.y);
label.llft(btex $x^{0,N}=x$ etex, z.x);
label.ulft(btex $x^{0,1}$ etex, z.x[0][1]);
label.urt(btex $x^{N,1}$ etex, z.x[n][1]);
label.bot(btex $x^{1,N}$ etex, z.x[1][n]);
label.bot(btex $\dots$ etex, z.x[3][n]+(0,-2));
label(btex $\dots$ etex rotated angle(z.p-z.x), z.x[0][3]+(-3,3));
label(btex $\dots$ etex rotated angle(z.y-z.p), z.x[n][3]+(3,3));
endfig;

beginfig(970) 
save u,p;
path p[];
u:=1cm;

p0=(0,0)*u--(1,0)*u--(1,1)*u--(0,1)*u--cycle;

hatchfill p0 withcolor (40, 1mm, -.5bp);
draw subpath(0,1) of p0 dashed evenly pensemibold;
draw subpath(1,4) of p0 pensemibold;

draw (0,0)*u{1,-.6}..{1,.6}(1,0)*u pensemibold;

Dot (0,0)*u,(1,0)*u;

endfig;

beginfig(1000) 
save u,p;
path p[];
u:=1cm;

z.v=(-1,0)*u;
z.vv=z.v xscaled -1;
z.r=(0,.5)*u;
z.rr=z.v+ (z.r-z.v) rotated 10;

z1=.6[z.r,-z.r];
z0=z.v-abs(z.r-z.v)*unitvector(z1-z.v);
z2=z.vv-abs(z.r-z.v)*unitvector(z1-z.vv);

p0=z0..z1{(z2-z1) rotated -50}..z2;
p1=arc(z.r,z.rr,-z.r);

hatchfill p1--cycle withcolor (77, 1.5mm, -.5bp);

draw subpath (0,1) of p0 pensemibold;
draw subpath (1,2) of p0 pensemibold dashed evenly;
draw p1;
draw p1 xscaled -1;
draw z.r-- -z.r;
draw z.v..z.r..z.vv;
draw z.v..-z.r..z.vv;

dOt z.v,z.vv;

whitelabel.lft(btex $v$ etex, z.v);
label.rt(btex $v'$ etex, z.vv);
whitelabel.urt(btex $\gamma_v$ etex, point .5 of p0);
whitelabel.urt(btex $\Star_v$ etex, z.r rotatedabout(z.v,-160));
label.llft(btex $\Star_{v'}$ etex, -z.r rotatedabout(z.vv,-160));
endfig;

beginfig(1100) 
save u,p;
path p[];
u:=.7cm;

z.x=origin;
z.z=(0,1)*u;
z.r2=z.z+(z.z rotated -72);
z.r3=z.r2+(z.z rotated -144);
z.r4=(-z.z rotated 72);

z.l2=z.z+(z.z rotated 60);
z.l3=z.l2+(z.z rotated 120);
z.l4=z.l3+(z.z rotated 180);
z.l5=z.l4+(z.z rotated -120);

draw z.x--z.z--z.r2--z.r3--z.r4--cycle;
draw z.z--z.l2--z.l3--z.l4--z.l5--z.x--cycle;

dOt z.x,z.z,z.r2,z.r3,z.r4,z.l2,z.l3,z.l4,z.l5;

label.bot(btex $\xi$ etex, z.x);
label.top(btex $\zeta$ etex, z.z);
label.lft(btex $e$ etex, .5[z.x,z.z]);
endfig;

beginfig(1201) 
save u,p;
path p[];
u:=1cm;

p0=
(-3,-3)*u..
for j=-3 step 1/16 until 3:
(j,.5*j*j)*u..
endfor
(3,-3)*u..cycle;

x1=-.8;

p1=
for j=-3 step 1/16 until 3:
(j*u,.5*j*j*u-2*(j-x1)**2*u)..
endfor
cycle;

x2=-.3;

p2=
for j=-3 step 1/16 until 3:
(j*u,.5*j*j*u-2*(j-x2)**2*u)..
endfor
cycle;

x3=.2;

p3=
for j=-3 step 1/16 until 3:
(j*u,.5*j*j*u-2*(j-x3)**2*u)..
endfor
cycle;

x4=.7;

p4=
for j=-3 step 1/16 until 3:
(j*u,.5*j*j*u-2*(j-x4)**2*u)..
endfor
cycle;


hatchfill p1 withcolor (77, 1mm, -.5bp);
hatchfill p2 withcolor (37, 1mm, -.5bp);
hatchfill p3 withcolor (-3, 1mm, -.5bp);
hatchfill p4 withcolor (-43, 1mm, -.5bp);
draw p0;
draw p1;
draw p2;
draw p3;
draw p4;

clip currentpicture to (-1.2,-1.2)*u--(1.2,-1.2)*u--(1.2,1.2**2/2)*u--(-1.2,1.2**2/2)*u--cycle;

endfig;

beginfig(1203) 
save u,p;
path p[];
u:=.7cm;

z.x=(0,0)*u;
z.x1=(-1,0)*u;
z.x2=(-1.5,0)*u;
z.y=(2,0)*u;
z.y1=(3,0)*u;
z.y2=(2.5,0)*u;
z.z=(1,2)*u;
z.z1=(2,2)*u;
z.z2=(2,2.5)*u;

p0=
z.x{-2*z.x+z.y+z.z}..{-z.x+2*z.y-z.z}z.y
--
z.y{z.x-2*z.y+z.z}..{-z.x-z.y+2*z.z}z.z
--
z.z{z.x+z.y-2*z.z}..{2*z.x-z.y-z.z}z.x
--cycle;

p1=z.x{2*z.x-z.y-z.z}..z.x1..z.x2;
p2=z.y{-z.x+2*z.y-z.z}..z.y1..z.y2;
p3=z.z{-z.x-z.y+2*z.z}..z.z1..{right}z.z2;

hatchfill p0 withcolor (77, 1mm, -.5bp);
draw p0;
draw p1;
draw p2;
draw p3;

dOt z.x2,z.y2,z.z2;
label.lft(btex $x$ etex, z.x2);
label.ulft(btex $y$ etex, z.y2);
label.rt(btex $z$ etex, z.z2);
endfig;

beginfig(1205) 
save u,p;
path p[];
u:=1cm;

z0=(-1,0)*u;
z.slope0=(1,2);
z1=(1,0)*u;
z.slope1=(1,1.8);
z.shift=(0,.4)*u;

p0=z0{z.slope0}..{z.slope1}z1;
p1=p0 shifted z.shift;
p2=p0 shifted -z.shift;

hatchfill p1--reverse(p2)--cycle withcolor (77, 1mm, -.5bp);
draw p0 pensemibold;
draw p1--reverse(p2)--cycle;

whitelabel(btex $\Gamma$ etex, point .5 of p0);
label.top(btex $K_n$ etex, point .5 of p1);
endfig;

beginfig(1207) 
save u,p;
path p[];
u:=1cm;

z0=(0,0)*u;
z1=(0,1)*u;
z2=(2,1)*u;
z3=(2,-.5)*u;
z4=(1,-.4)*u;
z5=(1,.6)*u;
z6=(.4,.5)*u;
z7=.4[z4,z5];

p0=z0--z1--z2--z3--z4--z5--z6--z7--cycle;

fill p0 withcolor 0;
draw .4[z7,z0]--.4[z7,z0]+(0,-.4)*u pensemibold;
%draw p0;

endfig;

beginfig(1209) 
save u,p;
path p[];
u:=1cm;

z0=(0,0)*u;
z1=(-.3,1)*u;
z2=(.5,1.6)*u;
z3=(1.4,.8)*u;
z4=(1,0)*u;

p0=z0--z1--z2--z3--z4--cycle;

p1=point 4.2 of p0{-1,1} .. {0,1}point 1.7 of p0;

z.p= point .5 of p1;
z.d= unitvector(direction .5 of p1);

draw z.p+ z.d*u--z.p- z.d*u;



hatchfill (subpath (1.7,4.2) of p0)--p1--cycle withcolor (77, 1mm, -.5bp);
draw p0;
draw p1;

dOt z.p;

label.top(btex $\ell$ etex,z.p+z.d*u);
label.rt(btex $A$ etex,point .5 of p0);
whitelabel.llft(btex $F_i'$ etex,point 2.5 of p0);
endfig;


beginfig(1305)
save u,p,k;
path p[];
u:=1cm;
k=.2;

z.a0=(0,1)*u;
z.a1=k*z.a0 rotated 60;
z.a2=z.a0 rotated 120;
z.a3=k*z.a0 rotated 180;
z.a4=z.a0 rotated -120;
z.a5=k*z.a0 rotated -60;

p1=z.a0..z.a1..z.a2..z.a3..z.a4..z.a5..cycle;

hatchfill p1  withcolor (20, 1mm, -.5bp);
draw p1;

endfig;

beginfig(1310)
save u,p;
path p[];
u:=.5cm;

z.p=origin;
z.x=(5,0)*u;
z.m=.6[z.p,z.x];
z.y=z.x zscaled (0,1);
z.x1=z.x rotated 10;
z.x2=z.x rotated 25;
z.x3=z.x rotated 40;
z.x4=z.x rotated 50;
z.x5=z.x rotated 65;
z.x6=z.x rotated 80;

p1=z.p--z.x..z.x1{-z.x1}..z.x2{z.x2}..z.x3{-z.x3}..z.x4{z.x4}..z.x5{-z.x5}..z.x6{z.x6}..z.y--cycle;

draw p1;

dOt z.p,z.m,z.x,z.y;

label.llft (btex $\tau$ etex, point 4.5 of p1);
label.llft (btex $p$ etex, z.p);
label.bot (btex $x$ etex, z.x);
label.lft (btex $y$ etex, z.y);
label.bot (btex $m$ etex, z.m);

endfig;

beginfig(1315)
save u,p,a,b;
path p[];
u:=.7cm;
a:=3.5*u;
b:=.3*u;

p0=(a,b){right}..{left}(a,-b)--(-a,-b){left}..{right}(-a,b)--cycle;
p1=point 1.5 of p0..tension 2..point 3.5 of p0..tension 2..cycle; 

draw p0;
draw subpath (0,1) of p1;
draw subpath (1,2) of p1 dashed evenly;

endfig;

beginfig(1320)
save u,p;
path p[];
u:=1.4cm;

p0=(0,0)*u--(0,1)*u--(1,1)*u--(1,0)*u--cycle;
draw p0;

label.lft (btex $A$ etex, point .5 of p0);
label.top (btex $B$ etex, point 1.5 of p0);
label.rt (btex $A'$ etex, point 2.5 of p0);
label.bot (btex $B'$ etex, point 3.5 of p0);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(1402)
save u,p;
path p[];
u:=.7cm;

z0=(-1.5,.5)*u;
z1=(0,-.2)*u;
z2=(0,1.2)*u;
z3=(1.3,.5)*u;
z4=(2.3,-.7)*u;
z5=(2.3,1.7)*u;
z6=(3.6,.5)*u;

z.shift=(7.5,0)*u;


p0=circle(z0,1*u);
p1=circle(z1,1*u);
p2=circle(z2,1*u);
p3=circle(z3,1*u);
p4=circle(z4,1*u);
p5=circle(z5,1*u);
p6=circle(z6,1*u);

draw p0;
draw p1;
draw p2;
draw p3;
draw p4;
draw p5;
draw p6;

hatchfill p0 withcolor (30, 1mm, -.5bp);
hatchfill p1 withcolor (100, 1mm, -.5bp);
hatchfill p2 withcolor (-30, 1mm, -.5bp);
hatchfill p3 withcolor (30, 1mm, -.5bp);
hatchfill p4 withcolor (100, 1mm, -.5bp);
hatchfill p5 withcolor (-30, 1mm, -.5bp);
hatchfill p6 withcolor (30, 1mm, -.5bp);

hatchfill  (z1--z2--z0--cycle) shifted z.shift withcolor (30, 1mm, -.5bp);
hatchfill  (z1--z2--z3--cycle) shifted z.shift withcolor (-100, 1mm, -.5bp);

draw (z1--z2--z0--z1--z3--z4--z6--z5--z3--z2) shifted z.shift;

dOt z0+z.shift,z1+z.shift,z2+z.shift,z3+z.shift,z4+z.shift,z5+z.shift,z6+z.shift;

whitelabel (btex $V_1$ etex, z0);
whitelabel.bot (btex $V_2$ etex, z1);
whitelabel.top (btex $V_3$ etex, z2);
whitelabel (btex $V_4$ etex, z3);
whitelabel (btex $V_5$ etex, z4);
whitelabel (btex $V_6$ etex, z5);
whitelabel (btex $V_7$ etex, z6);

label.lft (btex $v_1$ etex, z0+z.shift);
label.bot (btex $v_2$ etex, z1+z.shift);
label.top (btex $v_3$ etex, z2+z.shift);
label.rt (btex $v_4$ etex, z3+z.shift+(1,0));
label.bot (btex $v_5$ etex, z4+z.shift);
label.top (btex $v_6$ etex, z5+z.shift);
label.rt (btex $v_7$ etex, z6+z.shift);

label.bot (btex covering etex, (1.6,-1.7)*u);
label.bot (btex nerve etex, (1.6,-1.7)*u+z.shift);
endfig;


beginfig(1405)
save u,p;
path p[];
u:=1.4cm;

z.x0=(0,0)*u;
z.x1=(1,0)*u;
z.x2=(1.8,0)*u;

z.y0=(-.1,.5)*u;
z.y1=(.7,.6)*u;
z.y2=(1.9,.6)*u;

p0=z.x0..z.x1{1,1}..z.x2;
p1=z.y0..z.y1{1,-1}..z.y2;

drawarrow subpath(0,1.05) of p0;
draw subpath(1.05,2) of p0;
drawarrow subpath(0,1.05) of p1;
draw subpath(1.05,2) of p1;

for i=0 step 2/7-.0001 until 2:
draw point i of p0--point i of p1;
dOt point i of p0,point i of p1;
endfor

label.lrt (btex $\gamma_0$ etex, point 1 of p0);
label.urt (btex $\gamma_1$ etex, point 1 of p1);
label.lft (btex $\alpha$ etex, .5[point 0 of p0,point 0 of p1]);
label.rt (btex $\beta$ etex, .5[point 2 of p0,point 2 of p1]);
endfig;


end
