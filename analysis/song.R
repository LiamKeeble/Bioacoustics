

library(rstan)


data=data.frame(
date=c("5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18","5.18.18"),
time=c("AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM","AM"),
song=c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5),
unit=c(1,1,1,2,1,1,1,2,1,1,1,2,1,1,1,2,1,1,1,2),
time=c(1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4)
)



#Initial transition probabilities 
alpha=matrix(c(0.9,0.7,0.3,0.4),nrow=2,ncol=2)

nrow(data)


mod='
data{
int<lower=1> unit[20];
vector<lower=0>[2] alpha[2]; 
int<lower=1> song[20]; 
}
parameters{
simplex[2] theta[2]; 
}
model{
	for (k in 1:2){
		theta[k]~dirichlet(alpha[k]); 
	}
	for (t in 2:20) unit[t] ~ categorical(theta[song[unit[t-1]]]); 
}
'

data=list(
unit=data$unit,
song=data$song,
alpha=alpha
)

fit=stan(model_code=mod, data=data)


print(fit)
plot(fit)




