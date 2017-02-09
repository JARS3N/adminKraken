removeLLFile<-function(file){
  require(RMySQL)
  ConnectInfo<-DataStash::Triton()
  my_db <- dbConnect(RMySQL::MySQL(),
                     dbname=ConnectInfo[1],
                     user=ConnectInfo[2],
                     password=ConnectInfo[3],
                     host=ConnectInfo[4],
                     port=as.numeric(ConnectInfo[5]))
  # GEt Id of file to remove
  nm <-paste0("select ID from kraken.instqcllmeta where file=",shQuote(file),";")
  findID <-dbSendQuery(my_db,nm)
  ID <-dbFetch(findID)
  dbClearResult(findID)
  if (length(ID$ID)>0){
    data<-paste0("delete from kraken.instqclldata where MetaID=",ID,";")
    DelData<-dbSendQuery(my_db,data)
    dbClearResult(DelData)
    Meta<-paste0("delete from kraken.instqcllmeta where ID=",ID,";")
    DelMeta<-dbSendQuery(my_db,Meta)
    dbClearResult(DelMeta)
    message(paste0(file," removed"))
  }else{
    message(paste0(file," not present in the Database"))
  }
  dbDisconnect(my_db)
  rm(list=ls())
  gc()
}
