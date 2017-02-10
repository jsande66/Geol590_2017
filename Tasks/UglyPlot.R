##Ugly plot
nrow(mpg)
mpgdat <- mpg[sample(nrow(mpg), 200), ]
ggplot(mpgdat, aes(model, hwy, colour= "blue")) +
  geom_point() + geom_smooth(method="lm") +
  theme_dark()
