library(h2o)

h2o.init()

train_seq <- h2o.importFile("data/sequence.csv", header=FALSE, sep = ",")

heat_model <- h2o.deeplearning(
  x = names(train_seq),
  training_frame = train_seq,
  activation = "Tanh",
  autoencoder = TRUE,
  hidden = c(3,1,3),
  sparse = TRUE,
  l1 = 1e-4,
  epochs = 10)

recon_error <- h2o.anomaly(heat_model, train_seq)
recon_df <- as.data.frame(recon_error)
plot.ts(recon_df)