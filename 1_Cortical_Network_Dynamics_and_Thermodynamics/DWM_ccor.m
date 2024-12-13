
clear;
sV1=[0];
% Jm=[0.59:0.005:0.79]; %这个只改了Jmax没改后面的Js，要重写一下。
% load('xfixweightJm0.3versussV1.mat')
% load('corrJm0.3versussV1.mat')
% clear('corr');
Np=size(sV1,2);
Np=5;
sV1=0.03;
Nj=size(Jm,2);
% paramDWM;
% C=cell(Np,Nj);
Ns=3;
load('pca0.mat')
for ip=1:Np
    pulse=zeros(30,3);
    pulse(1,1)=sV1(ip);
    for b=1:Nj
        
        ip+b-1
        param=paramJm(Jm(b),0.001);
%         xss=randomxss(param,pulse,100);
% 
%         [xfix,weight]=statisxss(xss);
%         C{ip,b}={[xfix],[weight]};
    %     [mp,sc,va]=pca(xss');
    % % 
    %     save('pca0.mat','mp')
        
%         showinpca(xss,mp);
%         A_matrix=getmatrix(xfix,param);
    %     Dss=A_matrix*0;
%         d=0.05;
%         for i=1:size(xfix,2)
% 
%             Dss{i}=getsigma(d,A_matrix{i});
% 
%         end
        xfix=C{ip,b,1};
        weight=C{ip,b,2};

%         [CC,a,b1,c,d,yy]=getcorr(param,pulse,Ns,xfix,mp);
        [AutoC,a,b1,sa,yy]=getautocorr(param,pulse,Ns,xfix,mp);
%         corr(b,ip)=sum(CC.*weight)/sum(weight);
        Acorr(b,ip)=sum(AutoC.*weight)/sum(weight);



    %     [X,Y,Pz]=getPss(xfix,Dss,weight,mp);



    %     Uz = -log(Pz);                      %landscape U
    % 
    %     %绘制曲面
    %     Fig = surf(X,Y,Uz); %绘制三维曲面图
    %     shading interp;
    end

end
% save('xfixweightversusJm_0.59_0.79.mat','C');
% save('corrversusJm_0.59_0.79.mat','sV1','corr','Jm');
% plot(sV1,corr)
plot(sV1(1:Np),Acorr)
% plot(mp(:,1)'*yy,mp(:,2)'*yy)
% [p1,p2]=showtracepca(param,pulse,1,40,xfix);

