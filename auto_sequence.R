library(h2o)

h2o.init()

train_seq <- h2o.importFile("data/sequence.csv", header=FALSE, sep = ",")