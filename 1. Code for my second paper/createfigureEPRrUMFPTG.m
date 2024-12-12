function createfigureEPRrUMFPTG(X1, Y1, Y2, Y3)
%CREATEFIGURE(X1, Y1, Y2, Y3)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量
%  Y2:  y 数据的向量
%  Y3:  y 数据的向量

%  由 MATLAB 于 19-Sep-2023 10:39:04 自动生成

% 创建 figure
figure1 = figure;

% 创建 subplot
subplot1 = subplot(3,1,1,'Parent',figure1);
hold(subplot1,'on');

% 创建 plot
plot(X1,Y1,'Parent',subplot1,'LineWidth',2,'Color',[0 0 0]);

% 创建 ylabel
ylabel({'EPR'});

box(subplot1,'on');
hold(subplot1,'off');
% 设置其余坐标区属性
set(subplot1,'FontName','Arial','FontSize',16,'XTick',...
    [0.46 0.48 0.5 0.52 0.54 0.56 0.58 0.6]);
% 创建 subplot
subplot2 = subplot(3,1,2,'Parent',figure1);
hold(subplot2,'on');

% 创建 plot
plot(X1,Y2,'Parent',subplot2,'LineWidth',2,...
    'Color',[0.149019607843137 0.149019607843137 0.149019607843137]);

% 创建 ylabel
ylabel({'relative stability'});

box(subplot2,'on');
hold(subplot2,'off');
% 设置其余坐标区属性
set(subplot2,'FontName','Arial','FontSize',16);
% 创建 subplot
subplot3 = subplot(3,1,3,'Parent',figure1);
hold(subplot3,'on');

% 创建 plot
plot(X1,Y3,'Parent',subplot3,'LineWidth',2,...
    'Color',[0.149019607843137 0.149019607843137 0.149019607843137]);

% 创建 ylabel
ylabel({'MFPT (M to R)'});

% 创建 xlabel
xlabel({'global connection G'});

box(subplot3,'on');
hold(subplot3,'off');
% 设置其余坐标区属性
set(subplot3,'FontName','Arial','FontSize',16,'YTickLabel',{'0','5000'});
% 创建 line
annotation(figure1,'line',[0.13125 0.905357142857143],...
    [0.591857142857143 0.592857142857143]);

