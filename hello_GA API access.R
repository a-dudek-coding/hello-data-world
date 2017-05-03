##instructions available here: http://www.r-bloggers.com/how-to-extract-google-analytics-data-in-r-using-rgoogleanalytics/
##the instructions below are using an existing OAuth; above instructions are to create a new project + new OAuth

install.packages("RGoogleAnalytics")
library(RGoogleAnalytics)


##1) Log into Gmail account
###username: anna.dudek@ovoenergy.com
###password: maxthecow

client.id <- "621180029723-kheejv0idfovvccrqvj58s1k6t4mcuef.apps.googleusercontent.com"   ##clientID
client.secret <- "rAnun593UIICpNwmrxFmVrrN"   ##<-client secret   #named as Other client 2
token <- Auth(client.id,client.secret)   ##save token

##API requests will only run authentication each time afterwards //authentication instructions below.

## Save the token object for future sessions
save(token,file="./token_file")             

## Need to figure out how to save the token to Git