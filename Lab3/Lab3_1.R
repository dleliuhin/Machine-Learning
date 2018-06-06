library(mlbench)
library(tree)
data(Glass)
m <- dim(Glass)[1]
Glass.tr <- tree(Type ~., Glass)
library(maptree)
draw.tree(Glass.tr, cex=0.7)
Glass.tr
Glass.tr1 <- prune.tree(Glass.tr, k = 56)
draw.tree(Glass.tr1, cex=0.7)
