 blur<-function(x){
   n<-sample(1:5,1)
  require(magrittr)
  x %>%
  list(.,names(.)) %>%
    rapply(paste0,collapse=";") %>%
    paste0(.,collapse="%%") %>%
    charToRaw() %>%
    base64enc::base64encode()
}

sharpen<-function(x){
  require(magrittr)
  base64enc::base64decode(x) %>%
    rawToChar() %>%
    {if(grepl('%%',.)){
    strsplit(.,split="%%") %>%
    unlist() %>%
    lapply(.,strsplit,split=";") %>%
    lapply(unlist) %>%
    {setNames(.[[1]],.[[2]])}}else{.}}
}
