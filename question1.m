clear

syms u v
x(u, v)= u - u^3 /3 + u*v^2;
y(u, v)= v - v^3 /3 + v*u^2;
z(u,v)= u^2 - v^2;
fsurf(x, y, z, [ -25 25 -25 25]);
u0=10;
v0=15;
p=[ x(u0, v0), y(u0, v0), z(u0, v0)];
hold on;
plot3 (p(1), p(2), p(3), 'r*', 'MarkerSize', 10);
