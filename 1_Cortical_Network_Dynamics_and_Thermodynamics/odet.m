function dx = odet(t,x,param)



Jmin=param.Jmin;
Jmax=param.Jmax;
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
c1=param.c1;
gi=param.gi;
J0=param.J0;
k1=param.k1;
k2=param.k2;
SLN=param.SLN;%[30,30]
FLN=param.FLN;%[30,30]
W=k1.*FLN.^k2;%[30,30]
Iinput=param.Iinput;%[1,3]

Sa=x(1);
Sb=x(2);
Sc=x(3);

Z=(2*c1*tg*gami*Jei)/(c1*tg*gami*Jii-gi);

Ianet=0.3;
Ibnet=0.3;
Icnet=0.3;

h=1;
Js=Jmin+(Jmax-Jmin)*h;
zetta=(tg*gami*c1)/(gi-Jii*tg*gami*c1);
Jie=(J0-Js-Jc)/(2*Jei*zetta);

Ia=Js.*Sa+Jc.*Sb+Jei.*Sc+I0a+Ianet+Iinput(:,1);
Ib=Js.*Sb+Jc.*Sa+Jei.*Sc+I0b+Ibnet+Iinput(:,2);
Ic=Jie.*Sa+Jie.*Sb+Jii.*Sc+I0c+Icnet+Iinput(:,3);

dx=zeros(3,1);

dx(1)=(-Sa./tn+game*(1-Sa).*phidwm(Ia))';
dx(2)=(-Sb./tn+game*(1-Sb).*phidwm(Ib))';
dx(3)=(-Sc./tg+gami.*phic(Ic))';

end




