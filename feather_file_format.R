install.packages("feather")

library(feather)

x <- runif(1e6)
head(x)
x[sample(1e6, 1e5)] <- NA # 10% NAs
head(x, 100)
df <- as.data.frame(replicate(10, x))
head(df)
write_feather(df, 'test.feather')
write.csv(df, "test.csv")

system.time(read_feather('test.feather'))
system.time(read.csv("test.csv"))


# source: https://blog.rstudio.com/2016/03/29/feather/
