removeCCCartridge<-function(Lot,sn=NULL,extra=NULL){
 a<-"SET SQL_SAFE_UPDATES = 0;"
 b<-"SET SQL_SAFE_UPDATES = 1;"
  platstring<-unname(c(
    "C" ="xfpwetqc",
    "B" = "xfe24wetqc",
    "W" = "xfe96wetqc",
    "Q" = "xf24legacy"
  )[substr(Lot,1,1)])
  start<-"SET SQL_SAFE_UPDATES = 0;"
  end<-"SET SQL_SAFE_UPDATES = 1;"
  s1<-paste0("Delete FROM kraken.",platstring," where Lot = ")
if(is.null(extra)){
  if(is.null(sn)){
    STR<-paste0(s1,shQuote(Lot))
  }else{
    STR<-paste0(s1,shQuote(Lot)," AND sn = ",sn)
  }
}else{
  if(is.null(sn)){
    STR<-paste0(s1,shQuote(Lot)," AND ",extra)
  }else{
    STR<-paste0(s1,shQuote(Lot)," AND sn = ",sn," AND ",extra)
  }
}
require(RMySQL)
ConnectInfo<-DataStash::Triton()
my_db <- dbConnect(RMySQL::MySQL(),
                   dbname=ConnectInfo[1],
                   user=ConnectInfo[2],
                   password=ConnectInfo[3],
                   host=ConnectInfo[4],
                   port=as.numeric(ConnectInfo[5]))
x<-dbSendQuery(my_db,paste0(a,STR,";",b))
dbClearResult(x)
dbDisconnect(my_db)
}