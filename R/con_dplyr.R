con_dplyr<-function(){
    require(dplyr)
    ConnectInfo <- sharpen(triton())
    src_mysql(ConnectInfo["dbname"], user = ConnectInfo["user"], 
        password = ConnectInfo["password"], host = ConnectInfo["host"], 
        port = as.numeric(ConnectInfo["port"]))
}
