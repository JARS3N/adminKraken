fetchTables<-function(){
require(RMySQL)
my_db <-con_mysql()
get<-RMySQL::dbSendQuery(my_db,"show tables;")
out<-dbFetch(get)
dbClearResult(get)
dbDisconnect(my_db)
out[,1]
}
