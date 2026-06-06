theta = 0:0.001:2*pi;

function value = FTD(theta) 
    value = abs(sin(7/2 * theta) / sin(theta / 2));
end

function value = x_func(n) 
    value = 0;
    if n >= -3 && n <= 3 
        value = 1;
    end
       
end

F = arrayfun(@FTD, theta);
N = 128

n = -3:N-3
x = arrayfun(@x_func, n);

y = abs(fft(x, N))
k = 0:N-1



hold on

xticks([-pi, 0, pi, 2 * pi])
xlabel("\theta") % I like how latex just works in matlab unlike in matplotlib
% xlim([-pi, pi]) % this does not work like i thought it would
ylabel("|X(e^{j\theta})|")

plot(theta, F);
plot(2 * pi * k / N, y);

legend(["FTD", "DFT"])

grid on 
hold off
