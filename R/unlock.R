
unlock<-function(){
shiny::runApp(shiny::shinyApp(move_ui(),move_server()),
              launch.browser=FALSE,
              host="0.0.0.0",
              port=9999
              )
}
