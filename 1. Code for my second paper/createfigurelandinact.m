function createfigurelandinact(xdata1, ydata1, zdata1)
%CREATEFIGURE(xdata1, ydata1, zdata1)
%  XDATA1:  surface xdata
%  YDATA1:  surface ydata
%  ZDATA1:  surface zdata

%  由 MATLAB 于 11-Aug-2023 09:12:00 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 surf
surf(xdata1,ydata1,zdata1,'Parent',axes1,'FaceColor','interp',...
    'EdgeColor','none');

% 创建 zlabel
zlabel({'U'},'FontName','Arial');

% 创建 ylabel
ylabel({'PC2'},'FontName','Arial');

% 创建 xlabel
xlabel({'PC1'},'FontName','Arial');

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[-0.5 1]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[-2 4.7]);
% 取消以下行的注释以保留坐标区的 Z 范围
% zlim(axes1,[0 490]);
view(axes1,[-39.400390625 38.353515625]);
grid(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontName','Arial','FontSize',18,'Projection','perspective',...
    'ZTick',[0 200 400]);
% 创建 textbox
annotation(figure1,'textbox',...
    [0.576520399945884 0.109650944955407 0.180086519114688 0.190066857688634],...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588],...
    'String',{'Resting','state'},...
    'LineStyle','none',...
    'FontSize',18,...
    'FontName','Arial',...
    'FontAngle','italic',...
    'FitBoxToText','off');

