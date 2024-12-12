
clear;

% 开始计时
tic;

% 在此处编写您的脚本代码
% ...


kkk=491;
% h=0.01;
h=1; %10/3/2024

X=zeros(90,kkk);

X1=zeros(90,kkk);
% X_result=zeros(90,kkk);

load('xfixweightJm0.3versussV1.mat')
load('corrJm0.3versussV1.mat')
load('pca0.mat')
% load('xfix0_J0.3.mat');
% sV1=[0.0:0.002:0.028 0.03:0.0005:0.036 0.038 0.04:0.01:0.1];
% sV1=0.034;     %0.0353meipao
% sV1=[0.033:0.00005:0.0351];
% sV1=[0.08:0.0005:0.09];
% sV1=[0.078:0.00005:0.0785];
sV1=0.083;
            xfix0=C{1,1,1}(:,1);            % 3=R,1=MA
            xfix1=C{1,1,1}(:,3);
resting=C{1,1,1}(:,3);
memory_a=C{1,1,1}(:,1);
memory_b=C{1,1,1}(:,2);
param=paramJm(0.3,0.001);

            % 
            % pulse1=zeros(30,3);
            % pulse1(1,1)=0.3;
            % pulse2=zeros(30,3);
            % pulse2(1,2)=0.3;
            % 
            % 
            % y1=getatracedwmnoise(5,xfix1,param,pulse1,0,0);
            % y2=getatracedwmnoise(5,xfix1,param,pulse2,0,0);
            % y3=getatracedwmnoise(5,y2(:,5/param.ut),param,pulse1,0,0);
            % 
            % param.Iinput=pulse1;

            % L=y3(:,5/param.ut);     %y3是MB为小坑
            % R=y1(:,5/param.ut);     %y1是MA为大坑
R=memory_a;            %R->L
L=resting;
P1=R+(L-R)/7;
P2=R+2*(L-R)/7;
P3=R+3*(L-R)/7;
P4=R+4*(L-R)/7;
P5=R+5*(L-R)/7;
P6=R+6*(L-R)/7;


% param.Iinput=0;
D=1;
Gn = @(x,param)  diffu_mex(x,param,D,0.01)/D;
t=1;



F90 = @(t, x, param) odeDWM_mex(t, x, param);


% load('please_send_me_to_wxc_4_17.mat')
dF = @(t,x,param) dFmatnum_mex(t,x,param);

% Som_i = @(x,x1,Fx,Fx1,Gn,param,D,h) ...
%         -(1/2/D)*(Fx+Fx1)'/Gn*(x1-x)*0.5 ...
%         +(0.25*h/D)*(x1-x)'/Gn*(x1-x)/h.^2 ...
%         +(0.25*h/D)*0.5*(Fx'/Gn*Fx+Fx1'/Gn*Fx1) ...
%         +(0.25/D)*(x1-x)'/Gn*(Fx1-Fx);
Som_i = @(x,x1,Fx,Fx1,Gn,param,D,h) SOMi_mex(x,x1,Fx,Fx1,Gn,param,D,h);
% F90(t,x,param); F90(t,x1,param); Gn((x1+x)/2,param);      

% dSom = @(x_1,x,x1,Fx,Fx_1,dFx,Gn,param,D,h) ...
%         (Gn)^-1*(2*x-x1-x_1)/2/D/h ...
%         +h/2/D*(Gn)^-1*dFx*Fx ...
%         +1/2/D*(Gn)^-1*dFx*(x-x1) ...
%         +1/2/D*(Gn)^-1*(Fx-Fx_1);
dSom = @(x_1,x,x1,Fx,Fx_1,dFx,Gn,param,D,h) dSOM_mex(x_1,x,x1,Fx,Fx_1,dFx,Gn,param,D,h);
    
% F90(t,x,param),F90(t,x_1,param),dF(t,x,param),Gn(x,param)  ;


% 检查是否已经安装 Parallel Computing Toolbox
if ~matlab.internal.parallel.isPCTInstalled
    error('Parallel Computing Toolbox 未安装或未启用。');
end

% 检查是否已经启动了并行池，如果没有，则创建一个新的
if isempty(gcp('nocreate'))
    % 如果你有多个处理器核心，可以指定希望使用的工作进程数量（workers）
    numWorkers = 4; % 你可以根据自己的系统配置进行调整
    parpool('local', numWorkers);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %     获取计算机的可用核心数
% numCores = feature('numcores');
% disp(['Number of available cores: ' num2str(numCores)]);
% 
% % 设置 MATLAB 的并行计算线程数
% maxNumCompThreads(numCores - 1);

end

nn=1;       
% nn=1;
n_anneal = 30*nn; %一次退火计算的次数                      
n_all = 1;   %一共进行n_all次退火计算                      
kk = 1;


Xmove=zeros(90,kkk,n_anneal/nn);


X(:,1+(kkk-1)/7)=P1; 
    X(:,1+((kkk-1)/7)*2)=P2; 
    X(:,1+((kkk-1)/7)*3)=P3; 
    X(:,1+((kkk-1)/7)*4)=P4; 
    X(:,1+((kkk-1)/7)*5)=P5; 
    X(:,1+((kkk-1)/7)*6)=P6; 
    X(:,1)=R; X(:,kkk)=L; 
   for i=2:((kkk-1)/7)  %设置%重置初始试探路径
        X(:,i)=R+(i-1)*(P1-R)/((kkk-1)/7);
        X(:,i+((kkk-1)/7))=P1+(i-1)*(P2-P1)/((kkk-1)/7);
        X(:,i+((kkk-1)/7)*2)=P2+(i-1)*(P3-P2)/((kkk-1)/7);
        X(:,i+((kkk-1)/7)*3)=P3+(i-1)*(P4-P3)/((kkk-1)/7);
        X(:,i+((kkk-1)/7)*4)=P4+(i-1)*(P5-P4)/((kkk-1)/7);
        X(:,i+((kkk-1)/7)*5)=P5+(i-1)*(P6-P5)/((kkk-1)/7);
        X(:,i+((kkk-1)/7)*6)=P6+(i-1)*(L-P6)/((kkk-1)/7);
        
    end
mmk=0;

while kk < (1 + n_all) %进行500次退火优化并取平均
    kkkk=0;
    T_anneal=1.00001;
    
    X1(:,1)=X(:,1);X1(:,kkk)=X(:,kkk);%手动设置迭代过渡向量的起始点
    S_initial0=0;

                figure
            

    parfor i = 1:(kkk-1)  %计算全序列的Som
            S_initial0 = S_initial0 + Som_i(X(:,i),X(:,i+1),F90(t,X(:,i),param), F90(t,X(:,i+1),param),Gn((X(:,i+1)+X(:,i))/2,param),param,D,h);%%%
    end
    while kkkk < n_anneal  %开始一次退火优化流程
        S_initial = 0;  
        S_modified = 0;
        
                dSdx90 = zeros(90,(kkk-2)); %从第二个点(:,2)到倒数第二个点(:,9999)的dSom/dxy值,共kkk-2个点
        parfor i = 1:(kkk-1)  %计算全序列的Som
            S_initial = S_initial + Som_i(X(:,i),X(:,i+1),F90(t,X(:,i),param),F90(t,X(:,i+1),param),Gn((X(:,i+1)+X(:,i))/2,param),param,D,h);%%%
        end
        parfor i = 1:(kkk-2)  %从第二个点到倒数第二个点计算Som的偏导数

            F1=F90(t,X(:,i+1),param);
            F0=F90(t,X(:,i),param);
            dF1=dF(t,X(:,i+1),param);
            G1=Gn(X(:,i+1),param);
            dSdx90(:,i) = dSom(X(:,i),X(:,i+1),X(:,i+2),F1,F0,dF1,G1,param,D,h); %计算的是X(i+1)位置的导数%%%%%%%%%%%%%%%%%
           
        end

%         
% i=kkk-1;
% S_initial = S_initial + Som_i(X(:,i),X(:,i+1),F90(t,X(:,i),param),F90(t,X(:,i+1),param),Gn((X(:,i+1)+X(:,i))/2,param),param,D,h);%%%
% 
%         
%         X2=zeros(90,1);
%         dSdx90=zeros(90,1);
%         X0=X2;
        parfor i = 1:(kkk-2) %根据S的导数确定每一点的优化
            X2=X(:,i+1);
%             X0=X(:,i);
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             F1=F90(t,X2,param);
%             F0=F90(t,X0,param);
%             dF1=dF(t,X2,param);
%             G1=Gn(X2,param);
%             
%             S_initial = S_initial + Som_i(X0,X2,F0,F1,Gn((X2+X0)/2,param),param,D,h);%%%
%             dSdx90 = dSom(X(:,i),X(:,i+1),X(:,i+2),F1,F0,dF1,G1,param,D,h); %计算的是X(i+1)位置的导数%%%%%%%%%%%%%%%%%
% 
%             
%             
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
            for j=1:90
            if dSdx90(j,i)<0
                X1(j,i+1) = X2(j,1)+0.1*(abs(dSdx90(j,i)))/(sum(abs(dSdx90(:,i))))*T_anneal;
            elseif dSdx90(j,i)==0
                X1(j,i+1) = X2(j,1);
            elseif dSdx90(j,i)>0
                X1(j,i+1) = X2(j,1)-0.1*(abs(dSdx90(j,i)))/(sum(abs(dSdx90(:,i))))*T_anneal;
            end
            if X1(j,i+1)<=0
                X1(j,i+1)=X2(j,1);
            end
            end
%             if dSdx90(2,i)<0
%                 Y1(i+1) = Y(i+1)+0.1*(abs(dSdx90(2,i)))/(abs(dSdx90(1,i))+abs(dSdx90(2,i)))*T_anneal;
%             elseif dSdx90(2,i)==0
%                 Y1(i+1) = Y(i+1);
%             elseif dSdx90(2,i)>0
%                 Y1(i+1) = Y(i+1)-0.1*(abs(dSdx90(2,i)))/(abs(dSdx90(1,i))+abs(dSdx90(2,i)))*T_anneal;
%             end
%             if Y1(i+1)<=0
%                 Y1(i+1)=Y(i+1);
%             end

        end
        parfor i = 1:(kkk-1)  %计算全序列的Som
            S_modified = S_modified + Som_i(X1(:,i),X1(:,i+1),F90(t,X1(:,i),param),F90(t,X1(:,i+1),param),Gn((X1(:,i+1)+X1(:,i))/2,param),param,D,h); %计算全序列的Som%%%%%%%%%%%%%%%%%%
        end                        
        if S_modified <= S_initial   %如果优化成功，就迭代X，Y序列
            X = X1; %Y = Y1;
        elseif S_modified > S_initial
            if exp(-0.075*(S_modified-S_initial)/(T_anneal)) > (rand()) %退火过程
                X = (X1-X)*0.25+X; %Y = (Y1-Y)*0.25+Y;
            else                              
                Xsample = randsample(2:(kkk-1),(kkk-1)/5); %Ysample = randsample(2:(kkk-1),(kkk-1)/5); %如果Metroplis筛选失败就随机改变一些位置的值(起点终点不包括在随机采样中)
                for r = Xsample
                    X(:,r) = 0.5*(X(:,r)+X1(:,r));
                end
%                 for r = Ysample
%                     Y(r) = 0.5*(Y(r)+Y1(r));
%                 end
            end
        end
        T_anneal = 0.5*(1.05-tanh(0.025/nn*(kkkk-115*nn)));  %降低退火温度
        kkkk=kkkk+1;
        mk=floor(kkkk/nn);
        if mk>mmk
            mk
            hold on

            subplot(2,1,1)
            plot(0:h:(kkk-1)*h,mp(:,1)'*X(:,:))
            drawnow
            
            hold on

            subplot(2,1,2)
            plot(0:h:(kkk-1)*h,mp(:,2)'*X(:,:))
            drawnow

            Xmove(:,:,mk)=X;
            

        end
        mmk=mk;
    end
    S_final(kk)=S_modified;
    X_result{kk}(:)=X(:); %将一次退火的结果记录下来
    kk=kk+1;   

    hold off
end


% 获取当前工作文件夹路径
currentFolder = pwd;

% 设置子文件夹名称
subFolder = 'please_send_me_to_wxc'; % 子文件夹名称

% 创建子文件夹
subFolderPath = fullfile(currentFolder, subFolder);
if ~exist(subFolderPath, 'dir')
    mkdir(subFolderPath);
end

% 假设您的工作数据是一个名为 "data" 的变量
% data = [1, 2, 3, 4, 5];

% 保存工作数据到子文件夹中
% save(fullfile(subFolderPath, 'path_r2m_h001.mat'));  % 24.7.19
% save(fullfile(subFolderPath, 'path_m2r_h001.mat'));    %24.7.22
save(fullfile(subFolderPath, 'path_r2m_h1_241003.mat'));    %24.7.23


% 结束计时
elapsedTime = toc;

% 输出经过的时间
disp(['脚本运行时间：', num2str(elapsedTime), ' 秒']);





delete(gcp('nocreate'));
load('pca0.mat')
% plot(mp(:,1)'*X_result{1}(:),mp(:,2)'*X_result{1}(:))
% for i=1:1
%     xr=reshape(X_result{i},[90,841]);
%     hr(i)=plot(mp(:,1)'*xr,mp(:,2)'*xr);
%     hold on
% end
% figure
% for j=1:5
% for i=1:6
% 
% subplot(6,5,i+(j-1)*6)
% plot(0:h:(kkk-1)*h,X(i+(j-1)*6,:),0:h:(kkk-1)*h,X(i+(j-1)*6+30,:),0:h:(kkk-1)*h,X(i+(j-1)*6+60,:))
%     end
% end


% save('pathX1.mat','X_result','mp')

