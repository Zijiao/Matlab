function [error_rate,tp,tn,fp,fn] = test_gnb(X,y,mean,variance)
% return the testing error rate of Gaussian Naive Bayes model
% can also output statistics for confusion table for which reason this
% function can only deal with 2-class datasets (specific for Q3).
tp=0;
tn=0;
fp=0;
fn=0;
[m,n]=size(X);
po_num=0; % used to compute the prior
na_num=0;
for j=1:m
    if(y(j)==1)
        po_num=po_num+1;
    elseif(y(j)==0)
        na_num=na_num+1;
    end
end


for j=1:m
    if((pred(X,mean,variance,j,n,po_num,na_num)==1)&&(y(j)==1))
        tp=tp+1;
    elseif((pred(X,mean,variance,j,n,po_num,na_num)==1)&&(y(j)==0))
        fp=fp+1;
    elseif((pred(X,mean,variance,j,n,po_num,na_num)==0)&&(y(j)==0))
        tn=tn+1;
    elseif((pred(X,mean,variance,j,n,po_num,na_num)==0)&&(y(j)==1))
        fn=fn+1;
    end
end
error_rate=(fp+fn)/m;
       
end



function [class]=pred(X,mean,variance,j,n,po_num,na_num)
% return a prediction class (0 or 1)
% get n,po_num,na_num as input values to lower the running time

sum=log(po_num/na_num);
for i=1:n
    sum=sum+log(variance(i,1)/variance(i,2))+(X(j,i)-mean(i,1))^2/(2*variance(i,1)^2)-(X(j,i)-mean(i,2))^2/(2*variance(i,2)^2);    
end

if sum>=0
    class=1;
else
    class=0;
end
end

