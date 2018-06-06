library(kknn)
library(kernlab)

data(spam)
#spam[0:1, ]
size <- length(spam)

k_pos <- integer(9)
k_neg <- integer(9)

k_pos_test <- integer(9)
k_neg_test <- integer(9)
for (i in 1:9) {
  idx <- sample(1:dim(spam)[1], size * i / 10)
  spamtrain <- spam[-idx, ]
  spamtest <- spam[idx, ]
  
  kknn_predicted <- kknn(type ~ ., spamtrain, spamtest)
  kknn_res_table <- table(kknn_predicted$fitted.values, spamtest$type)
  pos <- kknn_res_table['nonspam', 'nonspam'] + kknn_res_table['spam', 'spam']
  neg <- kknn_res_table['nonspam', 'spam'] + kknn_res_table['spam', 'nonspam']
  k_pos[i] <- pos / length(kknn_predicted$fitted.values)
  k_neg[i] <- neg / length(kknn_predicted$fitted.values)
}
png(file = 'k_spam.jpg')
plot(k_pos, type = 'l', col="red", ylim=range(c(k_pos, k_neg)))
lines(k_neg, col="green", ylim=range(c(k_pos, k_neg)))
dev.off()
