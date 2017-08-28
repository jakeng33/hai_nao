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
  unlist(lapply(X = x,FUN = function(x){
    return(nchar(x))
  }))
}
## Calculate GC content
GCcontent <- function(x){
  count <- table(unlist(strsplit(x, "")))
  GC <- (count[2]+count[3])/sum(count)
  return(as.numeric(GC))
}
## Convert GC content for all sequence
GClist <- function(x){
  gc <- unlist(lapply(X = x,GCcontent))
  return(gc)
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
## Tinh độ dài đoạn dài nhất
maxlen <- max(fastalen)
## Tính độ dài trung bình
meanlen <- mean(fastalen)
## Convert to GC ratio
fastagc <- GClist(fasta)
## Tìm tỉ lệ GC cao nhất
maxGC <- max(fastagc)
## Tính tỉ lệ GC trung bình
meangc <- mean(fastagc)

write.table(x = t(data.frame(maxlen,meanlen,maxGC,meangc)),file = "Q2_result.txt",row.names = F,col.names = F)
