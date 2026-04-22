
% function n = f(x) 
%     g = [-3, -1, 1, 3];
%     if ismember(x, g) 
%         n = 1;
%     else
%         n = 0; 
%     end
% end

% t = -5:5;
x = [1, 0, 1, 0, 1, 0, 1]
h = [0.5, 1, 1.5]

y = conv(x, h)

stem(y);



% DISP("hello world")