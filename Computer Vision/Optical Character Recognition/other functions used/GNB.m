function [ mean,variance ] = train_gnb(X,y,Yk)
% Gaussian Naive Bayes
% output means and variances (as two matrices) for each feature's
% conditional probability given y in each class
% Yk is the number of classes of input (Yk=2,3...)

% mean(i,k)=mean(Xi|y=k-1)
% variance(i,k)=variance(Xi|y=k-1)

[m,n]=size(X);
mean=zeros(n,Yk);
variance=zeros(n,Yk);
for k=1:Yk
    for i=1:n
        sum1=0;
        sum2=0;
        sum3=0;
        for j=1:m
            sum1=sum1+Indicator(y(j),k-1);
            sum2=sum2+X(j,i)*Indicator(y(j),k-1);
        end
        mean(i,k)=1/sum1*sum2;
        for j=1:m
            sum3=sum3+(X(j,i)-mean(i,k))^2*Indicator(y(j),k-1);
        end
        variance(i,k)=1/(sum1-1)*sum3;
    end
end           
end

function [I]=Indicator(y,k)
% used in train_gnb()
% not necessary for 2-class dataset
if(y==k)
   I=1;
else
   I=0; % cannot deal with missing value
end
end
