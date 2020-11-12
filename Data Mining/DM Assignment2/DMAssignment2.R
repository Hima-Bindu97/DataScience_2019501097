setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\DM Assignment2")
getwd()
#myData<-read.csv("myfirstdata.csv",header=FALSE)

#str(myData)

#plot(myData[,1])

#myData<-read.csv("twomillion.csv",header=FALSE)
#data<-sample(myData[,1],10000,replace=TRUE)

#mean(data)

#max(data)

#var(data)

#quantile(data, .25)

#quantile(data, .50)

#quantile(data, .75)


#summary(data)
#mean(myData$V1)
#max(myData$V1)
#var(myData$V1)
#quantile(myData$V1)
#median(myData$V1)


#cahouse<-read.csv("CA_house_prices.csv", header=FALSE)
#ohhouse<-read.csv("OH_house_prices.csv", header = FALSE)

#boxplot(cahouse$V1, ohhouse$V1, main="Box Plots",col="blue",names=c("CA", "OH"),ylab="Prices")


#hist(cahouse$V1,breaks=seq(from=0,to=3500,by=500),col=c("green","red","blue","yellow","orange"),main="My Histogram",xlab="California House Prices(dollars)",ylab = "frequency")


#plot(ecdf(cahouse[,1]),verticals= TRUE,do.p = FALSE,main ="ECDF for House Prices ",xlab="Prices (in thousands)",ylab="Frequency")
#lines(ecdf(ohhouse[,1]),verticals= TRUE,do.p = FALSE,col.h="red",col.v="red",lwd=4)
#legend(2100,.6,c("CA Houses","OH Houses"), col=c("black","red"),lwd=c(1,4))


#football<-read.csv("football.csv",header=TRUE)
#head(football)


#str(football)

#plot(football[,2],football[,3],xlim=c(0,12),ylim=c(0,12),pch=15,col="blue",xlab="2003 Wins",ylab="2004 Wins",main="Football Wins")


#cor(football[,2],football[,3]) 

#cor(football[,2],football[,3]+10)

#cor(football[,2],football[,3]*2) 

#cor(football[,2],football[,3]*-2) 

#ohhouse<-read.csv("OH_house_prices.csv", header=FALSE)

#median(ohhouse[,1])

#mean(ohhouse[,1])

#median(ohhouse[,1]+10) 

#median(2*ohhouse[,1]) 

ages<-c(19,23,30,30,45,25,24,20)
sd(ages)

sd(100*ages) 


sd(ages+10) 
