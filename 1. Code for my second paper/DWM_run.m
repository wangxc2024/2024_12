
param=paramJm_G(0.243,0.42,0.001);

Tp=30;
% load('please_send_me_to_wxc_4_17.mat')
ut=param.ut;
T=Tp/ut;
Tr=10;
yy=zeros(90,T);
pulse=zeros(30,3,1);
pulse(1,1,1)=0.9;
Ns=1;
for s=1:Ns     %随机撒点



    [yy1,~]=getatracedwmnoise(Tr,1*rand(90,1),param,pulse,1,1);
    
     pulse=zeros(30,3,1);
    
    [yy1,~]=getatracedwmnoise(Tp,yy1(:,Tr/ut),param,pulse,11,1);
    
    pulse=zeros(30,3,1);
    prb=0.9;
    pulse(16:17,3,1)=prb;
    pulse(27:28,3,1)=prb;
%     Tp=10;
    [yy2,uy]=getatracedwmnoise(Tp,yy1(:,Tp/ut),param,pulse,1,0);
    pulse=zeros(30,3,1);
    
    [yy3,uy]=getatracedwmnoise_mex(Tp,yy2(:,Tp/ut),param,pulse,9,1);


end

% [mp,vs,kk]=pca(yy');

% save('pcalsln.mat','mp','vs','kk')


% for k=1:1000
% dF=dFmatnum(1,yy3(:,Tp/ut),param);
% dF1=dFmatnum_mex(1,yy3(:,Tp/ut),param);
% D=diffusion(yy3(:,Tp/ut),param);
% end

% plot(yy')
load('pca0.mat')
plot(mp(:,1)'*yy1,mp(:,2)'*yy1,mp(:,1)'*yy2,mp(:,2)'*yy2,mp(:,1)'*yy3,mp(:,2)'*yy3)
% for k=1:30
%     subplot(6,5,k)
%     plot(1:T,yy2(k,:)',1:T,yy2(k+30,:)',1:T,yy2(k+60,:)')
% end
function A=dFmatrix(t,x1,param,A_char)
x=x1;
Iinput=param.Iinput;
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



            A=zeros(90);
            
            for i = 1:90
                for j = 1:90
                    expr = A_char{i, j};  % Retrieve the expression from your cell array

                    % Evaluate the expression using the param cell array
                    A(i, j) = eval(expr);
                end
            end

end


