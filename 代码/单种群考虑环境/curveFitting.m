%% 拟合 rho 和 t 之间的函数曲线
clear; clc;
load rho.mat;
rho_mean = mean(rho);
x = 1:36;
%% 直接绘图
plot(x, rho, 'color', [0.3010 0.7450 0.9330], 'LineWidth', 1.25);

%% 分割后绘图
rho1=rho(1:12);
rho2=rho(13:24);
rho3=rho(25:36);
x=[1:12];
plot(x, rho1, '-', 'color', [0 0.4470 0.7410], 'LineWidth',1.5);
hold on;
plot(x, rho2, '-', 'color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5)
hold on;
plot(x, rho3, '-', 'color', [0.9290 0.6940 0.1250], 'LineWidth', 1.5)
%% 调整样式
% axis([0, 200, 0, 650])
box on;
grid on;
set(gca, 'LineWidth',1)
xlabel('Time(/month)')
ylabel('Environmental factor')
legend('2020', '2021', '2022')

%% 曲线拟合，取平均，作为拟合样本点
x = 1:12;
rho_ave = (rho1 + rho2 + rho3)./3;


%% 第（4）问，修改外界条件，重新拟合
x_2 = x .* 0.75;
rho_ave_2 = rho_ave*0.6;






