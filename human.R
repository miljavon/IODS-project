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
hd$dev_rank <-hd$HDI.Rank
hd$country <- hd$Country
hd$i <- hd$Human.Development.Index..HDI.
hd$life<-hd$Life.Expectancy.at.Birth
hd$eduexp<-hd$Expected.Years.of.Education
hd$edumean <- hd$Mean.Years.of.Education
gii$gni <- hd$Gross.National.Income..GNI..per.Capita
gii$gni_minus_hdi <-hd$GNI.per.Capita.Rank.Minus.HDI.Rank
gii$rank <- gii$GII.Rank
gii$country <- gii$Country
gii$gii <- gii$Gender.Inequality.Index..GII.
gii$mother_dead <- gii$Maternal.Mortality.Ratio
gii$preggo <- gii$Adolescent.Birth.Rate
gii$repres <- gii$Percent.Representation.in.Parliament
gii$seceduf <- gii$Population.with.Secondary.Education..Female.
gii$secedum <- gii$Population.with.Secondary.Education..Male.
gii$laborf <- gii$Labour.Force.Participation.Rate..Female.
gii$laborm <- gii$Labour.Force.Participation.Rate..Male.
#Mutating the data
library(dplyr)
ratioe <- mutate(gii, ratioedu = seceduf/secedum)
ratiol <- mutate(gii, ratiolabour = laborf/laborm)                 
#Joining the data
join_by <- c("giicountry","hdcountry")
human <- inner_join(gii, hd, by = join_by, suffix = c(".gii", ".hd") )

