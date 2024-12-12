function [mfpt,wpt,yy,yy1,pc10]=mfptdwm(J,G,noiseadd,sV1,prb,xfp,mp)

param=paramJm_G(J,G,0.002);

Tp=20;
ut=param.ut;
T=Tp/ut;
Tr=10;
yy=zeros(90,T);
pulse=zeros(30,3,1);

    pulse(1,1,1)=sV1;

    pulse(16:30,3,1)=prb;
%     pulse(27:28,3,1)=prb;

    [yy1,~]=getatracedwmnoise_mex(Tr,1*rand(90,1),param,pulse,1,0);
    pc1=mp(:,1)'*yy1;
    pc10=pc1(Tr/ut-1);
    pulse=zeros(30,3,1);
    
    

yy0=yy1(:,Tr/ut);

wpt=0;
sp=0;
while wpt<1
[yy,~]=getatracedwmnoise_mex(Tp,yy0,param,pulse,1,noiseadd);
pc1=mp(:,1)'*yy;

pcend=pc1(T);

if abs(pcend-pc10)>xfp
    ip=1;
    for y=pc1
        if abs(y-pc10)>xfp
            pt=ip;
            break
        end 
        ip=ip+1;
    end
    mfpt=sp*Tp+pt*param.ut;
    wpt=1;
else
    sp=sp+1;
    yy0=yy(:,T);
end
if sp>100
    mfpt=100*Tp;
    break
end
end
    
%     plot(mp(:,1)'*ymm,mp(:,2)'*ymm)


