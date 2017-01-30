function [X_log] =transform_log(X)
% transform X as log(Xij+0.1)
[m,n]=size(X);
X_log=zeros(m,n);
for j=1:m
    for i=1:n
        X_log(j,i)=log(X(j,i)+0.1);
    end
end
end

