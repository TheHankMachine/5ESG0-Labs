
function value = hnc_func(n) 
    if n >= -2 && n <= 0
        value = 1;
    else
        value = 0; 
    end
end

function value = hc_func(n) 
if n >= 0 && n <= 2
    value = 1;
else
    value = 0; 
end
end

function value = x_func(n) 
    if abs(n) == 2 || n == 0
        value = 1;
    elseif abs(n) == 1
        value = -0.5;
    else
        value = 0;
    end
end

n = -6:6;
x = arrayfun(@x_func, n);
hnc = arrayfun(@hnc_func, n);
hc = arrayfun(@hc_func, n);

ync = conv(x, hnc, "same");
yc = conv(x, hc, "same");

figure;
subplot(211), stem(n, ync);
ylabel("y_{non-causal}[n]");
ylim([0,1.8]);
subplot(212), stem(n, yc);
ylabel("y_{causal}[n]");
xlabel("n");
ylim([0,1.7]);