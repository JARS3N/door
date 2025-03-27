
unlock<-function(){
hostname <- Sys.info()[['nodename']]
message("Unlocking ... http://",hostname,":9999")
shiny::runApp(shiny::shinyApp(move_ui(),move_server()),
              launch.browser=FALSE,
              host="0.0.0.0",
              port=9999
              )
  }
