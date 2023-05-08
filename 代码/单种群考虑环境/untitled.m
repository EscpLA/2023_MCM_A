clear;clc;
% 读取 归一化 后的降水量和温度
load Z_jiangshuiAndWendu.mat;
%% 建立微分方程
x = dsolve('DN = r*N*(1-N/K)', 'N(t0)=N0', 't');
% 给定初始值
t0=0;
N0=10;
K=500;
error=30;
%% 计算month个月不同的r
month=36;% 共 36 个月
rho = Z_jiangshui(1:12);

% Li = 0.2;
% T=360;
% tlen=360;
% k=10;
% tspan = linspace(1, T, tlen);
% h=(1/12)*(1:12);%归一到 0-1 的降水量 h(t)
% r = Li ./ (1 + exp(-k*h)) - Li/2;
% plot(h, r, 'r-')

% rho = Z_jiangshui .* Z_wendu;
% rho = sort(rho);
Li = 100;
k=1;
% 计算共 month 个月的r
r = Li ./ (1 + exp(-k*rho)) - Li/2;

plot(rho, r, 'r-')

%% 将初始值带入微分方程
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
fplot(xx, [0, 200], 'b-', 'LineWidth', 1);
hold on;
plot(sample_x, sample_y, 'or');

%% 调整样式

axis([0, 200, 0, 650])
box on;
grid on;
set(gca, 'LineWidth',1)
xlabel('t(/day)')
ylabel('N(/plant)')
legend('Simulation', 'Observation', Location='southeast');

