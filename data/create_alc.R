#Milja von Lerber, 4.2.2017
#The dataset will be about student alcohol consumption in Portugal. 
#A link to the original open data: https://archive.ics.uci.edu/ml/machine-learning-databases/00356/

#Reading the data into memory 
url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets"
url_math <- paste(url, "student-mat.csv", sep = "/")
math <- read.table(url_math, sep = ";" , header=TRUE)
url_por <- paste(url, "student-por.csv", sep = "/")
por <- read.table(url_por, sep = ";", header = TRUE)

#Exploring the structure of the data 
str(math)
str(por) 
#"math" has 395 observations of 33 variables and "por" has 649 observations of 33 variables
#Joining the datasets
library(dplyr)
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por") )

#If- else structure
alc <- select(math_por, one_of(join_by))
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]
for(column_name in notjoined_columns) {
two_columns <- select(math_por, starts_with(column_name))
  
  first_column <- select(two_columns, 1)[[1]]
  
  
  if(is.numeric(first_column)) {
    
    alc[column_name] <- round(rowMeans(two_columns))
  } else { 
    alc[column_name] <- first_column
  }
}
glimpse(alc)
