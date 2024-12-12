function createfigure6areaspath(X1, YMatrix1, YMatrix2, YMatrix3, YMatrix4, YMatrix5, YMatrix6)
% load('plotFig3b.mat')
% createfigure6areaspath(0:1/(kkk-1):1, [xm2r(31,:);xr2m(31,:)], [xm2r(35,:);xr2m(35,:)], [xm2r(41,:);xr2m(41,:)], [xm2r(53,:);xr2m(53,:)], [xm2r(55,:);xr2m(55,:)], [xm2r(60,:);xr2m(60,:)])

% k=1;
% for i=[31 35 41 53 55 60]
%     i=i-30;
%     subplot(2,3,k)
%     plot(0:h:(kkk-1)*h,xm2r(i+30,:))
%     hold on
%     plot(0:h:(kkk-1)*h,xr2m(i+30,:))
% hold on
%     k=k+1;
% end


%CREATEFIGURE(X1, YMatrix1, YMatrix2, YMatrix3, YMatrix4, YMatrix5, YMatrix6)
%  X1:  x 数据的向量
%  YMATRIX1:  y 数据的矩阵
%  YMATRIX2:  y 数据的矩阵
%  YMATRIX3:  y 数据的矩阵
%  YMATRIX4:  y 数据的矩阵
%  YMATRIX5:  y 数据的矩阵
%  YMATRIX6:  y 数据的矩阵

%  由 MATLAB 于 09-Aug-2023 12:49:51 自动生成

% 创建 figure
figure1 = figure('WindowState','maximized');

% 创建 subplot
subplot1 = subplot(2,3,1,'Parent',figure1);
hold(subplot1,'on');

% 使用 plot 的矩阵输入创建多行
plot1 = plot(X1,YMatrix1,'Parent',subplot1,'LineWidth',2);
set(plot1(1),...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);
set(plot1(2),...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588]);

% 创建 title
title({'V1  hie=1'});

% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(subplot1,[0 0.1]);
hold(subplot1,'off');
% 设置其余坐标区属性
set(subplot1,'LineWidth',2,'XTick',[0 1 2],'YTick',[0 0.05 0.1]);
% 创建 subplot
subplot2 = subplot(2,3,2,'Parent',figure1);
hold(subplot2,'on');

% 使用 plot 的矩阵输入创建多行
plot2 = plot(X1,YMatrix2,'Parent',subplot2,'LineWidth',2);
set(plot2(1),...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);
set(plot2(2),...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588]);

% 创建 ylabel
ylabel({''});

% 创建 title
title({'MT hie=5'});

% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(subplot2,[0 0.2]);
hold(subplot2,'off');
% 设置其余坐标区属性
set(subplot2,'LineWidth',2,'XTick',[0 1 2],'YTick',[0 0.1 0.2]);
% 创建 subplot
subplot3 = subplot(2,3,3,'Parent',figure1);
hold(subplot3,'on');

% 使用 plot 的矩阵输入创建多行
plot3 = plot(X1,YMatrix3,'Parent',subplot3,'LineWidth',2);
set(plot3(1),'DisplayName','M to R',...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);
set(plot3(2),'DisplayName','R to M',...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588]);

% 创建 title
title({'F1 hie=11'});

% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(subplot3,[0 0.5]);
hold(subplot3,'off');
% 设置其余坐标区属性
set(subplot3,'LineWidth',2,'XTick',[0 1 2],'YTick',[0 0.25 0.5]);
% 创建 legend
legend1 = legend(subplot3,'show');
set(legend1,...
    'Position',[0.871990740740741 0.897825629808793 0.0736111099728279 0.0652311571871954],...
    'FontSize',14,...
    'EdgeColor',[1 1 1]);

% 创建 subplot
subplot4 = subplot(2,3,4,'Parent',figure1);
hold(subplot4,'on');

% 使用 plot 的矩阵输入创建多行
plot4 = plot(X1,YMatrix4,'Parent',subplot4,'LineWidth',2);
set(plot4(1),...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);
set(plot4(2),...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588]);

% 创建 title
title({'F2 hie=23'});

% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(subplot4,[0 0.8]);
hold(subplot4,'off');
% 设置其余坐标区属性
set(subplot4,'LineWidth',2,'XTick',[0 1 2],'YTick',[0 0.4 0.8]);
% 创建 subplot
subplot5 = subplot(2,3,5,'Parent',figure1);
hold(subplot5,'on');

% 使用 plot 的矩阵输入创建多行
plot5 = plot(X1,YMatrix5,'Parent',subplot5,'LineWidth',2);
set(plot5(1),...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);
set(plot5(2),...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588]);

% 创建 title
title({'ProM hie=25'});

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(subplot5,[0 1]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(subplot5,[0 0.800000011920929]);
hold(subplot5,'off');
% 设置其余坐标区属性
set(subplot5,'LineWidth',2,'XTick',[0 1 2],'YTick',[0 0.4 0.8]);
% 创建 subplot
subplot6 = subplot(2,3,6,'Parent',figure1);
hold(subplot6,'on');

% 使用 plot 的矩阵输入创建多行
plot6 = plot(X1,YMatrix6,'Parent',subplot6,'LineWidth',2);
set(plot6(1),...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);
set(plot6(2),...
    'Color',[0.231372549019608 0.380392156862745 0.0352941176470588]);

% 创建 ylabel
ylabel({''});

% 创建 title
title({'24c hie=30'});

hold(subplot6,'off');
% 设置其余坐标区属性
set(subplot6,'LineWidth',2,'XTick',[0 1 2],'YTick',[0 0.4 0.8]);
% 创建 line
annotation(figure1,'line',[0.226736111111111 0.226736111111111],...
    [0.921469284357188 0.848638378720709],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.225000000000001 0.225000000000001],...
    [0.262191260291324 0.189360354654845],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.227083333333333 0.227083333333333],...
    [0.819506016466118 0.746675110829639],...
    'Color',[1 0.411764705882353 0.16078431372549],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.789236111111112 0.789236111111112],...
    [0.727042431918937 0.654211526282458],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.793402777777779 0.793402777777779],...
    [0.257758074730843 0.184927169094364],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.514930555555556 0.514930555555556],...
    [0.255858138062065 0.183027232425586],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.509722222222224 0.509722222222224],...
    [0.92273590880304 0.849905003166562],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.518055555555556 0.518055555555556],...
    [0.335655478150729 0.26282457251425],...
    'Color',[1 0.411764705882353 0.16078431372549],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.512847222222223 0.512847222222223],...
    [0.808739708676377 0.735908803039899],...
    'Color',[1 0.411764705882353 0.16078431372549],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.795138888888889 0.795138888888889],...
    [0.369221025965801 0.296390120329322],...
    'Color',[1 0.411764705882353 0.16078431372549],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.790625 0.790625],...
    [0.671944268524382 0.599113362887904],...
    'Color',[1 0.411764705882353 0.16078431372549],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 line
annotation(figure1,'line',[0.227083333333334 0.227083333333334],...
    [0.329322355921469 0.25649145028499],...
    'Color',[1 0.411764705882353 0.16078431372549],...
    'LineWidth',2,...
    'LineStyle','--');

% 创建 textbox
annotation(figure1,'textbox',...
    [0.48774639580603 -0.12410959317229 0.0671520314547838 0.188095238095238],...
    'String','Time',...
    'LineStyle','none',...
    'FontSize',18,...
    'FontName','Arial',...
    'FontAngle','italic',...
    'FitBoxToText','off');

% 创建 textbox
annotation(figure1,'textbox',...
    [0.050593618028251 0.375573750716247 0.0671520314547837 0.188095238095238],...
    'String',{'S_i'},...
    'LineStyle','none',...
    'FontSize',24,...
    'FontName','Arial',...
    'FontAngle','italic',...
    'FitBoxToText','off');

