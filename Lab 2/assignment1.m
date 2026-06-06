
% theta = -pi:0.001:pi;
% in the assignment it says to use -pi:0.001:pi however this is nicer to work with for the DFT
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

n = -3:3
x = arrayfun(@x_func, n);

y = abs(fft(x, 7))
k = 0:6

hold on

xticks([-pi, 0, pi, 2 * pi])
xlabel("\theta") % I like how latex just works in matlab unlike in matplotlib
% xlim([-pi, pi]) % this does not work like i thought it would
ylabel("|X(e^{j\theta})|")

plot(theta, F);
stem(2 * pi * k / 7, y);

legend(["FTD", "DFT"])

grid on 
hold off
