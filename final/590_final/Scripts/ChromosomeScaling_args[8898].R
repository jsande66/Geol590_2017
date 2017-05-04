library(plyr)

inputargs <- commandArgs(TRUE);
if(length(inputargs)<1) {
	stop("Not enough arguments entered")
}

Infile <- inputargs[1];




HBSS_files = list.files(pattern = '*1xHBSS')

f = function(Infile) {
  my_data = read.table(gzfile(Infile), stringsAsFactors = FALSE, header = TRUE)
  HBSS24 = my_data[, c(2,3)]
  HBSS24$loggendist <- log10(HBSS24$realInteractionDistance)
  HBSS24$loginteraction <- log10(HBSS24$loessExpectedValue/HBSS24$loessExpectedValue[1])
  write.table(HBSS24, file = paste0('scaled_', file_name, '.txt'))
  plot(HBSS24$loggendist,HBSS24$loginteraction,col="red", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  legend('topright', c('1xHBSS_R2'),lty = c(1), col = c('red'))
  
}

l_ply(HBSS_files, f)


EDTA_files = list.files(pattern = '*-EDTA')

f = function(Infile) {
  my_data = read.table(gzfile(Infile), stringsAsFactors = FALSE, header = TRUE)
  EDTA24 = my_data[, c(2,3)]
  EDTA24$loggendist <- log10(EDTA24$realInteractionDistance)
  EDTA24$loginteraction <- log10(EDTA24$loessExpectedValue/EDTA24$loessExpectedValue[1])
  write.table(EDTA24, file = paste0('scaled_', file_name, '.txt'))
  plot(EDTA24$loggendist,EDTA24$loginteraction,col="blue", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  legend('topright', c('EDTA_R1'),lty = c(1), col = c('blue'))
  
}

l_ply(EDTA_files, f)
  
Post_files = list.files(pattern = '*post')
  
f = function(Infile) {
  my_data = read.table(gzfile(Infile), stringsAsFactors = FALSE, header = TRUE)
  Post24 = my_data[, c(2,3)]
  Post24$loggendist <- log10(Post24$realInteractionDistance)
  Post24$loginteraction <- log10(Post24$loessExpectedValue/Post24$loessExpectedValue[1])
  write.table(Post24, file = paste0('scaled_', file_name, '.txt'))
  plot(Post24$loggendist,Post24$loginteraction,col="black", type = "l", xlab = "Genomic Distance", ylab = "Log Interaction", ylim = c(-3.5,0))
  legend('topright', c('HBSSpostEDTA_R1'),lty = c(1), col = c('black'))
  
  }

l_ply(Post_files, f)


