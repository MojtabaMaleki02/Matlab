clear

px = [-2 6];
py = [-2 -2];
vx = [6 4];
vy = [-4 4];

quiver(px(1),py(1),vx(1),vy(1));
hold on
quiver(px(2),py(2),vx(2),vy(2));

t1=0;
t2=1;

syms a3 a2 a1 a0 t

x(t)=a3*t^3 + a2*t^2 + a1*t + a0;
xd(t)=diff(x,t);
ex=[x(t1)==px(1),...
    x(t2)==px(2),...
    xd(t1)==vx(1),...
    xd(t2)==vx(2)];
rx=solve(ex,[a3 a2 a1 a0]);
cx(t)=subs(x,[a3 a2 a1 a0],[rx.a3 rx.a2 rx.a1 rx.a0]);



syms b3 b2 b1 b0 

y(t)=b3*t^3 + b2*t^2 + b1*t + b0;
yd(t)=diff(y,t);
ey=[y(t1)==py(1),...
    y(t2)==py(2),...
    yd(t1)==vy(1),...
    yd(t2)==vy(2)];
ry=solve(ey,[b3 b2 b1 b0]);
cy(t)=subs(y,[b3 b2 b1 b0],[ry.b3 ry.b2 ry.b1 ry.b0]);

fplot(cx,cy,[t1 t2]);













