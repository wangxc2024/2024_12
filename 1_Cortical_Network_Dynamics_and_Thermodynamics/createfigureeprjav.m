function createfigureeprjav(X1, Y1, Y2, Y3, Y4)
%CREATEFIGURE(X1, Y1, Y2, Y3, Y4)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量
%  Y2:  y 数据的向量
%  Y3:  y 数据的向量
%  Y4:  y 数据的向量

%  由 MATLAB 于 10-Jun-2023 13:30:00 自动生成

% 创建 figure
figure1 = figure;

% 创建 subplot
subplot1 = subplot(4,1,1,'Parent',figure1);
hold(subplot1,'on');

% 创建 plot
plot(X1,Y1,'Parent',subplot1,'LineWidth',1);

% 创建 ylabel
ylabel({'EPR'});

box(subplot1,'on');
hold(subplot1,'off');
% 创建 subplot
subplot2 = subplot(4,1,2,'Parent',figure1);
hold(subplot2,'on');

% 创建 plot
plot(X1,Y2,'Parent',subplot2,'LineWidth',1,...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);

% 创建 ylabel
ylabel({'slope of EPR'});

box(subplot2,'on');
hold(subplot2,'off');
% 创建 subplot
subplot3 = subplot(4,1,3,'Parent',figure1);
hold(subplot3,'on');

% 创建 plot
plot(X1,Y3,'Parent',subplot3,'LineWidth',1);

% 创建 ylabel
ylabel({'J_a_v'});

box(subplot3,'on');
hold(subplot3,'off');
% 创建 subplot
subplot4 = subplot(4,1,4,'Parent',figure1);
hold(subplot4,'on');

% 创建 plot
plot(X1,Y4,'Parent',subplot4,'LineWidth',1,...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);

% 创建 ylabel
ylabel({'slope of J_a_v'});

% 创建 xlabel
xlabel({'stimulus to V1'});

box(subplot4,'on');
hold(subplot4,'off');
% 创建 line
annotation(figure1,'line',[0.452777777777778 0.455902777777778],...
    [0.110462951234959 0.921469284357188]);

% 创建 line
annotation(figure1,'line',[0.376041666666667 0.378472222222222],...
    [0.108563014566181 0.924002533248892]);

