setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\Exam Solutions\\Final exam")
getwd()

data = read.csv("BSE_Sensex_Index.csv", header = TRUE)

library(dplyr)
newdata = mutate(data, sgr = lead((lag(Close) - Close) / Close))

lastcol = nrow(newdata)
x = newdata$sgr[lastcol-1]
y = newdata$sgr[lastcol-2]
z = newdata$sgr[lastcol-3]
newdata$sgr[lastcol] = mean(x,y,z)


sgrmean <- mean(newdata$sgr, na.rm=TRUE)
sgrsd <- sd(newdata$sgr,na.rm=TRUE)
p<-(newdata[,8] - sgrmean) / sgrsd
sort(p)
newdata$zscores <- p

date<-subset(newdata[,1],  newdata[,"zscores"] >= 3.0 | newdata[,"zscores"] <= -3.0)
View(date)