library(kernlab)
data(spam)
dim(spam)

trainIndicator=rbinom(4601,size=1,prob=0.5)
table(trainIndicator)
trainSpam = spam[trainIndicator==1,]
testSpam = spam[trainIndicator==0,]
dim(trainSpam)

trainSpam = spam[trainIndicator == 1, ]
testSpam = spam[trainIndicator == 0, ]


names(trainSpam)


head(trainSpam)
table(trainSpam$type)
plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)

#relationship plot
plot(log10(trainSpam[, 1:4] + 1))

##clustering

hCluster = hclust(dist(t(trainSpam[, 1:57])))
plot(hCluster)

#refine clustering

hClusterUpdated = hclust(dist(t(log10(trainSpam[, 1:55] + 1))))
plot(hClusterUpdated)


##statistical prediction
trainSpam$numType = as.numeric(trainSpam$type) - 1
costFunction = function(x, y) {
 sum(x != (y > 0.5))
}
cvError = rep(NA, 55)
library(boot)
for (i in 1:55) {
 lmFormula = as.formula(paste("numType~", names(trainSpam)[i], sep = ""))
 glmFit = glm(lmFormula, family = "binomial", data = trainSpam)
 cvError[i] = cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}


##uncertainity

predictionModel = glm(numType ~ charDollar, family = "binomial", data = trainSpam)
## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
predictionTest = predict(predictionModel, testSpam)
predictedSpam = rep("nonspam", dim(testSpam)[1])
predictedSpam[predictionModel$fitted > 0.5] = "spam"
table(predictedSpam, testSpam$type)


