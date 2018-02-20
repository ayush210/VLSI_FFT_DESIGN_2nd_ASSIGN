function [X] = fftsp(x)
%tic;
N = size(x,2);
if N>=4
    Even = x([1:2:end]);
    Odd = x([2:2:end]);
    Evenfft = fftsp(Even);
    Oddfft = fftsp(Odd);
    Multiply = exp(((-1i*2*pi)/N)*(0:N/2-1)');
    X = [Evenfft + Multiply.*Oddfft;Evenfft - Multiply.*Oddfft];
else
    X = [1 1;1 -1]*x';
end
end