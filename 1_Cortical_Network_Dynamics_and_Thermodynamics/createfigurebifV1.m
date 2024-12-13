function createfigurebifV1(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 08-Jun-2023 17:58:36 自动生成

% 创建 figure
figure1 = figure('OuterPosition',[661 225.5 573 503.5]);

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1);

% 创建 ylabel
ylabel({'EPR'});

% 创建 xlabel
xlabel({'stimulus to V1'});

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[0 0.200000002980232]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[600 1200]);
box(axes1,'on');
hold(axes1,'off');
% 创建 line
annotation(figure1,'line',[0.261805555555556 0.267013888888889],...
    [0.109829639012033 0.92273590880304]);

% 创建 textbox
annotation(figure1,'textbox',...
    [0.222428571428571 0.784523809523811 0.04275 0.0702380952380952],...
    'String',{'bif'},...
    'LineStyle','none',...
    'FitBoxToText','off');

