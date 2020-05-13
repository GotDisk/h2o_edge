library(readr)
library(corrr)
library(ggplot2)
library(dbplot)

train_df <- read.csv("data/sequence.csv", header = FALSE, sep=",")

corm <- cor(train_df)

train_comp <- prcomp(train_df)

plot_2d <- ggplot(train_df, aes(x=V1, y=V3)) +
  geom_point() +
  stat_density2d()

dbplot_raster(train_df, V1, V2, resolution = 16)

train_lm <- lm(V1~V3,data = train_df)
summary(train_lm)
