setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\DM Assignment4")
getwd()
test<-read.csv("sonar_test.csv", header=FALSE)
train<-read.csv("sonar_train.csv", header=FALSE)

y<-as.factor(train[,61])
x<-train[,1:60]
y_test<-as.factor(test[,61])
x_test<-test[,1:60]

library(rpart)
fit<- rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))

error = 1-sum(y_test==predict(fit,x_test, type="class"))/length(y_test)
cat("Misclassification Error:",error)


install.packages("randomForest")
library(randomForest)
fit<-randomForest(x,y)
error_rate = 1-sum(y==predict(fit,x))/length(y)
cat("Misclassification Error rate:",error_rate)

library(class)
fit_train<-knn(x,x,y,k=6)
train_error = 1-sum(y==fit_train)/length(y)
cat("Train Error rate:",train_error)
fit_test<-knn(x,x_test,y,k=6)
test_error= 1-sum(y_test==fit_test)/length(y_test)
cat("\n Test Error rate:",test_error)

library(class)
fit_train<-knn(x,x,y,k=5)
train_error = 1-sum(y==fit_train)/length(y)
cat("Train Error rate:",train_error)
fit_test<-knn(x,x_test,y,k=5)
test_error= 1-sum(y_test==fit_test)/length(y_test)
cat("\n Test Error rate:",test_error)