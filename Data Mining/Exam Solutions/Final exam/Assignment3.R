setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\Exam Solutions\\Final exam\\Final exam")
getwd()


lensdata=read.csv("lenses.data.csv",header=FALSE,col.names = c("index","age","spectacle_prescription","astigmatic","tear_production_rate","Class"))
lensdata$index <- NULL
library(rpart)
y <-as.factor(lensdata[,5])
x <-lensdata[,1:4]
models<-rpart(y~.,x,parms=list(split='information'), control = rpart.control(minsplit = 0,minbucket = 0,cp=-1,maxcompete = 0,maxsurrogate = 0,usesurrogate = 0,xval=0,maxdepth = 5))
install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(models)
#information gain
gain <- sum(y==predict(models,x,type="class"))/length(y)
gain
#misclassification error rate
error <- 1-sum(y==predict(models,x,type="class"))/length(y)
error