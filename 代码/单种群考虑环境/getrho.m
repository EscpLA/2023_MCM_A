function [rho] = getrho(input_t)
%GETRHO 此处显示有关此函数的摘要
%   此处显示详细说明
t = mod(input_t - 1, 12) + 1;

p1=-0.028;
p2 = 0.38;
p3 = -0.44;
rho = p1*t.^2+p2*t+p3;
end

