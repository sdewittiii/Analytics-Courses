###########################
## EXERCISE 3 ANSWER KEY ##
###########################

## IMPORT DATA
  nlsy97_raw <- read.csv("nlsy97_raw.csv")

## LOAD LIBRARIES
  library(dplyr); library(sjlabelled)
  
## MAKE COPY OF RAW DATA
  nlsy97 <- nlsy97_raw
  
## CHANGE COLUMN NAMES IN DATA FRAME
  colnames(nlsy97) <- c("nlsy97_id", "sex", "birth_year", "race", "hh_struc98", 
                        "int_year98", "cigs_thirty99", "marij_thirty99", 
                        "coke_thirty99", "destprop_num99", "stllt50_num99", 
                        "stlgt50_num99", "othprop_num99", "selldrugs_num99", 
                        "alc_thirty99", "empweeks_num98")
  
## CHANGE MISSING VALUES TO MISSING OR ZERO
  nlsy97[nlsy97==-4] <- 0
  nlsy97[nlsy97==-5 |
         nlsy97==-3 |
         nlsy97==-2 |
         nlsy97==-1] <- NA
  
## CREATE AGE VARIABLE
    nlsy97$age98 <- nlsy97$int_year - nlsy97$birth_year
    
## CREATE COLUMN LABELS
    nlsy97$nlsy97_id <- set_label(nlsy97$nlsy97_id, "Unique ID")
    nlsy97$sex <- set_label(nlsy97$sex, "Biological sex")
    nlsy97$birth_year <- set_label(nlsy97$birth_year, "Birth Year")
    nlsy97$race <- set_label(nlsy97$race, "Race/Ethnicity")
    nlsy97$hh_struc98 <- set_label(nlsy97$hh_struc98, "Household Structure (98 Interview)")
    nlsy97$int_year98 <- set_label(nlsy97$int_year98, "Interview Year (98 Interview)")
    nlsy97$cigs_thirty99 <- set_label(nlsy97$cigs_thirty99, "Number of cigarettes smoked in last 30 days (99 Interview)")
    nlsy97$marij_thirty99 <- set_label(nlsy97$marij_thirty99, "Number times smoked marijuana in the last 30 days (99 Interview)")
    nlsy97$coke_thirty99 <- set_label(nlsy97$coke_thirty99, "Number of times did cocaine or other hard drugs in last 30 days (99 Interview)")
    nlsy97$destprop_num99 <- set_label(nlsy97$destprop_num99, "Number of times destroyed property since last interview (99 Interview)")
    nlsy97$stllt50_num99 <- set_label(nlsy97$stllt50_num99, "Number of times stole <$50 since last interview (99 Interview)")
    nlsy97$stlgt50_num99 <- set_label(nlsy97$stlgt50_num99, "Number of times stole >$50 since last interview (99 Interview)")
    nlsy97$othprop_num99 <- set_label(nlsy97$othprop_num99, "Number times committed other property crimes since last interview (99 Interview)")
    nlsy97$selldrugs_num99 <- set_label(nlsy97$selldrugs_num99, "Number times sold drugs since last interview (99 Interview)")
    nlsy97$alc_thirty99 <- set_label(nlsy97$alc_thirty99, "Number of times drank alcohol in the last 30 days (99 Interview)")
    nlsy97$empweeks_num98 <- set_label(nlsy97$empweeks_num98, "Number of weeks employed since the last interview (98 Interview)")
    nlsy97$age98 <- set_label(nlsy97$age98, "Respondent Age (98 Interview)")

## RECODE THE HOUSEHOLD STRUCTURE VARIABLE
  nlsy97$hh_struc98[nlsy97$hh_struc98==1] <- "Both bio"
  nlsy97$hh_struc98[nlsy97$hh_struc98==2 | 
                    nlsy97$hh_struc98==3] <- "One bio/One step"
  nlsy97$hh_struc98[nlsy97$hh_struc98==4 |
                    nlsy97$hh_struc98==5] <- "One bio"
  nlsy97$hh_struc98[nlsy97$hh_struc98==6 |
                    nlsy97$hh_struc98==7 |
                    nlsy97$hh_struc98==8 |
                    nlsy97$hh_struc98==9 |
                    nlsy97$hh_struc98==10] <- "Other"
    
## RECODE SEX VARIABLE
  nlsy97$sex[nlsy97$sex==1] <- "Male"
  nlsy97$sex[nlsy97$sex==2] <- "Female"
  
## RECODE RACE/ETHNICITY VARIABLE
  nlsy97$race[nlsy97$race==1] <- "Black"
  nlsy97$race[nlsy97$race==2] <- "Hispanic"
  nlsy97$race[nlsy97$race==3] <- "Two or more races"
  nlsy97$race[nlsy97$race==4] <- "White"
  
## SUMMARIZE DATA FRAME
  summary(nlsy97)