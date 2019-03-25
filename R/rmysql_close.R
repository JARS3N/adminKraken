rmysql_close<-function(){
lapply(dbListConnections( dbDriver( drv = "MySQL")),RMySQL::dbDisconnect)
}
