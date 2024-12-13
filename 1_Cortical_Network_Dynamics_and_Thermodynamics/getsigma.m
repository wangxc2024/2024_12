function [Dss]=getsigma(d,A_matrix)

% load('A_m1_dwm_01_03.mat','A_matrix')

Tp=10;
    ut=0.0001;
    T=Tp/ut;
% sig=zeros(90,90,T);


A=A_matrix;
% for g=1:T-1
% 
% 
% %     syms s
%     s=sig(:,:,g)';
%     dsig=s*A'+A*s+2*d*eye(90);
%     sig(:,:,g+1)=sig(:,:,g)+dsig'*ut;
% %     Dss=linsolve(s*A'+A*s+2*d*eye(90)==0,s)';
%     
% 
% end
D1=lyap(A, 2*d*eye(90));
% if isreal(D1)
     Dss=D1;
% else
% for g=1:T-1
% 
%  
%     A
%     
%     s=sig(:,:,g)';
%     dsig=s*A'+A*s+2*d*eye(90);
%     sig(:,:,g+1)=sig(:,:,g)+dsig'*ut;
% 
% end  
% Dss=reshape(sig(:,:,T),[90,90]);           %通过时间演化，得到稳态的扩散矩阵
% end
% % save('Dss3.mat','Dss','d')
% 
% a=reshape(sig(1,3,:),[1,T]);
% 
% plot(a)
end


    

