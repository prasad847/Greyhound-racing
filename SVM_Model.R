install.packages("e1071")
library("e1071")
#Dividing the dataset
set.seed(1456)
FinalData <- read.csv("Data.csv")
View(FinalData)
FinalData <- FinalData[,-1]
spec = c(train = .6, test = .2, validate = .2)

sm = sample(cut(
  seq(nrow(FinalData)), 
  nrow(FinalData)*cumsum(c(0,spec)),
  labels = names(spec)
))

res = split(FinalData, sm)
trainsvm <- res$train
testsvm <- res$test
validatesvm <- res$validate
#Radial Kernel
model_svm_radial <- svm(Win_time~., data = trainsvm,type = "eps-regression",kernel = "radial")
predict_svm_radial <- predict(model_svm_radial,validatesvm[,-2])
RMSE(predict_svm_radial,validatesvm[,2])
R2(predict_svm_radial,validatesvm[,2])
MAE(predict_svm_radial, validatesvm[,2])
# RMSE 0.04 R2 0.9916 MAE 0.027
#Linear kernel
model_svm_linear <- svm(Win_time~., data = trainsvm,type = "eps-regression",kernel = "linear")
predict_svm_linear <- predict(model_svm_linear,validatesvm[,-2])
RMSE(predict_svm_linear,validatesvm[,2])
R2(predict_svm_linear,validatesvm[,2])
MAE(predict_svm_linear, validatesvm[,2])
#polynomial kernel
#RMSE 0.07 R2 0.97 MAE 0.04
model_svm_polynomial <- svm(Win_time~., data = trainsvm,type = "eps-regression",kernel = "polynomial")
predict_svm_polynomial <- predict(model_svm_polynomial,validatesvm[,-2])
RMSE(predict_svm_polynomial,validatesvm[,2])
R2(predict_svm_polynomial,validatesvm[,2])
MAE(predict_svm_polynomial, validatesvm[,2])
#RMSE 0.05 R2 0.98 MAE 0.03
#tuning
tuneModel <- tune(svm,Win_time~.,data = trainsvm,range=list(elsilon=seq(0,1,0.1),cost = 1:100),type = "eps-regression",kernel= "radial" )
plot(tuneModel)

tunedModel <- tuneModel$best.model
#Computing the best model on test dataset
tunedModel1 <- predict(tunedModel,testsvm[,-2])
RMSE(tunedModel1,testsvm[,2])
R2(tunedModel1,testsvm[,2])
MAE(tunedModel1,testsvm[,2])
#RMSE 0.04 R2 0.9913 MAE 0.02