function [x,y,z] = rand_pick_sphere(n,a,b,X,Y,Z)
% Uniform points in a shell of inner radius a, outer radius b and center at
% (X,Y,Z)
% [x,y,z] = rand_pick_sphere(300,.5,.6);  % 300 points in shell between 
% r = .5 and r = .6, with center at origin.
if nargin==3
   X = 0;
   Y = 0;
   Z = 0;
end
r1 = (rand(n,1)*(b^3-a^3)+a^3).^(1/3);
phi1 = acos(-1 + 2*rand(n,1));
th1 = 2*pi*rand(n,1);
% Convert to cart.
x = r1.*sin(phi1).*sin(th1) + X;
y = r1.*sin(phi1).*cos(th1) + Y;
z = r1.*cos(phi1) + Z;