library(data.table)
DataBase <- read.csv("edw_dataset.csv",sep=",",header=TRUE,na.strings="NULL")
setnames(DataBase,c("YEAR","MONTH","DAY","TOTAL"),c("Year","Month","Day","Total"))

DataYear <- as.data.table(DataBase)[,mean(Total),by="Year,Month"]
setnames(DataYear,"V1","Total")

DataYearAll <- DataYear[,mean(Total),by="Year"]
setnames(DataYearAll,"V1","Total")
