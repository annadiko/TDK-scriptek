difftest <- function(table){
  sorok <- levels(table$ID_REF)
  ret <- c("")
  for(i in sorok){
     subset <- table[table$ID_REF == i,]
     result <- t.test(subset$CH1_NORMALIZED, subset$CH2_NORMALIZED)
     if(!is.nan(result$p.value) & result$p.value < 0.05){
        ret <- c(ret, i)
     }
  }
  return(ret[2:length(ret)])
}


files <-list.files(path = ".", pattern = "ST")
for (f in files)
{
        t <- read.table(f, sep = "\t", header = T)
        tmp <- difftest(t)
        filename <- sub("txtmod_ST" , "sig.id", f)
        write(tmp, filename)
}

