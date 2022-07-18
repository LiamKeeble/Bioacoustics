


library(seewave)
library(warbleR)



data1=read.delim("table1Selections.txt")
data1$file=rep("0928George131117", nrow(data1))


data2=read.delim("0941George230318selections.txt")
data2$file=rep("0941George230318",nrow(data2))




data=rbind(data1,data2)


d=data.frame(data)
nrow(d)

d=d[complete.cases(d),]
nrow(d)
head(d)

#Model

library(depmixS4)

mod=depmix(d$Delta.Freq..Hz~1, family=gaussian(), nstates=2, data=d)
fitm=fit(mod)


summary(fitm)






