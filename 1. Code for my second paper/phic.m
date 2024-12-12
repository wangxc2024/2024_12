function [y]=phic(I)

    c1=615;
    c0=177;
    r0=5.5;
    gi=4;
    y=((c1*I-c0)/gi+r0)/2+abs(((c1*I-c0)/gi+r0))/2;
    
end
