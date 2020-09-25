install.packages("rpart")
install.packages("caret")
library(rpart)
library(caret)
set.seed(3456)
#Dividing data into training testing and validation
spec = c(train = .6, test = .2, validate = .2)
FinalData <- read.csv("Data.csv")
View(FinalData)
FinalData <- FinalData[,-1]

dt = sample(cut(
  seq(nrow(FinalData)), 
  nrow(FinalData)*cumsum(c(0,spec)),
  labels = names(spec)
))

res = split(FinalData, dt)
traindt <- res$train
testdt <- res$test
validatedt <- res$validate
View(validate)

#########################
#Decision Trees
#Training without tuning
fit <- rpart(Win_time~.,data = traindt,method="anova")
summary(fit)
plot(fit,uniform = TRUE,main = "Regression tree for Win_time")
text(fit, use.n=TRUE,cex=0.6)
printcp(fit)
#Xerror decreases with the split, no overfitting
#Computing on validation
decision.trees.predict <- predict(fit, validatedt[,-2])

DT <- data.frame(decision.trees.predict,validatedt[,2])
RMSE(decision.trees.predict,validatedt[,2])
R2(decision.trees.predict,validatedt[,2])
MAE(decision.trees.predict,validatedt[,2])

#R2 0.8762 RMSE 0.1660 MAE 0.12
#Tuning - Random search with k fold
dt_fitControl <- trainControl(method = "repeatedcv",
                              number = 10,
                              repeats=5, 
                              search="random")

set.seed(1337)
dt_random <- caret::train(Win_time~., 
                          data=traindt,
                          method="rpart",
                          tuneLength=15,
                          trControl=dt_fitControl)
#Predicting on validation
decision.trees.predict.tune1 <- predict(dt_random, validatedt[,-2])
DTtune <- data.frame(decision.trees.predict.tune1,validatedt[,2])
View(DTtune)

View(decision.trees.predict.tune11)
RMSE(decision.trees.predict.tune1,validatedt[,2])
R2(decision.trees.predict.tune1,validatedt[,2])
MAE(decision.trees.predict.tune1,validatedt[,2])
plot(decision.trees.predict.tune1,validatedt[,2])
#RMSE = 0.05, R2 = 0.9859, MAE 0.022
View(test)
#Checking on test set
decision.trees.predict.tune2 <- predict(dt_random, testdt[,-2])
DTtune1 <- data.frame(decision.trees.predict.tune2,testdt[,2])
View(DTtune1)

RMSE(decision.trees.predict.tune2,testdt[,2])
R2(decision.trees.predict.tune2,testdt[,2])
MAE(decision.trees.predict.tune2,testdt[,2])

#RMSE = 0.06 R2 0.9834 MAE 0.022

plot(decision.trees.predict.tune1,testdt[,2],xlab = "Predicted",ylab = "Original",abline(a=0,b=1),col=c("red","blue"))
