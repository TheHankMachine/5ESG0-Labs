% a.
f = 400;
A = 1;
phi = 0;
fs = 4000;
N = 21;

n = 0:N-1;
ts = n/fs;
theta = 2*pi*(f/fs);
x = A*sin(theta.*n+phi);

T = 1/f;
t = 0:1/(10*fs):2*T;
xc = A*sin(2*pi*f*t+phi);

t = t*1000;
ts = ts*1000;

figure;
plot(t, xc);
hold on;
stem(ts, x);

xlabel('Time (msec)');
ylabel('Amplitude');

title('x_c(t) and x[n]');
grid on;

% c.
id = [[1 9 4 3 1 0 3]; [2 0 8 3 5 1 5]; [2 3 7 6 3 1 8]];
Ts = 0.1;
start_ind = -2;

figure;
for k = 1:size(id, 1)
    x = id(k, :);
    [xa, t, n] = sincinterpolation(x, start_ind, Ts);

    subplot(3,1,k);

    plot(t, xa);
    hold on;
    stem(n*Ts, x);

    grid on;
    xlabel('Time');
    ylabel('Amplitude');
    title(['', sprintf('%d', x)]);
end