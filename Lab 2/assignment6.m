lengths = [7 15 111];

for k = 1:3
    N = lengths(k);
    n = -((N-1)/2):((N-1)/2);
    
    h = 0.5*sinc(n/2);
    wr = rectwin(N);
    h1 = h.*wr;

    figure;
    freqz(h1);
end