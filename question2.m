clear 
syms x y z


F(x, y, z) = sqrt(1 - x^2 - 0.5 * y^2)-z;

fimplicit3(F);



p = [0.5, 0.2, 0.1321001];

hold on
plot3 (p(1), p(2), p(3), 'r*', 'MarkerSize', 10);



% 
% 
% hold on
% 
% plot3 (p(1), p(2), p(3), 'b*', 'MarkerSize', 15)


