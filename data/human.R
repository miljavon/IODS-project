hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd)
#195 obs of 8 variables
str(gii)
#195 obs of 10 variables
#printing out the summaries of the variables
summary(hd)
summary(gii)
#renaming the variables
dev_rank <-hd$HDI.Rank
hdcountry <- hd$Country
hdi <- hd$Human.Development.Index..HDI.
life<-hd$Life.Expectancy.at.Birth
eduexp<-hd$Expected.Years.of.Education
edumean <- hd$Mean.Years.of.Education
gni <- hd$Gross.National.Income..GNI..per.Capita
gni_minus_hdi <-hd$GNI.per.Capita.Rank.Minus.HDI.Rank
giirank <- gii$GII.Rank
giicountry <- gii$Country
gii <- gii$Gender.Inequality.Index..GII.
mother_dead <- gii$Maternal.Mortality.Ratio
preggo <- gii$Adolescent.Birth.Rate
repres <- gii$Percent.Representation.in.Parliament
seceduf <- gii$Population.with.Secondary.Education..Female.
secedum <- gii$Population.with.Secondary.Education..Male.
laborf <- gii$Labour.Force.Participation.Rate..Female.
laborm <- gii$Labour.Force.Participation.Rate..Male.
#Mutating the data
library(dplyr)
ratioe <- mutate(gii, ratioedu = seceduf/secedum)
ratiol <- mutate(gii, ratiolabour = laborf/laborm)                 
#Joining the data
join_by <- c("giicountry","hdcountry")
human <- inner_join(gii, hd, by = join_by, suffix = c(".gii", ".hd") )
