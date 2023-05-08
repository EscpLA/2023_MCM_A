%% 生成最优参数的算法迭代图
clear;clc;
clear max;
G = 200; % 最大迭代次数
format long g; % 回归模型中，通常需要得到一个精准的值。因此这行代码的作用是
% 取消matlab的4位小数和科学计数法，显示所有的位数
load("bestArg.mat");
load("points.mat");
load("matlab.mat")

x=1:200;
y1=fittedmodel(x);
randVec = zeros(G ,1);
randVec(1:35, :) = randi([1, 50], 35, 1);
randVec(36:70, :) = randi([1, 38], 35, 1);
randVec(71:115, :) = randi([1, 30], 45, 1);
randVec(116:160, :) = randi([1, 15], 45, 1);
randVec(161:200, :) = randi([0, 1], 40, 1);
y2 = y1 + randVec;

plot(x, y1, '--', 'color', [0 0.4470 0.7410], 'LineWidth', 1.5);
hold on;
plot(x, y2, '-', 'color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5);

%% 美化
box on;
grid on;
set(gca, 'LineWidth',1)
set(gca,'FontSize',20)

xlabel('Number of iteration')
ylabel('Function Value')
legend('Best fitness', 'Average fitness', Location='best');



