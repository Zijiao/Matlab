# preprocessing 

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



train_shrink<-train[,c(6,8:11,13:15,18:24)];
index1<-train$record_type==1;
train_noquote<-train_shrink[index1,];
index2<-index1;
#push the binary vector "forward"
index2[1:97008]<-index1[2:97009];
index2[97009]=FALSE
last_quote=train_shrink[index2,];
X=data.frame(last_quote[,1:15]);
Y=data.frame(train_noquote[,9:15]);

X2to8 <- array(0,c(97009,15,7))
for (i in 2:8){
  index.Xi <- index.first.num+min(num_quotes,+i)-1
  my_quote=train_shrink[index.Xi,]
  X2to8[,,i-1] <- as.matrix(my_quote[,1:15])
}



X2 <- data.frame(X2to8[,,1])
names(X2) <- names(X)
head(X2)
X2$A<-as.factor(X2$A);
X2$B<-as.factor(X2$B);
X2$C<-as.factor(X2$C);
X2$D<-as.factor(X2$D);
X2$E<-as.factor(X2$E);
X2$F<-as.factor(X2$F);
X2$G<-as.factor(X2$G);
X2$homeowner<-as.factor(X2$homeowner);
X2$married_couple<-as.factor(X2$married_couple);

X3 <- data.frame(X2to8[,,2])
names(X3) <- names(X)
head(X3)
X3$A<-as.factor(X3$A);
X3$B<-as.factor(X3$B);
X3$C<-as.factor(X3$C);
X3$D<-as.factor(X3$D);
X3$E<-as.factor(X3$E);
X3$F<-as.factor(X3$F);
X3$G<-as.factor(X3$G);
X3$homeowner<-as.factor(X3$homeowner);
X3$married_couple<-as.factor(X3$married_couple);

X4 <- data.frame(X2to8[,,3])
names(X4) <- names(X)
head(X4)
X4$A<-as.factor(X4$A);
X4$B<-as.factor(X4$B);
X4$C<-as.factor(X4$C);
X4$D<-as.factor(X4$D);
X4$E<-as.factor(X4$E);
X4$F<-as.factor(X4$F);
X4$G<-as.factor(X4$G);
X4$homeowner<-as.factor(X4$homeowner);
X4$married_couple<-as.factor(X4$married_couple);

X5 <- data.frame(X2to8[,,4])
names(X5) <- names(X)
head(X5)
X5$A<-as.factor(X5$A);
X5$B<-as.factor(X5$B);
X5$C<-as.factor(X5$C);
X5$D<-as.factor(X5$D);
X5$E<-as.factor(X5$E);
X5$F<-as.factor(X5$F);
X5$G<-as.factor(X5$G);
X5$homeowner<-as.factor(X5$homeowner);
X5$married_couple<-as.factor(X5$married_couple);

X6 <- data.frame(X2to8[,,5])
names(X6) <- names(X)
head(X6)
X6$A<-as.factor(X6$A);
X6$B<-as.factor(X6$B);
X6$C<-as.factor(X6$C);
X6$D<-as.factor(X6$D);
X6$E<-as.factor(X6$E);
X6$F<-as.factor(X6$F);
X6$G<-as.factor(X6$G);
X6$homeowner<-as.factor(X6$homeowner);
X6$married_couple<-as.factor(X6$married_couple);

X7 <- data.frame(X2to8[,,6])
names(X7) <- names(X)
head(X7)
X7$A<-as.factor(X7$A);
X7$B<-as.factor(X7$B);
X7$C<-as.factor(X7$C);
X7$D<-as.factor(X7$D);
X7$E<-as.factor(X7$E);
X7$F<-as.factor(X7$F);
X7$G<-as.factor(X7$G);
X7$homeowner<-as.factor(X7$homeowner);
X7$married_couple<-as.factor(X7$married_couple);

X8 <- data.frame(X2to8[,,7])
names(X8) <- names(X)
head(X8)
X8$A<-as.factor(X8$A);
X8$B<-as.factor(X8$B);
X8$C<-as.factor(X8$C);
X8$D<-as.factor(X8$D);
X8$E<-as.factor(X8$E);
X8$F<-as.factor(X8$F);
X8$G<-as.factor(X8$G);
X8$homeowner<-as.factor(X8$homeowner);
X8$married_couple<-as.factor(X8$married_couple);


Y$A<-as.factor(Y$A);
Y$B<-as.factor(Y$B);
Y$C<-as.factor(Y$C);
Y$D<-as.factor(Y$D);
Y$E<-as.factor(Y$E);
Y$F<-as.factor(Y$F);
Y$G<-as.factor(Y$G);


## below is old version
if (FALSE){

X$A<-as.factor(X$A);
X$B<-as.factor(X$B);
X$C<-as.factor(X$C);
X$D<-as.factor(X$D);
X$E<-as.factor(X$E);
X$F<-as.factor(X$F);
X$G<-as.factor(X$G);
X$homeowner<-as.factor(X$homeowner);
X$married_couple<-as.factor(X$married_couple);

rm(last_quote,train_noquote,train_shrink);
rm(index1,index2)


# change X's colnames from "A"~"G" to "A0"~"G0" to distinguish from Y's colnames
colnames(X)[9]<-"A0"
colnames(X)[10]<-"B0"
colnames(X)[11]<-"C0"
colnames(X)[12]<-"D0"
colnames(X)[13]<-"E0"
colnames(X)[14]<-"F0"
colnames(X)[15]<-"G0"


## to change car_value from 'a'~'g' to 1~7, but also as factors
# can use vectorized function since there are NAs 

X$car_value<-as.character(X$car_value)

for(i in 1:97009){
  if(X$car_value[i]=='a'){
    X$car_value[i]=1;
  }
  else if(X$car_value[i]=='b'){
    X$car_value[i]=2;
  }
  else if(X$car_value[i]=='C'){
    X$car_value[i]=3;
  }
  else if(X$car_value[i]=='d'){
    X$car_value[i]=4;
  }
  else if(X$car_value[i]=='e'){
    X$car_value[i]=5;
  }
  else if(X$car_value[i]=='f'){
    X$car_value[i]=6;
  }
  else if(X$car_value[i]=='g'){
    X$car_value[i]=7;
  }
}

X$car_value<-as.factor(X$car_value)

## svm needs X has no factors but all numeric values
X_numeric<-X;

X_numeric$homeowner<-as.numeric(X$homeowner);
X_numeric$group_size<-as.numeric(X$group_size);
X_numeric$married_couple<-as.numeric(X_numeric$married_couple);
X_numeric$car_value<-as.numeric(X_numeric$car_value);
X_numeric$A<-as.numeric(X_numeric$A);
X_numeric$B<-as.numeric(X_numeric$B);
X_numeric$C<-as.numeric(X_numeric$C);
X_numeric$D<-as.numeric(X_numeric$D);
X_numeric$E<-as.numeric(X_numeric$E);
X_numeric$F<-as.numeric(X_numeric$F);
X_numeric$G<-as.numeric(X_numeric$G);

## I did the same for Y just in case
Y_numeric<-Y
Y_numeric$A<-as.numeric(Y_numeric$A);
Y_numeric$B<-as.numeric(Y_numeric$B);
Y_numeric$C<-as.numeric(Y_numeric$C);
Y_numeric$D<-as.numeric(Y_numeric$D);
Y_numeric$E<-as.numeric(Y_numeric$E);
Y_numeric$F<-as.numeric(Y_numeric$F);
Y_numeric$G<-as.numeric(Y_numeric$G);

}