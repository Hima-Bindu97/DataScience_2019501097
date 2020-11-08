setwd("C:\\Users\\DELL\\Desktop\\DS\\DataScience_2019501097\\Data Mining\\Exam Solutions\\Final exam")
getwd()

data=read.csv("dataset.csv",header = TRUE)
View(data)
data$TID <- NULL
library(arules)
write.csv(data,"itemslist.csv",quote=FALSE,row.names = TRUE)
transactions=read.transactions("itemslist.csv",sep=',',rm.duplicates=TRUE)
inspect(transactions)
frequent_itemsets<- apriori(transactions,parameter=list(sup=0.03,conf=0.5,target="frequent itemsets"))
inspect(sort(frequent_itemsets)[1:15])
itemFrequencyPlot(transactions,topN=5)
