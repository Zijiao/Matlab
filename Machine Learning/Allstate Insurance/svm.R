 # svm
library(e1071)

A_svm_model<-svm(X_numeric[ ,2:15],Y$A)
A_svm_pred<-predict(A_svm_model,X_numeric[ ,2:15])

B_svm_model<-svm(X_numeric[ ,2:15],Y$B)
B_svm_pred<-predict(B_svm_model,X_numeric[ ,2:15])

C_svm_model<-svm(X_numeric[ ,2:15],Y$C)
C_svm_pred<-predict(C_svm_model,X_numeric[ ,2:15])

D_svm_model<-svm(X_numeric[ ,2:15],Y$D)
D_svm_pred<-predict(D_svm_model,X_numeric[ ,2:15])

E_svm_model<-svm(X_numeric[ ,2:15],Y$E)
E_svm_pred<-predict(E_svm_model,X_numeric[ ,2:15])

F_svm_model<-svm(X_numeric[ ,2:15],Y$F)
F_svm_pred<-predict(F_svm_model,X_numeric[ ,2:15])

G_svm_model<-svm(X_numeric[ ,2:15],Y$G)
G_svm_pred<-predict(G_svm_model,X_numeric[ ,2:15])

# to get the correct rate for each plan (training error=1-correctrate)
A_svm_correctrate<-sum(A_svm_pred==Y$A)/97009
B_svm_correctrate<-sum(B_svm_pred==Y$B)/97009
C_svm_correctrate<-sum(C_svm_pred==Y$C)/97009
D_svm_correctrate<-sum(D_svm_pred==Y$D)/97009
E_svm_correctrate<-sum(E_svm_pred==Y$E)/97009
F_svm_correctrate<-sum(F_svm_pred==Y$F)/97009
G_svm_correctrate<-sum(G_svm_pred==Y$G)/97009

# calculate the final correct rate
svm_correct_matrix<-cbind(A_svm_pred==Y$A,B_svm_pred==Y$B,C_svm_pred==Y$C,D_svm_pred==Y
                          $D,E_svm_pred==Y$E,F_svm_pred==Y$F,G_svm_pred==Y$G)
final_correct_amout=0;
for(i in 1:97009){
  if(sum(svm_correct_matrix[i, ])==7){
    final_correct_amout=final_correct_amout+1;
  }
}
training_correctrate=final_correct_amout/97009
training_correctrate