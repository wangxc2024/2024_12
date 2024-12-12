function [y] = pphi(x)
    Smax = 60;
    Ssat = 0.1;
    I0 = 30;
    y=Smax/(1 + exp(-Ssat*(x - I0)));
end