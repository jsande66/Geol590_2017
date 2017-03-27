Functions and error handling:
=============================

Write a function that fulfills the following criteria:
------------------------------------------------------

*It should be tidyverse compatible (i.e., the first argument must be a data frame) *It should add two arbitrary columns of the data frame (specified by the user) and putthem in a new column of that data frame, with the name of the new column specified by the user \*It should throw an informative warning if any invalid arguments are provided. Invalid arguments might include: **The first argument is not a data frame **Less than two valid columns are specified to add (e.g., one or both of the column names isn't in the supplied data frame) \*\*The columns specified are not numeric, and therefore can't be added - use tryCatch() for this \*If the columns to add aren't valid but the new column name is, the function should create a column of NA values

``` r
library(tidyverse)
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
#Function to add values in columns
add_column <- function(data_frame, col.one, col.two, sum.col) {
  
  if(class(data_frame) != "data.frame") {
    warning("Data frame not supplied") #warning for if data_frame argument is not a data frame
  }
  
  if(!(col.one %in% colnames(data_frame)) | !(col.two %in% colnames(data_frame))) {
    warning("One of your columns in not in the supplied data frame") #warning for if either columns to add are not actually columns in given data frame
  }
  
  tryCatch(data_frame$sum.col <- (data_frame[, col.one] + data_frame[, col.two]),  #runs function and returns warnings if column values are non-numeric
           warning=function(w){
             message("One or more values to add is non-numeric.")
             return(NA)
  })
  
  return(data_frame)
}

#Code lines to generate warnings and errors; using mtcars as an example

mtcars_adj <- mtcars 
mtcars_adj <- add_column(mtcars, "mpg", "cyl", sum) 
mtcars_adj$names <- rownames(mtcars_adj)
new_mtcars <- add_column(mtcars_adj, "mpg", "cyl", sum)
#new_mtcars <-add_column(mtcars_adj, "names", "mpg", sum) ***throws an error as "names" has no numeric values
```

Loop and performance metric tasks
=================================

*Write a function named that uses a for loop to calculate the sum of the elements of a vector, which is passed as an argument (i.e., it should do the same thing that sum() does with vectors). your\_fun(1:10^4) should return 50005000. *Use the microbenchmark::microbenchmark function to compare the performace of your function to that of sum in adding up the elements of the vector 1:10^4. The benchmarking code should look something like:

``` r
library(microbenchmark)
```

    ## Warning: package 'microbenchmark' was built under R version 3.3.3

``` r
new.vec <- c(2,4,6,8,10)

#add.vec.columns <- add_column(new.vec, "mpg", "cyl", sum) ***throws an error as a data frame is not supplied, and correct columns not present

col_adder <- function(my.vec) {
  sum <- 0
  for(i in my.vec) {
    sum <- sum + i
  }
  return(sum)
}

#Test the function 
test.vec <- 1:10^4 

#Returns sum of function created by me
col_adder(test.vec) 
```

    ## [1] 50005000

``` r
#Returns function using R nested function
sum(test.vec) 
```

    ## [1] 50005000

``` r
#Tests the efficiency of my function
microbenchmark( 
  col_adder(test.vec),
  sum(test.vec)
)
```

    ## Unit: microseconds
    ##                 expr      min        lq        mean    median        uq
    ##  col_adder(test.vec) 9978.063 10172.631 11584.55626 10379.841 11397.518
    ##        sum(test.vec)   20.149    20.545    23.80742    22.914    26.075
    ##        max neval
    ##  76201.392   100
    ##     42.668   100
