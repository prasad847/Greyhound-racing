install.packages("xgboost")
install.packages("caret")
library(xgboost)
library(caret)
set.seed(3456)
spec = c(train = .6, test = .2, validate = .2)
FinalData <- read.csv("Data.csv")
View(FinalData)
FinalData <- FinalData[,-1]

Sample = sample(cut(
  seq(nrow(FinalData)), 
  nrow(FinalData)*cumsum(c(0,spec)),
  labels = names(spec)
))

res = split(FinalData, Sample)
trainxg <- res$train
testxg <- res$test
validatexg <- res$validate
View(trainxg)
# Training the model without hyper parameter tuning
xgb_model = train(
  trainxg[,-2],trainxg[,2],  
  method = "xgbTree"
)

#Predicting on validation set
predicted = predict(xgb_model, validatexg[,-2])

RMSE(predicted,validatexg[,2])
R2(predicted,validatexg[,2])
MAE(predicted,validatexg[,2])
#RMSE 0.02, R2 0.991 MAE 0.011

#Parameter tuning with k fold
xgb_trcontrol = trainControl(
  method = "cv",
  number = 5,  
  allowParallel = TRUE,
  verboseIter = FALSE,
  returnData = FALSE
)

xgbGrid <- expand.grid(nrounds = c(100,200),  # this is n_estimators in the python code above
                       max_depth = c(10, 15, 20, 25),
                       colsample_bytree = seq(0.5, 0.9, length.out = 5),
                       ## The values below are default values in the sklearn-api. 
                       eta = 0.1,
                       gamma=0,
                       min_child_weight = 1,
                       subsample = 1
)
#Training the model after hyper parameter tuning 
set.seed(0123) 
xgb_model1 = train(
  trainxg[,-2],trainxg[,2],  
  trControl = xgb_trcontrol,
  tuneGrid = xgbGrid,
  method = "xgbTree"
)

# Checking on validation
predicted1 = predict(xgb_model1, validate[,-2])


RMSE(predicted1,validate[,2])
R2(predicted1,validate[,2])
MAE(predicted1,validate[,2])

# Finally predicting on the test dataset
predicted2 = predict(xgb_model1, testxg[,-2])
RMSE(predicted2,testxg[,2])
R2(predicted2,testxg[,2])
MAE(predicted2,testxg[,2])
#RMSE 0.02, R2 0.9982 MAE 0.007

plot(predicted2,test[,2],abline(a=0,b=1),col= c("red","blue"), xlab = "Predicted", ylab = "Original")
###################################################################################

