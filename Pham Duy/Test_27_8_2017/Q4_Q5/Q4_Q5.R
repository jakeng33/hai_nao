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
file <- unlist(read.delim('lcl.fasta',header=F))
fasta <- convertfasta(read.delim('lcl.fasta',header=F))
header <- as.character(file[grepl(pattern = ">",file)])
headerwtindex <- data.frame(Header = header, Index = seq(1:length(header)))
indexGroup1 <- headerwtindex[grepl(pattern = "Group1",header),][,2]
indexGroup2 <- headerwtindex[grepl(pattern = "Group2",header),][,2]
## Convert to GC ratio
fastagc <- GClist(fasta)
test <- t.test(fastagc[indexGroup1],fastagc[indexGroup2])
write.table(test$p.value,"Q4_result.txt",row.names = F,col.names = F)
## Plot
jpeg('Q5_result.jpeg')
boxplot(fastagc[indexGroup1],fastagc[indexGroup2],col=c("cornflowerblue","pink"),
        names=c("Group 1","Group 2"),main="Compare GC-content Ratio")
dev.off()
