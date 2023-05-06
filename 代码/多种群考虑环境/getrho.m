function [rho] = getrho(input_t)
%GETRHO 此处显示有关此函数的摘要
%   此处显示详细说明

cycle = 8; %周期

t = mod(input_t - 1, cycle) + 1;

% 修改前的参数
% p1=-0.028;
% p2 = 0.38;
% p3 = -0.44;

% 修改后的参数
p1 =    -0.03033  ;
p2 =      0.3031 ;
p3 =     -0.2617 ;


rho = p1*t.^2+p2*t+p3;

end

