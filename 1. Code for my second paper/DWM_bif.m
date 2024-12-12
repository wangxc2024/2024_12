
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
% sV1=[0.0:0.001:0.02,0.0201:0.0001:0.024,0.02402:0.00002:0.030,0.0301:0.0001:0.036,0.037:0.001:0.1];
% sV1=[-1*sV1,sV1];
sV1=[-0.1:0.05:0.1];
Sprb=[0.0:0.004:0.16];
% sV1=Sprb;
% sV1=[0:0.002:0.02 0.0205:0.0005:0.036 0.038:0.002:0.05];
Np=size(sV1,2);
% Jm=[0.59:0.005:0.79]; %这个只改了Jmax没改后面的Js，要重写一下。
Jm=0.3;
Nj=size(Jm,2);
% paramDWM;
ut=0.002;  
Ns=1;
load('pca0.mat')
mp1=mp(:,1)';


% 检查是否已经安装 Parallel Computing Toolbox
if ~matlab.internal.parallel.isPCTInstalled
    error('Parallel Computing Toolbox 未安装或未启用。');
end

% 检查是否已经启动了并行池，如果没有，则创建一个新的
if isempty(gcp('nocreate'))
%     % 如果你有多个处理器核心，可以指定希望使用的工作进程数量（workers）
%     numWorkers = 4; % 你可以根据自己的系统配置进行调整
%     parpool('local', numWorkers);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % 获取计算机的可用核心数
numCores = feature('numcores');
disp(['Number of available cores: ' num2str(numCores)]);

% 设置 MATLAB 的并行计算线程数
maxNumCompThreads(numCores - 1);

end


pss1=zeros(1,Np);
pss2=zeros(1,Np);
pss3=zeros(1,Np);

wss1=zeros(1,Np);
wss2=zeros(1,Np);
wss3=zeros(1,Np);

for ip=1:Np
    pulse=zeros(30,3);
    pulse(1,1)=max([sV1(ip),0]); %activation
    pulse(1,2)=abs(min([sV1(ip),0])); %activation
%     pulse(16:17,3,1)=sV1(ip);       %inactivation
%     pulse(27:28,3,1)=sV1(ip);
    for b=1:Nj
                param=paramJm(Jm(b),ut);
%         
%         ip+b-1

        
        xss=randomxss(param,pulse,300);

        [xfix,weight]=statisxss(xss);
        for iw=1:size(weight,2)
        if weight(iw)<3
            xfix(:,iw)=0;
            weight(1,iw)=0;
        end
        end
        wy=find(weight);
        xfix=xfix(:,wy);
        weight=weight(wy);
            
        C{b,ip}={[xfix],[weight]};
        
        PC=mp1*xfix;


% Sort the array in descending order
[PC,K] = sort(PC, 'descend');
Wei=weight(K);

pss=zeros(1,3);
wss=zeros(1,3);

if size(PC,2)==3
    pss=PC;

    wss=Wei;

elseif size(PC,2)==2
    pss(1)=PC(1);
    pss(2)=[];
    pss(3)=PC(2);
    wss(1)=Wei(1);
    wss(2)=[];
    wss(3)=Wei(2);
elseif size(PC)==1
    pss(1)=0;
    pss(2)=PC(1);
    pss(3)=0;
    wss(1)=0;
    wss(2)=Wei(1);
    wss(3)=0;
else
    sV1(ip)
    PC
end
    pss1(ip)=pss(1);
    pss2(ip)=pss(2);
    pss3(ip)=pss(3);
    wss1(ip)=wss(1);
    wss2(ip)=wss(2);
    wss3(ip)=wss(3);



        
        
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


% %         xfix=C{ip,b}{1,1};
% %         weight=C{ip,b}{1,2};
%         A_matrix=cell(1,size(xfix,2));
% param.Iinput=pulse;
% %         A_matrix=getmatrix(xfix,param);
%         for ia=1:size(xfix,2)
%         A_matrix{ia}=dFmatnum_mex(1,xfix(:,ia),param);
%         end
% 
%         Amat{b,ip}=A_matrix;
% %         A_matrix=Amat{1,ip};
%         [EPR,JAV]=geteprSim(param,pulse,xfix,A_matrix);
%         Epr(b,ip)=sum(EPR.*weight)/sum(weight);
%         Jav(b,ip)=sum(JAV.*weight)/sum(weight);
%         [b,ip]



    %     [X,Y,Pz]=getPss(xfix,Dss,weight,mp);



    %     Uz = -log(Pz);                      %landscape U
    % 
    %     %绘制曲面
    %     Fig = surf(X,Y,Uz); %绘制三维曲面图
    %     shading interp;
    end

end
% 
% nonZeroIndices = pss1 ~= 0;
% pss1 = pss1(nonZeroIndices);
% nonZeroIndices = pss2 ~= 0;
% pss2 = pss2(nonZeroIndices);
% nonZeroIndices = pss3 ~= 0;
% pss3 = pss3(nonZeroIndices);
delete(gcp('nocreate'));
% 示例数据


% Example data
x = sV1;
y = [pss1;pss2;pss3];
line_thickness = [wss1;wss2;wss3]; % The array representing line thickness for each set of y values

% Plot the data with varying line thickness
figure;
for i = 1:size(y, 1)
    yy=y(i,find(y(i,:)));
    xx=x(find(y(i,:)));
    lx=smoothdata(0.003*line_thickness(i,find(y(i,:))),'gaussian',8)/3;
    lx=tanh(lx.^1.8*60)/15;
    plot(xx, yy);
    patch([xx fliplr(xx)],[yy+lx fliplr(yy-lx)], [0.93333, 0.83529, 0.82353],'edgealpha', '0', 'facealpha', '1')


    hold on;
end
hold off;







% Add labels and title
xlabel('sV1');
ylabel('Stable states');
title('Line Plot with Varying Line Thickness');
legend('Dataset 1', 'Dataset 2', 'Dataset 3'); % You can customize the legend accordingly
grid on;


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
lx1=smoothdata(0.003*line_thickness(1,find(y(1,:))),'gaussian',8)/3;
lx1=tanh(lx1.^1.8*60)/15;
lx2=smoothdata(0.003*line_thickness(2,find(y(2,:))),'gaussian',8)/3;
lx2=tanh(lx2.^1.8*60)/15;
lx3=smoothdata(0.003*line_thickness(3,find(y(3,:))),'gaussian',8)/3;
lx3=tanh(lx3.^1.8*60)/15;

createfigurebifvsV1(xx, y([1 3],1:18), [yy+lx1 fliplr(yy-lx1)], [xx fliplr(xx)], x, y(2,:), [yy+lx2 fliplr(yy-lx2)], [x fliplr(x)], [yy+lx3 fliplr(yy-lx3)])
function createfigurebifvsV1(X1, YMatrix1, YData1, XData1, X2, Y1, YData2, XData2, YData3)

% DWM_bif;

%CREATEFIGURE(X1, YMatrix1, YData1, XData1, X2, Y1, YData2, XData2, YData3)
%  X1:  x 数据的向量
%  YMATRIX1:  y 数据的矩阵
%  YDATA1:  patch ydata
%  XDATA1:  patch xdata
%  X2:  x 数据的向量
%  Y1:  y 数据的向量
%  YDATA2:  patch ydata
%  XDATA2:  patch xdata
%  YDATA3:  patch ydata

%  由 MATLAB 于 10-Aug-2023 07:02:21 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多行
plot1 = plot(X1,YMatrix1);
set(plot1(1),'DisplayName','Dataset 1');

% 创建 patch
patch('DisplayName','Dataset 2','Parent',axes1,'YData',YData1,...
    'XData',XData1,...
    'EdgeAlpha',0,...
    'FaceColor',[0 0.447058823529412 0.741176470588235]);

% 创建 plot
plot(X2,Y1,'DisplayName','Dataset 3');

% 创建 patch
patch('Parent',axes1,'YData',YData2,'XData',XData2,'EdgeAlpha',0,...
    'FaceColor',[0.231372549019608 0.380392156862745 0.0352941176470588]);

% 创建 patch
patch('Parent',axes1,'YData',YData3,'XData',XData1,'EdgeAlpha',0,...
    'FaceColor',[0.850980392156863 0.325490196078431 0.0980392156862745]);

% 创建 ylabel
ylabel(['Stable states';'PC1          '],'FontSize',12,'FontName','Arial');

% 创建 xlabel
xlabel('input to V1','FontSize',12,'FontName','Arial');

grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontName','Arial','FontSize',9,'GridAlpha',0.05,'LineWidth',1,...
    'MinorGridAlpha',0.1,'TickDir','out','XTick',[-0.1 -0.03 0 0.03 0.1],...
    'YTick',[-3 0 3]);
% 创建 textbox
annotation(figure1,'textbox',...
    [0.698214285714286 0.309178743961352 0.180357142857142 0.14975845410628],...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745],...
    'String',{'Memory A'},...
    'LineStyle','none',...
    'FontSize',12,...
    'FontName','Arial',...
    'FontAngle','italic',...
    'FitBoxToText','off');

% 创建 textbox
annotation(figure1,'textbox',...
    [0.170535714285714 0.652173913043478 0.172321428571428 0.14975845410628],...
    'Color',[0.00784313725490196 0.372549019607843 0.619607843137255],...
    'String','Memory B',...
    'LineStyle','none',...
    'FontSize',12,...
    'FontName','Arial',...
    'FontAngle','italic',...
    'FitBoxToText','off');

% 创建 textbox
annotation(figure1,'textbox',...
    [0.456357142857143 0.379227053140096 0.115964285714286 0.14975845410628],...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588],...
    'String','Resting',...
    'LineStyle','none',...
    'FontSize',12,...
    'FontName','Arial',...
    'FontAngle','italic',...
    'FitBoxToText','off');

end