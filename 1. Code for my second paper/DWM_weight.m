
Tp=1;
ut=0.0001;
T=Tp/ut;
y=zeros(30,3,T);
r=zeros(30,3,T);
s=zeros(30,3,T,1);

load('pca.mat');
nin=10000;              %run了10000次
yss=zeros(nin,90);

%Iinput(:,:,0:100/ut)=1;
% Iinput(1,1,4/ut:4.5/ut)=0.3;
% Iinput(1,2,7/ut:7.8/ut)=0;
signoise=0.005;
tnoise=0.002;
dz=[0.001];
dx=[0];
pulse=0;
paramDWM;
for k=1:nin
    x=dx(1)*randn(30,3,T);
    z=dz(1)*randn(30,3,T);
    zz=zeros(30,3,T);
    y(1,1,1)=0;
    Iinput=zeros(30,3,T)+pulse;
    
    ypc0=reshape((randn(1)/(12)^0.5+0.5*sum(xp(:,1)))*xp(:,1)+(randn(1)/(12)^0.5+0.5*sum(xp(:,2)))*xp(:,2),[30,3]);
    y(:,:,1)=ypc0(:,:);
    for g=1:T-1
        
        
        
%         zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise)^0.5*z(:,:,g))*ut;
        param.Iinput=Iinput(:,:,g+1)+z(:,:,g+1);

        yy=reshape(y(:,:,g),[90,1]);
        dy=odeDWM(1,yy,param);

        y(:,:,g+1)=y(:,:,g)+ut.*[dy(1:30) dy(31:60) dy(61:90)];
       
        r(:,:,g+1)=[(dy(1:30)+yy(1:30)/param.tn)/param.game./(1-yy(1:30)) (dy(31:60)+yy(31:60)/param.tn)/param.game./(1-yy(31:60)) (dy(61:90)+yy(61:90)/param.tg)/param.gami];



    end
    yss(k,:)=yy;
end

pcy1=[xp(:,1)'*yss'];
pcy2=[xp(:,2)'*yss'];
Wa=0;
Wb=0;
Wr=0;

for k=1:nin             %统计落点在哪个吸引子上
    if pcy2(k)>1.5  
        if pcy1(k)>0
            Wb=Wb+1;
        else
            Wa=Wa+1;
        end
    else
        Wr=Wr+1;
    end
end

Wa
Wb
Wr
%结果大概是：pulse=0时，Wa：Wb：Wr=3：3：4
