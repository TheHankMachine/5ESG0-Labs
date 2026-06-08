% Assignment 4(f): DFT of rectangular and Hanning windows

clear; close all; clc;

Nw = 16;
R = 512;

wR = rectwin(Nw).';   % rectangular window
wH = hann(Nw).';      % Hanning window

% Zero-padding
wRzp = [wR, zeros(1, R-Nw)];
wHzp = [wH, zeros(1, R-Nw)];

% DFT
WR = fft(wRzp, R);
WH = fft(wHzp, R);

WRmag_dB = 20*log10(abs(WR));
WHmag_dB = 20*log10(abs(WH));

k = 0:R-1;

figure;
plot(k, WRmag_dB, 'b', 'LineWidth', 1.0); hold on;
plot(k, WHmag_dB, 'r', 'LineWidth', 1.0);
xlabel('DFT index k');
ylabel('Magnitude [dB]');
title('Magnitude of rectangular and Hanning windows(N=16, R=512)');
legend('Rectangular', 'Hanning');
grid on;