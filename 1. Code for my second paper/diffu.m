function [D]=diffu(x,param,Inoise,Snoise)


game=param.game;
gami=param.gami;
Jc=param.Jc;
Jei=param.Jei;
Jii=param.Jii;
I0a=param.I0a;
I0b=param.I0b;
I0c=param.I0c;
G=param.G;
tn=param.tn;
tg=param.tg;
SLN=param.SLN;%[30,30]
W=param.W;%[30,30]
Iinput=param.Iinput;%[30,3]
wa=param.wa;%[30,1]
wb=param.wb;%[30,1]
wc=param.wc;%[30,1]
Z=param.Z;
Js=param.Js;%[30,1]
Jie=param.Jie;%[30,1]

Sa=x(1:30);%[30,1]
Sb=x(31:60);%[30,1]
Sc=x(61:90);%[30,1]

Ianet=G.*W.*SLN*Sa.*wa;%[30,1]
Ibnet=G.*W.*SLN*Sb.*wb;%[30,1]
Icnet=G.*W.*(1-SLN)*(Sa+Sb)./Z.*wc;%[30,1]

Ia=Js.*Sa+Jc.*Sb+Jei.*Sc+I0a+Ianet+Iinput(:,1);%[30,1]
Ib=Js.*Sb+Jc.*Sa+Jei.*Sc+I0b+Ibnet+Iinput(:,2);%[30,1]
Ic=Jie.*Sa+Jie.*Sb+Jii.*Sc+I0c+Icnet+Iinput(:,3);%[30,1]

ie=[Ia;Ib;Ic];

di=1/10000;
dphi=(phidwm(ie+di)-phidwm(ie))/di;
dphic=(phic(ie+di)-phic(ie))/di;
% ddphi=(phidwm(ie+di)+phidwm(ie-di)-2*phidwm(ie))/di/di;

signoise=0.005;
tnoise=0.002;
sige2=eye(90)*signoise^2/tnoise;
sigi2=eye(90)*signoise^2/tnoise;


De=game^2*0.5*(1-x).^2.*(dphi.^2.*sige2)*Inoise+1*eye(90)*Snoise;
Di=gami^2*0.5*(dphic.^2.*sigi2)*Inoise+1*eye(90)*Snoise;
D=[De(1:60,:);Di(61:90,:)];

end

