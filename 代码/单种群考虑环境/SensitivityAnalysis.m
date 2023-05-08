%% 灵敏度分析代码
% 基于羊草的种群增长模型 ，对最大生长率r_i进行灵敏度分析。
clear;clc;
load sensitivity.mat;
load('sensitivity.mat', 'sensitivity')
%% 使用 ODE45 求解微分方程的数值解，进而绘图。
N0 = 50;
t_range = 90;
n = length(sensitivity)
global i;

color = [0 0.4470 0.7410;0.8500 0.3250 0.0980;0.9290 0.6940 0.1250;0.4940 0.1840 0.5560;0.4660 0.6740 0.1880;0.3010 0.7450 0.9330];

% 羊草
for i = 1:n
    %N0 = N0 * (1+sensitivity(i));
    [t, N] = ode45('dF1', [0, t_range], N0);
    plot(t, N,  '-', 'color', color(i, :), 'LineWidth', 1.5);
    hold on;
end


box on;
grid on;
set(gca, 'LineWidth',1)
set(gca,'FontSize',20)

xlabel('t(/month)')
ylabel('N(/plant)')
%legend('N=0.96N0', 'N=0.98N0', 'N=N0', 'N=1.02N0','N=1.04N0', Location='best');
% legend('Li=0.96Li0', 'Li=0.98Li0', 'Li=Li0', 'Li=1.02Li0','Li=1.04Li0', Location='best');
legend('K=0.96K0', 'K=0.98K0', 'K=K0', 'K=1.02K0','K=1.04K0', Location='best');