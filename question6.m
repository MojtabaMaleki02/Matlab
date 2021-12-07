clear

px=[-2 6 10];
py=[-2 -2 2];
vx=6;
vy=-4;
t1=0;
t2=1;
t3=1.5;

plot (px, py, 'b*');
hold on
syms a0 a1 a2 a3 t
x(t)=a3*t^3 + a2*t^2 + a1*t + a0;
xd(t)=diff(x,t);
ex=[x(t1)==px(1),...
    x(t2)==px(2),...
    x(t3)==px(3),...
    xd(t1)==vx(1)];
rx = solve(ex,[a3 a2 a1 a0]);
cx(t)=subs(x,[a3 a2 a1 a0],[rx.a3 rx.a2 rx.a1 rx.a0]);

syms b0 b1 b2 b3 
y(t)=b3*t^3 + b2*t^2 + b1*t + b0;
yd(t)=diff(y,t);
ey=[y(t1)==py(1),...
    y(t2)==py(2),...
    y(t3)==py(3),...
    yd(t1)==vy(1)];
ry = solve(ey,[b3 b2 b1 b0]);
cy(t)=subs(y,[b3 b2 b1 b0],[ry.b3 ry.b2 ry.b1 ry.b0]);

fplot(cx,cy,[t1 t3]);

xd(t)=diff(x,t);
yd(t)=diff(y,t);

cxd(t) = subs(xd, [a3 a2 a1 a0], [rx.a3 rx.a2 rx.a1 rx.a0]);
cyd(t) = subs(yd, [b3 b2 b1 b0], [ry.b3 ry.b2 ry.b1 ry.b0]);
vx = cxd(t1);
vy = cyd(t1);
quiver(px(1), py(1), vx, vy);





