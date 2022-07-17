


d=read.csv("jackdaw.csv")


d2=subset(d, Vocalisation=="SG")

write.csv(d2, "song.csv")


