y(:,:,1)=1;

Tp=1000;
ut=0.001;
T=Tp/ut;
y=zeros(30,3,T);
r=zeros(30,3,T);
s=zeros(30,3,T,1);

load('xp');
nin=3;
pc10=[-2 0 2];
pc20=[2.5 0.5 2.5];

%Iinput(:,:,0:100/ut)=1;
% Iinput(1,1,4/ut:4.5/ut)=0.3;
% Iinput(1,2,7/ut:7.8/ut)=0;
signoise=0.005;
tnoise=0.002;
dz=[1];
dx=[0];
pulse=0;
paramDWM;
for k=1:nin
    x=dx(1)*randn(30,3,T);
    z=dz(1)*randn(30,3,T);
    zz=zeros(30,3,T);
    y(1,1,1)=0;
    Iinput=zeros(30,3,T)+pulse;
    ypc0=reshape((pc10(k))*xp(:,1)+(pc20(k))*xp(:,2),[30,3]);
%     ypc0=reshape((randn(1)/(12)^0.5+0.5*sum(xp(:,1)))*xp(:,1)+(randn(1)/(12)^0.5+0.5*sum(xp(:,2)))*xp(:,2),[30,3]);
% ypc0=rand(30,3);
    y(:,:,1)=ypc0(:,:);
    for g=1:T-1
        
        
        
        zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
        param.Iinput=Iinput(:,:,g+1)+[1 1 0].*zz(:,:,g+1);
        
% 
%         dsa=odeDWM(1,y(:,:,g),param);
%         dsb=-Sb./tn+game*(1-Sb).*phidwm(Ib)+x(:,2,g);
%         dsc=-Sc./tg+gami.*phic(Ic)+x(:,3,g);
%         
        yy=reshape(y(:,:,g),[90,1]);
        xx=reshape(x(:,:,g),[90,1]);
        dy=odeDWM(1,yy,param)+xx;

        y(:,:,g+1)=y(:,:,g)+ut.*[dy(1:30) dy(31:60) dy(61:90)];
        %r(:,:,g+1)=y(:,:,g+1)./[tn tn tg];
        r(:,:,g+1)=[(dy(1:30)+yy(1:30)/param.tn)/param.game./(1-yy(1:30)) (dy(31:60)+yy(31:60)/param.tn)/param.game./(1-yy(31:60)) (dy(61:90)+yy(61:90)/param.tg)/param.gami];



    end
    s(:,:,:,k)=y;
end
ax1 = '1';
for k=1:nin
    yy=reshape(s(:,:,:,k),[90,T]);
    pcy1(:,k)=[xp(:,1)'*yy];
    pcy2(:,k)=[xp(:,2)'*yy];
end
plot(pcy1(:,:),pcy2(:,:))

% yy=reshape(y,[90,T]);
% pcy=[xp(:,1)'*yy ;xp(:,2)'*yy];
% plot(pcy(1,:),pcy(2,:))

%a=reshape((max(y(:,1:2,:),[],2)-min(y(:,1:2,:),[],2)),[30,100000]);
%a=reshape((max(r(:,1:2,:),[],2)),[30,100000]);
% a=reshape(r(:,1,:),[30,100000]);
% b=reshape(r(:,2,:),[30,100000]);
% c=reshape(Iinput(:,1,:),[30,100000]);
% d=reshape(Iinput(:,2,:),[30,100000]);
% 
% for k=1:30
%     subplot(6,5,k)
%     plot(1*ut:ut:Tp,reshape(r(k,:,:),[3,100000]))
% end
% 
% subplot(3,1,1)
% plot(1:T,a)
% subplot(3,1,2)
% plot(1:T,b)
% subplot(3,1,3)
% plot(1:T,c,1:T,d)
% 
% all_x_ss(1,:)=[y(:,1,99000)' y(:,2,99000)' y(:,3,99000)'];

