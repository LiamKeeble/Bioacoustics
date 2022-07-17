

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

#Continuous version
d=data.frame(
unit=rnorm(20,0,1),
time=1:20
)

alpha=matrix(c(0.2,0.3,0.5,0.7), ncol=2, nrow=2)



mod='
data{
vector[20] unit;
}
parameters{
matrix<lower=0,upper=1>[2,2] alpha;
real<lower=0,upper=1> theta;
}
model{
theta~beta(5,5);
for (n in 1:20)
	target += log_mix(theta,
	normal_lpdf(unit[n] | alpha[1,1], alpha[1,2]),
	normal_lpdf(unit[n] | alpha[2,1], alpha[2,2]));

}
'

data=list(
unit=d$unit
)

fit=stan(model_code=mod, data=data)
print(fit)



