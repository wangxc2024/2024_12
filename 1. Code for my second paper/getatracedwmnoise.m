function [yy,uy]=getatracedwmnoise(Tp,y0,param,pulse,noise,noiseadd)


% Tp=0.5;
ut=param(1).ut;
T=Tp/ut;
yy=zeros(90,T);
uy=zeros(90,T);

dz=[1 1 1].*noise;
dx=[1].*noiseadd;
Ns=1;
dy=zeros(90,1);
signoise=0.005;
tnoise=0.002;

Iinput=pulse;

for s=1:Ns     %随机撒点


    yy(:,1)=y0;
    z=dz(1).*randn(30,3,T);
    zz=zeros(30,3,T);
    Dadd=0.1;
    x=dx(1)*(2*Dadd*ut)^0.5.*randn(90,T);


    for g=1:T-1      %连续轨迹 跑到稳态

        zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
%         param.Iinput=Iinput+zz(:,:,g+1);
param.Iinput=Iinput+(signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
        
        
        yadd=yy(:,g);
        yadd(61:90)=1;        

        dy=ut.*odeDWM(1,yy(:,g),param)+yadd.*x(:,g);
        yy(:,g+1)=yy(:,g)+dy;
        uy(:,g)=dy/ut;

    end
    uy(:,T)=odeDWM(1,yy(:,T),param);
  

end



end

