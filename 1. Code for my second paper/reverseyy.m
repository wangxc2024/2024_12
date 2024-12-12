function [pc1,pc2]=reverseyy(param,pulse,Ns,x0,mp,dz)

Tp=0.1;
ut=0.0001;
T=Tp/ut;
yy=zeros(90,T);

signoise=0.005;
tnoise=0.002;

% dz=[1];
dx=200;
Iinput=pulse;

dx=0;  %低温
ss=1;
for k=1:size(x0,2)
    
for s=1:Ns     %随机撒点


    yy(:,1)=x0(:,k)+0.3*randn(90,1);
    z=dz(1)*randn(30,3,T);
    zz=zeros(30,3,T);


    for g=1:T-1       %连续轨迹 跑到稳态
        
        

        zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
        param.Iinput=Iinput+zz(:,:,g+1);

        dy=ut.*odeDWM(1,yy(:,g),param)+dx*randn;
        yy(:,g+1)=yy(:,g)-dy;
        if abs(mp(:,1)'*yy(:,g+1))+abs(mp(:,2)'*yy(:,g+1))>10
        for i=g+1:T
        yy(:,i)=yy(:,g);
        end
        g*ut
        break
        end
        
    end
    
    pc1(s+(k-1)*Ns,:)=mp(:,1)'*yy;
    pc2(s+(k-1)*Ns,:)=mp(:,2)'*yy;
    
    ss=ss+1
    

end

plot(pc1',pc2')  

end




