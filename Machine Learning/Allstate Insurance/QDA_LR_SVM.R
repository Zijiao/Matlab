C_svm_model<-svm(X_noNA$C~.,data=X_noNA[,c(2:11,14)]);
D_svm_model<-svm(X_noNA$D~.,data=X_noNA[,c(2:11,15)]);
E_svm_model<-svm(X_noNA$E~.,data=X_noNA[,c(2:11,16)]);
F_svm_model<-svm(X_noNA$F~.,data=X_noNA[,c(2:11,17)]);
G_svm_model<-svm(X_noNA$G~.,data=X_noNA[,c(2:11,18)]);

A_svm_pred<-fitted(A_svm_model);
B_svm_pred<-fitted(B_svm_model);
C_svm_pred<-fitted(C_svm_model);
D_svm_pred<-fitted(D_svm_model);
E_svm_pred<-fitted(E_svm_model);
F_svm_pred<-fitted(F_svm_model);
G_svm_pred<-fitted(G_svm_model);

B_svm_pred_round=round(B_svm_pred); 
C_svm_pred_round=round(C_svm_pred); 
D_svm_pred_round=round(D_svm_pred); 
E_svm_pred_round=round(E_svm_pred); 
F_svm_pred_round=round(F_svm_pred); 
G_svm_pred_round=round(G_svm_pred); 