% Lab 2
% Assignment 2: Spectrum of a sine wave of different frequencies

clear; close all; clc;

% parameters
fs = 80; % Sampling frequency [Hz]
N  = 16; % DFT length
f1 = 10; % Frequency of first sinusoid [Hz]
f2 = 11; % Frequency of second sinusoid [Hz]

% time n
n = 0:N-1;

% thetas
theta1 = (2*pi*f1)/fs;
theta2 = (2*pi*f2)/fs;

% signals
x1 = sin(theta1*n);
x2 = sin(theta2*n);

% DFTs
X1 = fft(x1, N);
X2 = fft(x2, N);

% DFT k-vector
k = 0:N-1;

% Plot magnitude spectrum of x1
figure;
stem(k, abs(X1), 'filled');
xlabel('DFT index k');
ylabel('|X_1[k]|');
title('Magnitude spectrum of x_1[n] (f_1 = 10 Hz)');
grid on;

% Plot magnitude spectrum of x2
figure;
stem(k, abs(X2), 'filled');
xlabel('DFT index k');
ylabel('|X_2[k]|');
title('Magnitude spectrum of x_2[n] (f_2 = 11 Hz)');
grid on;
