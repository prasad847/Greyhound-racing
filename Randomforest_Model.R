###############RF#####################################
install.packages("randomForest")
library(randomForest)
#Splitting the dataset into 3 parts
FinalData <- read.csv("Data.csv")
View(FinalData)
FinalData <- FinalData[,-1]set.seed(1456)
spec = c(train = .6, test = .2, validate = .2)

rf = sample(cut(
  seq(nrow(FinalData)), 
  nrow(FinalData)*cumsum(c(0,spec)),
  labels = names(spec)
))

res = split(FinalData, rf)
trainrf <- res$train
testrf <- res$test
validaterf <- res$validate
#Training without tuning
random <- randomForest(Win_time~.,data=trainrf)

plot(random,uniform = TRUE,main = "Regression tree for Win_time")
text(random, use.n=TRUE,cex=0.6)
# Checking on validation set
rf.predict <- predict(random, validaterf)
RMSE(rf.predict,validaterf[,2])
R2(rf.predict,validaterf[,2])
MAE(rf.predict,validaterf[,2])
#RMSE 0.030 R2 0.995 MAE 0.015

#Tuning Random search and Kfold
dt_fitControl1 <- trainControl(method = "repeatedcv",search="random")

set.seed(4337)
rf_random <- randomForest(Win_time~., 
                          data=trainrf,
                          method="rf",
                          tuneLength=15,
                          trControl=dt_fitControl1)
#Checking on validation
rf.tune <- predict(rf_random, validaterf[,-2])
rftune <- data.frame(rf.tune,validaterf[,2])
View(rftune)

RMSE(rf.tune,validaterf[,2])
R2(rf.tune,validaterf[,2])
MAE(rf.tune,validaterf[,2])
#Checking on test

rf.tune1 <- predict(rf_random, testrf[,-2])
rftune1 <- data.frame(rf.tune1,testrf[,2])
View(rftune)

RMSE(rf.tune1,testrf[,2])
R2(rf.tune1,testrf[,2])
MAE(rf.tune1,testrf[,2])
plot(rf.tune1,testrf[,2],xlab = "Predicted",ylab = "Original",abline(a=0,b=1),col=c("red","blue"))
