


library(seewave)
library(warbleR)


one=data.frame(sound.files="0941George230318.WAV",start=1319.95,end=1320.43)
wv=read_wave(one)
spectro(wv,flim=c(0,10))
fun=fund(wv)


data=fun

one=data.frame(sound.files="0941George230318.WAV",start=1322.803,end=1323.228)
wv=read_wave(one)
fun=fund(wv)


data2=fun



one=data.frame(sound.files="0941George230318.WAV",start=1329.874,end=1330.29)
wv=read_wave(one)
fun=fund(wv)

data3=fun


one=data.frame(sound.files="0941George230318.WAV",start=1338.579,end=1339.008)
wv=read_wave(one)
fun=fund(wv)

data4=fun


one=data.frame(sound.files="1122George190418.WAV",start=504.417,end=504.766)
wv=read_wave(one)
fun=fund(wv)


data5=fun


one=data.frame(sound.files="1122George190418.WAV",start=520.699,end=521.194)
wv=read_wave(one)
fun=fund(wv)


data6=fun




one=data.frame(sound.files="1122George190418.WAV",start=523.699,end=524.183)
wv=read_wave(one)
fun=fund(wv)


data7=fun


one=data.frame(sound.files="1122George190418.WAV",start=533.562,end=533.93)
wv=read_wave(one)
fun=fund(wv)


data8=fun

one=data.frame(sound.files="1122George190418.WAV",start=1104.595,end=1104.981)
wv=read_wave(one)
fun=fund(wv)


data9=fun




one=data.frame(sound.files="1122George190418.WAV",start=1109.955,end=1110.467)
wv=read_wave(one)
fun=fund(wv)



data10=fun





#Model


init=matrix(c(0.2,0.3,0.5,0.7,0.2,0.2), ncol=3, nrow=3)



mod='
data{
vector[20] unit;
matrix[2,2] init;
}
parameters{
matrix<lower=0,upper=1>[2,2] alpha;
real<lower=0,upper=1> theta;
real<lower=0> sigma;
}
model{
theta~beta(5,5);
sigma~normal(0,1);
alpha[1,1]~normal(init[1,1],sigma);
alpha[1,2]~normal(init[1,2],sigma);
alpha[2,1]~normal(init[2,1],sigma);
alpha[2,2]~normal(init[2,2],sigma);
for (n in 1:20)
	target += log_mix(theta,
	normal_lpdf(unit[n] | alpha[1,1], alpha[1,2]),
	normal_lpdf(unit[n] | alpha[2,1], alpha[2,2]);
	//Add normal distribution and prior for each matrix element in alpha?
}
'

data=list(
unit=d$unit,
init=init
)

fit=stan(model_code=mod, data=data)
print(fit)



