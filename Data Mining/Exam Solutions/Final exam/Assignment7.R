setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\Exam Solutions\\Final exam\\Final exam")
getwd()
data = read.csv("Liver_data.csv", header = FALSE, col.names = c("1", "2", "3", "4", "5", "6", "7"))
str(data)
summary(data)
x = data[,1:5]
y = data[,6]
fit = kmeans(x,4)
library(class)
knnfit = knn(fit$centers,x,as.factor(c(-2,-1,1,2)))
error = 1-sum(knnfit == y)/length(y)
error