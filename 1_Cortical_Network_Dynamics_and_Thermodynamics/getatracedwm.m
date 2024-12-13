function [yy,uy]=getatracedwm(Tp,y0,param,pulse)


% Tp=0.5;
ut=param(1).ut;
T=Tp/ut;
yy=zeros(90,T);
uy=zeros(90,T);

dz=[1 1 0];
Ns=1;
dy=zeros(90,1);
signoise=0.005;
tnoise=0.002;

Iinput=pulse;

for s=1:Ns     %随机撒点


    yy(:,1)=y0;
    z=dz(1).*randn(30,3,T);
    zz=zeros(30,3,T);


    for g=1:T-1      %连续轨迹 跑到稳态

        zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
        param.Iinput=Iinput+zz(:,:,g+1);

        dy=ut.*odeDWM(1,yy(:,g),param);
        yy(:,g+1)=yy(:,g)+dy;
        uy(:,g)=dy/ut;

    end
    uy(:,T)=odeDWM(1,yy(:,T),param);
  

end



end

