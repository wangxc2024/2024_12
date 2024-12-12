function [pc1,pc2]=showtracepca(param,pulse,Ns,Tp,x0)

 load('pca0.mat')
% Tp=5;
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

dz=[1];
dx=200;
Iinput=pulse;
% 
% yh(:,1)=rand(90,1);
% z=dz(1)*randn(30,3,Th);
% zz=zeros(30,3,Th);
% for g=1:Th-1        %加热
% 
%     zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
%     param.Iinput=Iinput+zz(:,:,g+1);
% 
%     dy=ut.*odeDWM(1,yh(:,g),param)+dx*randn;
%     yh(:,g+1)=yh(:,g)+dy;
% 
% end
% "heat"
% yc(:,1)=yh(:,Th-Th/10);
% z=dz(1)*randn(30,3,Tc);
% zz=zeros(30,3,Tc);
% for g=1:Tc-1        %稳定
% 
%     zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
%     param.Iinput=Iinput+zz(:,:,g+1);
% 
%     dy=ut.*odeDWM(1,yc(:,g),param)+dx*randn;
%     yc(:,g+1)=yc(:,g)+dy;
% 
% end
% 
% save('yc');
dx=0;  %低温
ss=1;
for k=1:size(x0,2)
for s=1:Ns     %随机撒点


    yy(:,1)=x0(:,k);
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

    yend(:,ss)=yy(:,T-3);


end
xss=yend;
% 
%     [mp,sc,va]=pca(yend');
     
%     
%     [xss,weight]=statisxss(yend');

 pc1(k,:)=mp(:,1)'*yy;
     pc2(k,:)=mp(:,2)'*yy;
end 
   plot(pc1',pc2')  


end

