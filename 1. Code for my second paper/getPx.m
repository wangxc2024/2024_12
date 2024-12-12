function [Pz]=getPx(X,xfix,Dss,weight,mp)
V=mp(:,1:2);            %前两个主成分的系数矩阵
zss=V'*xfix;

Xpc=V'*X;

for i=1:size(xfix,2)           %第i个吸引子的平均场概率分布函数pdf
    
    Dz{1,i}=V'*Dss{1,i}*V;
    dd=(Dz{1,i})^(-1);
    X1=Xpc(1,:)-zss(1,i);
    Y1=Xpc(2,:)-zss(2,i);
    pdf(:,i)=exp(-0.5*(X1.^2*dd(1,1)+X1.*Y1*(dd(1,2)+dd(2,1))+Y1.^2*dd(2,2)))/(2*pi*(det(Dz{1,i})^(0.5)));
    
end
Pz=0;
for i=1:size(xfix,2)
    
    
    Pz=Pz+weight(i)*pdf(:,i);     %概率分布Pz
end

end