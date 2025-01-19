#################################
## INTRODUCTION TO DATA FRAMES ##
#################################

data()
?USArrests
data("USArrests")
USArrests
head(USArrests)

## Summarizing Data Frames

summary(USArrests)
summary(USArrests$Murder)

## Measures of Central Tendency

mean(USArrests$Murder)
median(USArrests$Murder)

## Manual Computation of Mean

sum(USArrests$Murder)/length(USArrests$Murder)

## Measures of Dispersion

range(USArrests$Murder)
max(USArrests$Murder)-min(USArrests$Murder)

sd(USArrests$Murder)

## Manual Computation of Standard Deviation

sqrt(sum((USArrests$Murder-mean(USArrests$Murder))^2)/(length(USArrests$Murder)-1))

## Adding Variables to USArrests

USArrests$Assault2013<-Assault2013
USArrests$Murder2013<-Murder2013
USArrests$Rape2013<-Rape2013

## Percent Change Calculations

((mean(USArrests$Murder2013)-mean(USArrests$Murder))/mean(USArrests$Murder))*100
((mean(USArrests$Assault2013)-mean(USArrests$Assault))/mean(USArrests$Assault))*100
((mean(USArrests$Rape2013)-mean(USArrests$Rape))/mean(USArrests$Rape))*100





