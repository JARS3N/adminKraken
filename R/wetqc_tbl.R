wetqc_tbl <- function() {
  TBLS <- new.env()
  type <- c("W", "B", "C", "Q")
  tbls <- c("xfe96wetqc", "xfe24wetqc", "xfpwetqc", "xf24legacy")
  Map(function(x, y) {
    assign(x, y, envir = TBLS)
  }, type, tbls)
}
