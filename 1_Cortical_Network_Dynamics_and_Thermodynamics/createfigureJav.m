function createfigureJav(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 08-Jun-2023 15:53:11 自动生成

% 创建 figure
figure1 = figure('OuterPosition',[501 256 573 503.5]);

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'LineWidth',1);

% 创建 ylabel
ylabel('J_a_v');

% 创建 xlabel
xlabel({'J_m_a_x'});

box(axes1,'on');
hold(axes1,'off');
