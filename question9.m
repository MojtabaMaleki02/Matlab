clear

px=[-2 4 6 10];
py=[-2 0 -2 2];

plot (px, py, 'b*');

t1=-1;
t2=0;
t3=2;
t4=3;
hold on

syms a3 a2 a1 a0 t
x(t)=a3*t^3 + a2*t^2 + a1*t + a0;
ex=[x(t1) == px(1),...
    x(t2) == px(2),...
    x(t3) == px(3),...
    x(t4) == px(4)];
rx=solve(ex,[a3 a2 a1 a0]);
cx(t)=subs(x,[a3 a2 a1 a0],[rx.a3 rx.a2 rx.a1 rx.a0]);


syms b3 b2 b1 b0
y(t)=b3*t^3 + b2*t^2 + b1*t + b0;
ey=[y(t1) == py(1),...
    y(t2) == py(2),...
    y(t3) == py(3),...
    y(t4) == py(4)];
ry=solve(ey,[b3 b2 b1 b0]);
cy(t)=subs(y,[b3 b2 b1 b0],[ry.b3 ry.b2 ry.b1 ry.b0]);
fplot (cx, cy, [t1 t4]);


xd(t)=diff(x,t);
yd(t)=diff(y,t);

cxd(t) = subs(xd, [a3 a2 a1 a0], [rx.a3 rx.a2 rx.a1 rx.a0]);
cyd(t) = subs(yd, [b3 b2 b1 b0], [ry.b3 ry.b2 ry.b1 ry.b0]);
vx = cxd(2);
vy = cyd(2);
quiver(px(3), py(3), vx, vy);

%part 2

px2=[10,14];
py2=[2,-4];
vx2=[px2(2),3];
vy2=[py2(2),0];
t5=-1;
t6=1;

x(t)=a3*t^3 + a2*t^2 + a1*t + a0;
xd2=diff(x,t);
ex=[x(t1) == px2(1),...
    x(t2) == px2(2),...
    xd2(t5) == vx2(1),...
    xd2(t6) == vx2(2)];
rx=solve(ex,[a3 a2 a1 a0]);
cx(t)=subs(x,[a3 a2 a1 a0],[rx.a3 rx.a2 rx.a1 rx.a0]);


y(t)=b3*t^3 + b2*t^2 + b1*t + b0;
yd2=diff(y,t);
ey=[y(t1) == py2(1),...
    y(t2) == py2(2),...
    yd2(t5) == vy2(1),...
    yd2(t6) == vy2(2)];
ry=solve(ey,[b3 b2 b1 b0]);
cy(t)=subs(y,[b3 b2 b1 b0],[ry.b3 ry.b2 ry.b1 ry.b0]);

fplot (cx, cy, [t5 t6]);













