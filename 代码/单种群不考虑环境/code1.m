clear;clc;
x = dsolve('DN = r*N*(1-N/K)', 'N(t0)=N0', 't');
% 给定初始值
t0=0;
N0=10;
r=0.06;
K=500;
error=30;

% 将初始值带入微分方程
xx = subs(x); 
% n=200, 结果为：200/(exp(log(19) - (3*t)/50) + 1)
% n=100, 结果为：1000/(exp(log(99) - (3*t)/50) + 1)
% 绘图
t = 0:200;
N = 500 ./ (exp(log(49) - (3*t)/50) + 1);

% 手动制造样本点
sample_x = [25:25:200];
sample_y = 500 ./ (exp(log(49) - (3*sample_x)/50) + 1);
sample_n = length(sample_x);
error_value = unifrnd(-error, error, 1, sample_n);
sample_y = sample_y + error_value;

% 绘图

plot(t, N, '-','color', [0 0.4470 0.7410], 'LineWidth',1);
hold on;
plot(sample_x, sample_y, 'o', 'color', [0.6350 0.0780 0.1840], 'LineWidth',1);

% 调整样式

axis([0, 200, 0, 550])
box on;
grid on;
set(gca, 'LineWidth',1)
xlabel('t(/day)')
ylabel('N(/plant)')
legend('Simulation', 'Observation', Location='southeast');
