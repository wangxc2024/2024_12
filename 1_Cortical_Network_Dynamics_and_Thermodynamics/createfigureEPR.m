function createfigureEPR(X1, YMatrix1)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  x 数据的向量
%  YMATRIX1:  y 数据的矩阵

%  由 MATLAB 于 06-Jun-2023 21:59:27 自动生成

% 创建 figure
figure('OuterPosition',[824 172.5 573 503.5]);

% 创建 axes
axes1 = axes;
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多行
plot(X1,YMatrix1);

% 创建 ylabel
ylabel({'EPR'});

% 创建 xlabel
xlabel({'stimulus to V1'});

box(axes1,'on');
hold(axes1,'off');
