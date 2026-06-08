[y, fs] = audioread('audio_sin.wav');
fprintf('fs = %.2f Hz\n', fs);

N = length(y);
Y = fft(y);
f = fs*(0:floor(N/2))/N;

P2 = abs(Y/N);
P1 = P2(1:floor(N/2)+1);
P1(2:end-1) = 2*P1(2:end-1);

min = 200;
valid = f > min;

[~, idx] = max(P1(valid));
fu = f(valid);
fu = fu(idx);

fprintf('fu = %.2f Hz\n', fu);

y_filt = filter(bandstopfir1, y);
player = audioplayer(y_filt, fs);
play(player);

Y  = abs(fft(y));
Yf = abs(fft(y_filt));
Y  = Y(1:floor(N/2));
Yf = Yf(1:floor(N/2));
f_plot = f(1:floor(N/2));

figure;

subplot(2,1,1);
plot(f_plot, Y);
title('Original signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(2,1,2);
plot(f_plot, Yf);
title('Filtered signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

audiowrite("audio_filtered.wav", y_filt, fs);