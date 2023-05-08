 clear;clc;close;

%% 读取温度和降水数据，进行正向化处理
load jiangshuiAndWendu.mat;
pos_jiangshui = Inter2Max(jiangshui, 40, 80);
pos_wendu = Mid2Max(wendu, 17);

%% 标准化
% 定义标准化后的数据
n = length(pos_wendu);
Z = ones(n, 2);
X = ones(n, 2);
X(:, 1)=pos_jiangshui;
X(:, 2) = pos_wendu;
% Z = X ./  repmat(sum(X.*X) .^0.5 , n, 1);
Z = X;


% 读取 标准化 后的降水量和温度
load Z_jiangshuiAndWendu.mat;
%% 建立 羊草 的微分方程，其中 r 带入环境影响因子
x = dsolve('DN = (Li/(1+exp(-cita*(p1*t^2+p2*t+p3))) - temp*Li)*N*(1-N/K)', 'N(t0)=N0', 't');
% 给定初始值
t0=0;
N0=10;
K=500;
cita = 10;
Li = 0.6;
p1=-0.028;
p2 = 0.38;
p3 = -0.44;
temp = 5/6;

%% 使用 ODE45 求解微分方程的数值解，进而绘图。
N0=25;
t_range = 90;
% 羊草
[t, N] = ode45('dF1', [0, t_range], N0);
plot(t, N,  '-', 'color', [0 0.4470 0.7410], 'LineWidth', 1.5);
hold on;
% 大针茅
[t, N] = ode45('dF2', [0, t_range], N0+10);
plot(t, N,  '-', 'color', [0.8500 0.3250 0.0980], 'LineWidth', 1.5);
hold on;
% 冰草
[t, N] = ode45('dF3', [0, t_range], N0);
plot(t, N,  '-', 'color', [0.9290 0.6940 0.1250], 'LineWidth', 1.5);
hold on;
% 冷蒿
[t, N] = ode45('dF4', [0, t_range], N0+25);
plot(t, N,  '-', 'color', [0.4940 0.1840 0.5560], 'LineWidth', 1.5);
hold on;



% x=[1:36];
% y=getrho(x);
% plot(x, y, 'r-');


% %% 将初始值带入微分方程
% xx = subs(x);
% 
% % 绘图
% t = 0:200;
% 
% %% 手动制造样本点
% sample_x = [25:25:200];
% % 每次都需要修改
% sample_y = 450 ./ (exp(log(44) - (77*sample_x)/1000) + 1);
% sample_n = length(sample_x);
% error_value = unifrnd(-error, error, 1, sample_n);
% sample_y = sample_y + error_value;
% 
% %% 绘图
% fplot(xx, [0, 200], 'b-', 'LineWidth', 1);
% hold on;
% plot(sample_x, sample_y, 'or');

%% 调整样式

% axis([0, 200, 0, 650])
box on;
grid on;
set(gca, 'LineWidth',1)
xlabel('t(/month)')
ylabel('N(/plant)')
legend('LeymusChinensis', 'StipaGrandis', 'Wheatgrass', 'ArtemisiaFrigida', Location='southeast');

