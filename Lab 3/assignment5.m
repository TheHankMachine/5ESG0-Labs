% 2
load('synthetic_radar.mat');

tt = (0:length(trans)-1)/fs*1000;
tr = (0:length(receive)-1)/fs*1000;

figure;
subplot(2,1,1);
plot(tt, trans);
title('Transmitted signal');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(tr, receive);
title('Received signal');
xlabel('Time (ms)');
ylabel('Amplitude');
grid on;

% 3
maxl = length(trans)-1;
lags = 0:maxl;
r = zeros(size(lags));

for k = 1:length(lags)
    r(k) = crosscor(receive, trans, lags(k));
end

figure;
plot(lags, r);
xlabel('Lag (l)');
ylabel('crosscor(l)');
title('Cross-correlation between signals');
grid on;

% 4
% Calculate delay based on peak lag
[~, idx] = max(r);
peak = lags(idx);
delay = peak/fs;

% Get physical distance
dist = (3e8*delay)/2;
fprintf('Distance: %.2f m\n', dist);