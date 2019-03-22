removeCCCartridge<-function(Lot,sn=NULL,extra=NULL){
 a<-"SET SQL_SAFE_UPDATES = 0;"
 b<-"SET SQL_SAFE_UPDATES = 1;"
  postbls<-wetqc_tbl()
  platstring<-postbls[[substr(Lot,1,1)]]
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
my_db <- con_mysql()
x<-dbSendQuery(my_db,paste0(a,STR,";",b))
dbClearResult(x)
dbDisconnect(my_db)
}
