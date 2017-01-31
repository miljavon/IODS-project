learning2014 <- read.table("learning2014", header = TRUE, sep = ",")
learning2014
str(learning2014)
dim(learning2014)
 
# The data has 166 observations of 8 variables, which include gender, age, attitude, 
#deep learning, stategic learning, surface learning and the points (nonexistent points
#were excluded). The Data is about learning statistics from a course that was arranged
#in 2014.

install.packages("statisticalModeling")
library(ggplot2)
install.packages("GGally")
library(GGally)

p <- ggpairs(learning2014, mapping = aes(col = gender, alpha = 0.3), lower = list(combo = wrap("facethist", bins = 20)))
p

# the plot with all the pairs is very interesting. One can clearly see the correlation
#between attitude and points.
summary(learning2014$gender)
#There seems to have been significantly more females than males.
summary(learning2014$age)
#The youngest one was 17 while the oldest was 55. The median was 22, which is 
#a lot smaller than the mean, which was about 25
summary(learning2014$attitude)
#The overall attitude seems to have been modestly positive with the mean and the median being
#about 3,2. The boys seem to have had a better attitude. 
summary(learning2014$deep)
#The deep learning was quite high. The distribution was heavily on the better side:
#the mean was almost 4. 
summary(learning2014$stra)
#The strategic learning seems to have been lower than deep learning, with the mean being
#just over 3.
summary(learning2014$surf)
#Surface learning was significantly lower than the other variables related to learning.
#Average was 2,8.
summary(learning2014$points)
#I was happy to notice that the average amount of points was actually cuite high, with almost 23 points. 

