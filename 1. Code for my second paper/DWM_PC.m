
Tp=10;
ut=0.0001;
T=Tp/ut;
y=zeros(30,3,T);
r=zeros(30,3,T);
s=zeros(30,3,T,3);


y(:,:,1)=1;


signoise=0.005;
tnoise=0.002;
dz=[1];
pulse=0;
paramDWM
for k=1:3

    z=dz(1)*randn(30,3,T);
    zz=zeros(30,3,T);
    y(1,1,1)=0;
    Iinput=zeros(30,3,T)+pulse;
    Iinput(1,k,2/ut:3/ut)=0.3;

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

sr=reshape(s(:,:,0.9*T:0.9*T+99,:),90,100,3);
sr=reshape(sr,[90,300]);

xpc=pca(sr');




