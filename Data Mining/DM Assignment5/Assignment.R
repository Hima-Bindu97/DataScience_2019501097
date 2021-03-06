setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\DM Assignment5")
data<-read.csv("sonar_test.csv", header=FALSE)

x<-data[,1:2]
plot(x,pch=19,xlab=expression(x[1]), ylab=expression(x[2]))
fit<-kmeans(x, 2)
points(fit$centers,pch=19,col="blue",cex=2)
library(class)
knnfit<-knn(fit$centers,x,as.factor(c(-1,1)))
points(x,col=1+1*as.numeric(knnfit),pch=19)