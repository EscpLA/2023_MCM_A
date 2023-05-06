function [dN] = dF1(t,N)
%DN 微分方程的描述
%   此处显示详细说明
load("temp.mat", "temp");
load("rho.mat", "rho_mean", 'rho_sense');

K=400;
cita = 15;
Li = 0.42;

dN = (Li/(1+exp(-cita*(getrho(t)))) - Li*temp)*N*(1-N/K) + (getrho(t) - rho_mean) * rho_sense;

end

