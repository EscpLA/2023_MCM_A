function [dN] = dF1(t,N, x)
%DN 微分方程的描述
%   此处显示详细说明
load("temp.mat", "temp");
load("rho.mat", "rho_mean", 'rho_sense');
load('sensitivity.mat', 'sensitivity')

cita = 20;
global i;
Li = 0.6 ;%; * (1+sensitivity(i))
K = 500 * (1+sensitivity(i)); %


dN = (Li/(1+exp(-cita*(getrho(t)))) - Li*temp)*N*(1-N/K) + (getrho(t) - rho_mean) * rho_sense;

end

