
clear
load('xss3.mat');
load('Dss3.mat');
load('pca.mat');
weight=[0.3 0.3 0.4];
V=xp(:,1:2);

zss=V'*all_x_ss';


Nx=1200;
Ny=1200;
x = linspace(-8,8,Nx); %设置x轴的范围
y = linspace(-4,8,Ny); %设置y轴范围
[X,Y] = meshgrid(x,y); %将其x，y轴网格化
lx=(max(x)-min(x))/length(x);
ly=(max(y)-min(y))/length(y);
for i=1:3               %第i个吸引子的平均场概率分布函数pdf
    
    Dz{1,i}=V'*Dss{1,i}*V;
    dd=(Dz{1,i})^(-1);
    X1=X-zss(1,i);
    Y1=Y-zss(2,i);
    pdf(:,:,i)=exp(-0.5*(X1.^2*dd(1,1)+X1.*Y1*(dd(1,2)+dd(2,1))+Y1.^2*dd(2,2)))/(2*pi*(det(Dz{1,i})^(0.5)));
    
end
Pz=X-X;
for i=1:3
    
    
    Pz=Pz+weight(i)*pdf(:,:,i);     %概率分布Pz
end

Uz = -log(Pz);                      %landscape U
[G1,G2]=gradient(Uz,lx,ly);
nx=60;
ny=60;
xz = linspace(-8,8,nx); %设置x轴的范围
yz = linspace(-4,8,ny); %设置y轴范围
F1=zeros(nx,ny);
F2=zeros(nx,ny);
paramDWM;
pcc=xp'*all_x_ss';
mpcc=sum(pcc,2)/3;
y3=sum((mpcc(3:90).*xp(:,3:90)')',2);
for ix=1:nx
    for iy=1:ny
        
        F1(ix,iy)=V(:,1)'*odeDWM(1,xz(ix).*V(:,1)+yz(iy).*V(:,2)+y3,param);
        F2(ix,iy)=V(:,2)'*odeDWM(1,xz(ix).*V(:,1)+yz(iy).*V(:,2)+y3,param);
    end
end
Pzs=Pz(1:Nx/nx:Nx,1:Ny/ny:Ny);
Gs1=G1(1:Nx/nx:Nx,1:Ny/ny:Ny);
Gs2=G2(1:Nx/nx:Nx,1:Ny/ny:Ny);
Gsm=(Gs1.^2+Gs2.^2).^0.5;
J1=F1.*Pzs+d*Gs1.*Pzs;
J2=F2.*Pzs+d*Gs2.*Pzs;
Jm=(J1.^2+J2.^2).^0.5;
Fm=(F1.^2+F2.^2).^0.5;
Jm(Jm==inf) = NaN;
Jm(Jm==0) = NaN;
Fm(Jm==0) = NaN;
Fm(Jm==-inf) = NaN;
lgg1=log(Gsm).*Gs1./Gsm;
lgg2=log(Gsm).*Gs2./Gsm;
lgj1=log(Jm).*J1./Jm;
lgj2=log(Jm).*J2./Jm;
lgf1=log(Fm.*Pzs).*F1./Fm;
lgf2=log(Fm.*Pzs).*F2./Fm;
lgf2(lgf2==inf) = NaN;
lgf1(lgf1==inf) = NaN;
% lgj2(lgj2==inf) = NaN;
% lgj1(lgj1==inf) = NaN;
% Gss=quiver3(xz,yz,zeros(nx,ny),lgg1,lgg2,zeros(nx,ny));
% Jss= quiver3(xz,yz,zeros(nx,ny),lgj1,lgj2,zeros(nx,ny));
Fss=quiver3(xz,yz,zeros(nx,ny),F1,F2,zeros(nx,ny));

%绘制曲面
% Fig = mesh(X,Y,Uz); %绘制三维曲面图







