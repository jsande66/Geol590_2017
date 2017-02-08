## Double atomic vectors
a <- 1
typeof(a)
is.double(a)
b <- 2
str(b)
c <- a + b
typeof(c)
is.double(c)

##set.seed ensures that you the same random numbers are generated everytime they are run.
set.seed(0)

##rnorm distributes numbers in vector with equal mean and standard deviation
d <- rnorm(20)
typeof(d)
e <- rnorm(20)
f <- d + e 
typeof(f)
is.atomic(f)

##Creating a vector of length 5 and with 2 attributes
attrvect <- c(1:5)

attr(attrvect, "cell type") <- c("HeLa", "BJ1", "Phoenix Ampho")
attr(attrvect, "media") <- c("DMEM", "DMEM_Hygromycin", "DMEM")
str(attributes(attrvect))

##2.2.2.2 What happens to a factor when you modify its levels
f1 <- factor(letters)
levels(f1) <- ref(levels(f1))
## Could not find function "ref"

##2.2.2.3 What does this code do?
f2 <- rev(factor(letters))
f3 <- factor(letters, levels = rev(letters))
print(factor(letters, levels = rev(letters)))
##Prints the letters in reverse. Therefore, the vector is reversed.

##2.3.1.1 What does `dim` return when applied to a vector, **and why**?
dim(a)
#It returns a null answer because dim is meant to be run on matrices

##2.4.5.1: What attributes does a data frame possess?
##a data frame has names, colnames, and rownames, although names and colnames are the same thing.

##2.4.5.2: What does `as.matrix()` do when applied to a data frame with columns of different types?
## Coercion into the same type

##2.4.5.3: Can you have a data frame with 0 rows? What about 0 columns?
#Yes


## Read a .csv file into R

## Read .csv without skip = 33
plate_read <- read.csv("2016_10_11_plate_reader.csv")

## Read .csv with skip = 33
plate_reader <- read.csv("2016_10_11_plate_reader.csv", skip = 33)

# Determining what type of object I have 
str(plate_reader)

## load Tidyverse
library(tidyverse)

## Opening .csv with Tidyverse
read_csv(plate_reader)

## Substetting Tasks

nrow(mtcars)
?nrow
##nrow and ncol return the number of rows or columns present in x. NCOL and NROW do the same treating a vector as 1-column matrix.

length(mtcars)
?length
##Get or set the length of vectors (including lists) and factors, and of any other R object for which a method has been defined.

ncol(mtcars)

mtcars[["cyl"]]

mtcars$cyl
mtcars_df <- data.frame(mtcars)
mtcars_wt <- subset(mtcars_df, wt < 3 | wt > 4)

mtcars_row <- data.frame(subset(mtcars, select = c(mpg,wt)))
mpg_median <- median(mtcars_df$mpg)
car_mpgmed <- mtcars [which(mtcars$mpg == mpg_median),]
print(mtcars [which(mtcars$mpg == mpg_median),])

mtcars[mtcars$cyl == 4, ]
mtcars[-1, 0:4, ]
mtcars[mtcars$cyl <= 5,]
mtcars_cyl <- subset(mtcars, cyl == 4 | cyl == 6) 
print(subset(mtcars, cyl == 4 | cyl == 6))
