clear;
Ns=10000;
Tp=5;
ut=0.001;
T=Tp/ut;
Tg=T;

yy=zeros(90,Tg);
yend=zeros(90,Ns);

signoise=0.005;
tnoise=0.002;
dz=[1];
pulse=0;
Jm=[0.3213];
Nj=size(Jm,2);
paramDWM



for b=1:Nj              %改变参数
    
    param.Jmax=Jm(b);
    
    for s=1:Ns          %循环释放
                
        yy(:,1)=2*rand(90,1);
        z=dz(1)*randn(30,3,T);
        zz=zeros(30,3,T);
        
        Iinput=zeros(30,3,T)+pulse;
%         Iinput(1,k,2/ut:3/ut)=0.3;
        for g=1:T-1        %连续轨迹

            zz(:,:,g+1)=zz(:,:,g)+(-zz(:,:,g)/tnoise+signoise/(tnoise*ut)^0.5*z(:,:,g))*ut;
            param.Iinput=Iinput(:,:,g+1)+zz(:,:,g+1);

            dy=ut.*odeDWM(1,yy(:,g),param);
            yy(:,g+1)=yy(:,g)+dy;

        end
        
        yend(:,s)=yy(:,T-10);
        
    end

    [mp,sc,va]=pca(yend');
    pc1=mp(:,1)'*yend;
    pc2=mp(:,2)'*yend;

    Nx=10;
    Ny=10;
    xl=floor(min(pc1))-1;
    xr=floor(max(pc1))+1;
    yd=floor(min(pc2))-1;
    yu=floor(max(pc2))+1;
    X1=linspace(xl,xr,(Nx)*(xr-xl));
    Y1=linspace(yd,yu,(Ny)*(yu-yd));
    [X,Y] = meshgrid(X1,Y1);
    p=zeros(Nx*(xr-xl),Ny*(yu-yd));
    ss=reshape([pc1 pc2],[],2);
    yN=floor([Nx,Ny].*ss);

    for k=1:Ns
        

        p((yN(k,1)-xl*Nx),(yN(k,2)-yd*Ny))=p(yN(k,1)-xl*Nx,yN(k,2)-yd*Ny)+1;

    end
    
    
    
end


surf(X,Y,-log(p+1)')
shading interp;



