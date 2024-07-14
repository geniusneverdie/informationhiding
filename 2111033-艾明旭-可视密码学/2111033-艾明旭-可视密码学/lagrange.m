%拉格朗日插值命令
function yy=lagrange(x,y,xx)
%Lagrange 插值，求数据（x,y）所表达式的函数在插值点xx处的插值
m=length(x);
n=length(y);
if m~=n
    error('向量x,y长度必须一致');
end
s=0;
for i=1:n
    t=ones(1,length(xx));
    for j=1:n
        if j~=i
            t=t.*(xx-x(j))/(x(i)-x(j));
        end
    end
    s=s+t*y(i);
end
yy=s;