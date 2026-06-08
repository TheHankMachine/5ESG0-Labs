% Assignment 5: circular & linear convolution via DFT (assignment indexing)

clear; close all; clc;

% Given signals (n = 1..5 in the assignment)
x = [1 1 1 0.5 0.5];          % x[1..5]
h = [1 1 0.75 0.75 0.25];     % h[1..5]

% ---------- (b) Circular convolution via 5-point DFT ----------
Ncirc = 5;                    % length of circular conv and DFT

% 5-point DFTs
X = fft(x, Ncirc);
H = fft(h, Ncirc);

% Multiply in frequency domain
Ycirc = X .* H;

% Inverse DFT => length-5 circular convolution
y_circ = ifft(Ycirc, Ncirc);  % y_p[n], n=1..5 in assignment

n_circ = 1:Ncirc;             % assignment uses n=1..5
% ---------- (c) Linear convolution via DFT (zero-padding) ----------
Nx = length(x);
Nh = length(h);
M  = Nx + Nh - 1;             % 9

% Zero-pad to length M
xzp = [x, zeros(1, M - Nx)];  % length 9
hzp = [h, zeros(1, M - Nh)];  % length 9

% M-point DFTs
Xz = fft(xzp, M);
Hz = fft(hzp, M);

% Multiply in frequency domain
Ylin = Xz .* Hz;

% Inverse DFT => length-9 linear convolution
y_lin = ifft(Ylin, M);        % y[n], n=2..10 in assignment

n_lin = 2:10;                 % y_lin(1)=y[2], ..., y_lin(9)=y[10]
% ---------- Plot both via DFT ----------
figure;
stem(n_lin, real(y_lin), 'b', 'filled'); hold on;
stem(n_circ, real(y_circ), 'r', 'filled');

xlabel('n');
ylabel('Amplitude');
title('Linear vs circular convolution via DFT');
legend('Linear convolution y[n] = x[n]*h[n]', ...
       'Circular convolution y_p[n] (N=5)', ...
       'Location', 'best');
grid on;