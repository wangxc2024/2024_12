param=struct;

param.Jmin=0.21;
param.Jmax=0.4;
param.game=1.282;
param.gami=2;
param.Jc=0.0107;
param.Jei=-0.31;
param.Jii=-0.12;
param.I0a=0.3294;
param.I0b=0.3294;
param.I0c=0.26;
param.G=0.48;
param.tn=0.06;
param.tg=0.005;
param.c1=615;
param.gi=4;
param.J0=0.2112;
param.k1=1.2;
param.k2=0.3;
param.Iinput=zeros(30,3);

param.SLN=csvread('SLNdata.csv');
param.FLN=csvread('FLNdata.csv');
We=param.k1.*param.FLN.^param.k2;
zW=sum(We,2);
param.W=We./zW;
param.Z=(2*param.c1*param.tg*param.gami*param.Jei)/(param.c1*param.tg*param.gami*param.Jii-param.gi);
load('hiebyspine.mat','hie')
param.h=hie;
param.Js=param.Jmin+(param.Jmax-param.Jmin)*param.h;%[30,1]
param.zetta=(param.tg*param.gami*param.c1)/(param.gi-param.Jii*param.tg*param.gami*param.c1);
param.Jie=(param.J0-param.Js-param.Jc)/(2*param.Jei*param.zetta);%[30,1]
param.wa=param.Js/param.Jmax;
param.wb=param.Js/param.Jmax;
param.wc=param.Jie/max(param.Jie);

