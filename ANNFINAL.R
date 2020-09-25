FinalData <- read.csv("Data.csv")
View(FinalData)
FinalData <- FinalData[,-1]
#########ANN#####
#Dividing data into train, test, validate
Index <- sample(1:dim(FinalData)[1],dim(FinalData)[1]*0.8,replace=FALSE)
Train  <- FinalData[Index, ]
Test  <- FinalData[-Index, ]

Index1 <- sample(1:dim(Train)[1],dim(Train)[1]*0.8,replace=FALSE)
Train1 <- FinalData[Index1, ]
Validate1  <- FinalData[-Index1, ]

max = apply(FinalData , 2 , max)
min = apply(FinalData, 2 , min)
scaled = as.data.frame(scale(FinalData, scale = max - min))

TrainNN = scaled[Index1 , ]
ValidateNN = scaled[-Index1 , ]
TestNN = scaled[-Index,]
####################################
#Training the data - 1 neuron
ANN2 <- neuralnet(Win_time~.,data = TrainNN)
#Predicting on the validation set
Predict = neuralnet::compute(ANN2, ValidateNN[,-2])
Predict1 = (Predict$net.result * (max(FinalData$Win_time) - min(FinalData$Win_time))) + min(FinalData$Win_time)
NN1 <- data.frame(Predict1,Validate1[,2])
View(TrainNN)
#RESULTS
RMSE(Predict1,Validate1[,2])
R2(Predict1,Validate1[,2])
MAE(Predict1,Validate1[,2])
#RMSE 1.83 R2 0.76 MAE 1.81
# 2-Hidden Layers, Layer-1 4-neurons, Layer-2, 1-neuron, logistic activation
ANN3 <- neuralnet(Win_time~.,data = TrainNN,hidden = 2,linear.output = T)

Predict2 = neuralnet::compute(ANN3, ValidateNN[,-2])
Predict2 = (Predict2$net.result * (max(FinalData$Win_time) - min(FinalData$Win_time))) + min(FinalData$Win_time)
NN3 <- data.frame(Predict1,Validate1[,2])
View(NN)
RMSE(Predict2,Validate1[,2])
R2(Predict2,Validate1[,2])
MAE(Predict2,Validate1[,2])
#RMSE 1.59 R2 0.98 1.15

#############################################

ANN5 <- neuralnet(Win_time~.,data = TrainNN,hidden = 3,linear.output = T)

Predict5 = neuralnet::compute(ANN5, ValidateNN[,-2])
Predict5 = (Predict5$net.result * (max(FinalData$Win_time) - min(FinalData$Win_time))) + min(FinalData$Win_time)
NN3 <- data.frame(Predict1,Validate1[,2])
View(NN)
RMSE(Predict5,Validate1[,2])
R2(Predict5,Validate1[,2])
MAE(Predict5,Validate1[,2])
#RMSE 1.64 R2 0.9838 MAE 1.64
Predict = neuralnet::compute(ANN3, TestNN[,-2])
Predict = (Predict$net.result * (max(FinalData$Win_time) - min(FinalData$Win_time))) + min(FinalData$Win_time)
RMSE(Predict,Test[,2])
R2(Predict,Test[,2])
MAE(Predict,Test[,2])
#RMSE 1.6 R2 0.9955 MAE 1.60