setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\DM Assignment5")
data<-read.csv("sonar_test.csv", header=FALSE)

x<-data[,1:2]
plot(x,pch=19,xlab=expression(x[1]), ylab=expression(x[2]))
fit<-kmeans(x, 2)
points(fit$centers,pch=19,col="blue",cex=2)
library(class)
knnfit<-knn(fit$centers,x,as.factor(c(-1,1)))
points(x,col=1+1*as.numeric(knnfit),pch=19)



plot(x,pch=19,xlab=expression(x[1]), ylab=expression(x[2]))
y<-data[,61]
points(x,col=2+2*y,pch=19)
1-sum(knnfit==y)/length(y)



x<-data[,1:60]
fit<-kmeans(x, 2)
library(class)
knnfit<-knn(fit$centers,x,as.factor(c(-1,1)))
1-sum(knnfit==y)/length(y)



x<-c(1,2,2.5,3,3.5,4,4.5,5,7,8,8.5,9,9.5,10)
center1<-1
center2<-2
for (k in 2:10){
  cluster1<-x[abs(x-center1[k-1])<=abs(x-center2[k-1])]
  cluster2<-x[abs(x-center1[k-1])>abs(x-center2[k-1])]
  center1[k]<-mean(cluster1)
  center2[k]<-mean(cluster2)
}


x<-c(1,2,2.5,3,3.5,4,4.5,5,7,8,8.5,9,9.5,10)
center1<-1
center2<-2
for (k in 2:10){
  cluster1<-x[abs(x-center1[k-1])<=abs(x-center2[k-1])]
  cluster2<-x[abs(x-center1[k-1])>abs(x-center2[k-1])]
  center1[k]<-mean(cluster1)
  center2[k]<-mean(cluster2)
}



kmeans(x,2)
plot(x, col=fit$cluster, xlab = 'x', ylab='values', pch=19)


x1<-c(1,2) 
x2<-c(5,10)
data<-(rbind(x1,x2))
dist(data)



x1<-c(1,2,3,6)
x2<-c(5,10,4,12)
data<-(rbind(x1,x2))
dist(data)



data<-read.csv("spring2008exams.csv")
mean_exam<-mean(data[,2],na.rm=TRUE) 
sd_exam<-sd(data[,2],na.rm=TRUE)
z<-(data[,2]-mean_exam)/sd_exam
li=sort(z)
cat("largest z score:",li[length(li)])
cat("\nSmallest z score:",li[1])


spring_data<-read.csv("spring2008exams.csv")
mean_exam<-mean(spring_data[,3],na.rm=TRUE) 
sd_exam<-sd(spring_data[,3],na.rm=TRUE)
z<-(spring_data[,3]-mean_exam)/sd_exam
li=sort(z)
cat("largest z score:",li[length(li)])
cat("\nSmallest z score:",li[1])



spring_data<-read.csv("spring2008exams.csv")
q1<-quantile(spring_data[,3],.25,na.rm=TRUE)
q3<-quantile(spring_data[,3],.75,na.rm=TRUE)
iqr<-q3-q1
spring_data[(spring_data[,3]>q3+1.5*iqr),3]
spring_data[(spring_data[,3]<q1-1.5*iqr),3]
boxplot(spring_data[,2],spring_data[,3],col="blue",
        main="spring2008exams",
        names=c("first midterm","second midterm"),ylab="Exam Score")



spring_data<-read.csv("spring2008exams.csv")
model<-lm(spring_data[,3]~spring_data[,2])
plot(spring_data[,2],spring_data[,3],pch=19,xlab="first midterm",ylab="second midterm",xlim=c(100,200),ylim=c(100,200))
abline(model)
max(model$residuals)
