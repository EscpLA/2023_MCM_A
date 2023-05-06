function [dN] = dF1(t,N)
%DN 微分方程的描述
%   此处显示详细说明
load("temp.mat", "temp");
load("rho.mat", "rho_mean", 'rho_sense');

K=600;
cita = 30;
Li = 0.4;

dN = (Li/(1+exp(-cita*(getrho(t)))) - Li*temp)*N*(1-N/K) + (getrho(t) - rho_mean) * rho_sense;

end

