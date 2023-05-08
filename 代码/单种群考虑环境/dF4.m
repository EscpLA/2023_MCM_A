function [dN] = dF1(t,N)
%DN 微分方程的描述
%   此处显示详细说明
load("temp.mat", "temp");
load("rho.mat", "rho_mean", 'rho_sense');
K=450;
cita = 40;
Li = 0.77;

dN = (Li/(1+exp(-cita*(getrho(t)))) - Li*temp)*N*(1-N/K) + (getrho(t) - rho_mean) * rho_sense;
end

