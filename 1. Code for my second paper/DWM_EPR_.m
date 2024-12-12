
clear;
% load('eprjavversusV1.mat', 'EJ')
% sV1=EJ(1,:);
% sV1=[0.034:0.0001:0.035];
% load('xfixweightversusJm_0.59_0.005_0.79.mat')
% load('corrversusJm_0.59_0.79.mat')
% load('xfixweightversusJm4.17.mat')
% load('corrversusJm4.17.mat')
% load('xfixweightJm0.3versussV1.mat')
% load('corrJm0.3versussV1.mat')
% load('xfixweightversussV1_0.03_0.04.mat')
% load('AmatversussV1_0.03_0.04.mat')
sV1=[0.0:0.001:0.02,0.0201:0.0001:0.024,0.02402:0.00002:0.030,0.0301:0.0001:0.036,0.037:0.001:0.1];
sV1=[0.0:0.001:0.1];
% sV1=[0:0.002:0.02 0.0205:0.0005:0.036 0.038:0.002:0.05];
Np=size(sV1,2);
% Jm=[0.59:0.005:0.79]; %这个只改了Jmax没改后面的Js，要重写一下。
Jm=0.3;
Nj=size(Jm,2);
% paramDWM;
ut=0.002;  
Ns=1;
load('pca0.mat')
Amat=cell(Nj,Np);
% load('AmatJm0.3versussV1.mat', 'Amat')
% 检查是否已经安装 Parallel Computing Toolbox
if ~matlab.internal.parallel.isPCTInstalled
    error('Parallel Computing Toolbox 未安装或未启用。');
end

% 检查是否已经启动了并行池，如果没有，则创建一个新的
if isempty(gcp('nocreate'))
    % 如果你有多个处理器核心，可以指定希望使用的工作进程数量（workers）
    numWorkers = 4; % 你可以根据自己的系统配置进行调整
    parpool('local', numWorkers);
end

parfor ip=1:Np
    pulse=zeros(30,3);
%     pulse(1,1)=sV1(ip); %activation
    pulse(16:17,3,1)=sV1(ip);       %inactivation
    pulse(27:28,3,1)=sV1(ip);
    for b=1:Nj
                param=paramJm(Jm(b),ut);
%         
%         ip+b-1

        
        xss=randomxss(param,pulse,1000,1,1000);

        [xfix,weight]=statisxss(xss)
        for iw=1:size(weight,2)
        if weight(iw)<10
            xfix(:,iw)=0;
            weight(1,iw)=0;
        end
        end
        wy=find(weight);
        xfix=xfix(:,wy);
        weight=weight(wy);
            
        C{b,ip}={[xfix],[weight]};
        
        
%     %     [mp,sc,va]=pca(xss');
    % % 
    %     save('pca0.mat','mp')
        
%         showinpca(xss,mp);
%          A_matrix=getmatrix(xfix,param);
    %     Dss=A_matrix*0;
%         d=0.05;
%         for i=1:size(xfix,2)
% 
%             Dss{i}=getsigma(d,A_matrix{i});
% 
%         end
%         xfix=C{ip,b,1};
%         weight=C{ip,b,2};


%         xfix=C{ip,b}{1,1};
%         weight=C{ip,b}{1,2};
        A_matrix=cell(1,size(xfix,2));
param.Iinput=pulse;
%         A_matrix=getmatrix(xfix,param);
        for ia=1:size(xfix,2)
        A_matrix{ia}=dFmatnum_mex(1,xfix(:,ia),param);
        end

        Amat{b,ip}=A_matrix;
%         A_matrix=Amat{1,ip};
        [EPR,JAV]=geteprSim(param,pulse,1,1,xfix,A_matrix);
        Epr(b,ip)=sum(EPR.*weight)/sum(weight);
        Jav(b,ip)=sum(JAV.*weight)/sum(weight);
        [b,ip]



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
% save('AmatversusJm4.17.mat','Amat')
% save('xfixweightversusV10_001.mat','sV1','C');
% save('AmatversussV10_001.mat','Amat');
% save('eprjav_vs_Sprb_dense.mat','Sprb','Epr','Jav')

% % plot(sV1,corr)
% plot(sV1,Epr,sV1,Jav)
smepr=smoothdata(Epr,'gaussian');
smjav=smoothdata(Jav,'gaussian');
dEPR=gradient(smepr)./gradient(sV1);
dJAV=gradient(smjav)./gradient(sV1);
% createfigurebifV1(sV1,dJAV)
% createfigurebifV1(sV1,dEPR)
% plot(Jm,Epr,Jm,Jav)
% [p1,p2]=showtracepca(param,pulse,1,40,xfix);
createfigureautoCandCC(sV1,smepr,dEPR,smjav,dJAV)
% save('EPRJav_vs_sV1.mat')
delete(gcp('nocreate'));
% 示例数据
createfigureeprjav(sV1,smepr,dEPR,smjav,dJAV)


% 生成更密集的 x 值，用于平滑插值
x_dense = linspace(min(sV1), max(sV1), 10);

% 使用插值方法生成平滑的曲线
y_smooth = interp1(sV1, Epr, x_dense, 'spline');

% 绘制原始数据和平滑后的曲线
plot(sV1, Epr, 'bo-', x_dense, y_smooth, 'r-');
legend('原始数据', '平滑后的曲线');
