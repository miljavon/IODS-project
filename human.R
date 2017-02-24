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
hd$gni <- hd$Gross.National.Income..GNI..per.Capita
hd$gni_minus_hdi <-hd$GNI.per.Capita.Rank.Minus.HDI.Rank
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
#colnames(gii)[1] <- c("a")
hd1 <- select(hd, -(1:8))
str(hd1)
gii1 <- select(gii, -(1:11))
gii2 <- select(gii1, -(1))
str(gii2)

#Mutating the data
library(dplyr)
gii <- mutate(gii, ratioedu = seceduf/secedum)
gii <- mutate(gii, ratiolabour = laborf/laborm)
str(gii)

#Joining the data
join_by <- c("country")
human <- inner_join(gii2, hd1, by = join_by, suffix = c(".gii", ".hd") )

#The GNI as numeric
library(tidyr)
library(stringr)
str_replace(human$gni, pattern=",", replace ="")%>%as.numeric
human$gni

#Keeping only the certain columns
keep <- c("country", "seceduf", "laborf", "life", "eduexp", "gni", "mother_dead", "preggo", "repres")
human <- select(human, one_of(keep))
str(human)

#Filtering out the NA s
human_ <- filter(human, complete.cases(human))
#Excluding the rows of areas
last <- nrow(human) - 7
human_ <- human[1:last, ]

#Adding countries as rownames
rownames(human_) <- human_$country
human_ <- select(human, -country)
str(human_)
install.packages("FactoMineR")
