function [X_std] = transform_std(X)
% transform input X to have zero-mean and unit-variance
%   just use a matlab function

X_std=zscore(X);

end

