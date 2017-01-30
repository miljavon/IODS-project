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


