
clear;
pulse=zeros(30,3);
pulse(1,1)=0;
Jm=[0.46]; %这个只改了Jmax没改后面的Js，要重写一下。
Nj=size(Jm,2);
% paramDWM;

for b=1:Nj
    param=paramJm(Jm(b));
    xss=randomxss(param,pulse,100);
    
    [xfix,weight]=statisxss(xss);
    load('pca0.mat')
    reverseyy(param,pulse,100,xfix,mp,1);
    
end






