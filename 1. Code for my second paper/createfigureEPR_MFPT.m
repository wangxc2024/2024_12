function createfigureEPR_MFPT(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 19-Sep-2023 11:28:05 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'Marker','o','LineWidth',3,...
    'Color',[0.701960784313725 0.0470588235294118 0]);

% 创建 ylabel
ylabel({'MFPT (M to R)'});

% 创建 xlabel
xlabel({'EPR'});

box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontName','Arial','FontSize',20,'YTick',[0 2000 4000 6000]);
