function createfigureMFPT_EPR(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 24-Nov-2023 18:33:27 自动生成

% 创建 figure
figure1 = figure('OuterPosition',[473 95 713 683.5]);

% 创建 axes
axes1 = axes;
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'Marker','o','LineWidth',3,...
    'Color',[0.635294117647059 0.0784313725490196 0.184313725490196]);

% 创建 ylabel
ylabel({'MFPT (M to R)'});

% 创建 xlabel
xlabel({'EPR'});

box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontName','Arial','FontSize',20,'YTick',[0 2000 4000 6000]);
% 创建 textbox
annotation(figure1,'textbox',...
    [0.00171428571428572 0.812500000000001 0.155428571428571 0.185833333333333],...
    'String','(e)',...
    'LineStyle','none',...
    'FontSize',22,...
    'FontName','Arial',...
    'FitBoxToText','off');

