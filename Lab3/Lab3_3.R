library("tree")
library("DAAG")
library("maptree")
library("kernlab")  
data(nsw74psid1)
tr <- tree(re78 ~.,nsw74psid1)
draw.tree(tr, cex = 0.7)
res <- lm(re78 ~ ., data = nsw74psid1)
summary(res)
confint(res)
ksvm(re78 ~ ., data=nsw74psid1)
