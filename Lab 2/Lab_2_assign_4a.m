% Assignment 4(a,b): Minimum N and spectrum

clear; close all; clc;

% Given parameters
fs = 750;          % sampling frequency [Hz]
f1 = 135;          % [Hz]
f2 = 150;          % [Hz]

% Minimum N (from analysis): N = 50, change to 52 for question(b)
N = 52;

n = 0:N-1;         % time indices
Ts = 1/fs;         % sampling period

% Continuous-time signal sampled
x = cos(2*pi*f1*n*Ts) + cos(2*pi*f2*n*Ts);

% N-point DFT
X = fft(x, N);
k = 0:N-1;

figure;
stem(k, abs(X), 'filled');
xlabel('DFT index k');
ylabel('|X_1[k]|');
title('Magnitude spectrum |X[k]|, N = 52');
grid on;