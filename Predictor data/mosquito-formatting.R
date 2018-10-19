library(stringr)
setwd('C:/Users/ccarlson/Documents/Github/dame-gideon/Predictor data')

test <- read.csv('mosquito-unformatted.csv',header = FALSE)
test[,2] <- 'blorp'
test[,2] <- as.character(test[,2])

for(i in 1:(nrow(test)/2)){
  test[2*i-1,2] <- as.character(test[2*i,1])
}

test <- test[c(1:(nrow(test)/2))*2-1,]

test2 <- test[1,]


ticker=1
for (i in 1:length(test$V1)) {
  
  list <- str_split(test$V2[i],";")[[1]]
  list <- list[1:(length(list)-1)]
  
  for (j in 1:length(list)) {
   test2[ticker,] <- c(as.character(test$V1[i]),list[j])
   ticker <- ticker+1
  }
}

write.csv(test2, 'mosquito-formatted.csv')
