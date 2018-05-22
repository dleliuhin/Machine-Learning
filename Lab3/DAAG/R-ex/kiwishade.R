### Name: kiwishade
### Title: Kiwi Shading Data
### Aliases: kiwishade
### Keywords: datasets

### ** Examples

print("Data Summary - Example 2.2.1")
attach(kiwishade)
kiwimeans <- aggregate(yield, by=list(block, shade), mean)
names(kiwimeans) <- c("block","shade","meanyield")

kiwimeans[1:4,]
pause()
 
print("Multilevel Design - Example 9.3")
kiwishade.aov <- aov(yield ~ shade+Error(block/shade),data=kiwishade)
summary(kiwishade.aov)
pause()

sapply(split(yield, shade), mean)

pause()

kiwi.table <- t(sapply(split(yield, plot), as.vector))
kiwi.means <- sapply(split(yield, plot), mean)
kiwi.means.table <- matrix(rep(kiwi.means,4), nrow=12, ncol=4)   
kiwi.summary <- data.frame(kiwi.means, kiwi.table-kiwi.means.table)   
names(kiwi.summary)<- c("Mean", "Vine 1", "Vine 2", "Vine 3", "Vine 4")
kiwi.summary
mean(kiwi.means) # the grand mean (only for balanced design)

require(nlme)
kiwishade.lme <- lme(fixed = yield ~ shade, random = ~ 1 | block/plot, 
data=kiwishade)
res <- residuals(kiwishade.lme)
hat <- fitted(kiwishade.lme) # By default fitted(kiwishade.lme, level=2)
coplot(res ~ hat | kiwishade$block, pch=16, columns=3,
  xlab= "Fitted", ylab="Residuals")
 
res <- residuals(kiwishade.lme)
hat <- fitted(kiwishade.lme, level=0) # shade effects only
unique(hat) # There are just four distinct values, one per treatment
coplot(res ~ hat | kiwishade$block, pch=16, columns=3,
  xlab="Fitted", ylab="Residuals")

n.omit <- 2
take <- rep(TRUE, 48)
take[sample(1:48,2)] <- FALSE
kiwishade.lme <- lme(yield ~ shade, data = kiwishade,
                     random = ~1 | block/plot, subset=take)
VarCorr(kiwishade.lme)[4, 1]  # Plot component of variance
VarCorr(kiwishade.lme)[4, 1]  # Vine component of variance

detach(kiwishade)




