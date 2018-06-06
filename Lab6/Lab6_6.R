#Unit 6
F <-read.table("svmdata6.txt",header = TRUE, sep="\t")
set.seed(0)
plot(F$X, F$Y)
svmModel = svm(F$X, F$Y,type = "eps-regression", cost = 1, kernel = "radial", epsilon  = 0.5)
points(F$X[svmModel$index], F$Y[svmModel$index], col = "red") 
predctions = predict(svmModel,F$X) 
lines(F$X, predctions, col = "dodgerblue", lwd = 2) 
lines(F$X, predctions + svmModel$epsilon, col = "cyan") 
lines(F$X, predctions - svmModel$epsilon, col = "cyan")
msquared = c()
for(i in seq(0.05, 1.5, by = 0.05)){
  svmModel = svm(F$X, F$Y, type = "eps-regression", cost = 1, kernel = "radial", epsilon  = i,cross = 1)
  predctions = predict(svmModel, F$X)
  msquared =c(msquared,sum((predctions - F$Y) ^ 2) / length(predctions))
}
plot(msquared, x = seq(0.05, 1.5, by = 0.05))
