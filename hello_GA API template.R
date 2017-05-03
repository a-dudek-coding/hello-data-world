rm(list=ls(all=TRUE))

##get access to GA 
library(RGoogleAnalytics)
load("./token_file")
ValidateToken(token)

##query parameters
query.list <- Init(start.date = "2016-01-01",
                   end.date = "2016-09-08",
                   dimensions = "ga:date,ga:channelGrouping",
                   metrics = "ga:sessions,ga:bounces,ga:goal5Completions, ga:goal1Completions",
                   max.results = 10000,
                   sort = "-ga:date",
                   table.id = "ga:87324011") ##<-view id


ga.query <- QueryBuilder(query.list)

###3 ways to retrieve data
data <- GetReportData(ga.query, token)                     ##retrieve data - less than 10000 rows
data <- GetReportData(ga.query, token,paginate_query=T)    ##retrieve data - more than 1000 rows
data <- GetReportData(ga.query, token,split_daywise = T)   ##retrieve data - split day-wise to reduce sampling

###fix date formats
library(lubridate)
data$date1 <- as.Date(data$date, "%Y%m%d")  
data$date1 <- as.Date(data$date1, format="%d-%m-%Y")
data$weeknum <- as.numeric( format(data$date1+2, "%U"))       ##add weeknumber, week ending Thursday
data$weekday <- weekdays(as.Date(data$date1))                 ##day of the week


