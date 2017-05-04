Introduction
------------

The nucleus is a remarkable organelle that is responsible for housing DNA. This feat is extremely surprising because human DNA is about 2 meter long and must fit into the 10 micrometer nucleus. Our lab is focused on understanding how DNA folds within nuclei in various diseases and nuclei that are physically manipulated. Our latest experiment test the ability of the nucleus to expand and if DNA organization is maintained during expansion. We hypothesize that nuclear expansion will cause chromatin to expand, therefore losing interactions. More specifically we expect to see a decrease in long range interactions between expanded nuclei and pre-expanded nuclei. We also wanted to determine if post-expansion nuclei are able to return to their pre-expanded state. To test our hypotheses we isolated GM12878 nuclei and placed them in 1xHBSS (normal buffer), 1mm EDTA (expansion buffer). We also used nuclei which were placed in 1mm EDTA for 1 hr and returned to 1xHBSS for 1 hr to obtain post-expansion data. We then conducted a Hi-C experiment to determine all ineractions that are occuring during the pre-expanded, expanded, and post-expanded state. To determine long- range interactions we have run scaling analysis in our lab to obtain .gz files containing all interactions for each chromosome. To visualize their trends, I have written the code below to generate indivual plots for each condition and comparison plots to determine if long-range interactions change during or after expansion.

### 1xHBSS

``` r
library(plyr)

##Generate a list containing all files with 1xHBSS in the name.


HBSS_files = list.files(pattern = '*1xHBSS')


f = function(file_name) {
  ## Read in each file containing 1xHBSS. 
  my_data = read.table(gzfile(file_name), stringsAsFactors = FALSE, header = TRUE)
  
  ## Keep Genomic Distance and loess Expected Value Columns.
  HBSS24 = my_data[, c(2,3)] 
  
  ## Generate a new column with the log of Genomic Distance.
  HBSS24$loggendist <- log10(HBSS24$realInteractionDistance)
  
  ## Generate a new column containing the log of the loess Expected Value starting at 0.
  HBSS24$loginteraction <- log10(HBSS24$loessExpectedValue/HBSS24$loessExpectedValue[1])
  
  ## Generate a table containing the file name with a new name containing "scaled_" in front of the original file name.
  write.table(HBSS24, file = paste0('scaled_', file_name, '.txt'))
  
  ## Generate a plot 
  plot(HBSS24$loggendist,HBSS24$loginteraction,col="red", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  legend('topright', c('1xHBSS_R2'),lty = c(1), col = c('red'))
  
}

## Apply function to 1xHBSS List
l_ply(HBSS_files, f)
```

![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-1.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-2.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-3.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-4.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-5.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-6.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-7.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-8.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-9.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-10.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-11.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-12.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-13.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-14.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-15.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-16.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-17.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-18.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-19.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-1-20.png)

### EDTA

``` r
##Generate a list containing all files with EDTA in the name.


EDTA_files = list.files(pattern = '*-EDTA')

f = function(file_name) {
  ## Read in each file containing EDTA
  my_data = read.table(gzfile(file_name), stringsAsFactors = FALSE, header = TRUE)
  
  ## Keep Genomic Distance and loess Expected Value Columns.
  EDTA24 = my_data[, c(2,3)]
  
  ## Generate a new column with the log of Genomic Distance.
  EDTA24$loggendist <- log10(EDTA24$realInteractionDistance)
  
  ## Generate a new column containing the log of the loess Expected Value starting at 0.
  EDTA24$loginteraction <- log10(EDTA24$loessExpectedValue/EDTA24$loessExpectedValue[1])
  
  ## Generate a table containing the file name with a new name containing "scaled_" in front of the original file name.
  write.table(EDTA24, file = paste0('scaled_', file_name, '.txt'))
  
  ## Generate a plot
  plot_data <- plot(EDTA24$loggendist,EDTA24$loginteraction,col="blue", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  legend('topright', c('EDTA_R1'),lty = c(1), col = c('blue'))
  
}

## Apply function to EDTA List
l_ply(EDTA_files, f)
```

![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-1.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-2.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-3.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-4.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-5.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-6.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-7.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-8.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-9.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-10.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-11.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-12.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-13.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-14.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-15.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-16.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-17.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-18.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-19.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-2-20.png)

### HBSSpostEDTA

``` r
##Generate a list containing all files with Post in the name.
 
Post_files = list.files(pattern = '*post')
  
f = function(file_name) {
  
  ## Read in each file containing Post
  my_data = read.table(gzfile(file_name), stringsAsFactors = FALSE, header = TRUE)
  
  ## Keep Genomic Distance and loess Expected Value Columns.
  Post24 = my_data[, c(2,3)]
  
  ## Generate a new column with the log of Genomic Distance.
  Post24$loggendist <- log10(Post24$realInteractionDistance)
  
  ## Generate a table containing the file name with a new name containing "scaled_" in front of the original file name
  Post24$loginteraction <- log10(Post24$loessExpectedValue/Post24$loessExpectedValue[1])
  
  ## Generate a table containing the file name with a new name containing "scaled_" in front of the original file name.
  write.table(Post24, file = paste0('scaled_', file_name, '.txt'))
  
  ## Generate a plot
  plot(Post24$loggendist,Post24$loginteraction,col="black", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  legend('topright', c('HBSSpostEDTA_R1'),lty = c(1), col = c('black'))
  
  }

## Apply function to Post List
l_ply(Post_files, f)
```

![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-1.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-2.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-3.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-4.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-5.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-6.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-7.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-8.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-9.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-10.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-11.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-12.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-13.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-14.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-15.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-16.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-17.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-18.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-19.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-3-20.png)

### Comparison of all conditions

``` r
##Generate Plots that contain all three conditions 
for (i in 1:20){
  
  my_dataHBSS = read.table(gzfile(HBSS_files[i]), stringsAsFactors = FALSE, header = TRUE)
  HBSS24_data = my_dataHBSS[, c(2,3)]
  HBSS24_data$loggendist <- log10(HBSS24_data$realInteractionDistance)
  HBSS24_data$loginteraction <- log10(HBSS24_data$loessExpectedValue/HBSS24_data$loessExpectedValue[1])
  
  my_dataEDTA = read.table(gzfile(EDTA_files[i]), stringsAsFactors = FALSE, header = TRUE)
  EDTA24_data = my_dataEDTA[, c(2,3)]
  EDTA24_data$loggendist <- log10(EDTA24_data$realInteractionDistance)
  EDTA24_data$loginteraction <- log10(EDTA24_data$loessExpectedValue/EDTA24_data$loessExpectedValue[1])
  
  my_dataPost = read.table(gzfile(Post_files[i]), stringsAsFactors = FALSE, header = TRUE)
  Post24_data = my_dataPost[, c(2,3)]
  Post24_data$loggendist <- log10(Post24_data$realInteractionDistance)
  Post24_data$loginteraction <- log10(Post24_data$loessExpectedValue/Post24_data$loessExpectedValue[1])
  
  
  ##Generates plot name with Chromosome name
  chrname = unlist(strsplit(unlist(strsplit(HBSS_files[i], "__")) [5], "--"))[1]
  
  #Generates plots
  plot(HBSS24_data$loggendist, HBSS24_data$loginteraction,col="red", type = "l", main = chrname, xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  lines(EDTA24_data$loggendist, EDTA24_data$loginteraction, col = "blue", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  lines(Post24_data$loggendist, Post24_data$loginteraction, col = "black", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  legend('topright', c('1xHBSS', 'EDTA', 'HBSSpostEDTA'), lty = c(1,1,1), col = c('red', 'blue', 'black'))

  }
```

![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-1.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-2.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-3.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-4.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-5.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-6.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-7.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-8.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-9.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-10.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-11.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-12.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-13.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-14.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-15.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-16.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-17.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-18.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-19.png)![](LongRangeScaling_files/figure-markdown_github/unnamed-chunk-4-20.png)

Conclusion
----------

Even though we have observed the nuclei expanding 4 to 10 times its normal size, the genome structure and long range interactions seem to be maintaned base on our scaling plots. Each condition follows the same trend. Other data in our lab and others seem to corroborate our data. More Hi-C experiments will be conducted to determine if the data from this experiment is reliable.
