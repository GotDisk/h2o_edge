library(readr)
library(corrr)
library(ggplot2)

train_df <- read.csv("data/sequence.csv", header = FALSE, sep=",")

corm <- cor(train_df)

train_comp <- prcomp(train_df)

plot_2d <- ggplot(train_df, aes(x=V1, y=V2)) +
  geom_point() +
  stat_density2d()

