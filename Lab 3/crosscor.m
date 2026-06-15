function r = crosscor(x, y, l)
    sum_val = 0;
    for n = (l+1):length(x)
        sum_val = sum_val+x(n)*y(n-l);
    end
    r = sum_val/(length(x)-l);
end