#Unit 5
E_test=read.table("svmdata4test.txt",header = TRUE, sep="\t")
area.pallete = function(n = 2) 
{ 
  cols = rainbow(n)
  cols[1:2] = c("PaleGreen", "Pink") 
  return(cols)
}
svmModelLinear = svm(Colors ~ ., data = E_test, type = "C-classification", cost = 1, kernel = "sigmoid") 
plot(svmModelLinear, E_test, grid = 250, symbolPalette = symbols.pallete, color.palette = area.pallete)
predictionsTest = predict(svmModelLinear, E_test) 
table(E_test$"Color", predictionsTest)
