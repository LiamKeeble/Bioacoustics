


library(depmixS4)



data=c(12,16,45,45,56,67,78,98,120,124,156)

model=depmix(data~1, nstates=3,ntimes=length(data))

fitm=fit(model)

print(fitm)

fitm@transition

probs=posterior(fitm)


probs




