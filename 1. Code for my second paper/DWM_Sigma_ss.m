
load('A_m1_dwm_01_03.mat','A_matrix')

d=0.05;

Tp=1;
ut=0.0001;
T=Tp/ut;
sig=zeros(90,90,T);

for i=1:3
    A=A_matrix{1,i};
    for g=1:T-1



        s=sig(:,:,g)';
        dsig=s*A'+A*s+2*d*eye(90);
        sig(:,:,g+1)=sig(:,:,g)+dsig'*ut;

    end
    Dss{1,i}=reshape(sig(:,:,T),[90,90]);           %通过时间演化，得到稳态的扩散矩阵
end

% save('Dss3.mat','Dss','d')

a=reshape(sig(1,3,:),[1,T]);

plot(a)


    

