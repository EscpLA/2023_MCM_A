function dN = df4(t, N)
%DF 是微分方程组
%   此处显示详细说明
D = load ('data1.mat');
load("rho.mat", "rho_mean")
n=4;

D = D.D;

dN = zeros(n,1);
for i=1:n
    r_i=(D.L(i)/(1+exp(-D.theta(i) * getrho(t) )) - D.L(i)/2);
    tmp=0;
    for k=1:n
        if k~=i
            tmp = tmp + D.alpha(k, i) * D.lambda(k) * N(k) * N(i) * D.W(k, i) / (D.V(i) * 250);
        end
    end
    tmp_i=1-N(i) / D.K(i);
    disp('1111');
%     if N(i) == 0
%         rho_factor = 0;
%     else
        rho_factor = (getrho(t) - rho_mean) * D.beta(i) * N(i) / D.K(i);
%     end

    dN(i)= r_i * N(i) * tmp_i - tmp + rho_factor;
end


end

