###########################################################
#                                                         #
#                     Preparation                         #
#                                                         #
###########################################################
## Loading library
library(tidyverse)
## Convert FASTA
convertfasta <- function(x){
  str <- as.data.frame(apply(X = x,MARGIN = 1,function(x) gsub(">.*", " ", x)))
  spl <- function(x) {
    g <- paste0(x,sep="",collapse = "\n") %>% gsub("\n","",.)
  }
  str <- strsplit(unlist(lapply(X = str, spl))," ")
  names(str) <- "FASTA"
  return(str$FASTA[-1])
}
## Convert do dai
convertlen <- function(x){
  unlist(lapply(X = x,FUN = nchar))
}
## Convert to complementary sequence
compledna <- function(x){
  x <- x %>% gsub("A","X",.) %>% gsub("T","A",.) %>% gsub("X","T",.) %>% 
    gsub("G","X",.) %>% gsub("C","G",.) %>% gsub("X","C",.)
  return(x)
}
## Reverse seq
rev <- function(x){
  x <- paste0(unlist(strsplit(x,""))[c(nchar(x):1)],collapse = "")
  return(x)
}
###########################################################
#                                                         #
#                     Implementation                      #
#                                                         #
###########################################################
## Read file
fasta <- convertfasta(read.delim('lcl.fasta',header=F))
## Convert to length
fastalen <- convertlen(fasta)
fastalenind <- data.frame(Len = fastalen,index=seq(1:length(fastalen)))
index <- fastalenind[ order(-fastalenind[,1]), ]$index
write.table(data.frame(index,fasta[index]),"Q3a_result.txt",col.names = F,row.names = F,quote = F)
## Convert to reverse sequence
reverse <- unlist(lapply(X = fasta,FUN = compledna))
reverselen <- convertlen(reverse)
revindex <- data.frame(Len = reverselen,index=seq(1:length(reverselen)))
rndex <- revindex[ order(-revindex[,1]), ]$index
revseq <- reverse[rndex] 
revseq <- unlist(lapply(revseq,rev))
write.table(data.frame(rndex,revseq),"Q3b_result.txt",col.names = F,row.names = F,quote = F)



