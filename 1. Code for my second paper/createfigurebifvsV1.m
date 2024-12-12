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
