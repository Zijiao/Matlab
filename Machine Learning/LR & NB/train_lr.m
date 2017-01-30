function [theta, lambda]=train_lr(X, y,lambda_max,lambda_step)
% Logistic Regression with L2 Regularization

% get X,y as input to output the parameters with "best" lambda
% use cross() and train()

%candidate lambda(s) are generated from input values lambda_max and lambda_step
lambdas=0:lambda_step:lambda_max;
lambda=cross(X,y,lambdas);
theta=train(X,y,lambda); % to get the final parameters

end

function [lambda]=cross(X,y,lambdas)
% used in train_lr()
% use 5-folder CV to lambda_amountick the lambda related to the smallest training error from all candidates
% use function pred_error()
[m,n]=size(X);
lambda_amount=length(lambdas);
errors=zeros(lambda_amount,1);
indices=crossvalind('Kfold', m, 5); % used in CV
for i=1:lambda_amount
    error=zeros(5,1);
    lambda=lambdas(i);
    for j=1:5
        theta=train(X(indices~=j,:),y(indices~=j,:),lambda);
        error(j)=pred_error(X(indices==j,:),y(indices==j,:),theta);
    end
    errors(i)=mean(error);
end
indi_temp=find(errors==min(errors));
lambda=lambdas(indi_temp(1)); % this is the lambda with smallest CV error
end

function [theta,J]=train(X,y,lambda)
% the actual "regress" function
% use function costFunction()

% preprocessing and initialization
[m,n]=size(X);
X=[ones(m,1) X]; % add a constant term
theta_startvalue=zeros(n+1,1);

% use optimization method to get the parameters
% from Andrew Ng's code
options=optimset('GradObj','on','MaxIter',500,'Display','off'); % iterate 500 times
[theta,J] = ...
    fminunc(@(t)(costFunction(t,lambda,X,y)),theta_startvalue,options);

end

function [J,grad]=costFunction(theta,lambda,X,y)
% used in train()
% refered to Andrew's code and Stackoverflow
% (http://stackoverflow.com/questions/19824293/regularized-logistic-regression-code-in-matlab)
% J is the cost function and the gradient of the cost
m=length(y);
n=length(theta);
J=(1/m)*(-y'*log(sigmoid(X*theta))-(1-y)'*log(1-sigmoid(X*theta)))-(lambda/(2*m))*theta(2:end)'* theta(2:end);
grad = (1/m)*X'*(sigmoid(X*theta)-y)+(lambda/m)*[0;theta(2:end)];

end

function g=sigmoid(x)
% this function equals sigmf(x,[1,0]) but people always define sigmoid() by
% themselves
g = 1./(1+exp(-x));

end

function [error]=pred_error(X,y,theta)
% return the prediction error
error=0;
m=length(y);
X=[ones(m,1) X]; % add a constant term
for i=1:m
    if((X(i,:)*theta>=0)&&(y(i)==0))
        error=error+1;
    end
    if((X(i,:)*theta<0)&&(y(i)==1))
        error=error+1;
    end
end

end
