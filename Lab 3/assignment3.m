rng(0); % set rng for reproducibility
x1 = randn(1000, 1);
x2 = randn(1000, 1);

nums = [1 2 5 100];
rho = zeros(length(nums),1);

figure;
for i = 1:length(nums)
    N = nums(i);
    y = ((N-1)*x1+x2)/N;

    % 1
    subplot(2,2,i);
    scatter(x1, y, 10, 'filled');
    title(['N = ', num2str(N)]);
    xlabel('x1[n]');
    ylabel('y_[n]');
    grid on;

    % 2
    x1_m = x1-mean(x1);
    y_m = y-mean(y);
    rho(i) = sum(x1_m.*y_m) / sqrt(sum(x1_m.^2)*sum(y_m.^2));

    fprintf('N = %d, rho = %.4f\n', N, rho(i));
end