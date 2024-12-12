
clear
load('xss3.mat');
load('Dss3.mat');
load('pca.mat');
weight=[0.3 0.3 0.4];   %三个吸引子的权重
V=xp(:,1:2);            %前两个主成分的系数矩阵

zss=V'*all_x_ss';
x = linspace(-8,8,600); %设置x轴的范围
y = linspace(-4,8,600); %设置y轴范围
[X,Y] = meshgrid(x,y);  %将其x，y轴网格化
Z=[X,Y];
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

%绘制曲面
Fig = mesh(X,Y,Uz); %绘制三维曲面图
