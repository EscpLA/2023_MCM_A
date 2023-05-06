clear;clc;close;
x = dsolve('DN = r*N*(1-N/K)', 'N(t0)=N0', 't');
% 给定初始值
t0=0;
N0=10;
r=0.040;
K=600;
error=30;

% 将初始值带入微分方程
xx = subs(x); 

% 绘图
t = 0:200;

%% 手动制造样本点
sample_x = [25:25:200];
% 每次都需要修改
sample_y = 600 ./ (exp(log(59) - sample_x/25) + 1);
sample_n = length(sample_x);
error_value = unifrnd(-error, error, 1, sample_n);
sample_y = sample_y + error_value;

%% 绘图
fplot(xx, [0, 200], '-', 'color',[0.9290 0.6940 0.1250],  'LineWidth', 1);
hold on;
plot(sample_x, sample_y, 'o', 'color', [0.6350 0.0780 0.1840], 'LineWidth',1);

%% 调整样式

axis([0, 200, 0, 650])
box on;
grid on;
set(gca, 'LineWidth',1)
xlabel('t(/day)')
ylabel('N(/plant)')
legend('Simulation', 'Observation', Location='southeast');
