library(datasets)
A <- sunspot.year
plot(A)  
A <- data.frame(A, Year=1700:1988)
res <- lm(A~Year, data = A)
plot(res$fitted.values)
