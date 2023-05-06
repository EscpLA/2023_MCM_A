clear;clc;close;
load ('data1.mat', 'D');
load rho.mat;

% % 绘制 rho t 图像，观察规律
% x=1:50;
% y=getrho(x);
% plot(x, y, '-', 'Color', [0 0.4470 0.7410], 'LineWidth',1.5)
% box on;
% grid on;
% axis([0, 50, 0, 0.6])
% set(gca, 'LineWidth',1)
% set(gca,'FontSize',25)
% xlabel('Time(/month)')
% ylabel('Environmental factor')

%% 求解微分方程，绘制图像。
[t, N] = ode45('df4', [0:90], D.N0);

%% 绘图
plot(t, N(:,1),  '-', 'color', [0 0.4470 0.7410], 'LineWidth', 1.5);
hold on;
plot(t, N(:,2),  '-', 'color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5);
hold on;
plot(t, N(:,3),  '-', 'color', [0.9290 0.6940 0.1250], 'LineWidth', 1.5);
hold on;
plot(t, N(:,4),  '-', 'color', [0.4940 0.1840 0.5560], 'LineWidth', 1.5);
hold on;

%% 美化
box on;
grid on;
set(gca, 'LineWidth',1)
set(gca,'FontSize',20)

xlabel('t(/month)')
ylabel('N(/plant)')
legend('LeymusChinensis', 'StipaGrandis', 'Wheatgrass', 'ArtemisiaFrigida', Location='best');



