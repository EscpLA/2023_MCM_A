clear;clc;close;
%% 变量说明
% alpha ik 表示物种i对物种k的空间竞争度
% W ik 表示物种i和物种k个体资源库重叠的大小

load data.mat;


[t, N] = ode45('df', [0:25], N0);


plot(t, N(:,1),  '-', 'color', [0 0.4470 0.7410], 'LineWidth', 1.5);
hold on;
plot(t, N(:,2),  '-', 'color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5);
hold on;
plot(t, N(:,3),  '-', 'color', [0.9290 0.6940 0.1250], 'LineWidth', 1.5);
hold on;
plot(t, N(:,4),  '-', 'color', [0.4940 0.1840 0.5560], 'LineWidth', 1.5);
hold on;

box on;
grid on;
set(gca, 'LineWidth',1)
set(gca,'FontSize',25)

xlabel('t(/month)')
ylabel('N(/plant)')
legend('LeymusChinensis', 'StipaGrandis', 'Wheatgrass', 'ArtemisiaFrigida', Location='best');


