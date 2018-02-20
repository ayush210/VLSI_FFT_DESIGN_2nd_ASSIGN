function [X] = ffts(x)
tic;
N = size(x,2);
if N>=4
    Even = x([1:2:end]);
    Odd = x([2:2:end]);
    Evenfft = ffts(Even);
    Oddfft = ffts(Odd);
    Multiply = exp(((-1i*2*pi)/N)*(0:N/2-1)');
    X = [Evenfft + Multiply.*Oddfft;Evenfft - Multiply.*Oddfft];
else
    temp1 = clock();
    X = [1 1;1 -1]*x';
    temp2 = clock();
    pause(0.5   -temp2(6)+temp1(6));
end
toc;
end