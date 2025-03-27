
unlock<-function(){
  sys<-Sys.info()
shiny::runApp(shiny::shinyApp(move_ui(),move_server()),
              launch.browser=FALSE,
              host="0.0.0.0",
              port=9999
              )
   message( paste0("Listening on http://",sys['nodename'],":9999"))
}
