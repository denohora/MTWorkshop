# Simple import script for TIMELY workshop in Vietri, May 2012

# Takes as input a .csv file processed by MouseTracker Analyser
# MouseTracker suite of applications coded by Jon Freeman
# and available at http://mousetracker.jbfreeman.net/help/index.htm

######## Starts below

# sets working directory - adjust for your computer and uncomment
# setwd("~/Dropbox/Storage/TIMELY workshop/sample_nohold") 

import = read.csv(file.choose(), skip=1, stringsAsFactors=FALSE) # pick MT output .csv file

# cut off the end of the file - put into separate data frame
first.meanrow = as.numeric(row.names(import[import[,1] == "MEAN SUBJECT-BY-SUBJECT DATA",]))

## TRIAL DATA
trialdata = data.frame(import[1:first.meanrow-1,])
# check last 6 columns of data frame to see if last column ok
head(trialdata[,(length(trialdata)-5):length(trialdata)])
# if not trim columns
trialdata=trialdata[,1:226] # adjust if more than 2 responses
trialdata=trialdata[is.na(trialdata$trial)==F,1:226] # remove any breaks or instructions from trial series

# test data
# trialdata[(nrow(trialdata)-10):nrow(trialdata), 1:10]
# nas = trialdata[is.na(trialdata$X_1 == T),]

# prep data frame by using sensibke data types for column vectors
for (column in c(2,11:ncol(trialdata))) trialdata[,column] = as.numeric(trialdata[,column])
for (column in c(1,3:5)) trialdata[,column] = as.factor(trialdata[,column])
trialdata$error = as.logical(as.numeric(trialdata$error))

## MEAN DATA
# set up meandata data frame
num.subs = length(unique(trialdata[,1]))
meandata = data.frame(import[(first.meanrow+2):(first.meanrow+1+num.subs),])

meandata[nrow(meandata), 1:10] # columns are wrong
mean.colnames = as.character(import[(first.meanrow+1),]) # these are the mean column names
mean.colnames = mean.colnames[mean.colnames!="NA"]

meandata = meandata[,1:length(mean.colnames)]
colnames(meandata) = mean.colnames

for (column in 3:ncol(meandata)) meandata[,column] = as.numeric(meandata[,column])
for (column in 1:2) meandata[,column] = as.factor(meandata[,column])


