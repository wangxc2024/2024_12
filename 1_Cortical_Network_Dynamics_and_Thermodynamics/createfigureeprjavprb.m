function createfigureeprjavprb(X1, Y1, Y2, Y3, Y4)

% load('eprjav_vs_Sprb_dense.mat')
% 
% smepr=smoothdata(Epr,'gaussian');
% smjav=smoothdata(Jav,'gaussian');
% dEPR=gradient(smepr)./gradient(sV1);
% dJAV=gradient(smjav)./gradient(sV1);
% X1=sprb;
% Y1=smepr;
% Y2=dEPR;
% Y3=smjav;
% Y4=dJAV;

%CREATEFIGURE(X1, Y1, Y2, Y3, Y4)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量
%  Y2:  y 数据的向量
%  Y3:  y 数据的向量
%  Y4:  y 数据的向量

%  由 MATLAB 于 10-Aug-2023 05:58:15 自动生成

% 创建 figure
figure1 = figure;

% 创建 subplot
subplot1 = subplot(4,1,1,'Parent',figure1);
hold(subplot1,'on');

% 创建 plot
plot(X1,Y1,'Parent',subplot1,'LineWidth',1);

% 创建 ylabel
ylabel({'EPR'},'FontSize',12,'FontName','Arial');

box(subplot1,'on');
hold(subplot1,'off');
% 创建 subplot
subplot2 = subplot(4,1,2,'Parent',figure1);
hold(subplot2,'on');

% 创建 plot
plot(X1,Y2,'Parent',subplot2,'LineWidth',1,...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);

% 创建 ylabel
ylabel({'slope of EPR'},'FontName','Arial');

box(subplot2,'on');
hold(subplot2,'off');
% 设置其余坐标区属性
set(subplot2,'FontSize',8);
% 创建 subplot
subplot3 = subplot(4,1,3,'Parent',figure1);
hold(subplot3,'on');

% 创建 plot
plot(X1,Y3,'Parent',subplot3,'LineWidth',1);

% 创建 ylabel
ylabel({'J_a_v'},'FontSize',12,'FontName','Arial');

box(subplot3,'on');
hold(subplot3,'off');
% 创建 subplot
subplot4 = subplot(4,1,4,'Parent',figure1);
hold(subplot4,'on');

% 创建 plot
plot(X1,Y4,'Parent',subplot4,'LineWidth',1,...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);

% 创建 ylabel
ylabel({'slope of J_a_v'},'FontName','Arial');

% 创建 xlabel
xlabel({'stimulus to V1'},'FontSize',12,'FontName','Arial');

box(subplot4,'on');
hold(subplot4,'off');
% 创建 line
annotation(figure1,'line',[0.75625 0.75625],...
    [0.687095238095239 0.550000000000001]);

% 创建 line
annotation(figure1,'line',[0.75625 0.75625],...
    [0.466857142857145 0.329761904761907]);

% 创建 line
annotation(figure1,'line',[0.755357142857143 0.755357142857143],...
    [0.249000000000001 0.111904761904763]);

% 创建 line
annotation(figure1,'line',[0.755357142857143 0.755357142857143],...
    [0.904952380952382 0.767857142857144]);

