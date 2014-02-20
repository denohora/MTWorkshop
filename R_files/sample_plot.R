# Test plotting Mousetracker csvs at Swansea Uni Feb 2014

# for more R functions for mousetracking analyses check out
# https://github.com/denohora/mtR

# for a useful guide to R download this
# http://webcom.upmf-grenoble.fr/LIP/Perso/DMuller/M2R/R_et_Mixed/documents/Baayen-Livre-Draft.pdf

print("First, we need to tell R where we are working")
print("click any file in your R files folder")
setwd(dirname(file.choose())) #click any file in your R files folder

# use "source" to import functions from other R files
source("mt_import.R") # this is a general purpose mt csv importer (based on read.csv)
source("mt_plot.R") # this is a simple plotting function that will plot the mean traj in data frame
                    # we will subset data frames to use this function

# import the data using mt.import and store it in sampledata
sampledata = mt.import("sampledata.csv", prepVar = T)

# use str to look at the first 30 columns of sampledata
str(sampledata[,1:30])

# get the names of the conditions
unique(sampledata$code)

# first rough usage of mt.plot
mt.plot(sampledata[sampledata$code == "model_h",]) # uses "plot"s defaults
# average trajectory for the model_h condition

# let's compare model_h with model_m
mt.plot(sampledata[sampledata$code == "model_h",],
        xlim = c(-1,1), ylim = c(0,1.2), type = "l", col = "red" ) 
mt.plot(sampledata[sampledata$code == "model_m",], NewPlot = F,
        xlim = c(-1,1), ylim = c(0,1.2), type = "l", col = "green" ) # uses "plot"s defaults
















