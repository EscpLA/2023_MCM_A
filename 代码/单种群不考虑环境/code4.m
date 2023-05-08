clear;clc;close;
x = dsolve('DN = r*N*(1-N/K)', 'N(t0)=N0', 't');
% 给定初始值
t0=0;
N0=10;
r=0.077;
K=450;
error=30;

% 将初始值带入微分方程
xx = subs(x); 

% 绘图
t = 0:200;

%% 手动制造样本点
sample_x = [25:25:200];
% 每次都需要修改
sample_y = 450 ./ (exp(log(44) - (77*sample_x)/1000) + 1);
sample_n = length(sample_x);
error_value = unifrnd(-error, error, 1, sample_n);
sample_y = sample_y + error_value;

%% 绘图
fplot(xx, [0, 200], '-', 'color', [0.4940 0.1840 0.5560], 'LineWidth', 1);
hold on;
plot(sample_x, sample_y, 'o', 'color', [0.3010 0.7450 0.9330], 'LineWidth',1);

%% 调整样式

axis([0, 200, 0, 650])
box on;
grid on;
set(gca, 'LineWidth',1)
xlabel('t(/day)')
ylabel('N(/plant)')
legend('Simulation', 'Observation', Location='southeast');
