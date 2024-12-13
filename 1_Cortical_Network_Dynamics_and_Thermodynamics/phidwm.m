function [y]=phidwm(I)
    a=135;
    b=54;
    d=0.308;
    y=(a*I-b)./(1-exp(-d*(a*I-b)));
end