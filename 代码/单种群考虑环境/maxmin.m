%对数据进行归一化函数
function new=maxmin(old)
%找出每列的最大最小值
maxold=max(old);
minold=min(old);
%张成与old一样大小,主要对行进行复制，列不用变
m=size(old,1);
maxnew=repmat(maxold,m,1);
minnew=repmat(minold,m,1);
new=(old-minnew)./(maxnew-minnew);
end
