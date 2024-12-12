
clear;
% sV1=[0:80];
% load('xfixweightversusJm_0.59_0.005_0.79.mat')
% load('corrversusJm_0.59_0.79.mat')
% load('xfixweightversusJm4.17.mat')
% load('corrversusJm4.17.mat')
load('xfixweightJm0.3versussV1.mat')
load('corrJm0.3versussV1.mat')
% load('xfix0_J0.3.mat');
% sV1=[0.0:0.002:0.028 0.03:0.0005:0.036 0.038 0.04:0.01:0.1];
% sV1=0.034;     %0.0353meipao
sV1=[0.029:0.0005:0.036];
% sV1=[0.072:0.0005:0.081];
% sV1=[0.078:0.00005:0.0785];
% sV1=0.083;
xfix0=C{1,1,1}(:,3);
Np=size(sV1,2);
% Jm=[0.59:0.005:0.79]; %这个只改了Jmax没改后面的Js，要重写一下。
Jm=0.3;
Nj=size(Jm,2);
% paramDWM;
Tp=0.3;
ut=0.001;
Ns=8;
load('pca0.mat')


if ~matlab.internal.parallel.isPCTInstalled
    error('Parallel Computing Toolbox 未安装或未启用。');
end

% 检查是否已经启动了并行池，如果没有，则创建一个新的
if isempty(gcp('nocreate'))
    % 如果你有多个处理器核心，可以指定希望使用的工作进程数量（workers）
    numWorkers = 3; % 你可以根据自己的系统配置进行调整
    parpool('local', numWorkers);
end


nr=0;
for i=1:30
    
    mpp{1,i}=zeros(90,90);
    mpp{1,i}(i,1)=1;
    mpp{1,i}(i+30,2)=1;
    mpp{1,i}(i+60,3)=1;
end
mpp{1,31}=eye(90,90);

CrCo=zeros(1,Np);
        CrCodv=zeros(1,Np);
        AutoCor=zeros(1,Np);
        stdCrCo=zeros(1,Np);
        stdAutoCor=zeros(1,Np);

parfor ip=1:Np
    pulse=zeros(30,3);
    pulse(1,1)=max(sV1(ip),0);
    pulse(1,2)=-min(sV1(ip),0);
%     pulse(16:17,3,1)=sV1(ip);       %inactivation
%     pulse(27:28,3,1)=sV1(ip);
    for b=1:Nj
%         
%         ip+b-1
         param=paramJm(Jm(b),ut);
% [b,ip]
        
        [yy,uy]=getatracedwm_mex(Tp,xfix0,param,pulse);    
        xfix=yy(:,Tp/ut);
%         [EPR,JAV]=geteprsubspace(param,pulse,Ns,xfix0,mpp);
        [CC,AutoC,stdCC,stdAutoC,CCdv,a,b1,c,d,p,q,A,p0,sa,pc1,pc2,cfun]=getcorr(param,pulse,Ns,xfix,mp,0.5);
%         [AutoC,a,b1,sa,yy]=getautocorr(param,pulse,Ns,xfix0,mp);
%         corr(b,ip)=sum(CC.*weight)/sum(weight);
%         Acorr(b,ip)=sum(AutoC.*weight)/sum(weight);
        if sum(mp(:,1:2)'*(yy(:,1)-yy(:,Tp/ut)))>100
            [b,ip]
        end
%         Epr(:,b,ip)=EPR;
%         Jav(:,b,ip)=JAV;
        CrCo(b,ip)=CC
        CrCodv(b,ip)=CCdv
        AutoCor(b,ip)=AutoC
        stdCrCo(b,ip)=stdCC
        stdAutoCor(b,ip)=stdAutoC
        y1(:,ip)=pc1;
        y2(:,ip)=pc2;
        [b,ip]
        max(abs(pc1))
nr=nr+1;

    %     [X,Y,Pz]=getPss(xfix,Dss,weight,mp);



    %     Uz = -log(Pz);                      %landscape U
    % 
    %     %绘制曲面
    %     Fig = surf(X,Y,Uz); %绘制三维曲面图
    %     shading interp;
    end

end
Np=nr;
% save('xfixweightversusJm_0.59_0.79.mat','C');
% save('corrversusJm_0.59_0.79.mat','sV1','corr','Jm');
% plot(sV1(1:Np),reshape(Corr,[1,Np]),sV1(1:Np),reshape(Epr(31,:,:),[1,Np]),sV1(1:Np),reshape(Jav(31,:,:),[1,Np]))
plot(sV1(1:Np),AutoCor(1:Np),sV1(1:Np),100000*CrCo(1:Np))
plot(y1,y2)
plot(q,p)
plot(b1*ut,a)
% plot(sV1(1:Np),reshape(Corr,[1,Np]))      %0.0334有概率出现corr~10^-3，平常10^-5
% %0.0335还没跑但是很大，0.034太大了，0.0345就过去了
plot(y1,y2)
% xx=reshape(Epr.^0.5,[30,Np+Nj-1]);
% plot(1:30,xx)
% % [p1,p2]=showtracepca(param,pulse,1,40,xfix);
% e=sum(Epr,1);
% plot(sV1,reshape(e(1,1,:),[81,1]))
%0.058 peak of Auto Tao

Ts=1;  
    x=[0:ut:0.9*Ts]';%列向量
    y=p(sa+1:sa+1+0.9*Ts/ut)';
    f=fittype('a*exp(-w*t)+b','independent','t','coefficients',{'a','w','b'});  %fittype是自定义拟合函数
    opt=fitoptions(f);
    opt.StartPoint=[p(sa+1) 1 p(sa+1)/100];
    cfun=fit(x,y,f,opt); %根据自定义拟合函数f来拟合数据x，y
    
    xi=x;
    yi=cfun(xi);
    plot(x,y,xi,yi);
    tao=cfun.w^-1
    
    %%%%%%%%%%%%%%%%
     subplot(4,1,1)
plot(sV1(1:Np),reshape(AutoCor,[1,Np]),sV1(1:Np),reshape(AutoCor,[1,Np])+reshape(stdAutoCor,[1,Np]),sV1(1:Np),reshape(AutoCor,[1,Np])-reshape(stdAutoCor,[1,Np]))
subplot(4,1,2)
dauto=gradient(reshape(AutoCor,[1,Np]))./gradient(sV1(1:Np));
    plot(sV1(1:Np),dauto) 
subplot(4,1,3)

    plot(sV1(1:Np),reshape(CrCo,[1,Np])) 
    plot(sV1(1:Np),reshape(CrCo,[1,Np]),sV1(1:Np),reshape(CrCo,[1,Np])+reshape(stdCrCo,[1,Np]),sV1(1:Np),reshape(CrCo,[1,Np])-reshape(stdCrCo,[1,Np]))

    subplot(4,1,4)
dcro=gradient(reshape(CrCodv,[1,Np]))./gradient(sV1(1:Np));
    plot(sV1(1:Np),dcro) 
    AC=[sV1(1:Np);reshape(AutoCor,[1,Np]); dauto ;reshape(CrCo,[1,Np]); dcro];
createfigureACrels(AC(1,:),AC(2,:),AC(3,:)./AC(2,:),AC(4,:),AC(5,:)./AC(4,:))
createfigureACrels(sV1(1:Np),reshape(AutoCor,[1,Np]),reshape(AutoCor,[1,Np])./reshape(stdAutoCor,[1,Np]),reshape(CrCo,[1,Np]),reshape(CrCo,[1,Np])./reshape(stdCrCo,[1,Np]))

 createfigureACrels(sV1(1:Np),AutoCor,[1,Np],reshape(AutoCor,[1,Np])./reshape(stdAutoCor,[1,Np]),reshape(CrCodv,[1,Np]),reshape(CrCo,[1,Np])./reshape(stdCrCo,[1,Np]))
% 0.07815开始增加 noise=0.1


createfigureAC(sV1(1:Np),log(reshape(AutoCor,[1,Np])),log(reshape(AutoCor,[1,Np])./reshape(stdAutoCor,[1,Np])),log(reshape(CrCo,[1,Np])),log(reshape(CrCo,[1,Np])./reshape(stdCrCo,[1,Np])))
createfigureAC(sV1(1:Np),log(reshape(AutoCor,[1,Np])),reshape(AutoCor,[1,Np])./reshape(stdAutoCor,[1,Np]),log(reshape(CrCo,[1,Np])),reshape(CrCo,[1,Np])./reshape(stdCrCo,[1,Np]))

