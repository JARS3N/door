library(dplyr)
library(shiny)
ENVS<-Sys.getenv()
nms<-ENVS[["USERNAME"]]
cmp<-ENVS[["COMPUTERNAME"]]
shinyServer(function(input, output,session) {
  output$nm<-renderText(nms)
  output$cmp<-renderText(cmp)
  session$onSessionEnded(function() {
    stopApp()
  })

  observeEvent(input$files,{
    input$files %>%
      group_by(name) %>%
      (function(u){
        file.copy(u$datapath,file.path(system.file("find",package="door"),u$name))
      })
  })
})
