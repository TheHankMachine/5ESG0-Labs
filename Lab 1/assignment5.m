f = 400;
A = 1;
phi = 0;
fs = 4000;
N = 100;

n = 0:N-1;
theta = 2*pi*(f/fs);
x = A*sin(theta.*n+phi);
stem(n,x);