# SVM on new train.X and train.Y data

# change factors to numeric values first

X.train_num=X.train

X.train_num$A<-as.numeric(X.train$A);
X.train_num$B<-as.numeric(X.train$B);
X.train_num$C<-as.numeric(X.train$C);
X.train_num$D<-as.numeric(X.train$D);
X.train_num$E<-as.numeric(X.train$E);
X.train_num$F<-as.numeric(X.train$F);
X.train_num$G<-as.numeric(X.train$G);

library(e1071)

A_svm_model<-svm(X.train_num,Y$A)
A_svm_pred<-predict(A_svm_model,X.train_num)

B_svm_model<-svm(X.train_num,Y$B)
B_svm_pred<-predict(B_svm_model,X.train_num)

C_svm_model<-svm(X.train_num,Y$C)
C_svm_pred<-predict(C_svm_model,X.train_num)

D_svm_model<-svm(X.train_num,Y$D)
D_svm_pred<-predict(D_svm_model,X.train_num)

E_svm_model<-svm(X.train_num,Y$E)
E_svm_pred<-predict(E_svm_model,X.train_num)

F_svm_model<-svm(X.train_num,Y$F)
F_svm_pred<-predict(F_svm_model,X.train_num)

G_svm_model<-svm(X.train_num,Y$G)
G_svm_pred<-predict(G_svm_model,X.train_num)

# on test data

test <- read.csv("test.csv",header=TRUE)
index.lastquote <- c()
for (i in 2:198856){
  if (test[i,"customer_ID"] != test[i-1,"customer_ID"]) index.lastquote <- c(index.lastquote,i-1)
}
index.lastquote <- c(index.lastquote,198856)
X.test <- test[index.lastquote,names]

A <- predict(A_svm_model,X.test[,c("A","B","C","D","E","F","G")])
B <- predict(B_svm_model,X.test[,c("A","B","C","D","E","F","G")])
C <- predict(C_svm_model,X.test[,c("A","B","C","D","E","F","G")])
D <- predict(D_svm_model,X.test[,c("A","B","C","D","E","F","G")])
E <- predict(E_svm_model,X.test[,c("A","B","C","D","E","F","G")])
F <- predict(F_svm_model,X.test[,c("A","B","C","D","E","F","G")])
G <- predict(G_svm_model,X.test[,c("A","B","C","D","E","F","G")])

plan <- paste0(A,B,C,D,E,F,G)
customer_ID <- unique(test$customer_ID)
output <- data.frame(customer_ID=customer_ID,plan=plan)
head(output)
write.csv(output,file="output_rf_Apr26-8.csv",row.names=FALSE,na="",quote=FALSE)

