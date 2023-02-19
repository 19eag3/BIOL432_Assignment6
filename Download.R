#Download R
#Assignment 6

#install.packages("rentrez")

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #creates vectors of names of 3 different sequences 
library(rentrez)  #loads the rentrez
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #creates object Bburg from retrieving 3 fasta sequence data from the nuccore database through searching by the ncbi_ids vector declared above 

Sequences <-strsplit(Bburg, ">")
Sequences<-unlist(Sequences)

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)
Sequences <- data.frame(lapply(Sequences, function(x) gsub("\n", "", x)))


write.csv(Sequences,"Sequences.csv")
