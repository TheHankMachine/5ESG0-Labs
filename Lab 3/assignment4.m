N = 1000
fft_N = 100
sigma = 1

x = sigma * randn(1, N)

h_1 = [0.5, 0.5];
h_2 = [0.5, -0.5];

y_1 = conv(x, h_1, "same");
y_2 = conv(x, h_2, "same");

PSD_y_1_est = abs(fft(y_1, fft_N)).^2 / fft_N;
PSD_y_2_est = abs(fft(y_2, fft_N)).^2 / fft_N;

theta = 0:0.01:2 * pi;

PSD_y_1_analytic = 0.5 * (1 + cos(theta)) * sigma ^ 2;
PSD_y_2_analytic = 0.5 * (1 - cos(theta)) * sigma ^ 2;

subplot(2, 1, 1)
hold on
plot(2 * pi * (0:fft_N - 1) / fft_N, PSD_y_1_est);
plot(theta, PSD_y_1_analytic);

ylabel("P_{y_1}(e^{j\theta})")
xlabel("\theta")
legend(["Estimated PSD", "Analytically Solved PSD"])
xticks([0:0.5:2].*pi)
hold off

subplot(2, 1, 2)
hold on
plot(2 * pi * (0:fft_N - 1) / fft_N, PSD_y_2_est);
plot(theta, PSD_y_2_analytic);

ylabel("P_{y_2}(e^{j\theta})")
xlabel("\theta")
legend(["Estimated PSD", "Analytically Solved PSD"])
xticks([0:0.5:2].*pi)
hold off
