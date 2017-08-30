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
## Calculate GC content
GCcontent <- function(x){
  count <- table(unlist(strsplit(x, "")))
  GC <- (count[2]+count[3])/sum(count)
  return(as.numeric(GC))
}
## Convert to complementary sequence
compledna <- function(x){
  x <- x %>% gsub("A","X",.) %>% gsub("T","A",.) %>% gsub("X","T",.) %>% 
    gsub("G","X",.) %>% gsub("C","G",.) %>% gsub("X","C",.)
  return(x)
}

###########################################################
#                                                         #
#                     Implementation                      #
#                                                         #
###########################################################

## Read FASTA file
fasta <- read.delim('sequence.fasta',header=F)
## Convert FASTA file
fastacvt <- convertfasta(fasta)
## Tính độ dài
len <- nchar(fastacvt[1])
## Tỉ lệ GC
GC <- GCcontent(fastacvt[1])
## Trình tự đoạn còn lại
comdna <- compledna(fastacvt[1])
### Kết quả
write.table(x = t(data.frame(len,GC,comdna)),file = "Q1_result.txt",
            row.names = F,col.names = F,quote = F)
