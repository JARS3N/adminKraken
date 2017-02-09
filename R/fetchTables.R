fetchTables<-function(){
require(RMySQL)
ConnectInfo<-DataStash::Triton()
my_db <- dbConnect(RMySQL::MySQL(),
                   dbname=ConnectInfo[1],
                   user=ConnectInfo[2],
                   password=ConnectInfo[3],
                   host=ConnectInfo[4],
                   port=as.numeric(ConnectInfo[5]))

get<-RMySQL::dbSendQuery(my_db,"show tables;")
out<-dbFetch(get)
dbClearResult(get)
dbDisconnect(my_db)
out[,1]
}