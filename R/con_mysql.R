con_mysql<-function(){
require(RMySQL)
ConnectInfo<-sharpen(triton())
dbConnect(RMySQL::MySQL(),
                     dbname=ConnectInfo[1],
                     user=ConnectInfo[2],
                     password=ConnectInfo[3],
                     host=ConnectInfo[4],
                     port=as.numeric(ConnectInfo[5]))
}
