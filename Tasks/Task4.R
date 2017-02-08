##Determine how many rows the diamonds data set that comes loaded with ggplot2 has
## nrow determines how many rows are in a dataset
nrow(diamonds)


##set.seed function allows us to generate random numbers. The number 1410 allows us to generate the same random numbers when the set.seed function is used using this number.
set.seed(1410)


##dsmall is set as our variable
##diamonds is the dataset we are using, sample gives us the sample names. Brackets are used to subset from that dataset.
##nrow(diamonds), 100) calls for the 10 look at the 10 rows of our diamond samples and the first 100 rows
dsmall <- diamonds[sample(nrow(diamonds), 100), ]

library(ggplot2)


##A scatterplot of y vs x, colored by z values and faceted by cut
scatter_cut <- ggplot(dsmall, aes(x=x, y=y, colour=z)) +
  geom_point() + facet_wrap(~cut)
print(scatter_cut)


##A scatterplot of price vs carat, colored by cut and smoothed (using the "lm" method, without standard error bars)
scat_pricecar <- ggplot(dsmall, aes(x=carat, y =price, colour=cut)) + geom_point() 
scat_smoothed <- scat_pricecar + geom_smooth(method=lm, se=FALSE)
print(scat_smoothed)


##A density plot of carat, faceted and colored by clarity. 
diam_dens <- ggplot(dsmall, aes(carat, colour=clarity)) + 
  geom_density() + facet_wrap(~clarity)
print(diam_dens)


##A boxplot of price as a function of cut. 
diam_box <- ggplot(dsmall, aes(x=cut, y=price)) + 
  geom_boxplot()
print(diam_box)

##A scatterplot of y versus x. The points should be red (colour = "red"), the color of the smoothing line should be blue (colour = "blue"), and the line should be dashed with fat dashes (linetype=2). The x and y labels should be set manually as well. The trickiest part of this may be to figure out where colour = "red" etc should go in the code. Think about mapped vs static aesthetic values.
ggplot(dsmall, aes(x=x, y=y, colour = "red")) + ##colour indicates the color of the data points
  geom_point() + geom_smooth(method="lm", colour="blue", linetype=2) + ## lm for linear regression and blue is is the color of the line
  xlab("x,in mm")+
  ylab("y, in mm") +
  theme(legend.position="none") ## removes legend

##Ugly plot
nrow(mpg)
mpgdat <- mpg[sample(nrow(mpg), 200), ]
ggplot(mpgdat, aes(model, hwy, colour= "blue")) +
  geom_point() + geom_smooth(method="lm") +
  theme_dark()
