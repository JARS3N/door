.onLoad <- function(libname = find.package("door"), pkgname = "door") {
  autoUp("door")
}

autoUp<-function(pack){
 # pack<-gsub("[:]{2}[A-Z|a-z|0-9]+","",deparse(sys.call()[[1]]))
  testUrl <- function(url) {
    out <- tryCatch(
      {
        readLines(con=url, warn=FALSE,n=1) 
      },error=function(cond) {
        return(NA)
      },warning=function(cond) {
        return(FALSE)
      },finally={})    
    return(out)
  }
  pkg<-packageDescription(pack)$URL
  GETS<-paste0("https://raw.githubusercontent.com/",pkg,"/master/DESCRIPTION")
  if (testUrl(GETS)==FALSE){return(message("contact to repo failed\n updates postponed."))}
  ongit<- gsub("Version: ","",grep("Version: ",readLines(GETS,warn=F),value=T))
  if (ongit!=utils::packageVersion(pack)){
    devtools::install_github(gsub("https://github.com/","",pkg),quite=TRUE)
  }
}
# mostly borrowed from Adam Lee Perelman's answer here: http://stackoverflow.com/a/33738713
