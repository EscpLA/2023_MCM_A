function dN = df(t, N)
%DF 是微分方程组
%   此处显示详细说明

D = load ('data.mat');
n=4;


dN = zeros(n,1);
for i=1:n
    tmp=0;
    for k=1:n
        if k~=i
            tmp = tmp + D.alpha(k, i) * D.lambda(k) * N(k) * N(i) * D.W(k, i) / (D.V(i) * 150);
        end
    end
    tmp_i=1 - N(i) / D.K(i);

    dN(i) = D.r(i) * N(i) * tmp_i - tmp;
end


end

