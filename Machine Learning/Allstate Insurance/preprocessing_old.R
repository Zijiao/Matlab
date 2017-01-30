# preprocessing 

train_shrink<-train[,c(6,8:11,13:15,18:24)];
index1<-train$record_type==1;
train_noquote<-train_shrink[index1,];
index2<-index1;
index2[1:97008]<-index1[2:97009];
index2[97009]=FALSE
last_quote=train_shrink[index2,];
##   X=data.frame(train_noquote[,1:8],last_quote[,9:15]);
X=data.frame(last_quote[,1:15]);
Y=data.frame(train_noquote[,9:15]);

Y$A<-as.factor(Y$A);
Y$B<-as.factor(Y$B);
Y$C<-as.factor(Y$C);
Y$D<-as.factor(Y$D);
Y$E<-as.factor(Y$E);
Y$F<-as.factor(Y$F);
Y$G<-as.factor(Y$G);

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
  # cannot use vectorized function since there are NAs 

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
X_numeric$A0<-as.numeric(X_numeric$A0);
X_numeric$B0<-as.numeric(X_numeric$B0);
X_numeric$C0<-as.numeric(X_numeric$C0);
X_numeric$D0<-as.numeric(X_numeric$D0);
X_numeric$E0<-as.numeric(X_numeric$E0);
X_numeric$F0<-as.numeric(X_numeric$F0);
X_numeric$G0<-as.numeric(X_numeric$G0);

## I did the same for Y just in case
Y_numeric<-Y
Y_numeric$A<-as.numeric(Y_numeric$A);
Y_numeric$B<-as.numeric(Y_numeric$B);
Y_numeric$C<-as.numeric(Y_numeric$C);
Y_numeric$D<-as.numeric(Y_numeric$D);
Y_numeric$E<-as.numeric(Y_numeric$E);
Y_numeric$F<-as.numeric(Y_numeric$F);
Y_numeric$G<-as.numeric(Y_numeric$G);