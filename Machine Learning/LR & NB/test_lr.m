function [error_rate,tp,tn,fp,fn]=test_lr(X,y,theta)
% return the test error rate 
% can also return statistics for confusion table
error_rate=0;
tp=0;
tn=0;
fp=0;
fn=0;
m=length(y);
X=[ones(m,1) X]; % add a constant term
for i=1:m
    if((X(i,:)*theta>=0)&&(y(i)==0))
        fp=fp+1;
    end
    if((X(i,:)*theta<0)&&(y(i)==1))
        fn=fn+1;
    end
    if((X(i,:)*theta>=0)&&(y(i)==1))
        tp=tp+1;
    end
    if((X(i,:)*theta<0)&&(y(i)==0))
        tn=tn+1;
    end
end

error_rate=(fp+fn)/m;

end