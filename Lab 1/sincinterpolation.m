function [xa, t, n] = sincinterpolation(x, start_ind, Ts)
    n = start_ind:start_ind+length(x)-1;
    t = Ts*(start_ind-1:0.001:start_ind+length(x));
    
    xa = zeros(size(t));
    
    for k = 1:length(n)
        aux = (t-n(k)*Ts)/Ts;
        xa = xa+x(k)*sinc(aux);
    end
end