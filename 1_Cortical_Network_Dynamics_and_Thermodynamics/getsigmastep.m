function [Dss]=getsigmastep(d,A_matrix,D0)

% load('A_m1_dwm_01_03.mat','A_matrix')

Tp=100;
    ut=0.001;
    T=Tp/ut;
sig=zeros(90,90,T);

sig(:,:,1)=D0;
A=A_matrix;
for g=1:T-1



    s=sig(:,:,g)';
    dsig=s*A'+A*s+2*d*eye(90);
    sig(:,:,g+1)=sig(:,:,g)+dsig'*ut;

    

end

Dss=reshape(sig(:,:,T),[90,90]);           %通过时间演化，得到稳态的扩散矩阵
% end

end


    

