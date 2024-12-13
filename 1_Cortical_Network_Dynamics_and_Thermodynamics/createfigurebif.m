function createfigurebif(X1, YMatrix1, YData1, XData1, X2, Y1, YData2, XData2, YData3)
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

%  由 MATLAB 于 10-Aug-2023 06:39:05 自动生成

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
    'FaceColor',[0.929411764705882 0.694117647058824 0.125490196078431]);

% 创建 ylabel
ylabel('Stable states');

% 创建 xlabel
xlabel('sV1');

% 创建 title
title('Line Plot with Varying Line Thickness');

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[-0.100268817204301 0.0997311827956989]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[-2.5 2.5]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% 创建 legend
legend(axes1,'show');

