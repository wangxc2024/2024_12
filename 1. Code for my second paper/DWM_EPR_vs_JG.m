
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
sV1=0;
Np=size(sV1,2);
% Jm=[0.59:0.005:0.79]; %这个只改了Jmax没改后面的Js，要重写一下。
% Jm=[0.21:0.01:0.3];
Jm=[0.21:0.04:0.56];
% Jm=0.243;
Nj=size(Jm,2);
G=[0.21:0.04:0.6];
% G=[0.46:0.01:0.6];
% G=0.48;
Ng=size(G,2);
% paramDWM;
ut=0.002;  
Ns=1;
load('pca0.mat')
Amat=cell(Nj,Ng);
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

for ip=1:Np
    pulse=zeros(30,3);
    pulse(1,1)=sV1(ip); %activation
    
    
%     pulse(16:17,3,1)=sV1(ip);       %inactivation
%     pulse(27:28,3,1)=sV1(ip);
    for bg=1:Ng
%         param=paramJm_G(Jm(b),0.3,ut);
        parfor b=1:Nj
        param=paramJm_G(Jm(b),G(bg),ut);
%         
%         ip+b-1

                        
                        xss=randomxss(param,pulse,100,1,1000);
                
                        [xfix,weight]=statisxss(xss);
                        for iw=1:size(weight,2)
                        if weight(iw)<10
                            xfix(:,iw)=0;
                            weight(1,iw)=0;
                        end
                        end
                        wy=find(weight);
                        xfix=xfix(:,wy);
                        weight=weight(wy);
                            
                        C{b,bg}={[xfix],[weight]};
                        
                        
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
                        A_matrix{ia}=dFmatnum(1,xfix(:,ia),param);
                        end
                
                        Amat{b,bg}=A_matrix;
                %         A_matrix=Amat{1,ip};
                        [EPR,JAV]=geteprSim(param,pulse,10,0,xfix,A_matrix);
                        Epr(b,bg)=sum(EPR.*weight)/sum(weight);
                        Jav(b,bg)=sum(JAV.*weight)/sum(weight);
                        [b,bg]
        
% mt=zeros(1,100);
% nt=0
% for im=1:100
% [mfpt,w,~,~,~]=mfptdwm(Jm(b),G(bg),6,0,3,1,mp);
% mt(im)=mfpt;
% nt=nt+w;
% end
% 
% Mfptr2m(b,bg)=sum(sum(mt))/nt;
% 
% mt=zeros(1,100);
% nt=0
% for im=1:100
% [mfpt,w,~,~,~]=mfptdwm(Jm(b),G(bg),6,1,0,1,mp);
% mt(im)=mfpt;
% nt=nt+w;
% end
% 
% Mfptm2r(b,bg)=sum(sum(mt))/nt;


    %     [X,Y,Pz]=getPss(xfix,Dss,weight,mp);



    %     Uz = -log(Pz);                      %landscape U
    % 
    %     %绘制曲面
    %     Fig = surf(X,Y,Uz); %绘制三维曲面图
    %     shading interp;
        end
    end

end

[X,Y] = meshgrid(Jm,G);
Fig = surf(X,Y,log(real(Epr'))); %绘制三维曲面图
    shading interp;
hold on

% save('xfixweightversusJm_0.59_0.79.mat','C');
% save('corrversusJm_0.59_0.79.mat','sV1','corr','Jm');
% save('AmatversusJm4.17.mat','Amat')
% save('xfixweight_vs_Jmax.mat','sV1','Jm','C');
% save('Amat_vs_Jmax.mat','Amat');
% save('eprjav_vs_Sprb_dense.mat','Sprb','Epr','Jav')

% % plot(sV1,corr)
% plot(sV1,Epr,sV1,Jav)
% smepr=smoothdata(Epr,'gaussian');
% smjav=smoothdata(Jav,'gaussian');
% dEPR=gradient(smepr)./gradient(Jm);%%%%%%%%%%     Jm   or   G      %%%%%%%%%%
% dJAV=gradient(smjav)./gradient(Jm);%%%%%%%%%%     Jm   or   G      %%%%%%%%%%%
% % createfigurebifV1(sV1,dJAV)
% % createfigurebifV1(sV1,dEPR)
% % plot(Jm,Epr,Jm,Jav)
% % [p1,p2]=showtracepca(param,pulse,1,40,xfix);
% createfigureautoCandCC(Jm,smepr,dEPR,smjav,dJAV)%%%%%     Jm   or   G      %%%%%%%%%%%%%%%%%
% save('EPRJav_vs_Jmax.mat')
%             [X,Y] = meshgrid(Jm,G);
%             Fig = surf(X,Y,Epr'); %绘制三维曲面图
%                 shading interp;
%             % save('EPRJav_vs_JmG2.mat')
%             delete(gcp('nocreate'));
% 示例数据

% 
% % 生成更密集的 x 值，用于平滑插值
% x_dense = linspace(min(sV1), max(sV1), 10);
% 
% % 使用插值方法生成平滑的曲线
% y_smooth = interp1(sV1, Epr, x_dense, 'spline');
% 
% % 绘制原始数据和平滑后的曲线
% plot(sV1, Epr, 'bo-', x_dense, y_smooth, 'r-');
% legend('原始数据', '平滑后的曲线');
% param=paramJm(Jm(Nj),ut);
% A_matrix=Amat{Nj,1};
% xfix=C{Nj,1}{1,1};
si=1;
sj=29;
k=1;
for j=1:sj-1
    for i=1:si-1
        if size(Amat{i,j},2)==1
            if size(Amat{i+1,j},2)>1
                xj(k)=Jm(i+1);
                yg(k)=G(j);
                ez(k)=Epr(i+1,j);
                k=k+1;
            end
        end
        if i==1
            if size(Amat{i,j},2)==1
                if size(Amat{i,j+1},2)>1
                    xj(k)=Jm(i);
                yg(k)=G(j+1);
                ez(k)=Epr(i,j+1);
                k=k+1;
                end
            end
        end
        
    end
end


for i=1:si
    for j=1:sj
        cweight(i,j)=max(C{i,j}{1,2}(:));
        ck=maxk(C{i,j}{1,2}(:),3);
        if size(ck,1)>1
            c2weight(i,j)=ck(2);
        else
            c2weight(i,j)=1;
        end
        if size(ck,1)>2
            c3weight(i,j)=ck(3);
        else
            c3weight(i,j)=1;
        end
    end
end

rU=log(c2weight./(1000-2*c2weight));
%  plot(G,log(1./Mfptr2m),G,log(1./Mfptm2r),G,rU)
%  plot(1./rMfp,exp(-rU.^2).*1./cosh(rU))
rMfp=(1./Mfptr2m)+2*(1./Mfptm2r);
rEr=1./Mfptr2m.*(1000-2*c2weight)+1./Mfptm2r.*c2weight*2;
% plot(G,rEr,G,exp(-rU.^2)./(2*exp(-0.5*rU)+exp(0.5*rU)))
k=1;
for j=1:sj
    for i=1:si-1
        if cweight(i,j)-cweight(i+1,j)<0
            ux(k)=Jm(i);
            uy(k)=G(j);
            uepr(k)=Epr(i,j);
            k=k+1;
            break
        end
    end
end
plot3(smoothdata(ux,'gaussian'),smoothdata(uy,'gaussian'),smoothdata(log(uepr)+0.3,'gaussian'))




[X,Y] = meshgrid(Jm,G);
Fig = surf(X,Y,real(Epr')); %绘制三维曲面图
    shading interp;
hold on
plot3(smoothdata(xj,'gaussian'),smoothdata(yg,'gaussian'),smoothdata(log(ez)+0.1,'gaussian'))
plot3(xj,yg,log(ez)+0.1)

figure
plot(smoothdata(ux,'sgolay'),smoothdata(uy,'sgolay'))
hold on
plot(smoothdata(xj,'sgolay'),smoothdata(yg,'sgolay'))
hold on
% Cepr=contour(X,Y,Epr',[min(smoothdata(uepr,'sgolay')),min(smoothdata(uepr,'sgolay'))]);
contour(X,Y,log(Epr'),[log(min(smoothdata(uepr,'sgolay'))),log(min(smoothdata(uepr,'sgolay')))]);
hold on 
contour(X,Y,log(Epr'),[log(min(smoothdata(ez,'sgolay'))),log(min(smoothdata(ez,'sgolay')))])
hold on 
[X,Y] = meshgrid(Jm,G);
Fig = surf(X,Y,log(Epr')); %绘制三维曲面图
    shading interp;
hold on

subplot(3,1,1)
plot(G,Epr)
subplot(3,1,2)
plot(G,rU)
subplot(3,1,3)
plot(G,Mm2r)

plot(Epr,Mm2r)
