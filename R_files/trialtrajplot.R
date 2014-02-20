# Simple trial by trial trajectory plotting script for TIMELY workshop in Vietri, May 2012

# Requires trialdata from timely_import.R (run that file first)


######################################
### Participant All Trajectories
# With large numbers of trials and/or participants, this script will be slow

# par(mfrow=c(3,3)) # Adjust this if you wish to present many subjects on one page

subjects = unique(trialdata$subject)
trials = unique(trialdata$trial)

for (i in 1:length(subjects)){
  # set up plot - x and y not plotted
  print(i)
  plot(mean(trialdata[trialdata$condition == 0,25:125]),
       mean(trialdata[trialdata$condition == 0, 126:226]), 
       "n", main= subjects[i], xlab = "X", ylab = "Y", lwd = 1, xlim = c(-1,1), ylim = c(0, 1.5))
  
  # this section plots lines on graph
  for (tr in 1:length(trials)){ 
      cond.num = as.numeric(trialdata[ trialdata$subject==subjects[i] & 
        trialdata$trial==trials[tr],]$code) # if you have meaningful conditions in condition variable, then use that here
      
      # color will change for each condition
      lines(trialdata[trialdata$subject==subjects[i] & trialdata$trial==trials[tr],25:125],                            
           trialdata[trialdata$subject==subjects[i] & trialdata$trial==trials[tr],126:226],                            
            "l", col = cond.num, lwd = 2)
      legend(-1, 1.5, unique(trialdata$code), col = as.numeric(trialdata$code), merge = TRUE, bg = 'gray90', lwd = 2)
      
  } # tr
} #i

#   par(mfrow=c(1,1)) # rest parameters


