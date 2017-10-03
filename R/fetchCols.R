fetchCols<-function(tbl,like=NULL){
  require(RMySQL)
  ConnectInfo<-sharpen(triton())
  my_db <- dbConnect(RMySQL::MySQL(),
                     dbname=ConnectInfo[1],
                     user=ConnectInfo[2],
                     password=ConnectInfo[3],
                     host=ConnectInfo[4],
                     port=as.numeric(ConnectInfo[5]))

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
