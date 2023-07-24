getwd()

setwd(".\\Weather Data")

Chicago <- read.csv("Chicago-F.csv", row.names=1)
NewYork <- read.csv("NewYork-F.csv", row.names=1)
Houston <- read.csv("Houston-F.csv", row.names=1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names=1)

#Chicago:
Chicago
#New york:
NewYork
#Houston
Houston
#SanFrancisco
SanFrancisco

#These are dataframes:
is.data.frame(Chicago)


#Lets Convert to matricies:
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#Check:
is.matrix(Chicago)


#Lets put all of this into a list:
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather


#Lets try it out
Weather[3]
Weather[[3]]
Weather$Houston

#apply()
Chicago
apply(Chicago, 1, mean)


#analyze 
apply(Chicago, 1, max)
apply(Chicago, 1, min)


# for practice
apply(Chicago, 2, max)
apply(Chicago, 2, min)


#Compare Cities
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)
                          # <<< (nearly)deliv1: but there is a faster way

#Recreating the apply fuction with loops 
Chicago

#Find the mean of every row

#Via loops
output <- NULL #Preparing an empty vector 
for(i in 1:5){ #run Cycle
  output[i] <- mean(Chicago[i,])
}
output
names(output) <-rownames(Chicago)
output


#2. via apply function
apply(Chicago, 1, mean)

#Using lapply()
Chicago
t(Chicago)
Weather
lapply(Weather, t) 
mynewlist <- lapply(Weather, t)
mynewlist


#example 2
Chicago
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, NewRow=1:12)


#example 3
rowMeans(Chicago)
lapply(Weather, rowMeans)

# Combining lappy with the [] operator
Weather
lapply(Weather, "[", 1,1)

lapply(Weather, "[",1)

lapply(Weather, "[",3)

#Adding your own Functions
lapply(Weather, rowMeans)
lapply(Weather, function(x) x[1,])

lapply(Weather, function(x)x[5,])

lapply(Weather, function(x)x[,12])

lapply(Weather, function(z)z[1,]-z[2,])

lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))

#Using sapply()
Weather

#AvgHigh_F for July;
lapply(Weather, "[", 1, 7)
sapply(Weather, "[", 1, 7)
#AvgHigh_F for 4th quarter 
lapply(Weather, "[", 1, 10:12)
sapply(Weather, "[", 1, 10:12)
#another example
lapply(Weather, rowMeans)
lapply(Weather, rowMeans)
round(sapply(Weather, rowMeans), 2)
#Another example:
sapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))
#By the way
sapply(Weather, rowMeans, simplify=FALSE)

#Nesting Aply Functions 
Weather
lapply(Weather, rowMeans)
Chicago
apply(Chicago, 1, max)

#apply across whole list:
lapply(Weather, apply, 1, max)
lapply(Weather, function(x) apply(x, 1, max))

#tidyup
sapply(Weather, apply, 1, max)
sapply(Weather, apply, 1, min)

#Which.max
which.max(Chicago[1,])
names(which.max(Chicago[1,]))

apply(Chicago, 1, function(x) names(which.max(x)))
lapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))








       