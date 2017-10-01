sharpen<-function(x){
   str<- rawToChar(
      base64enc::base64decode(x)
    ) 
    if(grepl('%%',str)){
     unraveled<- lapply(
        lapply(
          unlist(strsplit(str,split="%%")),
          strsplit,split=";"),
          unlist
        ) 
        setNames(unraveled[[1]],unraveled[[2]])
    }else{
        str
      }
}
