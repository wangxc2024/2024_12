function [pc1,pc2]=randomyypc(param,pulse,Ns,mp,dz)


Tp=5;
ut=0.001;
T=Tp/ut;
yy=zeros(90,T);
Th=50/ut;
yh=zeros(90,Th);
Tc=100001;
yc=zeros(90,Tc);
Tb=T;
yb=zeros(90,Tb);
yend=zeros(90,Ns);

signoise=0.005;
tnoise=0.002;

% dz=[1];
dx=200;
Iinput=pulse;

dx=0;  %低温
ss=1;
for s=1:Ns     %随机撒点


    yy(:,1)=rand(90,1);
    z=dz(1)*randn(30,3,T);
    zz=zeros(30,3,T);


    for g=1:T-1000        %连续轨迹 跑到稳态

        zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
        param.Iinput=Iinput+zz(:,:,g+1);

        dy=ut.*odeDWM(1,yy(:,g),param)+dx*randn;
        yy(:,g+1)=yy(:,g)+dy;

    end
    for g=T-999:T-1   %冻结到定点

        
        param.Iinput=Iinput+zeros(30,3);

        dy=ut.*odeDWM(1,yy(:,g),param);
        yy(:,g+1)=yy(:,g)+dy;

    end
    pc1(s,:)=mp(:,1)'*yy;
    pc2(s,:)=mp(:,2)'*yy;
    
    ss=ss+1
    

end


  plot(pc1',pc2')  


end



