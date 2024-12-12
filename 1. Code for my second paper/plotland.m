function [Pz,A_matrix,Dss]=plotland(xfix,weight,param,mp)

A_matrix=getmatrix(xfix,param);
%     Dss=A_matrix*0;
    d=0.05;
    for i=1:size(xfix,2)
        if isreal(A_matrix{i})
        
            Dss{i}=getsigma(d,A_matrix{i});
        else
            i
            Dss{i}=getsigma(d,real(A_matrix{i}));
        end
        
    end
    
    
    
    [X,Y,Pz]=getPss(xfix,Dss,weight,mp);



    Uz = -log(real(Pz)+0.000000000001);                      %landscape U

    %绘制曲面
    Fig = surf(X,Y,Uz); %绘制三维曲面图
    shading interp;
end