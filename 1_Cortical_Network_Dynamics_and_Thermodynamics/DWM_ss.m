
Tp=10;
ut=0.001;
T=Tp/ut;
y=zeros(30,3,T);
r=zeros(30,3,T);
s=zeros(30,3,T,1);

y(:,:,1)=1;


signoise=0.005;
tnoise=0.002;
dz=[1];
pulse=0;
paramDWM
for k=1:size(dz)

    z=dz(k)*randn(30,3,T);
    zz=zeros(30,3,T);
    y(1,1,1)=0;
    Iinput=zeros(30,3,T)+pulse;
    Iinput(1,1,4/ut:4.5/ut)=0.3;
    Iinput(1,2,7/ut:7.8/ut)=0.3;
    for g=1:T-1
        
        
        
        zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
        param.Iinput=Iinput(:,:,g+1)+zz(:,:,g+1);
        
           
        yy=reshape(y(:,:,g),[90,1]);
        dy=odeDWM(1,yy,param);

        y(:,:,g+1)=y(:,:,g)+ut.*[dy(1:30) dy(31:60) dy(61:90)];
   
        r(:,:,g+1)=[(dy(1:30)+yy(1:30)/param.tn)/param.game./(1-yy(1:30)) (dy(31:60)+yy(31:60)/param.tn)/param.game./(1-yy(31:60)) (dy(61:90)+yy(61:90)/param.tg)/param.gami];



    end
    s(:,:,:,k)=y;
end

for k=1:30
    subplot(6,5,k)
    plot(1*ut:ut:Tp,reshape(r(k,:,:),3,[]))
end


