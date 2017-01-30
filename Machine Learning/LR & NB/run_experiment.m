% run experiment with given data using other 6 m-files.
% This script itself does not define any funcions

% 1. run Logistic Regression and Gaussian Naive Bayes on original data
% 1.a logistic regression on original data
theta_orig=train_lr(Xtrain,ytrain,0.1,0.02);
[error_lr_orig,tp_lr_orig,tn_lr_orig,fp_lr_orig,fn_lr_orig]=test_lr(Xtest,ytest,theta_orig);

% 1.b gaussian naive bayes on original data
[mean_orig,variance_orig]=train_gnb(Xtrain,ytrain,2);
[error_gnb_orig,tp_gnb_orig,tn_gnb_orig,fp_gnb_orig,fn_gnb_orig]=test_gnb(Xtest,ytest,mean_orig,variance_orig);

% 2. run LR and GNB on column-standardized data 
Xtrain_std=transform_std(Xtrain);
Xtest_std=transform_std(Xtest);
% 1.a LR on column-standardized data
theta_std=train_lr(Xtrain_std,ytrain,0.1,0.02);
[error_lr_std,tp_lr_std,tn_lr_std,fp_lr_std,fn_lr_std]=test_lr(Xtest_std,ytest,theta_std);

% 1.b gaussian naive bayes on column-standardized data
[mean_std,variance_std]=train_gnb(Xtrain_std,ytrain,2);
[error_gnb_std,tp_gnb_std,tn_gnb_std,fp_gnb_std,fn_gnb_std]=test_gnb(Xtest_std,ytest,mean_std,variance_std);

% 3. run LR and GNB on log-transformed data 
Xtrain_log=transform_log(Xtrain);
Xtest_log=transform_log(Xtest);
% 1.a LR on log-transformed data
theta_log=train_lr(Xtrain_log,ytrain,0.1,0.02);
[error_lr_log,tp_lr_log,tn_lr_log,fp_lr_log,fn_lr_log]=test_lr(Xtest_log,ytest,theta_log);

% 1.b gaussian naive bayes on log-transformed data
[mean_log,variance_log]=train_gnb(Xtrain_log,ytrain,2);
[error_gnb_log,tp_gnb_log,tn_gnb_log,fp_gnb_log,fn_gnb_log]=test_gnb(Xtest_log,ytest,mean_log,variance_log);

% display all the error rates
% statistics for confusion table are not displayed, but they are already saved
disp('LR on original data has error rate: '); 
disp(error_lr_orig);
disp('GNB on original data has error rate: '); 
disp(error_gnb_orig);
disp('LR on column-standardized data has error rate: '); 
disp(error_lr_std);
disp('GNB on column-standardized data has error rate: '); 
disp(error_gnb_std);
disp('LR on log-transformed data has error rate: '); 
disp(error_lr_log);
disp('GNB on log-transformed data has error rate: '); 
disp(error_gnb_log);

% end of Q3


