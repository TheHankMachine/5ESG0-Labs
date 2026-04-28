% nested functions share parent scope
function main() 
[y, sample_rate] = audioread('tone_in.wav');

% function to define envelope
function value = h_func(n)
    value = 0;

    if      isbetween(n, 0, sample_rate);                    value = n / sample_rate; 
    elseif  isbetween(n, sample_rate, 4 * sample_rate);      value = 1;
    elseif  isbetween(n, 4 * sample_rate, 5 * sample_rate);  value = 5 - (n / sample_rate);
    end
end

n = 1:length(y);
% initialize envelope h over range n evaluating each n by our h definition
h = arrayfun(@h_func, n);

% multiply the envelope with audio signal
y = y(:).*h(:); % what beautify syntax this language has

% stem(y)

audiowrite("tone_out.wav", y, sample_rate)

end
main()