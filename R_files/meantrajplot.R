# Simple mean condition trajectory plotting script for TIMELY workshop in Vietri, May 2012

# Requires trialdata from timely_import.R (run that file first)

######################################
### Participant Mean Trajectories

# par(mfrow=c(4,4)) # adjust if necessary

subjects = unique(trialdata$subject)

for (i in 1:length(subjects)){
  # green is Condition 1
  plot(mean(trialdata[trialdata$condition == 1 & trialdata$subject==subjects[i],25:125]),
       mean(trialdata[trialdata$condition == 1 & trialdata$subject==subjects[i],126:226]), 
       'l', main= subjects[i], col = 'green', xlab = 'X', ylab = 'Y', lwd = 2, xlim = c(-1,1), ylim = c(0, 1.5))
  
  # red is Condition 2
  lines(mean(trialdata[ trialdata$condition == 2 & trialdata$subject==subjects[i],25:125]),
        mean(trialdata[trialdata$condition == 2 & trialdata$subject==subjects[i],126:226]), 
        'l', col = 'red', xlab = 'X', ylab = 'Y', lwd = 2)
  
  legend(-1, 1.5, c('Condition 1', 'Condition 2'), col = c('green', 'red'), merge = TRUE, bg = 'gray90', lwd = 2)
}
#