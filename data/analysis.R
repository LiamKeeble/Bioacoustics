


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








d=data.frame(rbind(data,data2,data3,data4,data5,data6,data7,data8,data9,data10))

head(d, 100)











#Model

library(rstan)

unit=rnorm(20,0,1)
init=matrix(c(0.1,0.2,0.9,0.8), ncol=2, nrow=2)













