clear;clc;
load points.mat;
x = points(:, 1)';
y = points(:, 2)';

y_smoothed = smooth(y, 101);
plot(x, y, 'o', x, y_smoothed, '-');

xx = 1:0.1:200; % 插值
yy = interp1(x,y,xx,'cubic');
plot(x,y,'o',xx,yy,'linewidth',1)

clear;clc;
% 准备数据
x = [1, 3, 4, 6, 7, 9, 10];
y = [3, 4, 6, 2, 1, 4, 5];

% 进行平滑处理
y_smoothed = smooth(y, 5);

% 绘制折线图
plot(x, y, 'o', x, y_smoothed, '-');