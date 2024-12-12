function createfigureCCstd(X1, YMatrix1)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  x 数据的向量
%  YMATRIX1:  y 数据的矩阵

%  由 MATLAB 于 14-Jun-2023 21:17:47 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多行
plot(X1,YMatrix1,'Parent',axes1);

% 创建 ylabel
ylabel({'\Delta CC'});

% 创建 xlabel
xlabel({'stimulus'});

box(axes1,'on');
hold(axes1,'off');
% 创建 textbox
annotation(figure1,'textbox',...
    [0.385821428571428 0.663095238095238 0.200785714285714 0.123809523809526],...
    'String','μ+ \sigma',...
    'LineStyle','none',...
    'FontSize',20,...
    'FitBoxToText','off');

% 创建 textbox
annotation(figure1,'textbox',...
    [0.471535714285714 0.221428571428572 0.200785714285714 0.123809523809526],...
    'String','μ - \sigma',...
    'LineStyle','none',...
    'FontSize',20,...
    'FitBoxToText','off');

% 创建 textbox
annotation(figure1,'textbox',...
    [0.709035714285714 0.451190476190477 0.0829285714285715 0.0964285714285719],...
    'String',{'μ'},...
    'LineStyle','none',...
    'FitBoxToText','off');

% 创建 line
annotation(figure1,'line',[0.752678571428571 0.755357142857143],...
    [0.112095238095238 0.926190476190476]);

% 创建 line
annotation(figure1,'line',[0.397321428571429 0.399107142857143],...
    [0.109714285714286 0.921428571428571]);

