clear

px=[-2 6 10];
py=[-2 -2 2];

vx=6;
vy=-4;

t1=0;t2=1;t3=1.5;
plot (px, py, 'b*');
hold on

syms a3 a2 a1 a0 t;

x(t)=a3*t^3 + a2*t^2 + a1*t + a0;
xd(t)=diff(x,t);
ex=[x(t1)==px(1),...
    x(t2)==px(2),...
    x(t3)==px(3),...
    xd(t1)==vx(1)];
rx=solve(ex,[a3 a2 a1 a0]);
cx(t)=subs(x,[a3 a2 a1 a0],[rx.a3 rx.a2 rx.a1 rx.a0]);

syms b3 b2 b1 b0
y(t)=b3*t^3 + b2*t^2 + b1*t + b0;
yd(t)=diff(y,t);
ey=[y(t1)==py(1),...
    y(t2)==py(2),...
    y(t3)==py(3),...
    yd(t1)==vy(1)];
ry=solve(ey,[b3 b2 b1 b0]);
cy(t)=subs(y,[b3 b2 b1 b0],[ry.b3 ry.b2 ry.b1 ry.b0]);

fplot(cx,cy,[t1 t3]);


cxd(t)=subs(xd,[a3 a2 a1 a0],[rx.a3 rx.a2 rx.a1 rx.a0]);
cyd(t)=subs(yd,[b3 b2 b1 b0],[ry.b3 ry.b2 ry.b1 ry.b0]);
vx = cxd(t1);
vy = cyd(t1);
quiver(px(1), py(1), vx, vy);


% part 2
%px=[-2 6 10];
%py=[-2 -2 2];


px2=[10 13];
py2=[2 5];
dxd(t)=diff(cx,t);
dyd(t)=diff(cy,t);
vx2=[dxd(t3),2];
vy2=[dyd(t3),2];

quiver(px2(1),py2(1),vx2(1),vy2(1));


xs(t)=a3*t^3 + a2*t^2 + a1*t + a0;
xdd=diff(xs,t);
ex2=[xs(t1)==px2(1),...
     xs(t2)==px2(2),...
     xdd(t1)==vx2(1),...
     xdd(t2)==vx2(2)];
rx2=solve(ex2,[a3 a2 a1 a0]);
cxd(t)=subs(xs,[a3 a2 a1 a0],[rx2.a3 rx2.a2 rx2.a1 rx2.a0]);

ys(t)=b3*t^3 + b2*t^2 + b1*t + b0;
ydd=diff(ys,t);
ey2=[ys(t1)==py2(1),...
     ys(t2)==py2(2),...
     ydd(t1)==vy2(1),...
     ydd(t2)==vy2(2)];
ry2=solve(ey2,[b3 b2 b1 b0]);
cyd(t)=subs(ys,[b3 b2 b1 b0],[ry2.b3 ry2.b2 ry2.b1 ry2.b0]);

fplot(cxd,cyd,[t1 t2]);


