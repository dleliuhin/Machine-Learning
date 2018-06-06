library(DAAG)
library(tree)
data(spam7)
sp.tr <- tree(yesno ~., spam7)
draw.tree(sp.tr, cex = 0.7)

library(maptree)
tr1 <- prune.tree(spam_tree ,method = "misclass")
for(i in 2:4)
{
  tr2 <- prune.tree(spam_tree ,k=tr1$k[i],method = "misclass")
  png(filename=paste(toString(i),'.jpg'))
  draw.tree(tr2)
  dev.off()
}
