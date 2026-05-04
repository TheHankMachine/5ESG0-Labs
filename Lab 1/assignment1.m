
function value = x_func(n) 
    if abs(n) == 1 || abs(n) == 3
        value = 1;
    else
        value = 0; 
    end
end

function value = h_func(n) 
    if n == -1
        value = 0.5;
    elseif n == 0
        value = 1; 
    elseif n == 1
        value = 1.5;
    else 
        value = 0;
    end
end

n = -6:6;
x = arrayfun(@x_func, n);
h = arrayfun(@h_func, n);

y = conv(x, h, "same");

figure;
stem(n, y);
ylabel("y[n]");
xlabel("n");
ylim([0,2.2]);
