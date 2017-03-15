
open<-function(){
shiny::runApp(system.file("move",package="in"),
              launch.browser=FALSE,
              host="0.0.0.0",
              port=9999
              )
}
