function [X,Y,Pz]=getPss(xfix,Dss,weight,mp)
V=mp(:,1:2);            %前两个主成分的系数矩阵
zss=V'*xfix;
x = linspace(-8,8,200); %设置x轴的范围
y = linspace(-4,8,200); %设置y轴范围
[X,Y] = meshgrid(x,y);  %将其x，y轴网格化
Z=[X,Y];
for i=1:size(xfix,2)           %第i个吸引子的平均场概率分布函数pdf
    
    Dz{1,i}=V'*Dss{1,i}*V;
    dd=(Dz{1,i})^(-1);
    X1=X-zss(1,i);
    Y1=Y-zss(2,i);
    pdf(:,:,i)=exp(-0.5*(X1.^2*dd(1,1)+X1.*Y1*(dd(1,2)+dd(2,1))+Y1.^2*dd(2,2)))/(2*pi*(det(Dz{1,i})^(0.5)));
    
end
Pz=X-X;
for i=1:size(xfix,2)
    
    
    Pz=Pz+weight(i)*pdf(:,:,i);     %概率分布Pz
end
end