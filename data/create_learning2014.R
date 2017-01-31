#Milja von Lerber, 30.1.2017. In this file I will learn how to wrangle data.
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(lrn14)

#It seems that the dataset has 180 observations and 60 variables.

str(lrn14)

# So now we see the variables alongside the observations.
#I can understand age, attitude, points and gender, but others are a mystery.

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D07","D14","D22","D30")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

install.packages("dplyr")

lrn14$attitude <- lrn14$Attitude / 10
lrn14$attitude
library(dplyr)
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

keep_columns <- c("gender","Age", "attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(lrn14, one_of(keep_columns))
str(learning2014)
colnames(learning2014)
colnames(learning2014)[2] <- "age"
colnames (learning2014)[7] <- "points"
colnames((learning2014))
learning2014 <- filter(learning2014, points > 0)
setwd
?write.csv
write.table(learning2014, file = "data", append = F)
