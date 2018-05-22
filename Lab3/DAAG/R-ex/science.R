### Name: science
### Title: School Science Survey Data
### Aliases: science
### Keywords: datasets

### ** Examples

attach(science)
classmeans <- aggregate(like, by=list(PrivPub, Class), mean)
names(classmeans) <- c("PrivPub","Class","like")
dim(classmeans)

attach(classmeans)
boxplot(split(like, PrivPub), ylab = "Class average of attitude to science score", boxwex = 0.4)
rug(like[PrivPub == "private"], side = 2)
rug(like[PrivPub == "public"], side = 4)
detach(classmeans)

require(nlme)
science.lme <- lme(fixed = like ~ sex + PrivPub,
  data = science, random = ~ 1 | school/Class, na.action=na.omit)
summary(science.lme)$tTable # Print coefficients.

science1.lme <- lme(fixed = like ~ sex + PrivPub, data = science,
random = ~ 1 | Class, na.action=na.exclude)
summary(science1.lme)$tTable # Table of coefficients

intervals(science1.lme, which="var-cov")[[1]]$Class^2
intervals(science1.lme, which="var-cov")[[2]]^2 

science.lme <- lme(fixed = like ~ sex + PrivPub,
  data = science, random =  ~ 1 | Class/school, na.action=na.omit)
res <- residuals(science.lme)
hat <- fitted(science.lme)
coplot(res ~ hat|science$PrivPub[!is.na(science$sex)],
  xlab="Fitted values", ylab="Residuals")
detach(science)



