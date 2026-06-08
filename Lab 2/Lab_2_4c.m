% Assignment 4(c): Zero-padding to R = 256

clear; close all; clc;

load signal.mat   % assumes variable is called x_tilde or similar
% Suppose the variable name is xtilde; adjust if different:
xtilde = x(:).';   % ensure row vector

N = length(xtilde);
R = 512;
wH = hann(N).';          % Hanning window, row vector
xw = xtilde .* wH;       % windowed signal
% Zero-padding to length R
xzp = [xw, zeros(1, R-N)];

X = fft(xzp, R);

k = 0:R-1;

% Magnitude in dB
Xmag_dB = 20*log10(abs(X));

figure;
plot(k, Xmag_dB);
xlabel('DFT index k');
ylabel('Magnitude [dB]');
title('Magnitude spectrum with Hanning of zero-padded signal, R = 512');
grid on;