function dx=odeLSLN8a(t,x,param)

r=reshape(x,[4,8]);

Wff=param(1).Wff;%[30,30]
Wfb=param(1).Wfb;%[30,30]
noise=param(1).noise;%[4,30]
dltime=param(1).Ndelaytime;%[30,30]
Iext=param(1).Iext;%[4,30]
y=param(1).y;
ut=param(1).ut;
Tpre=0.04/ut;
% rl2edl=param.rl2edl;%[4,30,]



Jee=1.5;
Jie=3.5;
Jei=-3.25;
Jii=-2.5;

Jff1=1;
Jfb1=0.1;
Jfb2=0.5;
Jfb3=0.9;
Jfb4=0.5;

J25=0.75;
J52=1;

Jff=[[Jff1 0 0 0];[0 0 0 0];[0 0 0 0];[0 0 0 0]];
Jfb=[[0 0 Jfb1 0];[0 0 Jfb2 0];[0 0 Jfb3 0];[0 0 Jfb4 0]];

Js=[[Jee Jei 0 0];[Jie Jii J25 0];[J52 0 Jee Jei];[0 0 Jie Jii]];

Is=Js*r;

% % % % % % % % % % 

rl2edl=zeros(30,30);
rl5edl=zeros(30,30);
Iinter=zeros(4,30);
for id=1:8
    
    for jd=1:8
        rl2edl(id,jd)=y(4*jd-3,Tpre-dltime(id,jd));
        rl5edl(id,jd)=y(4*jd-3,Tpre-dltime(id,jd));
        
    end
    Iinter(1,id)=(Wff(id,:)*rl2edl(:,id))'+(Wfb(id,:)*rl5edl(:,id)*Jfb1)';
    Iinter(2,id)=(Wfb(id,:)*rl5edl(:,id)*Jfb2)';
    Iinter(3,id)=(Wfb(id,:)*rl5edl(:,id)*Jfb3)';
    Iinter(4,id)=(Wfb(id,:)*rl5edl(:,id)*Jfb4)';

end

% % % % % % % % % % % 

% Iinter=(Wff*(Jff*)'+Wfb*(Jfb*rdl)')';


rl2e=r(1,:);
rl2i=r(2,:);
rl5e=r(3,:);
rl5i=r(4,:);


sigl2e=0.3;
sigl2i=0.3;
sigl5e=0.45;
sigl5i=0.45;


zl2e=sigl2e*noise(1,:);
zl2i=sigl2i*noise(2,:);
zl5e=sigl5e*noise(3,:);
zl5i=sigl5i*noise(4,:);

taol2e=0.006;
taol2i=0.015;
taol5e=0.03;
taol5i=0.075;

Itot=Is+Iinter+Iext;
phi=Itot./(1-exp(-Itot));

dr=zeros(4,30);
dr(1,:)=(-rl2e+phi(1,:)+(taol2e/ut)^0.5*zl2e)/taol2e;
dr(2,:)=(-rl2i+phi(2,:)+(taol2i/ut)^0.5*zl2i)/taol2i;
dr(3,:)=(-rl5e+phi(3,:)+(taol5e/ut)^0.5*zl5e)/taol5e;
dr(4,:)=(-rl5i+phi(4,:)+(taol5i/ut)^0.5*zl5i)/taol5i;

dx=reshape(dr,[120,1]);

end



