function dx = odeDWM(t,x,param)

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

dx=zeros(90,1);

    a=135;
    b=54;
    d=0.308;
    phia=(a*Ia-b)./(1-exp(-d*(a*Ia-b)));%[30,1]
    phib=(a*Ib-b)./(1-exp(-d*(a*Ib-b)));%[30,1]
    
    c1=615;
    c0=177;
    r0=5.5;
    gi=4;
    phic=((c1*Ic-c0)/gi+r0)/2+abs(((c1*Ic-c0)/gi+r0))/2;%[30,1]

dx(1:30)=(-Sa./tn+game*(1-Sa).*phia)';
dx(31:60)=(-Sb./tn+game*(1-Sb).*phib)';
dx(61:90)=(-Sc./tg+gami.*phic)';

end




