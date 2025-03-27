
unlock<-function(){

shiny::runApp(shiny::shinyApp(move_ui(),move_server()),
              launch.browser=FALSE,
             # host="0.0.0.0",
              host = Sys.info()[["nodename"]],
              port=9999
              )
  }
