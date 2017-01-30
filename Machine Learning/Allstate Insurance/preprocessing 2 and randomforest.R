rm(list=ls())

# preprocessing 
train <- read.csv("train.csv",header=TRUE)
head(train,20)

#a vector indicating total number of records for each customer
num_records <- c()
for (i in 1:665248){
  if (train[i,"shopping_pt"]>train[i+1,"shopping_pt"]) num_records <- c(num_records,train[i,"shopping_pt"])
}
num_records <- c(num_records,train[length(train$shopping_pt),"shopping_pt"])

#number of quote(not including the final transaction) for each customer
num_quotes <- num_records-1

index.first <- train$shopping_pt==1
index.first.num <- c() 
for(i in 1:length(index.first)){
  if(index.first[i]==TRUE) index.first.num <- c(index.first.num,i)
}
head(index.first.num)
index.last <- index.first.num + num_quotes
#names <- c("group_size","homeowner","car_age","car_value","age_oldest","age_youngest","married_couple","A","B","C","D","E","F","G")
names <- c("A","B","C","D","E","F","G")
X.train <- train[index.last-1,names]
head(X.train)
#X.train <- data.frame(X.train,train[index.last-2,c("A","B","C","D","E","F","G")])
#X.train$homeowner <- as.factor(X.train$homeowner)
#X.train$married_couple <- as.factor(X.train$married_couple)
X.train$A <- as.factor(X.train$A)
X.train$B <- as.factor(X.train$B)
X.train$C <- as.factor(X.train$C)
X.train$D <- as.factor(X.train$D)
X.train$E <- as.factor(X.train$E)
X.train$F <- as.factor(X.train$F)
X.train$G <- as.factor(X.train$G)
#X.train$A.1 <- as.factor(X.train$A.1)
#X.train$B.1 <- as.factor(X.train$B.1)
#X.train$C.1 <- as.factor(X.train$C.1)
#X.train$D.1 <- as.factor(X.train$D.1)
#X.train$E.1 <- as.factor(X.train$E.1)
#X.train$F.1 <- as.factor(X.train$F.1)
#X.train$G.1 <- as.factor(X.train$G.1)

Y <- train[index.last,c("A","B","C","D","E","F","G")]
Y$A <- as.factor(Y$A)
Y$B <- as.factor(Y$B)
Y$C <- as.factor(Y$C)
Y$D <- as.factor(Y$D)
Y$E <- as.factor(Y$E)
Y$F <- as.factor(Y$F)
Y$G <- as.factor(Y$G)

library(adabag)
library(e1071)
library(MASS)
library(randomForest)
library(rpart)
library(mlbench)


# random forest
str(X.train)
rf.A <- randomForest(X.train,Y$A)
rf.B <- randomForest(X.train,Y$B)
rf.C <- randomForest(X.train,Y$C)
rf.D <- randomForest(X.train,Y$D)
rf.E <- randomForest(X.train,Y$E)
rf.F <- randomForest(X.train,Y$F)
rf.G <- randomForest(X.train,Y$G)

test <- read.csv("test.csv",header=TRUE)
index.lastquote <- c()
for (i in 2:198856){
  if (test[i,"customer_ID"] != test[i-1,"customer_ID"]) index.lastquote <- c(index.lastquote,i-1)
}
index.lastquote <- c(index.lastquote,198856)
X.test <- test[index.lastquote,names]
#X.test <- data.frame(X.test,test[index.lastquote-1,c("A","B","C","D","E","F","G")])
#X.test$homeowner <- as.factor(X.test$homeowner)
#X.test$married_couple <- as.factor(X.test$married_couple)

X.test$A <- as.factor(X.test$A)
X.test$B <- as.factor(X.test$B)
X.test$C <- as.factor(X.test$C)
X.test$D <- as.factor(X.test$D)
X.test$E <- as.factor(X.test$E)
X.test$F <- as.factor(X.test$F)
X.test$G <- as.factor(X.test$G)
#X.test$A.1 <- as.factor(X.test$A.1)
#X.test$B.1 <- as.factor(X.test$B.1)
#X.test$C.1 <- as.factor(X.test$C.1)
#X.test$D.1 <- as.factor(X.test$D.1)
#X.test$E.1 <- as.factor(X.test$E.1)
#X.test$F.1 <- as.factor(X.test$F.1)
#X.test$G.1 <- as.factor(X.test$G.1)

str(X.test)

A <- predict(rf.A,X.test)
B <- predict(rf.B,X.test)
C <- predict(rf.C,X.test)
D <- predict(rf.D,X.test)
E <- predict(rf.E,X.test)
F <- predict(rf.F,X.test)
G <- predict(rf.G,X.test)

plan <- paste0(A,B,C,D,E,F,G)
customer_ID <- unique(test$customer_ID)
output <- data.frame(customer_ID=customer_ID,plan=plan)
head(output)
write.csv(output,file="output_rf_Apr26-3.csv",row.names=FALSE,na="",quote=FALSE)