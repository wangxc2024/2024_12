function [xss]=randomxss(param,pulse,Ns,noise,Td)


Tp=4;
ut=param.ut;
% T=Tp/ut;
% yy=zeros(90,T);
% Th=50/ut;
% yh=zeros(90,Th);
% Tc=100001;
% yc=zeros(90,Tc);
% Tb=T;
% yb=zeros(90,Tb);
yend=zeros(90,Ns);
% % % Td=1000;
yd=zeros(90,Td);
% 
% signoise=0.005;
% tnoise=0.002;
% 
% dz=[1];
% dx=200;
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
for s=1:Ns     %随机撒点
yy=getatracedwmnoise_mex(Tp,10*rand(90,1),param,pulse,noise,0);

%     yy(:,1)=rand(90,1);
%     z=dz(1)*randn(30,3,T);
%     zz=zeros(30,3,T);


%     for g=1:T-1000        %连续轨迹 跑到稳态
% 
%         zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
%         param.Iinput=Iinput+zz(:,:,g+1);
% 
%         dy=ut.*odeDWM(1,yy(:,g),param)+dx*randn;
%         yy(:,g+1)=yy(:,g)+dy;
% 
%     end
yd(:,1)=yy(:,Tp/ut);
    for g=1:Td   %冻结到定点

        
        param.Iinput=Iinput+zeros(30,3);

        dy=ut.*odeDWM(1,yd(:,g),param);
        yd(:,g+1)=yd(:,g)+dy;

    end

    yend(:,ss)=yd(:,Td-3);
    ss=ss+1;

end
xss=yend;
% 
%     [mp,sc,va]=pca(yend');
%     pc1=mp(:,1)'*yend;
%     pc2=mp(:,2)'*yend;
%     
%     [xss,weight]=statisxss(yend');
% load('pca0.mat')
%   plot(mp(:,1)'*yy,mp(:,2)'*yy)  


end

