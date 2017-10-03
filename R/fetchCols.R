fetchCols<-function(tbl,like=NULL){
  require(RMySQL)
  my_db <- con_mysql()
  if(is.null(like)){
    str<-paste0("show columns from ",tbl,";")
  }else{
    str<-paste0("show columns from ",tbl,"like",shQuote(like),";")
  }

  get<-RMySQL::dbSendQuery(my_db,str)
  out<-dbFetch(get)
  dbClearResult(get)
  dbDisconnect(my_db)
  out
}
